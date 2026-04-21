local M = {}

local uv = vim.uv or vim.loop
local unpack_fn = table.unpack or unpack

local function ms(ns)
  return ns / 1e6
end

local function is_loaded()
  return package.loaded["neo-tree"] ~= nil or package.loaded["neo-tree.command"] ~= nil
end

function M.run()
  local started = uv.hrtime()
  local stats = {
    load_ms = 0,
    git_ms = 0,
    git_calls = 0,
    before_open_ms = nil,
    after_open_ms = nil,
    after_render_ms = nil,
  }

  local ok_lazy, lazy = pcall(require, "lazy")
  if ok_lazy and not is_loaded() then
    local load_started = uv.hrtime()
    lazy.load({ plugins = { "neo-tree.nvim" } })
    stats.load_ms = ms(uv.hrtime() - load_started)
  end

  local ok_events, events = pcall(require, "neo-tree.events")
  if not ok_events then
    vim.notify("Could not load neo-tree events for profiling", vim.log.levels.ERROR)
    return
  end

  local git = require("neo-tree.git")
  local original_status = git.status
  local subscriptions = {}
  local finished = false

  local function cleanup()
    if git.status ~= original_status then
      git.status = original_status
    end
    for _, event_handler in ipairs(subscriptions) do
      pcall(events.unsubscribe, event_handler)
    end
  end

  local function finish()
    if finished then
      return
    end
    finished = true
    cleanup()

    local lines = {
      "Neo-tree git_status profile",
      string.format("plugin load: %.1f ms", stats.load_ms),
      string.format("git.status: %.1f ms (%d call%s)", stats.git_ms, stats.git_calls, stats.git_calls == 1 and "" or "s"),
    }

    if stats.before_open_ms then
      table.insert(lines, string.format("start -> window before open: %.1f ms", stats.before_open_ms))
    end
    if stats.after_open_ms then
      table.insert(lines, string.format("start -> window after open: %.1f ms", stats.after_open_ms))
    end
    if stats.after_render_ms then
      table.insert(lines, string.format("start -> after render: %.1f ms", stats.after_render_ms))
    end

    vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO, { title = "Neo-tree profile" })
  end

  local function subscribe(event, id, handler)
    local event_handler = {
      event = event,
      id = id,
      once = true,
      handler = handler,
    }
    table.insert(subscriptions, event_handler)
    events.subscribe(event_handler)
  end

  git.status = function(...)
    local git_started = uv.hrtime()
    local result = { original_status(...) }
    stats.git_calls = stats.git_calls + 1
    stats.git_ms = stats.git_ms + ms(uv.hrtime() - git_started)
    return unpack_fn(result)
  end

  subscribe(events.NEO_TREE_WINDOW_BEFORE_OPEN, "profile-neotree-before-open", function(args)
    if args.source == "git_status" then
      stats.before_open_ms = ms(uv.hrtime() - started)
    end
  end)

  subscribe(events.NEO_TREE_WINDOW_AFTER_OPEN, "profile-neotree-after-open", function(args)
    if args.source == "git_status" then
      stats.after_open_ms = ms(uv.hrtime() - started)
    end
  end)

  subscribe(events.AFTER_RENDER, "profile-neotree-after-render", function(state)
    if state.name == "git_status" then
      stats.after_render_ms = ms(uv.hrtime() - started)
      finish()
    end
  end)

  vim.defer_fn(function()
    if not finished then
      finish()
      vim.notify("Neo-tree profiling timed out before after_render fired", vim.log.levels.WARN, { title = "Neo-tree profile" })
    end
  end, 10000)

  vim.cmd("Neotree git_status")
end

return M

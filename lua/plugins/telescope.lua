return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-live-grep-args.nvim" },
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fF", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", desc = "Find in all files" },
    { "<leader>sg", function()
      require("telescope").extensions.live_grep_args.live_grep_args()
    end, desc = "Live grep" },
    { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Grep word under cursor" },
    { "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Search buffers" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Search help" },
    { "<leader><leader>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
  },
  config = function()
    local telescope = require("telescope")
    local entry_display = require("telescope.pickers.entry_display")

    telescope.setup({
      defaults = {
        layout_strategy = "vertical",
        layout_config = {
          vertical = {
            width = 0.9,
            height = 0.7,
            prompt_position = "top",
            preview_height = 0.4,
            mirror = true,
          },
        },
        sorting_strategy = "ascending",
        results_title = false,
        prompt_prefix = "  ",
        selection_caret = "  ",
        file_ignore_patterns = { "node_modules", ".git/" },
        path_display = function(_, path)
          local tail = vim.fn.fnamemodify(path, ":t")
          local dir = vim.fn.fnamemodify(path, ":h")
          if dir == "." then
            return tail
          end
          return tail .. "  " .. dir, { { { #tail, #tail + 2 + #dir + 2 }, "Comment" } }
        end,
        borderchars = {
          prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
          results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
          preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        },
      },
      pickers = {
        live_grep = {
          prompt_title = "Find in Files",
          entry_maker = function(line)
            -- line format from rg: "file:lnum:col:text"
            local file, lnum, col, text = line:match("^(.+):(%d+):(%d+):(.*)$")
            if not file then return nil end

            lnum = tonumber(lnum)
            col = tonumber(col)
            local filename = vim.fn.fnamemodify(file, ":t")
            local suffix = " " .. filename .. " " .. lnum

            return {
              value = line,
              ordinal = text,
              filename = file,
              lnum = lnum,
              col = col,
              text = text,
              display = function(entry)
                local win = vim.api.nvim_get_current_win()
                local win_width = vim.api.nvim_win_get_width(win)
                local content = vim.trim(text)
                local max_text = win_width - #suffix - 4 -- caret + padding
                if #content > max_text then
                  content = content:sub(1, max_text - 1) .. "…"
                end
                local padding = win_width - #content - #suffix - 4
                if padding < 1 then padding = 1 end
                local display = content .. string.rep(" ", padding) .. suffix
                return display, { { { #content + padding, #display }, "Comment" } }
              end,
            }
          end,
        },
      },
    })
    telescope.load_extension("fzf")
    telescope.load_extension("live_grep_args")

    -- Disable global winborder for Telescope (it uses its own borderchars)
    vim.api.nvim_create_autocmd("User", {
      pattern = "TelescopeFindPre",
      callback = function()
        vim.g._prev_winborder = vim.o.winborder
        vim.o.winborder = "none"
        vim.schedule(function()
          vim.o.winborder = vim.g._prev_winborder or "rounded"
        end)
      end,
    })
  end,
}

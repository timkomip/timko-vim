return {
  "mfussenegger/nvim-lint",
  event = { "BufWritePost", "BufReadPost" },
  config = function()
    local lint = require("lint")

    local function first_available(commands)
      for _, command in ipairs(commands) do
        if vim.fn.executable(command) == 1 then
          return command
        end
      end
    end

    local js_linter = first_available({ "oxlint", "eslint" })

    lint.linters_by_ft = {
      javascript = js_linter and { js_linter } or {},
      typescript = js_linter and { js_linter } or {},
      javascriptreact = js_linter and { js_linter } or {},
      typescriptreact = js_linter and { js_linter } or {},
      python = { "ruff" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
      group = vim.api.nvim_create_augroup("nvim-lint", {}),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}

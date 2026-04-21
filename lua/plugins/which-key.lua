return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    wk.setup({})
    wk.add({
      { "<leader>b", group = "Buffers" },
      { "<leader>c", group = "Code" },
      { "<leader>f", group = "File" },
      { "<leader>g", group = "Git" },
      { "<leader>s", group = "Search" },
      { "<leader>u", group = "UI" },
      { "<leader>w", group = "Windows" },
    })
  end,
}

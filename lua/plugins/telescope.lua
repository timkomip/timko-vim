return {
  "nvim-telescope/telescope-live-grep-args.nvim",
  keys = {
    { "<leader>\\", "<cmd>Telescope live_grep_args<cr>", desc = "Command History" },
  },
  config = function()
    LazyVim.on_load("telescope.nvim", function()
      local telescope = require("telescope")

      telescope.load_extension("live_grep_args")
    end)
  end,
}

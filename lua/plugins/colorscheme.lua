return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      highlight_groups = {
        NormalFloat = { bg = "surface" },
        FloatBorder = { fg = "subtle", bg = "surface" },
      },
    })
    vim.cmd.colorscheme("rose-pine")
  end,
}
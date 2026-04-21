return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "ruby",
      "typescript",
      "javascript",
      "tsx",
      "html",
      "markdown",
      "markdown_inline",
      "yaml",
      "lua",
      "python",
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
}

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
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
  },
}

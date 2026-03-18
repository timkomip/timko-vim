return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          enabled = true,
          mason = false,
          cmd = { vim.fn.expand("~/.rbenv/shims/ruby-lsp") },
        },
        rubocop = {
          enabled = true,
          mason = false,
          cmd = { vim.fn.expand("~/.rbenv/shims/rubocop") },
        },
      },
    },
  },
}

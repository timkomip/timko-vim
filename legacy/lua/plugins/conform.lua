return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ruby = { "rubocop" },
      eruby = { "erb_format" },
    },

    formatters = {
      rubocop = {
        command = "~/.rbenv/shims/rubocop",
      },
    },
  },
}

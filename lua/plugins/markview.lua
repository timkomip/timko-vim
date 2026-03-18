return {
	"OXY2DEV/markview.nvim",
	lazy = false, -- plugin handles its own lazy-loading
	keys = {
		{ "<leader>um", "<cmd>Markview toggle<cr>", desc = "Toggle markdown preview" },
		{ "<leader>us", "<cmd>Markview splitToggle<cr>", desc = "Toggle markdown split preview" },
	},
}

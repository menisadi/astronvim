return {
	"stevearc/aerial.nvim",
	opts = {
		-- backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
		filter_kind = {
			markdown = false, -- show everything for markdown
			["_"] = {
				"Class",
				"Constructor",
				"Function",
				"Interface",
				"Module",
				"Method",
				"Struct",
			},
		},
	},
}

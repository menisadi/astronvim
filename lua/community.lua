-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.pack.lua" },
	{ import = "astrocommunity.pack.python-ruff" },
	{ import = "astrocommunity.pack.markdown" },
	{ import = "astrocommunity.pack.yaml" },
	{ import = "astrocommunity.pack.sql" },
	{ import = "astrocommunity.colorscheme.kanagawa-nvim" },
	{ import = "astrocommunity.recipes.heirline-mode-text-statusline" },
	{ import = "astrocommunity.quickfix.nvim-bqf" },
	{ import = "astrocommunity.editing-support.nvim-treesitter-endwise" },
	{ import = "astrocommunity.code-runner.vim-slime" },
	{ import = "astrocommunity.motion.nvim-surround" },
	{ import = "astrocommunity.editing-support.todo-comments-nvim" },
	{ import = "astrocommunity.file-explorer.oil-nvim" },
	{ import = "astrocommunity.motion.flash-nvim" },
	{ import = "astrocommunity.media.vim-wakatime" },
	{ import = "astrocommunity.workflow.hardtime-nvim" },
	-- { import = "astrocommunity.scrolling.mini-animate" },
	-- import/override with your plugins folder
}

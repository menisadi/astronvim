---@type LazySpec
return {
	"AstroNvim/astrocore",
	---@type AstroCoreOpts
	opts = {
		autocmds = {
			colorscheme_background = {
				{
					event = "OptionSet",
					pattern = "background",
					nested = true,
					desc = "Switch colorscheme when background changes",
					callback = function()
						if vim.o.background == "dark" then
							vim.cmd.colorscheme("kanagawa")
						else
							vim.cmd.colorscheme("default")
						end
					end,
				},
			},
		},
		options = {
			g = {
				python3_host_prog = "/Users/meni/.pyenv/versions/nvim/bin/python3",
			},
		},
		mappings = {
			n = {
				["<Leader>lq"] = {
					":!sqlfluff fix %<CR><CR>",
					desc = "Run SqlFluff on the current buffer.",
					noremap = true,
					silent = true,
				},
				["<Leader>ra"] = {
					":SlimeSend1 %autoindent<CR>",
					desc = "Toggle autoindent on IPython REPL",
					noremap = true,
					silent = true,
				},
				["<Leader>rn"] = {
					"o<CR># %%<CR>",
					desc = "New 'cell'",
				},
				["]C"] = {
					[[:/^\# %%<CR>j]],
					desc = "Go to next cell",
				},
				["[C"] = {
					[[:?^\# %%<CR>?^\# %%<CR>j]],
					desc = "Go to previous cell",
				},
				["<Leader>rm"] = {
					"o<CR># %% [markdown]<CR># ",
					desc = "New Markdown 'cell'",
				},
				["<Leader>Sz"] = {
					function()
						local stats = require("lazy").stats()
						local ms = math.floor(require("lazy").stats().startuptime * 100 + 0.5) / 100
						local stat_string = "loaded "
							.. stats.loaded
							.. "/"
							.. stats.count
							.. " plugins in "
							.. ms
							.. "ms"
						vim.api.nvim_echo({ { stat_string, "Title" } }, true, {})
					end,
					desc = "Show Lazy loading stats",
				},
			},
			i = {},
			x = {},
			o = {},
			t = {},
		},
	},
}

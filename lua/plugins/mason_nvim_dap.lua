return {
	"jay-babu/mason-nvim-dap.nvim",
	opts = {
		handlers = {
			function(cfg)
				require("mason-nvim-dap").default_setup(cfg)
			end,

			-- python: run current buffer as a module (-m)
			python = function(config)
				config.configurations = {
					{
						type = "python",
						request = "launch",
						name = "Debug current module (-m)",
						module = function()
							local r = vim.fn.fnamemodify(vim.fn.expand("%:r"), ":.")
							return (r:gsub("[/\\\\]", ".")) -- path -> dotted module
						end,
						cwd = function()
							return vim.fn.getcwd()
						end,
						justMyCode = false,
					},
					{
						type = "python",
						request = "launch",
						name = "Debug current file (script)",
						program = "${file}",
						cwd = "${workspaceFolder}",
						justMyCode = false,
					},
				}

				require("mason-nvim-dap").default_setup(config)
			end,
		},
	},
}

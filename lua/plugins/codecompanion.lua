return {
	"olimorris/codecompanion.nvim",
	opts = {
		interactions = {
			chat = { adapter = "copilot" },
		},
		adapters = {
			acp = {
				codex = function()
					return require("codecompanion.adapters").extend("codex", {
						defaults = {
							auth_method = "chatgpt",
						},
						commands = {
							default = { "/Users/meni/.local/bin/codex-acp" },
						},
					})
				end,
			},
		},
	},
}

return {
	"folke/todo-comments.nvim",
	opts = {
		keywords = {
			TEMP = {
				icon = " ",
				color = "time",
				alt = { "TEMPORARY", "TMP", "WIP" },
			},
			QSTN = {
				icon = "? ",
				color = "wonder",
				alt = { "ASK", "WONDER", "QUES", "THINK" },
			},
		},
		colors = {
			wonder = { "#9966CC" },
			time = { "#9CA3AF" },
		},
	},
}

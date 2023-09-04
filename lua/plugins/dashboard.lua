local db = require("dashboard")

db.setup({
	theme = "hyper",
  shortcut_type = 'number',
	config = {
		week_header = {
			enable = true,
		},
    project = { enable = false },
		shortcut = {
			{ desc = " Update", group = "@property", action = "Lazy update", key = "u" },
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				desc = " Config",
				group = "Number",
				action = "e ~/.config/nvim/",
				key = "d",
			},
		},
	},
})

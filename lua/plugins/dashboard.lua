-- local get_icon = require("astroui").get_icon

return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        -- keys = {
        --   { key = "n", action = "<Leader>n", icon = get_icon("FileNew", 0, true), desc = "New File  " },
        --   { key = "f", action = "<Leader>ff", icon = get_icon("Search", 0, true), desc = "Find File  " },
        --   { key = "o", action = "<Leader>fo", icon = get_icon("DefaultFile", 0, true), desc = "Recents  " },
        --   { key = "w", action = "<Leader>fw", icon = get_icon("WordFile", 0, true), desc = "Find Word  " },
        --   { key = "'", action = "<Leader>f'", icon = get_icon("Bookmarks", 0, true), desc = "Bookmarks  " },
        --   { key = "s", action = "<Leader>Sl", icon = get_icon("Refresh", 0, true), desc = "Last Session  " },
        -- },
        header = table.concat({
          "✨✨  („• ֊ •„)੭  ✨✨",
          "      Hi There!",
        }, "\n"),
      },
    },
  },
}

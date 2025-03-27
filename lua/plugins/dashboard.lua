return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        -- keys = {
        --   {
        --     key = "h",
        --     action = function() vim.notify "Hello World!" end,
        --     desc = "Say Hi",
        --   },
        -- },
        header = table.concat({
          "✨✨  („• ֊ •„)੭  ✨✨",
          "      Hi There!",
        }, "\n"),
      },
    },
  },
}

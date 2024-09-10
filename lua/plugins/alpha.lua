return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    opts.section.buttons.val = {
      opts.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      opts.button("SPC O", "  Oil", "<CMD> Oil <CR>"),
      opts.button("SPC f f", "󰐱  Find file", "<CMD> Telescope find_files <CR>"),
      opts.button("SPC f z", "  Zoxide", "<CMD> Telescope zoxide list <CR>"),
      opts.button("SPC f o", "󰋚  Recents", "<CMD> Telescope oldfiles <CR>"),
      -- opts.button("SPC S l", "󰕇 Last session", ":echo not working yet <CR>"),
      opts.button("q", "󰅚  Quit", ":qa<CR>"),
    }
    opts.section.header.val = {
      "✨✨  („• ֊ •„)੭  ✨✨",
      "      Hi There!",
    }
  end,
}

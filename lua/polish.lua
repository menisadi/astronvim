-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- TODO: is this the right place for this Neovide config?
if vim.g.neovide then
  vim.g.neovide_window_blurred = true
  vim.g.neovide_scale_factor = 1.5
end

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  desc = "Set up python specific settings",
  group = vim.api.nvim_create_augroup("python_settings", {}),
  callback = function(args)
    vim.keymap.set(
      "n",
      "<Leader>le",
      "<cmd>w<CR><cmd>10split <bar> terminal python %<CR>",
      { desc = "Execute Python code in a new pane", remap = false, buffer = args.buf }
    )
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  desc = "Set up lua specific settings",
  group = vim.api.nvim_create_augroup("lua_settings", {}),
  callback = function(args)
    vim.keymap.set(
      "n",
      "<Leader>le",
      function() vim.cmd(":term /Applications/love.app/Contents/MacOS/love " .. vim.fn.expand "%:p:h") end,
      { desc = "Execute Love game in a new pane", remap = false, buffer = args.buf }
    )
  end,
})

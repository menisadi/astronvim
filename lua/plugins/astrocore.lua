-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

local lp = require "luasnip"
local fl = require "flash"
local td = require "todo-comments"

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        python3_host_prog = "/Users/me/.pyenv/versions/nvim/bin/python3",
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map
        ["<Leader>fl"] = {
          function() fl.jump() end,
          desc = "Flash jump",
          remap = true,
        },
        ["<Leader>lc"] = {
          function() require("neogen").generate() end,
          noremap = true,
          silent = true,
          desc = "Generate annotation using Neogen",
        },
        ["[c"] = {
          function() td.jump_prev() end,
          desc = "Previous todo comment",
          silent = true,
        },
        ["]c"] = {
          function() td.jump_next() end,
          desc = "Next todo comment",
          silent = true,
        },
        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
      },
      i = {
        ["<C-K>"] = { function() lp.expand() end, silent = true },
        ["<C-L>"] = { function() lp.jump(1) end, silent = true },
        ["<C-J>"] = { function() lp.jump(-1) end, silent = true },
        ["<C-E>"] = {
          function()
            if lp.choice_active() then require("luasnip").change_choice(1) end
          end,
          silent = true,
        },
      },
      x = {
        ["<Leader>fl"] = { function() fl.jump() end, desc = "Flash jump", remap = true },
      },
      o = {
        ["<Leader>fl"] = { function() fl.jump() end, desc = "Flash jump", remap = true },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}

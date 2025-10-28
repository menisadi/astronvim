return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      options = {
        -- NOTE: Not a mapping, I know, but for now it will be here
        -- Later I might move this to a separate file
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
          -- ["<Leader>lc"] = {
          --   function() require("neogen").generate() end,
          --   noremap = true,
          --   silent = true,
          --   desc = "Generate annotation using Neogen",
          -- },
        },
        i = {
          -- ["<C-K>"] = { function() require("luasnip").expand() end, silent = true },
          -- ["<C-L>"] = { function() require("luasnip").jump(1) end, silent = true },
          -- ["<C-J>"] = { function() require("luasnip").jump(-1) end, silent = true },
          -- ["<C-E>"] = {
          --   function()
          --     if require("luasnip").choice_active() then require("luasnip").change_choice(1) end
          --   end,
          --   silent = true,
          -- },
        },
        x = {},
        o = {},
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
}

if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    config.sources = {
      null_ls.builtins.diagnostics.sqlfluff.with {
        extra_args = { "--dialect", "athena" },
      },
      null_ls.builtins.diagnostics.sqlfluff.with {
        extra_args = { "--dialect", "athena" },
      },

      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
    }
    return config -- return final config table
  end,
}

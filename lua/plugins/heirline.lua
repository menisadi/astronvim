return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require("astroui.status")
    opts.statusline = {
      hl = { fg = "fg", bg = "bg" },
      status.component.mode({
        mode_text = { padding = { left = 1, right = 1 } },
      }),
      { flexible = 3, status.component.git_branch(), {} },
      { flexible = 2, status.component.file_info(),  {} },
      { flexible = 4, status.component.git_diff(),   {} },
      status.component.diagnostics(),
      status.component.fill(),
      status.component.cmd_info(),
      { flexible = 1, status.component.fill(), {} },
      status.component.lsp(),
      status.component.virtual_env(),
      status.component.treesitter(),
      {
        static = {
          n_requests = 0,
          request_symbol = "⟳",
          done_symbol = "✓",
        },
        init = function(self)
          if self._cc_autocmds then
            return
          end
          self._cc_autocmds = true
          vim.api.nvim_create_autocmd("User", {
            pattern = "CodeCompanionRequestStarted",
            callback = function()
              self.n_requests = self.n_requests + 1
              vim.cmd("redrawstatus")
            end,
          })
          vim.api.nvim_create_autocmd("User", {
            pattern = "CodeCompanionRequestFinished",
            callback = function()
              self.n_requests = math.max(0, self.n_requests - 1)
              vim.cmd("redrawstatus")
            end,
          })
        end,
        provider = function(self)
          if not package.loaded["codecompanion"] then
            return nil
          end
          local symbol
          if self.n_requests > 0 then
            symbol = self.request_symbol
          else
            symbol = self.done_symbol
          end
          return (" %d %s "):format(self.n_requests, symbol)
        end,
        hl = function()
          return status.hl.filetype_color()
        end,
      },
      status.component.nav(),
    }
  end,
}

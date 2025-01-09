return {
  "epwalsh/pomo.nvim",
  version = "*", -- Recommended, use latest release instead of latest commit
  lazy = true,
  cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
  dependencies = {
    -- Optional, but highly recommended if you want to use the "Default" timer
    "rcarriga/nvim-notify",
  },
  opts = {
    sticky = false,
  },
  keys = {
    { "<leader>pp", "<cmd>TimerStart 35m<cr>", desc = "Start Pomodoro Timer (35m)" },
    { "<leader>pP", "<cmd>TimerStop<cr>", desc = "End Pomodoro Timer" },
    { "<leader>pP", "<cmd>TimerStop<cr>", desc = "Stop Pomodoro Timer" },
    { "<leader>pe", "<cmd>TimerPausecr>", desc = "Pause Pomodoro Timer" },
    { "<leader>pr", "<cmd>TimerResume<cr>", desc = "Resume Pomodoro Timer" },
    { "<leader>pw", "<cmd>TimerShow<cr>", desc = "Show Pomodoro Timer" },
    { "<leader>pq", "<cmd>TimerHide<cr>", desc = "Hide Pomodoro Timer" },
  },
}

return {
  "stevearc/aerial.nvim",
  opts = {
    filter_kind = {
      "Class",
      "Function",
      "Method",
    },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  {
    "dressing.nvim",
    opts = {
      input = {
        insert_only = false,
      },
    },
  },
}

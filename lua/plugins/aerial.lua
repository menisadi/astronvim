-- require("aerial").setup({
--   filter_kind = {
--     "Class",
--     "Constructor",
--     "Enum",
--     "Function",
--     "Interface",
--     "Module",
--     "Method",
--     "Struct",
--   },
-- })

return {
  "stevearc/aerial.nvim",
  opts = {
    filter_kind = {
      "Class",
      "Constructor",
      -- "Enum",
      "Function",
      "Interface",
      "Module",
      "Method",
      "Struct",
    },
  },
}

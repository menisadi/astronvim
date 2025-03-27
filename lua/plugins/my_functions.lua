local function get_relative_path_with_dots()
  local current_file = vim.fn.expand "%:p"
  local cwd = vim.fn.getcwd()
  local relative_path = current_file:gsub("^" .. vim.pesc(cwd .. "/"), "")
  local path_with_dots = relative_path:gsub("/", ".")
  local path_without_extension = path_with_dots:gsub("%.py$", "")

  vim.cmd "split | terminal"
  vim.fn.chansend(vim.b.terminal_job_id, "python -m " .. path_without_extension .. "\n")
end

return {
  "AstroNvim/astrocore",
  opts = {
    mappings = {
      n = {
        ["<Leader>tr"] = {
          get_relative_path_with_dots,
          desc = "Run current module on terminal split",
        },
      },
    },
  },
}

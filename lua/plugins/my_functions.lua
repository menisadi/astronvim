local function get_relative_path_with_dots()
	local current_file = vim.fn.expand("%:p")
	local cwd = vim.fn.getcwd()
	local relative_path = current_file:gsub("^" .. vim.pesc(cwd .. "/"), "")
	local path_with_dots = relative_path:gsub("/", ".")
	local path_without_extension = path_with_dots:gsub("%.py$", "")

	vim.cmd("split | terminal")
	local runner = vim.g.python_runner or "python"
	if runner == "uv" then
		runner = "uv run"
	end
	vim.fn.chansend(vim.b.terminal_job_id, runner .. " -m " .. path_without_extension .. "\n")
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
				["<Leader>tp"] = {
					function()
						if vim.g.python_runner == nil or vim.g.python_runner == "python" then
							vim.g.python_runner = "uv"
							print("Switched python runner to uv")
						else
							vim.g.python_runner = "python"
							print("Switched python runner to python")
						end
					end,
					desc = "Toggle python runner between python and uv",
				},
				["<Leader>ts"] = {
					function()
						local runner = vim.g.python_runner or "python"
						print("Current python runner: " .. runner)
					end,
					desc = "Show current python runner",
				},
			},
		},
	},
}

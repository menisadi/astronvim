-- lua/timew.lua
-- Minimal, non-intrusive Timewarrior commands for Neovim
-- Commands provided:
--  :TimewStart proj,deepwork        → timew start proj deepwork
--  :TimewContinue                   → timew continue (last)
--  :TimewStop                       → timew stop
--  :TimewSummary [:day|:week|...]   → timew summary (default :day)

local M = {}

local function trim(s)
	return (s:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function split_csv(s)
	local out = {}
	if not s or s == "" then
		return out
	end
	for part in s:gmatch("[^,]+") do
		table.insert(out, trim(part))
	end
	return out
end

local function split_words(s)
	local out = {}
	if not s or s == "" then
		return out
	end
	for w in s:gmatch("%S+") do
		table.insert(out, w)
	end
	return out
end

local function truncate_lines(s, max_lines)
	local lines = {}
	if not s or s == "" then
		return ""
	end
	for line in (s .. "\n"):gmatch("(.-)\n") do
		table.insert(lines, line)
		if #lines >= max_lines then
			break
		end
	end
	if s:find("\n") and #lines == max_lines then
		lines[#lines] = lines[#lines] .. " …"
	end
	return table.concat(lines, "\n")
end

local function run(cmdlist, title)
	local function on_exit(code, stdout, stderr)
		if code == 0 then
			local msg = truncate_lines(trim(stdout ~= "" and stdout or (title .. " done")), 12)
			vim.schedule(function()
				vim.notify(title .. " ✓\n" .. msg, vim.log.levels.INFO, { title = "Timewarrior" })
			end)
		else
			local err = trim(stderr ~= "" and stderr or stdout)
			if err == "" then
				err = "Exited with code " .. tostring(code)
			end
			vim.schedule(function()
				vim.notify(title .. " ✗\n" .. err, vim.log.levels.ERROR, { title = "Timewarrior" })
			end)
		end
	end

	-- Prefer vim.system (Neovim ≥0.10). Fallback to jobstart.
	if vim.system then
		vim.system(cmdlist, { text = true }, function(obj)
			on_exit(obj.code or 1, obj.stdout or "", obj.stderr or "")
		end)
	else
		local stdout, stderr = {}, {}
		local jobid = vim.fn.jobstart(cmdlist, {
			stdout_buffered = true,
			stderr_buffered = true,
			on_stdout = function(_, data)
				if data and #data > 0 then
					table.insert(stdout, table.concat(data, "\n"))
				end
			end,
			on_stderr = function(_, data)
				if data and #data > 0 then
					table.insert(stderr, table.concat(data, "\n"))
				end
			end,
			on_exit = function(_, code)
				on_exit(code, table.concat(stdout, "\n"), table.concat(stderr, "\n"))
			end,
		})
		if jobid <= 0 then
			vim.notify("Failed to start background job", vim.log.levels.ERROR, { title = "Timewarrior" })
		end
	end
end

local function timew(args, title)
	local cmd = { "timew" }
	for _, a in ipairs(args) do
		table.insert(cmd, a)
	end
	run(cmd, title)
end

function M.setup()
	-- :TimewStart proj,tag2,tag3
	vim.api.nvim_create_user_command("TimewStart", function(opts)
		local tags = split_csv(opts.args)
		local argv = { "start" }
		for _, t in ipairs(tags) do
			table.insert(argv, t)
		end
		timew(argv, "timew start")
	end, { nargs = "?" })

	-- :TimewContinue (continues the most recent interval)
	vim.api.nvim_create_user_command("TimewContinue", function()
		timew({ "continue" }, "timew continue")
	end, { nargs = 0 })

	-- :TimewStop
	vim.api.nvim_create_user_command("TimewStop", function()
		timew({ "stop" }, "timew stop")
	end, { nargs = 0 })

	-- :TimewSummary [range]
	-- Examples: :TimewSummary            → default :day
	--           :TimewSummary :week      → summary for week
	--           :TimewSummary :month     → summary for month
	vim.api.nvim_create_user_command("TimewSummary", function(opts)
		local args = split_words(opts.args)
		if #args == 0 then
			args = { ":day" }
		end
		local argv = { "summary" }
		for _, a in ipairs(args) do
			table.insert(argv, a)
		end
		timew(argv, "timew summary")
	end, { nargs = "?" })
end

return M

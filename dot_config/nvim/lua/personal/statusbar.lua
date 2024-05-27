local function get_battery_status()
  local battery = "N/A"
  local job = vim.fn.jobstart("pmset -g batt | grep -Eo \"\\d+%\"", {
    cwd = "/tmp",
    on_exit = function(jobid, data, event)
      vim.fn.chansend(jobid, "exit")
    end,
    on_stdout = function(jobid, data, event)
      battery = data
    end,
  })
  return battery
end

local function get_time()
  local handle = io.popen("date")
  local result = handle:read("*a")
  handle:close()
  result = string.sub(result, 1, -2)
  return result or "N/A"
end
local function status_line()
  local mode = " %-3{%v:lua.string.upper(v:lua.vim.fn.mode())%}"
  local file_name = "%-.16t"
  local buf_nr = "[%n]"
  local modified = " %-m"
  local file_type = " %y"
  local right_align = "%="
  local line_no = "%10([%l/%L%)]"
  local pct_thru_file = "%5p%%"
  local time = " %{v:lua.get_time()}"
  local battery_status  = " " -- "   %{v:lua.get_battery_status()}"
  local filemode = "%-2{v:lua.get_modeicons()} "

  return string.format("%s%s%s%s%s%s%s", mode, filemode, time, right_align, file_name, file_type, battery_status)
end

vim.opt.winbar = status_line()

-- The function must be global to be accessible in the statusline.
_G.get_battery_status = get_battery_status
_G.get_time = get_time

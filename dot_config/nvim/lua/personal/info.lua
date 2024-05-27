local popup = require("plenary.popup")

local function create_window()

    local width =  60
    local height =  10
    local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

    local bufnr = vim.api.nvim_create_buf(false, false)

    local Harpoon_cmd_win_id, win = popup.create(bufnr, {
        title = "System Info",
        highlight = "Info",
        line = math.floor(((vim.o.lines - height) / 2) - 1),
        col = math.floor((vim.o.columns - width) / 2),
        minwidth = width,
        minheight = height,
        borderchars = borderchars,
    })

    vim.api.nvim_win_set_option(
        win.border.win_id,
        "winhl",
        "Normal:HarpoonBorder"
    )

    return {
        bufnr = bufnr,
        win_id = Harpoon_cmd_win_id,
    }
end


function get_info ()
  local battery = vim.api.nvim_command("r !cat /sys/class/power_supply/CMB0/capacity")
  return "Battery: " .. battery .. "%"
100
end

vim.api.nvim_create_user_command('DisplayInfo', function()
  local info = get_info()
  local win = create_window()
  vim.api.nvim_buf_set_lines(win.bufnr, 0, -1, false, {"Hello World"})
end, {})




local attach_to_bufnr = require("personal.attach").attach_to_bufnr

-- attach_to_bufnr(4, "*.py", {"python", "test.py"})
vim.api.nvim_create_user_command('AutorunAssign', function()
  print("Autorun starting now")
  local bufnr = vim.fn.input "Bufnr: "
  local pattern = vim.fn.input "Pattern: "
  local command = vim.split(vim.fn.input "Command: ", " ")
  attach_to_bufnr(tonumber(bufnr), pattern, command)
end, {}
)

vim.api.nvim_create_user_command('Autorun', function()
  print("Autorun starting now")
  local bufnr = vim.api.nvim_create_buf(false, true)
  local pattern = vim.split(vim.fn.input "Pattern(s): ", " ")
  local command = vim.split(vim.fn.input "Command: ", " ")
  for _, arg in ipairs(command) do
    if arg == "%" then
      command[_] = vim.api.nvim_buf_get_name(0)
    end
  end
  vim.cmd('vsplit')
  vim.api.nvim_win_set_buf(0, bufnr)
  attach_to_bufnr(tonumber(bufnr), pattern, command)
end, {}
)

vim.api.nvim_create_user_command('AutorunPy', function()
  print("Autorun starting now")
  local bufnr = vim.api.nvim_create_buf(false, true)
  local pattern = "*.py,*.yaml"
  local command = {"python", vim.api.nvim_buf_get_name(0)}
  vim.cmd('vsplit')
  vim.api.nvim_win_set_buf(0, bufnr)
  attach_to_bufnr(tonumber(bufnr), pattern, command)
end, {}
)


vim.api.nvim_create_user_command('AutorunMakeFileType', function()
  print("Autorun starting now.")
  
  local bufnr = vim.api.nvim_create_buf(false, true)
  local cur_file_ext = vim.bo.filetype
  local pattern = string.format("*.%s", cur_file_ext)
  local command = {"make"}

  print("Pattern(s): ", pattern)
  print("Command: make")

  for _, arg in ipairs(command) do
    if arg == "%" then
      command[_] = vim.api.nvim_buf_get_name(0)
    end
  end
  vim.cmd('vsplit')
  vim.api.nvim_win_set_buf(0, bufnr)
  attach_to_bufnr(tonumber(bufnr), pattern, command)
end, {}
)

vim.api.nvim_create_user_command('AutorunMake', function()
  print("Autorun starting now.")
  local bufnr = vim.api.nvim_create_buf(false, true)
  local pattern = string.format("*")
  local command = {"make"}

  print("Pattern(s): ", pattern)
  print("Command: make")

  for _, arg in ipairs(command) do
    if arg == "%" then
      command[_] = vim.api.nvim_buf_get_name(0)
    end
  end
  vim.cmd('vsplit')
  local init_win = vim.api.nvim_get_current_win() 
  vim.api.nvim_win_set_buf(0, bufnr)
  -- vim.cmd('res -20')
  attach_to_bufnr(tonumber(bufnr), pattern, command)
  vim.api.nvim_set_current_win(init_win)
end, {}
)

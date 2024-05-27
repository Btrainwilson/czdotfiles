-- Desc: Set default modes for vim
-- Available modes: paper, presentation, programming, writing
MODES = {"Programming", "Paper", "Presentation" }
MODEICONS = { "", "󰼭", "󰐨" }

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

local function getModeIndex()
  local currentMode = _G.filemode
  local currentModeIndex = 1
  for index, value in ipairs(MODES) do
    if value == currentMode then
      currentModeIndex = index
    end
  end
  return currentModeIndex
end

local function nextMode() 
  local nextModeIndex = getModeIndex() + 1
  if nextModeIndex > #MODES then
    nextModeIndex = 1
  end
  local nextMode = MODES[nextModeIndex]
  set_filemode(nextMode)
end

local function set_filemode(mode)
  if not has_value(MODES, mode) then
    print("Invalid mode: ")
    print(mode)
    return
  end
  _G.filemode = mode
  print("Setting filemode to: ")
  print(mode)


end

local function get_filemode()
  return _G.filemode
end

local function get_modeicons()
  return MODEICONS[getModeIndex()]
end

_G.filemode = "Programming"
_G.get_filemode = get_filemode
_G.set_filemode = set_filemode
_G.nextMode = nextMode
_G.get_modeicons = get_modeicons

vim.api.nvim_create_user_command('SetMode', function(opts)
  set_filemode(opts.args)
end, {nargs = '?'}
)

vim.api.nvim_create_user_command('NextMode', function(opts)
  nextMode()
end, {nargs = '?'}
)

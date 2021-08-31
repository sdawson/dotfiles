local hotkey = require "hs.hotkey"
local window = require "hs.window"
local application = require "hs.application"
local hints = require "hs.hints"

window.animationDuration = 0

hints.style = "vimperator"
hints.showTitleThresh = 30
hotkey.bind({"cmd"}, "J", function()
  hints.windowHints()
end)

local apps = {
  { key = "c", app = "google chrome" },
  { key = "v", app = "MacVim" },
  { key = "s", app = "slack" },
  { key = "t", app = "iterm" },
  { key = "a", app = "the archive" },
  { key = "x", app = "textedit" }
}

for i, object in ipairs(apps) do
  hotkey.bind({"cmd", "alt", "ctrl", "shift"}, object.key, function()
    application.launchOrFocus(object.app)
  end)
end

hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "1", function()
  -- move the focused window one display to the left
  local win = window.focusedWindow()
  win:moveOneScreenWest()
end)

hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "2", function()
  -- move the focused window one display to the right
  local win = window.focusedWindow()
  win:moveOneScreenEast()
end)

hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "h", function()
  -- size focused window to left half of display
  local win = window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "l", function()
  -- size focused window to right half of display
  local win = window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "j", function()
  -- size focused window to left 40% of display
  local win = window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = 4 * max.w / 10
  f.h = max.h
  win:setFrame(f)
end)

hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "k", function()
  -- size focused window to right 60% of display
  local win = window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (4 * max.w / 10)
  f.y = max.y
  f.w = 6 * max.w / 10
  f.h = max.h
  win:setFrame(f)
end)

hotkey.bind({"cmd", "alt", "ctrl", "shift"}, ";", function()
  -- size focused window to left 60% of display
  local win = window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = 6 * max.w / 10
  f.h = max.h
  win:setFrame(f)
end)

hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "'", function()
  -- size focused window to right 40% of display
  local win = window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (6 * max.w / 10)
  f.y = max.y
  f.w = 4 * max.w / 10
  f.h = max.h
  win:setFrame(f)
end)

hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "m", function()
  -- maximuze focused window to cover whole screen
  local win = window.focusedWindow()
  win:maximize()
end)

hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "o", function()
  -- center focused window on screen
  local win = window.focusedWindow()
  win:centerOnScreen()
end)

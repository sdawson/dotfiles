hs.logger.defaultLogLevel = "info"

lg = hs.logger.new("blah", "info")

hs.hotkey.bind({"cmd", "alt"}, "V", function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

local pos = hs.screen.screenPositions()
for k, v in pairs(pos) do
  lg.i(k)
  for k2, v2 in pairs(v) do
    lg.i(k2)
    lg.i(v2)
  end
end
-- lg.i(hs.screen.screenPositions())

hs.hints.style = "vimperator"
hs.hints.showTitleThresh = 30
hs.hotkey.bind({"cmd"}, "E", function()
  hs.hints.windowHints()
end)

-- these layouts assume they're being set as part of the unitrect layout 
-- setting
local gobig = {x = 0, y = 0, w = 1, h = 1}
local gosmallerleft = {x = 0, y = 0, w = 0.4, h = 1}
local gobiggerright = {x = 0.4, y = 0, w = 0.60, h = 1}

local leftscreen = hs.screen.find("0,0")
local rightscreen = hs.screen.find("1,0")

-- layout format reminder
-- {"App name", "Window name", "Display/screen name", "unitrect", "framerect", "fullframerect"}
-- Can only specify one of unitrect, framerect and fullframerect

-- layout for two screens
local worklayout = {
  {"MacVim",        nil, leftscreen,  gobig,         nil, nil},
  {"iTerm2",         nil, rightscreen, gosmallerleft, nil, nil},
  {"Google Chrome", nil, rightscreen, gobiggerright, nil, nil},
  -- {"Slack",         nil, leftscreen,  what,          nil, nil} -- TODO: not sure for this, should just be on one screen in whatever size it is normally
}

hs.hotkey.bind({"cmd", "alt"}, "2", function()
  hs.layout.apply(worklayout)
end)

-- TODO:
--  - add a hotkey to arrange the active window (this is probably for making a 
--  second browser window go to the left behind the terminal so that I can be 
--  looking at two browser windows simultaneously

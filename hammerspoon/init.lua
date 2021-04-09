-- apps
terminal = "Alacritty"
browser  = "FireFox"
git      = "Fork"
notes    = "Obsidian"
chat     = "Slack"
music    = "Music"
empty    = "Finder"

-- Keys
hyper = {"ctrl", "alt", "cmd", "shift"}

-- Window Halfs and Thirds
hs.loadSpoon("WindowHalfsAndThirds")
spoon.WindowHalfsAndThirds:bindHotkeys({
  left_half   = { hyper, "N" },
  right_half  = { hyper, "M" },
  third_left  = { hyper, "I" },
  third_right = { hyper, "O" },
  max_toggle  = { hyper, "'" },
  undo        = { hyper, "U" },
  larger      = { hyper, "=" },
  smaller     = { hyper, "-" },
})

-- Window Screen
hs.loadSpoon("WindowScreenLeftAndRight")
spoon.WindowScreenLeftAndRight:bindHotkeys({
  screen_left = { hyper, "[" },
  screen_right= { hyper, "]" },
})

-- Window hopping
hs.hotkey.bind(hyper, "H", function() hs.window.filter.focusWest() end)
hs.hotkey.bind(hyper, "J", function() hs.window.filter.focusSouth() end)
hs.hotkey.bind(hyper, "K", function() hs.window.filter.focusNorth() end)
hs.hotkey.bind(hyper, "L", function() hs.window.filter.focusEast() end)
hs.hotkey.bind(hyper, "1", function() hs.application.launchOrFocus(terminal) end)
hs.hotkey.bind(hyper, "2", function() hs.application.launchOrFocus(browser) end)
hs.hotkey.bind(hyper, "3", function() hs.application.launchOrFocus(git) end)
hs.hotkey.bind(hyper, "4", function() hs.application.launchOrFocus(notes) end)
hs.hotkey.bind(hyper, "5", function() hs.application.launchOrFocus(empty) end)
hs.hotkey.bind(hyper, "6", function() hs.application.launchOrFocus(empty) end)
hs.hotkey.bind(hyper, "7", function() hs.application.launchOrFocus(empty) end)
hs.hotkey.bind(hyper, "8", function() hs.application.launchOrFocus(empty) end)
hs.hotkey.bind(hyper, "9", function() hs.application.launchOrFocus(chat) end)
hs.hotkey.bind(hyper, "0", function() hs.application.launchOrFocus(music) end)

-- Terminal
hs.application.enableSpotlightForNameSearches(true)
terminalHidden = false
hs.hotkey.bind({"cmd"}, "Escape", function()
  local app = hs.application.find(terminal)
  local hasFocus = app and app:isFrontmost()
  hs.application.launchOrFocus(terminal)
  if hasFocus and not TerminalHidden then
    terminalHidden = true
    app:hide()
  else
    terminalHidden = false
    app:unhide()
  end
end)

-- Experimentation
hs.hotkey.bind(hyper, "R", function()
  hs.reload()
  hs.notify.new({title='Config reloaded'}):send()
end)

-- Full Screen with padding
hs.hotkey.bind(hyper, ";", function()
  local function round(x, places)
    local places = places or 0
    local x = x * 10^places
    return (x + 0.5 - (x + 0.5) % 1) / 10^places
  end
  local win = hs.window.focusedWindow()
  win:move({ 0.00, 0.00, 1.00, 1.00 })
  local ur, r = win:screen():toUnitRect(win:frame()), round
  local cw = {r(ur.x,2), r(ur.y,2), r(ur.w,2), r(ur.h,2)}
  local move_to_rect = {}
  move_to_rect[3] = cw[3]-0.01
  move_to_rect[4] = cw[4]-0.015
  move_to_rect[1] = cw[1]+0.005
  move_to_rect[2] = cw[2]+0.0075
  win:move(move_to_rect)
end)

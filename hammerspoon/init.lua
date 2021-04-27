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

-- Toggle applications
function toggleApp(appName)
  appHidden = false
  return function()
    local app = hs.application.find(appName)
    local hasFocus = app and app:isFrontmost()
    hs.application.launchOrFocus(appName)
    if hasFocus and not appHidden then
      appHidden = true
      app:hide()
    else
      appHidden = false
      app:unhide()
    end
  end
end

hs.hotkey.bind({"cmd"}, "Escape", toggleApp(terminal))
hs.hotkey.bind(hyper, "1", toggleApp(terminal))
hs.hotkey.bind(hyper, "2", toggleApp(browser))
hs.hotkey.bind(hyper, "3", toggleApp(git))
hs.hotkey.bind(hyper, "4", toggleApp(notes))
hs.hotkey.bind(hyper, "5", toggleApp(empty))
hs.hotkey.bind(hyper, "6", toggleApp(empty))
hs.hotkey.bind(hyper, "7", toggleApp(empty))
hs.hotkey.bind(hyper, "8", toggleApp(empty))
hs.hotkey.bind(hyper, "9", toggleApp(chat))
hs.hotkey.bind(hyper, "0", toggleApp(music))

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

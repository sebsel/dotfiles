-- apps
terminal = "Alacritty"
browser  = "FireFox"
chrome   = "Chrome"
git      = "Fork"
notes    = "Obsidian"
chat     = "Slack"
music    = "Music"
finder   = "Finder"
writer   = "iA Writer"

-- Keys
hyper = {"ctrl", "alt", "cmd", "shift"}

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
hs.application.enableSpotlightForNameSearches(true)
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

-- hs.hotkey.bind({"cmd"}, "Escape", toggleApp(terminal))
hs.hotkey.bind(hyper, "1", toggleApp(chrome))
hs.hotkey.bind(hyper, "2", toggleApp(git))
hs.hotkey.bind(hyper, "3", toggleApp(browser))
hs.hotkey.bind(hyper, "4", toggleApp(notes))
hs.hotkey.bind(hyper, "5", toggleApp(writer))
hs.hotkey.bind(hyper, "6", toggleApp(finder))
hs.hotkey.bind(hyper, "7", function() end)
hs.hotkey.bind(hyper, "8", function() end)
hs.hotkey.bind(hyper, "9", toggleApp(chat))
hs.hotkey.bind(hyper, "0", toggleApp(music))

-- Desk
function deskMove(to)
  return function()
    hs.osascript.applescript([[
      tell application "Desk Controller"
        move "]] .. to .. [["
      end tell
    ]])
  end
end
hs.hotkey.bind(hyper, "-", deskMove("to-sit"))
hs.hotkey.bind(hyper, "=", deskMove("to-stand"))

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

-- apps
terminal = 'Alacritty'

-- Keys
hyper = {"ctrl", "alt", "cmd", "shift"}

-- Window Halfs and Thirds
hs.loadSpoon("WindowHalfsAndThirds")
spoon.WindowHalfsAndThirds:bindHotkeys({
  left_half   = { hyper, "H" },
  right_half  = { hyper, "L" },
  third_left  = { hyper, "J" },
  third_right = { hyper, "K" },
  max_toggle  = { hyper, ";" },
  undo        = { hyper, "U" },
  larger      = { hyper, "N" },
  smaller     = { hyper, "M" },
})

-- Terminal
hs.application.enableSpotlightForNameSearches(true)
terminalOpen = true
hs.hotkey.bind({"cmd"}, "Escape", function()
  hs.application.launchOrFocus(terminal)
  app = hs.application.find(terminal)
  if terminalOpen then
    terminalOpen = false
    app:unhide()
  else
    terminalOpen = true
    app:hide()
  end
end)

local usbWatcher = nil

function usbKeyboardCallback(data)
  if (data["productName"] == "Truly Ergonomic Computer Keyboard") then
    if (data["eventType"] == "added") then
      hs.keycodes.setLayout("U.S.")
    elseif (data["eventType"] == "removed") then
      hs.keycodes.setLayout("Dvorak")
    end
  end
end

usbWatcher = hs.usb.watcher.new(usbKeyboardCallback)
usbWatcher:start()

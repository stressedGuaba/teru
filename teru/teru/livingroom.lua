-- room1.lua
local room1 = {}

function room1.load()
  -- Load resources specific to room 1
  print("Loading room 1...")
end

function room1.update(dt)
  -- Update logic specific to room 1
  print("Updating room 1...")
end

function room1.draw()
  -- Draw elements specific to room 1
  love.graphics.print("Welcome to room 1!", 10, 10)
end

return room1

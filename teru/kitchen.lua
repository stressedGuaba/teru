
-- room2.lua
local room2 = {}

function room2.load()
  -- Load resources specific to room 2
  print("Loading room 2...")
end

function room2.update(dt)
  -- Update logic specific to room 2
  print("Updating room 2...")
end

function room2.draw()
  -- Draw elements specific to room 2
  love.graphics.print("Welcome to room 2!", 10, 10)
end

return room2


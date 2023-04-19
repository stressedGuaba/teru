
local room4 = {}

function room4.load()
  print("Loading room 4...")
end

function room4.update(dt)
  print("Updating room 4...")
end

function room4.draw()
  love.graphics.print("Welcome to room 4!", 10, 10)
end

return room4

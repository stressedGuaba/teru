local room3 = {}

function room3.load()
  print("Loading room 3...")
end

function room3.update(dt)
  print("Updating room 3...")
end

function room3.draw()
  love.graphics.print("Welcome to room 3!", 10, 10)
end

return room3

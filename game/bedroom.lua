local bedroom = {}
local item = require("item")
local myItem = item.new(95, 225)
local item2 = item.new(700, 250)


function bedroom.load()
  print("Loading bedroom...")
  bed = love.graphics.newImage("bed.png")
  wall = love.graphics.newImage("LV_wall.png")
  floor = love.graphics.newImage("LV_floor.png")
end

function bedroom.update(dt)
  print("Updating bedroom...")
  myItem.update(dt)
  item2.update(dt)
end

function bedroom.draw()
  love.graphics.print("Welcome to the bedroom!", 10, 10)
  love.graphics.draw(floor, 0, 0)
  love.graphics.draw(wall, 0, 0)
  myItem.draw()
  love.graphics.draw(bed, 0, 0)
  item2.draw()
end

return bedroom

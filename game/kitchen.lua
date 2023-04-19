-- kitchen.lua
local kitchen = {}

local item = require("item")
local myItem = item.new(650, 350)
local item2 = item.new(250, 200)

local counterDoorVisible = true


function kitchen.load()
  -- Load resources specific to kitchen

  counterdoor = love.graphics.newImage("k_counterdoor.png")
  kitchenImage = love.graphics.newImage("k_kitchen.png")
  wall = love.graphics.newImage("LV_wall.png")
  floor = love.graphics.newImage("LV_floor.png")
  print("Loading kitchen...")
  showImage = true

end

function kitchen.update(dt)
  -- Update logic specific to kitchen
  print("Updating kitchen...")
  myItem.update(dt)
  item2.update(dt)
  if button == 1 and showImage then
    showImage = false
  end

end

function kitchen.draw()
  -- Draw elements specific to kitchen
  love.graphics.print("Welcome to the kitchen", 10, 10)
  love.graphics.draw(floor, 0, 0)
  love.graphics.draw(wall, 0, 0)
  love.graphics.draw(kitchenImage, 0, 0)
  myItem.draw()
  item2.draw()
  if showImage then
    love.graphics.draw(counterdoor, 0, 0)
  end

  
end

function love.mousepressed(x, y, button)
  if button == 1 then -- left mouse button
    -- check if the click is on the image
    if showImage and x >= 0 and x < counterDoor:getWidth() and
       y >= 0 and y < counterDoor:getHeight() then
      showImage = false
    end
    print(love.mouse.isDown(l))
  end
end

return kitchen


-- livingroom.lua
local livingRoom = {}

--bringing the item in
local item = require "item"

local myItem = item.new(800, 290)

function livingRoom.load()
  -- Load resources specific to room 1
  print("Loading living room...")
--[[
  
  sofa = love.graphics.newImage("LV_sofa.png")
  table = love.graphics.newImage("LV_table.png")
  redPillow = love.graphics.newImage("LV_red_pillow.png")
  bluePillow = love.graphics.newImage("LV_blue_pillow.png")
  kirby = love.graphics.newImage("LV_kirby.png")
  curtains = love.graphics.newImage("LV_curtains.png")
  --]]
  LV = love.graphics.newImage("LV_livingroom.png")
  wall = love.graphics.newImage("LV_wall.png")
  floor = love.graphics.newImage("LV_floor.png")

end

function livingRoom.update(dt)
  -- Update logic specific to room 1
  print("Updating living room...")
   -- update items
  myItem.update(dt)
  
end

function livingRoom.draw()
  -- Draw elements specific to room 1
  print("drawing living room")
  love.graphics.print("Welcome to the living room!", 10, 10)

  love.graphics.draw(floor, 0, 0)
  love.graphics.draw(wall, 0, 0)
  love.graphics.draw(LV, 0,0)
  --[[
  love.graphics.draw(curtains, 0, 0)
  love.graphics.draw(sofa, 0, 0)
  love.graphics.draw(redPillow, 0, 0)
  love.graphics.draw(bluePillow, 0, 0)
  love.graphics.draw(kirby, 0, 0)
  love.graphics.draw(kirby, 0, kirbyY)
  love.graphics.draw(table, 0, 0)
  --]]

  myItem.draw()
end

return livingRoom
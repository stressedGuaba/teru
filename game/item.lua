-- item.lua

local item = {}
item.counter = 0

function item.new(x, y)
  local self = {}
  
  self.x = x or 0
  self.y = y or 0
  self.visible = true
  self.image = love.graphics.newImage("tissue.png")
  
  function self.update(dt)
    -- check if the item has been clicked
    if self.visible and love.mouse.isDown(1) then
      local mx, my = love.mouse.getPosition()
      if mx >= self.x and mx < self.x + self.image:getWidth() and
         my >= self.y and my < self.y + self.image:getHeight() then
        item.counter = item.counter + 1
        self.visible = false
      end
    end
    if item.counter == 5 then
      local endscreen = require("endscreen")
      endscreen.load()
    end
  end
  
  function self.draw()
    -- draw the item if it's visible
    if self.visible then
      love.graphics.draw(self.image, self.x, self.y)
    end
    
    -- draw the counter
    love.graphics.print("Item Count: " .. item.counter, 10, 10)
  end
  
  return self
end

return item
--for now

function love.load()
    love.window.setMode(370, 250)
    love.window.setTitle("Teru's Tissues")

    item = {
        x = 100,
        y = 100,
        width = 50,
        height = 50,
        clicked = false,
        image = love.graphics.newImage("tissues.png")
    }
    counter = 0
end

function love.update()
    image = love.graphics.newImage("loading_screen.png")

    
end

function love.draw()
    love.graphics.draw(image, 0, 0)
    if item ~= nil then
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(item.image, item.x, item.y)
    end
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Count: " .. counter, 10, 10)
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        if item ~= nil and x > item.x and x < item.x + item.image:getWidth() and y > item.y and y < item.y + item.image:getHeight() then
            counter = counter + 1
            item = nil
        end
    end
end

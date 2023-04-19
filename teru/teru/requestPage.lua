local requestPage = {}
local currentScreen = requestPage

function love.load()
    requestPage.load()
end

function love.update(dt)
    requestPage.update(dt)
end

function love.draw()
    requestPage.draw()
end

function love.mousepressed()
    requestPage.mousepressed(x, y, button)
end

function requestPage.load()
    font = love.graphics.newFont(24)
    print("are you being called?!")
end

function requestPage.update(dt)
    requestPage.mousepressed()
end

function requestPage.draw()
    love.graphics.print("Do you accept this quest?", 0, 0)
    love.graphics.print("Yes", 0, 50)
    love.graphics.print("No", 0, 75)
end

function requestPage.mousepressed(x, y, button)
        if button == 1 then
            if y > 50 and y < 65 then
                -- If the "Yes" button is clicked, go to the living room
                currentScreen = livingroom
                livingroom.load()
            elseif y > 75 and y < 90 then
                -- If the "No" button is clicked, go back to the start
                currentScreen = startScreen
                startScreen.load()
            end
        end
    end
    
return requestPage

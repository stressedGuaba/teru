local requestPage = {}
local currentScreen = requestPage

function requestPage.load()
end

function requestPage.update(dt)
    function love.mousepressed(x, y, button)
        if button == 1 then
            if y > 50 and y < 65 then
                -- If the "Yes" button is clicked, go to the living room
                currentScreen = livingroom
            elseif y > 75 and y < 90 then
                -- If the "No" button is clicked, go back to the start
                currentScreen = startScreen
            end
        end
    end
    
end

function requestPage.draw()
    love.graphics.print("Do you accept this quest?", 0, 0)
    love.graphics.print("Yes", 0, 50)
    love.graphics.print("No", 0, 75)
end


return requestPage

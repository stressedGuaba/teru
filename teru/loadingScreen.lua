local loadingScreen = {}
local background = love.graphics.newImage("tissues.png")

function loadingScreen.load()
    --window size & name
    love.window.setMode(370, 250)
    love.window.setTitle("Teru's Tissues")
    return true
end

function loadingScreen.update(dt)

end

function loadingScreen.draw()
    -- Draw new screen

    love.graphics.draw(background, 0, 0)
end

return loadingScreen

local loadingScreen = require("loadingscreen")
local text = "Start Game"
local font = love.graphics.newFont(24)
local starting_background = love.graphics.newImage("loading_screen.png")
local currentScreen = loadingScreen
local loadingScreenLoaded = false

function love.load()
    --window size & name
    love.window.setMode(370, 250)
    love.window.setTitle("Teru's Tissues")

    --join game
    startGame = love.graphics.newText(font, "Start Game")
end

function love.update(dt)
    love.graphics.clear()

    if loadingScreenLoaded then
        loadingScreen.update(dt)
    end

    -- Check if screen needs to be replaced
    if replaceScreen then
        currentScreen = replaceScreen
        replaceScreen = nil
    end

end

function love.draw()
    love.graphics.draw(startGame, 100, 100)
    --love.graphics.draw(starting_background, 0, 0) 
    -- Draw current screen
    currentScreen.draw()
end

function love.mousepressed(x, y, button)
    -- Check if mouse is clicked on clickable text
    if button == 1 and x > 100 and x < 100 + startGame:getWidth() and y > 100 and y < 100 + startGame:getHeight() then
        if not loadingScreenLoaded then
            local chunk = love.filesystem.load("loadingscreen.lua")
            chunk()
            loadingScreenLoaded = true
        end
        loadingScreen.load()
    end
end
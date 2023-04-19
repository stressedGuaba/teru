
local dialoguePage = {}
local currentScreen = startScreen
local requestPage = require("requestPage")


local textToDisplay = { -- define and initialize the table
    "Ah?!",
    "I'm in trouble...",
    "I forgot to feed maftueru.. T_T",
    "But I really need to finish writing this song if I want to finish before the deadline...",
    "Would you be kind enough to feed mafuteru for me?",
    "I don't remember where I put his food, you can look around the house.",
    "Please find 10 tissue boxes and feed them to mafteru, thank you!"
}

local currentLine = 1
local numberOfCharsToDisplay = 0
local timePassed = 0
local timeForEachChar = 0.25

function dialoguePage.load()
    
    textToDisplay = {
        "Ah?!",
        "I'm in trouble...",
        "I forgot to feed maftueru.. T_T",
        "But I really need to finish writing this song if I want to finish before the deadline...",
        "Would you be kind enough to feed mafuteru for me?",
        "I don't remember where I put his food, you can look around the house.",
        "Please find 10 tissue boxes and feed them to mafteru, thank you!"
        }
    currentLine = 1
    numberOfCharsToDisplay = 0
    timePassed = 0
    timeForEachChar = 0.25
end

function dialoguePage.update(dt)
    
    timePassed = timePassed + dt
    if timePassed >= timeForEachChar then
         timePassed = timePassed - timeForEachChar
         numberOfCharsToDisplay = numberOfCharsToDisplay + 1
         
    end
    local x, y = love.mouse.getPosition()
    love.mousepressed(x, y, button)

    function love.mousepressed(x, y, button)
        if currentLine == #textToDisplay then
            if button == 1 then
                currentScreen = requestPage
                currentScreen.load()
            end
        end
        if button == 1 then
            --if characters are all displayed, move onto the next line of text
            if numberOfCharsToDisplay >= #textToDisplay[currentLine] then
                -- Move to the next line of text
                currentLine = currentLine + 1
            if currentLine == #textToDisplay then
                -- If end of text, move to next screen
                -- currentScreen = requestPage
                gameState = "requestPage"
                requestPage.load()
            else
                    -- Otherwise, reset the number of characters to display
                    numberOfCharsToDisplay = 0
            end
            else
                -- If the current line is not fully displayed, show the full line
                numberOfCharsToDisplay = #textToDisplay[currentLine]
            end
        end

    end
    

end

function dialoguePage.draw()
    if currentLine <= #textToDisplay then
        love.graphics.print(textToDisplay[currentLine]:sub(1, numberOfCharsToDisplay), 0, 0)
    end
end
--[[
function love.mousepressed(x, y, button)
    if button == 1 then
        if numberOfCharsToDisplay >= #textToDisplay[currentLine] then
            -- Move to the next line of text
            currentLine = currentLine + 1
            if currentLine > #textToDisplay then
                -- If we've reached the end of the text, move to the next screen
                currentScreen = requestPage
            else
                -- Otherwise, reset the number of characters to display
                numberOfCharsToDisplay = 0
            end
        else
            -- If the current line is not fully displayed, show the full line and move to the next line
            numberOfCharsToDisplay = #textToDisplay[currentLine]
            currentLine = currentLine + 1
            if currentLine > #textToDisplay then
                -- If we've reached the end of the text, move to the next screen
                currentScreen = requestPage
            end
        end
    end
end
]]
--[[
local dialoguePage = {}
local currentScreen = startScreen
local requestPage = require("requestPage")

textToDisplay = {
    "Ah?!",
    "I'm in trouble...",
    "I forgot to feed maftueru.. T_T",
    "But I really need to finish writing this song if I want to finish before the deadline...",
    "Would you be kind enough to feed mafuteru for me?",
    "I don't remember where I put his food, you can look around the house.",
    "Please find 10 tissue boxes and feed them to mafteru, thank you!"
}

function dialoguePage.mousepressed(x, y, button)
    if button == 1 then
        if numberOfCharsToDisplay >= #textToDisplay[currentLine] then
            -- Move to the next line of text
            currentLine = currentLine + 1
            if currentLine > #textToDisplay then
                -- If we've reached the end of the text, move to the next screen
                currentScreen = requestPage
            else
                -- Otherwise, reset the number of characters to display
                numberOfCharsToDisplay = 0
            end
        else
            -- If the current line is not fully displayed, show the full line and move to the next line
            numberOfCharsToDisplay = #textToDisplay[currentLine]
            currentLine = currentLine + 1
            if currentLine > #textToDisplay then
                -- If we've reached the end of the text, move to the next screen
                currentScreen = requestPage
            end
        end
    end
end
]]
return dialoguePage
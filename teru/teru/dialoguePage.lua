
local dialoguePage = {}
local currentScreen = dialoguePage
local requestPage = require("requestPage")

function love.load()
    dialoguePage.load()
end

function love.update(dt)
    dialoguePage.update(dt)
end

function love.draw()
    dialoguePage.draw()
end

function love.mousepressed()
    love.mousepressed = dialoguePage.mousepressed
end

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
    dialoguePage.mousepressed(x, y, button)
end

function dialoguePage.draw()
    if currentLine <= #textToDisplay then
        love.graphics.print(textToDisplay[currentLine]:sub(1, numberOfCharsToDisplay), 0, 0)
    end
end

function dialoguePage.mousepressed(x, y, button)
    if button == 1 then
        if currentLine <= #textToDisplay and #textToDisplay > 0 then
            if numberOfCharsToDisplay >= #textToDisplay[currentLine] then
                currentLine = currentLine + 1

                if currentLine == #textToDisplay then
                    gameState = "request"
                    currentScreen = requestPage
                    requestPage.load()
                    print("you sucka")
                else
                    numberOfCharsToDisplay = 0
                end
            else
                numberOfCharsToDisplay = #textToDisplay[currentLine]
            end
        end
    end

end

--[[
function dialoguePage.mousepressed(x, y, button)
    if button == 1 then
        -- numbers of characters to display is less than number on line, display all on line
        if numberOfCharsToDisplay >= #textToDisplay[currentLine] then
            currentLine = currentLine + 1
        if currentLine == #textToDisplay then
            currentScreen = requestPage
            requestPage.load()
        else
            numberOfCharsToDisplay = #textToDisplay[currentLine]
        end
    end
end
end
--]]
return dialoguePage
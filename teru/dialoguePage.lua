local dialoguePage = require("dialoguePage")
local currentScreen = startScreen

function love.load()
    dialoguePage.load()

    textToDisplay = {"Ah!?", "I'm in trouble, in trouble..", "I need to feed teru, but I'm so behind on my music work right now...", "would you be kind enough to help me feed teru for me?!", "Thank you very much!"}
    currentLine = 1
    numberOfCharsToDisplay = 0
    timePassed = 0
    timeForEachChar = 0.25
end

function love.update(dt)
    dialoguePage.update(dt)
    timePassed = timePassed + dt
    if timePassed >= timeForEachChar then
         timePassed = timePassed - timeForEachChar
         numberOfCharsToDisplay = numberOfCharsToDisplay + 1
    end
end

function love.draw()
    dialoguePage.draw()
    love.graphics.print(textToDisplay[currentLine]:sub(1, numberOfCharsToDisplay), 0, 0)
end

function love.mousepressed(x, y, button)
    if button == 1 then
        if numberOfCharsToDisplay < #textToDisplay[currentLine] then
            -- If there are more characters to display, show them
            numberOfCharsToDisplay = #textToDisplay[currentLine]
        else
            -- Otherwise, move to the next line of text
            currentLine = currentLine + 1
            if currentLine > #textToDisplay then
                -- If we've reached the end of the text, loop back to the beginning
                currentLine = 1
            end
            numberOfCharsToDisplay = 0
        end
    end
end
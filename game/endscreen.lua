local endscreen = {}

function endscreen.load()
    textToDisplay = {
        "congradulations, mafuteru is now a fed boy",
        "thank you very much for your service!11!!!111!111"
        }
    currentLine = 1
    numberOfCharsToDisplay = 0
    timePassed = 0
    timeForEachChar = 0.25
end

function endscreen.update(dt)
    timePassed = timePassed + dt
    if timePassed >= timeForEachChar then
         timePassed = timePassed - timeForEachChar
         numberOfCharsToDisplay = numberOfCharsToDisplay + 1
         
    end
end

function endscreen.draw()
    if currentLine <= #textToDisplay then
        love.graphics.print(textToDisplay[currentLine]:sub(1, numberOfCharsToDisplay), 0, 0)
    end
end

return endscreen
-- start.lua

local startScreen = {}

function startScreen.load()
  -- Load any necessary assets and set initial values
  font = love.graphics.newFont(24)
end

function startScreen.update(dt)
  -- Check for user input to start game
  if love.keyboard.isDown("return") or love.mouse.isDown(1) then
    love.graphics.setFont(font)
    love.graphics.printf("Starting game...", 0, love.graphics.getHeight()/2, love.graphics.getWidth(), "center")
    love.graphics.present()
    love.timer.sleep(2) -- Wait for 2 seconds before transitioning to the game
    love.graphics.setFont(love.graphics.newFont(12)) -- Reset font
    love.graphics.setBackgroundColor(255, 255, 255) -- Reset background color
    love.graphics.clear()
    love.graphics.present()
    love.state.switch(gameState) -- Change Love2D state to game state
  end
end

function startScreen.draw()
  -- Display title and instructions on start screen
  love.graphics.setFont(font)
  love.graphics.printf("Teru's Tissues", 0, love.graphics.getHeight()/2 - 50, love.graphics.getWidth(), "center")
  love.graphics.setFont(love.graphics.newFont(12))
  love.graphics.printf(">Start Game<", 0, love.graphics.getHeight()/2 + 50, love.graphics.getWidth(), "center")
end

return startScreen -- Return the module for use in the main game loop
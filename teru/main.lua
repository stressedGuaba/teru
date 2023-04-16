--[[
-- main.lua
local room1 = require("livingroom")
local room2 = require("kitchen")
local room3 = require("bedroom")
local room4 = require("bathroom")

local rooms = {room1, room2, room3, room4}
local currentRoom = rooms[1]
local roomNumber = 1

function love.load()
  currentRoom.load()
end

function love.update(dt)
  currentRoom.update(dt)
end

function love.draw()
  currentRoom.draw()
end

function love.mousepressed(x, y, button)
  -- Move to the next room when the mouse is clicked
  if button == 1 then
    roomNumber = roomNumber + 1
    if roomNumber > #rooms then
      roomNumber = 1
    end
    currentRoom = rooms[roomNumber]
    currentRoom.load()
  end
end
]]

local startScreen = require("startScreen")
local dialoguePage = require("dialoguePage")
local requestPage = require("requestPage")
local livingRoom = require("livingroom")
local endingScreen = require("endingScreen")

local gameState = "start"

function love.load()
  startScreen.load()
end

function love.update(dt)
  if gameState == "start" then
    startScreen.update(dt)
  elseif gameState == "dialogue" then
    dialoguePage.update(dt)
  elseif gameState == "request" then
    requestPage.update(dt)
  elseif gameState == "room" then
    roomManager.update(dt)
  elseif gameState == "ending" then
    endingScreen.update(dt)
  end
end

function love.draw()
  if gameState == "start" then
    startScreen.draw()
  elseif gameState == "dialogue" then
    dialoguePage.draw()
  elseif gameState == "request" then
    requestPage.draw()
  elseif gameState == "room" then
    roomManager.draw()
  elseif gameState == "ending" then
    endingScreen.draw()
  end
end

function love.mousepressed(x, y, button)
  if gameState == "start" and button == 1 then
    gameState = "dialogue"
    dialoguePage.load()
  elseif gameState == "dialogue" and button == 1 then
    if dialoguePage.hasNext() then
      dialoguePage.next()
    else
      gameState = "request"
      requestPage.load()
    end
  elseif gameState == "request" and button == 1 then
    if requestPage.isAccepted() then
      gameState = "room"
      roomManager.load()
    else
      gameState = "start"
      startScreen.load()
    end
  elseif gameState == "room" and button == 1 then
    roomManager.onClick(x, y)
  elseif gameState == "ending" and button == 1 then
    gameState = "start"
    startScreen.load()
  end
end
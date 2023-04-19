-- main.lua
local room1 = require("livingroom")
local room2 = require("kitchen")
local room3 = require("bedroom")
local item = require("item")
local endscreen = require("endscreen")

local rooms = {room1, room2, room3}
local currentRoom = rooms[1]
local roomNumber = 1

local gameOver = false


-- Define the position and size of the Next Room button
local nextRoomButton = {
  x = 800,
  y = 480,
  width = 100,
  height = 50
}

function love.load()
  love.window.setMode(960, 540, {resizable=true})
  currentRoom.load()
end

function love.update(dt)
  currentRoom.update(dt)

  if item.counter == 5 and not gameOver then
    gameOver = true
    endscreen.load()
  end
end

function love.draw()
  currentRoom.draw()

  -- Draw the Next Room button on the screen
  love.graphics.setColor(0.5, 0.5, 0.5)
  love.graphics.rectangle("fill", nextRoomButton.x, nextRoomButton.y, nextRoomButton.width, nextRoomButton.height)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print("Next Room", nextRoomButton.x + 10, nextRoomButton.y + 10)
end

function love.mousepressed(x, y, button)
  -- Check if the mouse was clicked inside the Next Room button
  if button == 1 and x >= nextRoomButton.x and x <= nextRoomButton.x + nextRoomButton.width
    and y >= nextRoomButton.y and y <= nextRoomButton.y + nextRoomButton.height then
    roomNumber = roomNumber + 1
    if roomNumber > #rooms then
      roomNumber = 1
    end
    currentRoom = rooms[roomNumber]
    currentRoom.load()
  end
end
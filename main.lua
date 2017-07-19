class = require 'lib/middleclass'
require 'player'

function love.load()
	player = Player:new(0, 550)
end

function love.update(dt)
	player.cooldown = player.cooldown - 1

	if love.keyboard.isDown("right") then
		player.x = player.x + player.speed
	elseif love.keyboard.isDown("left") then
		player.x = player.x - player.speed
	end

	if love.keyboard.isDown("space") then
		player:fire()
	end

	-- Remove the bullets when they leave the screen
	for i,b in ipairs(player.bullets) do
		if b.y < -10 then
			table.remove(player.bullets, i)
		end

		b.y = b.y - 10
	end
end

function love.draw()
	love.graphics.setColor(0, 0, 255)
	love.graphics.rectangle("fill", player.x, player.y, 80, 20)

	love.graphics.setColor(255, 255, 255)
	for _,b in pairs(player.bullets) do
		love.graphics.rectangle("fill", b.x, b.y, 10, 10)
	end
end
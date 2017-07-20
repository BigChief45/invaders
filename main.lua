class = require 'lib/middleclass'
require 'player'
require 'enemy'
require 'utils'

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")

	player = Player:new(0, 550)
	enemies = {}

	table.insert(enemies, Enemy:new(200, 50))
	table.insert(enemies, Enemy:new(300, 60))
end

function love.update(dt)
	player.cooldown = player.cooldown - 1

	if love.keyboard.isDown("right") then
		player:moveRight()
	elseif love.keyboard.isDown("left") then
		player:moveLeft()
	end

	if love.keyboard.isDown("space") then
		player:fire()
	end

	-- Enemy movements
	for _,e in pairs(enemies) do
		e:move()
	end

	-- Remove the bullets when they leave the screen
	for i,b in ipairs(player.bullets) do
		if b.y < Bullet.static.BULLET_LIMIT then
			table.remove(player.bullets, i)
		end

		b:move()
	end
end

function love.draw()
	-- Draw player
	love.graphics.draw(Player.static.image, player.x, player.y, 0, 1)

	-- Draw enemies
	resetColor()
	for _,e in pairs(enemies) do
		love.graphics.draw(Enemy.static.image, e.x, e.y, 3.1, 1)
	end

	-- Draw bullets
	for _,b in pairs(player.bullets) do
		love.graphics.draw(Bullet.static.image, b.x, b.y, 0, 1)
	end



end

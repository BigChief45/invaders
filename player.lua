require 'bullet'

Player = class('Player')

Player.static.image = love.graphics.newImage('img/player.png')

function Player:initialize(x, y)
	self.x = x
	self.y = y

	self.speed = 10
	self.cooldown = 20 -- ticks

	self.bullets = {}
end

function Player:fire()
	if self.cooldown <= 0 then
	 	self.cooldown = 20

	 	local bullet = Bullet:new(self.x + ((80 / 2) ), self.y)
	 	table.insert(self.bullets, bullet)
	end
end

function Player:moveRight()
	self.x = self.x + self.speed
end

function Player:moveLeft()
	self.x = self.x - self.speed
end

function Player:removeBullets()
	local limit = -10

	for i,b in ipairs(self.bullets) do
		if b.y < limit then
			table.remove(self.bullets, i)
		end
	end
end
require 'bullet'

Enemy = class('Enemy')

Enemy.static.image = love.graphics.newImage('img/enemy1.png')

function Enemy:initialize(x, y)
	self.x = x
	self.y = y

	self.speed = 1
	self.cooldown = 20

	self.bullets = {}
end

function Enemy:fire()
	if self.cooldown <= 0 then
		self.cooldown = 20

		local bullet = Bullet:new(self.x, self.y)
		table.insert(self.bullets, bullet)
	end
end

function Enemy:move()
  self.y = self.y + self.speed
end
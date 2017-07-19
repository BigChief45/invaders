require 'bullet'

Player = class('Player')
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
	 	local bullet = Bullet:new(self.x + ((80 / 2) - 5), self.y)
	 	table.insert(self.bullets, bullet)
	end
end
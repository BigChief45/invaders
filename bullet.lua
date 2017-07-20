Bullet = class('Bullet')

Bullet.static.image = love.graphics.newImage('img/bullet.png')
Bullet.static.BULLET_LIMIT = -10

function Bullet:initialize(x, y)
	self.x = x
	self.y = y

	self.speed = 10
end

function Bullet:move()
	self.y = self.y - self.speed
end
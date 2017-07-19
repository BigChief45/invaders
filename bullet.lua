Bullet = class('Bullet')

Bullet.static.image = love.graphics.newImage('img/bullet.png')

function Bullet:initialize(x, y)
	self.x = x
	self.y = y
end
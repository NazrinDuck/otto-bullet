Bullet = {}
Bullet.size = {
  shoot = 0.5,
  small = 0.3,
  medium = 0.5,
  big = 1.2,
}
Bullet.image = {
  small_bullet1 = love.graphics.newImage("images/small_bullet1.png"),
  small_bullet2 = love.graphics.newImage("images/small_bullet2.png"),
  small_bullet3 = love.graphics.newImage("images/small_bullet3.png"),
  small_bullet4 = love.graphics.newImage("images/small_bullet4.png"),
  medium_sword = love.graphics.newImage("images/medium_sword.png"),
  big_bullet1 = love.graphics.newImage("images/big_bullet1.png"),
  big_bullet2 = love.graphics.newImage("images/big_bullet2.png"),
}

function Bullet:init() end

function Bullet:new(b, _x, _y, rot, size_name, image_name)
  b = b
      or {
        _x = _x or 0,
        _y = _y or 0,
        rot = rot or 0,
        size = self.size[size_name],
        image = self.image[image_name] or nil,
      }
  return b
end

function Bullet:move() end

function Bullet:draw(Bullets)
  love.graphics.setColor(1, 1, 1)

  if #Bullets ~= 0 then
    for _, bullet in ipairs(Bullets) do
      love.graphics.setColor(1, 1, 1)
      love.graphics.draw(bullet.image, bullet._x, bullet._y, bullet.rot, 0.2, 0.2, bullet.ox, bullet.oy)
    end
  end
end

return Bullet

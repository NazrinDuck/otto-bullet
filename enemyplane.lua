Enemy_plane = {}
Enemy_plane.info = {
  _x = 525,
  _y = 75,
  ox = 0,
  oy = 0,
  sx = 0.3,
  sy = 0.3,
  image = love.graphics.newImage("images/enemy_otto.png"),
}

function Enemy_plane:init(_x, _y)
  self.info._x = _x
  self.info._y = _y
  self.info.ox = self.info.image:getWidth() / 2
  self.info.oy = self.info.image:getHeight() / 2
end

function Enemy_plane:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(
    self.info.image,
    self.info._x,
    self.info._y,
    self.info.rot,
    self.info.sx,
    self.info.sy,
    self.info.ox,
    self.info.oy
  )
end

return Enemy_plane

Self_plane = {}

Self_plane.const = {
  H_SPEED = 500,
  L_SPEED = 280,
}

Self_plane.info = {
  _x = 0,
  _y = 0,
  speed = 500,
  rot = 0,
  ox = 0,
  oy = 0,
  sx = 0.2,
  sy = 0.2,
  image = love.graphics.newImage("images/self_plane.png"),
  is_low_speed = false,
}

function Self_plane:init(_x, _y)
  self.info._x = _x
  self.info._y = _y
  self.info.ox = self.info.image:getWidth() / 2
  self.info.oy = self.info.image:getHeight() / 2
end

function Self_plane:draw(radius)
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
  if self.info.is_low_speed then
    love.graphics.setColor(1, 0, 0, 0.6)
    love.graphics.circle("fill", self.info._x, self.info._y, radius * 2)
    love.graphics.setColor(1, 0.5, 0, 0.6)
    love.graphics.circle("fill", self.info._x, self.info._y, radius)
  end
end

function Self_plane:shoot(bullets)
  if love.keyboard.isDown("z") then
    --local bullet = Bullet:new(nil, Self_plane._x, Self_plane._y, 0, "images/medium_sword.png")
    local bullet = Bullet:new({
      _x = Self_plane.info._x,
      _y = Self_plane.info._y,
      rot = 0,
      image = love.graphics.newImage("images/medium_sword.png"),
      size_name = "shoot",
      image_name = "small_bullet",
    })

    bullet.ox = bullet.image:getWidth() / 2
    bullet.oy = bullet.image:getHeight() / 2

    table.insert(bullets, bullet)
  end
end

function Self_plane:move(dt, board)
  board = board or {
    X = 0,
    Y = 0,
    HEIGHT = 0,
    WIDTH = 0,
  }
  if love.keyboard.isDown("up") and self.info._y >= board.Y + self.info.oy * self.info.sy then
    self.info._y = self.info._y - self.info.speed * dt
  end

  if love.keyboard.isDown("down") and self.info._y <= board.Y + board.HEIGHT - self.info.oy * self.info.sy then
    self.info._y = self.info._y + self.info.speed * dt
  end

  if love.keyboard.isDown("left") and self.info._x >= board.X + self.info.ox * self.info.sx then
    self.info._x = self.info._x - self.info.speed * dt
  end

  if love.keyboard.isDown("right") and self.info._x <= board.X + board.WIDTH - self.info.ox * self.info.sx then
    self.info._x = self.info._x + self.info.speed * dt
  end

  if love.keyboard.isDown("lshift") then
    self.info.speed = self.const.L_SPEED
    self.info.is_low_speed = true
  else
    self.info.speed = self.const.H_SPEED
    self.info.is_low_speed = false
  end
end

return Self_plane

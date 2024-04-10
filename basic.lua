Basic = {}
Basic.info = {
  WINDOWS = {
    HEIGHT = 960,
    WIDTH = 1280,
  },
  GAME_BORDER = {
    X = 50,
    Y = 50,
    HEIGHT = 750,
    WIDTH = 1000,
  },
  FPS = {
    x = 0,
    y = 0,
    fps = 0,
  },
  POINT = {
    radius = 4,
  },
  TIME = 0,
}
function Basic:init()
  local success = love.window.setMode(
    self.info.WINDOWS.WIDTH,
    self.info.WINDOWS.HEIGHT,
    { vsync = true, minwidth = 400, minheight = 300 }
  )
end

function Basic:draw_game_border()
  love.graphics.setColor(0, 0, 0, 1)
  love.graphics.print("fps:" .. tostring(self.info.FPS.fps), self.info.FPS.x, self.info.FPS.y)
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle(
    "fill",
    self.info.GAME_BORDER.X,
    self.info.GAME_BORDER.Y,
    self.info.GAME_BORDER.WIDTH,
    self.info.GAME_BORDER.HEIGHT
  )
end

function Basic:draw_windows_border()
  love.graphics.setColor(0, 255, 0, 1)
  -- left
  love.graphics.rectangle("fill", 0, 0, self.info.GAME_BORDER.X, self.info.WINDOWS.HEIGHT)
  -- up
  love.graphics.rectangle(
    "fill",
    self.info.GAME_BORDER.X,
    0,
    self.info.WINDOWS.WIDTH - self.info.GAME_BORDER.X,
    self.info.GAME_BORDER.Y
  )
  -- down
  love.graphics.rectangle(
    "fill",
    self.info.GAME_BORDER.X,
    self.info.GAME_BORDER.Y + self.info.GAME_BORDER.HEIGHT,
    self.info.WINDOWS.WIDTH - self.info.GAME_BORDER.X,
    self.info.WINDOWS.HEIGHT - self.info.GAME_BORDER.Y - self.info.GAME_BORDER.HEIGHT
  )
  -- right
  love.graphics.rectangle(
    "fill",
    self.info.GAME_BORDER.X + self.info.GAME_BORDER.WIDTH,
    self.info.GAME_BORDER.Y,
    self.info.WINDOWS.WIDTH - self.info.GAME_BORDER.X - self.info.GAME_BORDER.WIDTH,
    self.info.GAME_BORDER.HEIGHT
  )
end

function Wait_time(time)
  if Basic.info.TIME - love.timer.getTime() > time then
    Basic.info.TIME = love.timer.getTime()
  end
end

return Basic

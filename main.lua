Tween = require("tween")
Basic = require("basic")
Bullet = require("bullet")

Self_plane = require("selfplane")
Enemy_plane = require("enemyplane")

Bullets = {}

DEBUG = true

function love.load()
  local f = love.graphics.newFont(20)
  love.graphics.setFont(f)
  love.graphics.setBackgroundColor(255, 255, 255)

  ----- init -----
  Self_plane:init(
    (Basic.info.GAME_BORDER.X + Basic.info.GAME_BORDER.WIDTH) / 2,
    Basic.info.GAME_BORDER.Y + Basic.info.GAME_BORDER.HEIGHT - 100
  )
  Enemy_plane:init((Basic.info.GAME_BORDER.X + Basic.info.GAME_BORDER.WIDTH) / 2, Basic.info.GAME_BORDER.Y + 100)
  Basic:init()
end

function love.update(dt)
  Basic.info.FPS.fps = love.timer.getFPS()
  --Self_plane:Shoot(Bullets)
  Self_plane:move(dt, Basic.info.GAME_BORDER)
end

function love.draw()
  Basic:draw_game_border()

  Self_plane:draw(Basic.info.POINT.radius)
  Enemy_plane:draw()
  Bullet:draw(Bullets)

  Basic:draw_windows_border()
  ---------- debug ----------
  if DEBUG then
    love.graphics.setColor(0, 0, 0, 1)
    --love.graphics.print("???:" .. tostring(Basic:Move(123124)), Basic.info.FPS.x, Basic.info.FPS.y + 50)
    love.graphics.print("time: " .. tostring(love.timer.getTime()), Basic.info.FPS.x, Basic.info.FPS.y + 25)

    love.graphics.print("nums: " .. tostring(#Bullets), Basic.info.FPS.x, Basic.info.FPS.y + 50)
    love.graphics.print("x: " .. tostring(Self_plane.info._x), Basic.info.FPS.x, Basic.info.FPS.y + 100)
    love.graphics.print("y: " .. tostring(Self_plane.info._y), Basic.info.FPS.x, Basic.info.FPS.y + 130)
    --[[
    love.graphics.print("ox: " .. tostring(Self_plane.info.ox), Basic.info.FPS.x, Basic.info.FPS.y + 50)
    love.graphics.print("oy: " .. tostring(Self_plane.info.oy), Basic.info.FPS.x + 100, Basic.info.FPS.y + 50)
    ]]
  end
end

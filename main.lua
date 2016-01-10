require("place_card")
require("init")

require("card")
require("hand")
require("game")

function love.load()
  math.randomseed(os.time())

  Game = Game()
end

function love.draw()
  love.graphics.push()
  love.graphics.scale(zoom)

  Game:draw()

  love.graphics.setColor(255, 255, 255)
  love.graphics.pop()
end

function love.update(dt)
end

function love.mousepressed(x, y, button)
    Game:mousepressed(x, y, button)
end

function love.keypressed(key, isrepeat)
  if key == "l" then
    in_game = not in_game
  end

  if key == "r" then
    init_grid()
  end
end

function get_grid_cell(x, y)
    local grid_start_x = 73
    local grid_start_y = 9
    local grid_spacing_x = 42
    local grid_spacing_y = 52
    for i = 0, 3 do
      for j = 0, 3 do
          local c = card_grid[i + 1][j + 1]
          local x2 = (grid_start_x + i * grid_spacing_x) * zoom
          local y2 = (grid_start_y + j * grid_spacing_y) * zoom

          if bounding_box_check(x, y, 1, 1, x2, y2, grid_spacing_x * zoom, grid_spacing_y * zoom) then
              return i + 1, j + 1
          end
      end
  end

  return -1, -1
end

function bounding_box_check(x1, y1, w1 , h1, x2, y2, w2, h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

function turn_end()
  if current_turn == "red" then
    current_turn = "blue"
    return
  end

  current_turn = "red"
end

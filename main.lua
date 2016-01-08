require("init")

function love.load()
  init_graphics()

  cards = require("cards")

  init_grid()

  in_game = true
end

function love.draw()
  love.graphics.draw(graphic_sheet, background_q, 0, 0)

  if in_game then
    love.graphics.draw(graphic_sheet, grid_q, 48, 0)
  end

  local grid_start_x = 73
  local grid_start_y = 9
  local grid_spacing_x = 46
  local grid_spacing_y = 55
  for i = 0, 3 do
    for j = 0, 3 do
      if card_grid[i + 1][j + 1] then
        local c = card_grid[i + 1][j + 1]
        local x = grid_start_x + i * grid_spacing_x
        local y = grid_start_y + j * grid_spacing_y

        if c.side == "blue" then
          love.graphics.draw(graphic_sheet, card_back_blue_q, x, y)
        elseif c.side == "red" then
          love.graphics.draw(graphic_sheet, card_back_red_q, x, y)
        end

        love.graphics.draw(graphic_sheet, cards_q[c.id], x, y)


      end
    end
  end
end

function love.update(dt)
end

function love.keypressed(key, isrepeat)
  if key == "l" then
    in_game = not in_game
  end
end

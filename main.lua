require("place_card")
require("init")

function love.load()
  math.randomseed(os.time())

  current_turn = "blue"

  init_graphics()

  cards = require("cards")

  init_grid()

  in_game = true
end

function love.draw()
  love.graphics.draw(graphic_sheet, background_q, 0, 0)

  if not in_game then
    return
  end

  love.graphics.draw(graphic_sheet, grid_q, 48, 0)

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

        if cards_q[c.id] then
          love.graphics.draw(graphic_sheet, cards_q[c.id], x, y)
        elseif c.side == "neutral" then
          love.graphics.draw(graphic_sheet, block_card_q, x, y)
        elseif c.side == "neutral2" then
          love.graphics.draw(graphic_sheet, block_card2_q, x, y)
        end
      end
    end
  end
end

function love.update(dt)
end

function love.mousereleased(x, y, button)
  if button ~= "l" then
    return
  end

  x1, y1 = get_grid_cell(x, y)

  if x1 == nil or y1 == nil then
    return
  end

  if card_grid[x1][y1] == nil then
    -- Check for existing card etc.

    place_card(16, x1, y1, current_turn)
    turn_end()
  end
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
  local grid_spacing_x = 46
  local grid_spacing_y = 55

  local w, h = 41, 50

  for i = 0, 3 do
    for j = 0, 3 do
      local x2 = grid_start_x + i * grid_spacing_x
      local y2 = grid_start_y + j * grid_spacing_y

      if bounding_box_check(x, y, 1, 1, x2, y2, w, h) then
        return i + 1, j + 1
      end
    end
  end
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

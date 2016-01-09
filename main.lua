require("place_card")
require("init")

function love.load()
  math.randomseed(os.time())

  love.graphics.setDefaultFilter("nearest", "nearest")

  zoom = 4
  current_turn = "blue"

  init_graphics()

  cards = require("cards")

  init_grid()

  in_game = true

  love.window.setMode(320 * zoom, 240 * zoom)
end

function love.draw()
  love.graphics.push()
  love.graphics.scale(zoom)

  love.graphics.draw(graphic_sheet, background_q, 0, 0)

  if not in_game then
    return
  end

  love.graphics.draw(graphic_sheet, grid_q, 48, 0)

  local grid_start_x = 73
  local grid_start_y = 9
  local grid_spacing_x = 42
  local grid_spacing_y = 52

  local selected_grid_x = -1
  local selected_grid_y = -1
  selected_grid_x, selected_grid_y = get_grid_cell(love.mouse.getX(), love.mouse.getY())

  for i = 0, 3 do
    for j = 0, 3 do
        love.graphics.setColor(255, 255, 255)

        local x = grid_start_x + i * grid_spacing_x
        local y = grid_start_y + j * grid_spacing_y

      if card_grid[i + 1][j + 1] then
        local c = card_grid[i + 1][j + 1]

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

      if x == selected_grid_x and y == selected_grid_y then
          love.graphics.draw(graphic_sheet, card_back_red_q, x, y)
      end
    end
  end

  love.graphics.setColor(255, 255, 255)
  love.graphics.pop()
end

function love.update(dt)
end

function love.mousepressed(x, y, button)
  if button ~= "l" then
    return
  end

  x1, y1 = get_grid_cell(x, y)

  if x1 == -1 or y1 == -1 then
    return
  end

  -- Check for existing card etc.
  if card_grid[x1][y1] == nil then
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

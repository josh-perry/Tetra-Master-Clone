function init_graphics()
  graphic_sheet = love.graphics.newImage("graphics.png")
  sheet_w = graphic_sheet:getWidth()
  sheet_h = graphic_sheet:getHeight()

  background_q = love.graphics.newQuad(10, 498, 320, 240, sheet_w, sheet_h)
  grid_q = love.graphics.newQuad(340, 498, 224, 240, sheet_w, sheet_h)
  cards_q = init_card_quads()

  card_back_blue_q = love.graphics.newQuad(18, 822, 42, 51, sheet_w, sheet_h)
  card_back_red_q = love.graphics.newQuad(66, 822, 42, 51, sheet_w, sheet_h)

  block_card_q = love.graphics.newQuad(114, 822, 42, 51, sheet_w, sheet_h)
end

function init_grid()
  card_grid = {}

  disabled_spaces = math.random(0, 6)

  for i = 1, 4 do
    card_grid[i] = {}

    for j = 1, 4 do
      card_grid[i][j] = nil
    end
  end

  local i = 0
  while i < disabled_spaces do
    local x = math.random(1, 4)
    local y = math.random(1, 4)

    if card_grid[x][y] == nil then
      local c = {
        side = "neutral"
      }

      card_grid[x][y] = c

      i = i + 1
    end
  end

  -- Debug:
  -- place_card(math.random(1, 99), 1, 1, "blue")
end

function init_card_quads()
  quads = {}

  card_w = 42
  card_h = 51
  card_spacing = 10
  card_max_w = 11 + (12 * card_w) + (12 * card_spacing)
  card_max_h = 11 + (8 * card_h) + (8 * card_spacing)
  for y = 11, card_max_h, card_h + card_spacing do
    for x = 11, card_max_w, card_w + card_spacing do
      q = love.graphics.newQuad(x, y, card_w, card_h, sheet_w, sheet_h)
      table.insert(quads, q)
    end
  end

  return quads
end

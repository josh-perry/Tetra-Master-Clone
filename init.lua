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
  block_card2_q = love.graphics.newQuad(162, 822, 42, 51, sheet_w, sheet_h)

  score_divider_q = love.graphics.newQuad(202, 759, 43, 23, sheet_w, sheet_h)

  card_back_q = love.graphics.newQuad(210, 822, 42, 51, sheet_w, sheet_h)

  arrow_q = init_arrow_quads()
end

function init_grid()
  card_grid = {}

  local disabled_spaces = math.random(0, 6)
  -- local disabled_spaces = 0

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
      local c = { side = "neutral" }

      if math.random(1, 2) == 1 then
        c.side = "neutral2"
      end

      card_grid[x][y] = c

      i = i + 1
    end
  end

  -- Debug:
  -- place_card(math.random(1, 99), 1, 1, "blue")
end

function init_card_quads()
  local quads = {}

  local card_w = 42
  local card_h = 51
  local card_spacing = 10
  local card_max_w = 11 + (12 * card_w) + (12 * card_spacing)
  local card_max_h = 11 + (8 * card_h) + (8 * card_spacing)
  for y = 11, card_max_h, card_h + card_spacing do
    for x = 11, card_max_w, card_w + card_spacing do
      q = love.graphics.newQuad(x, y, card_w, card_h, sheet_w, sheet_h)
      table.insert(quads, q)
    end
  end

  return quads
end


function init_arrow_quads()
    local arrows = {}

    arrows["upleft"] = love.graphics.newQuad(202, 790, 8, 8, sheet_w, sheet_h)
    arrows["up"] = love.graphics.newQuad(210, 790, 8, 8, sheet_w, sheet_h)
    arrows["upright"] = love.graphics.newQuad(218, 790, 8, 8, sheet_w, sheet_h)
    arrows["downleft"] = love.graphics.newQuad(226, 790, 8, 8, sheet_w, sheet_h)
    arrows["down"] = love.graphics.newQuad(234, 790, 8, 8, sheet_w, sheet_h)
    arrows["downright"] = love.graphics.newQuad(242, 790, 8, 8, sheet_w, sheet_h)
    arrows["left"] = love.graphics.newQuad(202, 798, 8, 8, sheet_w, sheet_h)
    arrows["right"] = love.graphics.newQuad(210, 798, 8, 8, sheet_w, sheet_h)

    return arrows
end

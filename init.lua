function init_graphics()
  graphic_sheet = love.graphics.newImage("graphics.png")
  sheet_w = graphic_sheet:getWidth()
  sheet_h = graphic_sheet:getHeight()

  background_q = love.graphics.newQuad(10, 498, 320, 240, sheet_w, sheet_h)
  grid_q = love.graphics.newQuad(340, 498, 224, 240, sheet_w, sheet_h)
  cards_q = init_card_quads()

  card_back_blue_q = love.graphics.newQuad(18, 822, 42, 51, sheet_w, sheet_h)
  card_back_red_q = love.graphics.newQuad(66, 822, 42, 51, sheet_w, sheet_h)
end

function init_grid()
  card_grid = {}

  for i = 1, 4 do
    card_grid[i] = {}

    for j = 1, 4 do
      card_grid[i][j] = nil

      card_grid[i][j] = cards[math.random(1, #cards)]

      card_id = math.random(1, #cards)
      base_card = cards[card_id]
      c = {
        name = base_card.name,
        attack = base_card.attack,
        type = base_card.type,
        physical_defense = base_card.physical_defense,
        magical_defense = base_card.magical_defense,
        id = card_id
      }

      if math.random(1, 2) == 1 then
        c.side = "blue"
      else
        c.side = "red"
      end

      card_grid[i][j] = c
    end
  end
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

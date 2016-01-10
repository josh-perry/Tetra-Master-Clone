local class = require("libs/middleclass/middleclass")

Card = class("Card")

function Card:initialize(base_card, side)
    if not self:check_base_card(base_card) then
        print("oh no")
    end

    self.card_id = base_card.id
    self.name = base_card.name
    self.attack = base_card.attack
    self.type = base_card.type
    self.physical_defense = base_card.physical_defense
    self.magical_defense = base_card.magical_defense

    self.side = side
end

function Card:check_base_card(base_card)
  if base_card.id and
      base_card.name and
      base_card.attack and
      base_card.type and
      base_card.physical_defense and
      base_card.magical_defense then
      return true
  end


    return false
end

-- function Card:draw(x, y)
--     print("INSIDE CARD: "..x)
--     love.graphics.draw(graphic_sheet, block_card_q, x, y)
--     -- love.graphics.draw(graphic_sheet, cards_q[1], x, y)
-- end

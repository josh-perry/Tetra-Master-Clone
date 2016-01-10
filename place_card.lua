-- function place_card(id, x, y, side)
--   card_id = math.random(1, #cards)
--   base_card = cards[card_id]
--   c = {
--     name = base_card.name,
--     attack = base_card.attack,
--     type = base_card.type,
--     physical_defense = base_card.physical_defense,
--     magical_defense = base_card.magical_defense,
--     id = card_id,
--     side = side
--   }
--
--   card_grid[x][y] = c
-- end

function place_card(x, y, card)    
    card_grid[x][y] = card
end

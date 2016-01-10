local function attack_card(attacking_card, defending_card, defending_side)
    if not defending_card then
        return
    end

    if defending_card and defending_card.arrows then
        if not defending_card.arrows[defending_side] then
            defending_card.side = attacking_card.side
        else
            -- Card combat
        end
    end
end

local function get_card_at(x, y)
    if x < 1 or x > 4 or y < 1 or y > 4 then
        return nil
    end

    return card_grid[x][y]
end

function place_card(x, y, card)
    if not card then
        return
    end

    card_grid[x][y] = card

    if not card.arrows then
        return
    end

    for i, v in pairs(card.arrows) do
        if i == "up" then
            local defending_card = get_card_at(x, y - 1)
            attack_card(card, defending_card, "down")
        elseif i == "down" then
            local defending_card = get_card_at(x, y + 1)
            attack_card(card, defending_card, "up")
        elseif i == "left" then
            local defending_card = get_card_at(x - 1, y)
            attack_card(card, defending_card, "right")
        elseif i == "right" then
            local defending_card = get_card_at(x + 1, y)
            attack_card(card, defending_card, "left")
        elseif i == "upleft" then
            local defending_card = get_card_at(x - 1, y - 1)
            attack_card(card, defending_card, "downright")
        elseif i == "upright" then
            local defending_card = get_card_at(x + 1, y - 1)
            attack_card(card, defending_card, "downleft")
        elseif i == "downleft" then
            local defending_card = get_card_at(x - 1, y + 1)
            attack_card(card, defending_card, "upright")
        elseif i == "downright" then
            local defending_card = get_card_at(x + 1, y + 1)
            attack_card(card, defending_card, "upleft")
        end
    end
end

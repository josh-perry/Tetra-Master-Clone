local function get_card_at(x, y)
    if x < 1 or x > 4 or y < 1 or y > 4 then
        return nil
    end

    return card_grid[x][y]
end

local function combo_capture(card, x, y)
  for i, v in pairs(card.arrows) do
      if i == "up" then
          local defending_card = get_card_at(x, y - 1)

          if defending_card then
            defending_card.side = card.side
          end
      elseif i == "down" then
          local defending_card = get_card_at(x, y + 1)
          if defending_card then
            defending_card.side = card.side
          end
      elseif i == "left" then
          local defending_card = get_card_at(x - 1, y)
          if defending_card then
            defending_card.side = card.side
          end
      elseif i == "right" then
          local defending_card = get_card_at(x + 1, y)
          if defending_card then
            defending_card.side = card.side
          end
      elseif i == "upleft" then
          local defending_card = get_card_at(x - 1, y - 1)
          if defending_card then
            defending_card.side = card.side
          end
      elseif i == "upright" then
          local defending_card = get_card_at(x + 1, y - 1)
          if defending_card then
            defending_card.side = card.side
          end
      elseif i == "downleft" then
          local defending_card = get_card_at(x - 1, y + 1)
          if defending_card then
            defending_card.side = card.side
          end
      elseif i == "downright" then
          local defending_card = get_card_at(x + 1, y + 1)
          if defending_card then
            defending_card.side = card.side
          end
      end
  end
end

local function attack_card(attacking_card, defending_card, defending_side, x, y)
    if not defending_card then
        return
    end

    if defending_card and defending_card.arrows then
        if not defending_card.arrows[defending_side] then
            defending_card.side = attacking_card.side
        else
            -- Card combat
            local a = attacking_card.attack * 16
            local d = 0

            -- Physical battle
            if attacking_card.type == "P" then
              -- Attack vs physical defense
              d = defending_card.physical_defense * 16

            -- Magical battle
            elseif attacking_card.type == "M" then
              -- Attack vs magical defense
              d = defending_card.magical_defense * 16

            -- Flexible battle
            elseif attacking_card.type == "X" then
              -- Attack vs lowest of magical/physical defense
              d = math.min({defending_card.physical_defense, defending_card.magical_defense}) * 16

            -- Assault battle
            elseif attacking_card.type == "A" then
              -- Highest stat vs lowest stat
              a = math.max({attacking_card.attack, attacking_card.physical_defense, attacking_card.magical_defense}) * 16
              d = math.min({defending_card.attack, defending_card.physical_defense, defending_card.magical_defense}) * 16
            end

            local attacker_power = math.random(a, a + 15)
            local defender_power = math.random(d, d + 15)

            local actual_attack_score = math.random(0, attacker_power)
            local actual_defend_score = math.random(0, defender_power)

            local attacker_final_score = attacker_power - actual_attack_score
            local defender_final_score = defender_power - actual_defend_score

            if attacker_final_score > defender_final_score then
              defending_card.side = attacking_card.side
              combo_capture(defending_card, x, y)
            else
              attacking_card.side = defending_card.side
            end
        end
    end
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
            attack_card(card, defending_card, "down", x, y)
        elseif i == "down" then
            local defending_card = get_card_at(x, y + 1)
            attack_card(card, defending_card, "up", x, y)
        elseif i == "left" then
            local defending_card = get_card_at(x - 1, y)
            attack_card(card, defending_card, "right", x, y)
        elseif i == "right" then
            local defending_card = get_card_at(x + 1, y)
            attack_card(card, defending_card, "left", x, y)
        elseif i == "upleft" then
            local defending_card = get_card_at(x - 1, y - 1)
            attack_card(card, defending_card, "downright", x, y)
        elseif i == "upright" then
            local defending_card = get_card_at(x + 1, y - 1)
            attack_card(card, defending_card, "downleft", x, y)
        elseif i == "downleft" then
            local defending_card = get_card_at(x - 1, y + 1)
            attack_card(card, defending_card, "upright", x, y)
        elseif i == "downright" then
            local defending_card = get_card_at(x + 1, y + 1)
            attack_card(card, defending_card, "upleft", x, y)
        end
    end
end

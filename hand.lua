local class = require("libs/middleclass/middleclass")

Hand = class("Hand")

function Hand:initialize(side)
    self.cards = {}
    self.side = side
    self.selected_card = nil

    local i = 0
    while #self.cards < 5 do
        local base_card = BASE_CARDS[math.random(1, #BASE_CARDS - 1)]

        if base_card ~= nil and base_card.id ~= nil then
            local c = Card:new(base_card, self.side)

            if c then
                table.insert(self.cards, c)
                i = i + 1
            end
        end
    end
end

function Hand:draw(x, y)
    local card_height = 51
    local card_width = 42
    local s = 1

    if #self.cards == 5 then
        s = (42 / card_height)
        card_height = 42
        card_width = 35
    end

    for i, v in ipairs(self.cards) do
        local y = y + ((i - 1) * card_height)

        if self.selected_card then
            if v == self.selected_card then
                love.graphics.setColor(255, 255, 255)
            else
                love.graphics.setColor(100, 100, 100, 100)
            end
        end

        if self.side == "blue" then
           love.graphics.draw(graphic_sheet, card_back_blue_q, x, y, 0, s, s)
       elseif self.side == "red" then
          love.graphics.draw(graphic_sheet, card_back_red_q, x, y, 0, s, s)
        end

        v:draw(x, y, s, card_height, card_width)
        -- love.graphics.draw(graphic_sheet, cards_q[v.card_id], x, y, 0, s, s)
    end

    love.graphics.setColor(255, 255, 255)
end

function Hand:mousepressed(x, y, button)
    local card_height = 51
    local card_width = 42
    local s = 1

    if #self.cards == 5 then
        s = (42 / card_height)
        card_height = 42
        card_width = 35
    end

    for i, v in ipairs(self.cards) do
        local x2 = 260 * zoom
        local y2 = (8 + (i - 1) * card_height) * zoom

        if bounding_box_check(x, y, 1, 1, x2, y2, card_width * zoom, card_height * zoom) then
            self.selected_card = v
            return
        end
    end
end

function Hand:remove_selected_card()
    for i, v in ipairs(self.cards) do
        if v == self.selected_card then
            self.selected_card = nil
            table.remove(self.cards, i)
        end
    end
end

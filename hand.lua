local class = require("libs/middleclass/middleclass")

Hand = class("Hand")

function Hand:initialize(side, ai)
    self.cards = {}
    self.side = side
    self.selected_card = nil
    self.hovered_card = nil
    self.ai_controlled = ai

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

    self.hovered_card = self:get_card_at(love.mouse.getX(), love.mouse.getY())

    for i, v in ipairs(self.cards) do
        love.graphics.setColor(100, 100, 100, 100)
        local y = y + ((i - 1) * card_height)

        if not self.ai_controlled then
            if not self.selected_card then
                love.graphics.setColor(255, 255, 255)
            end

            if self.hovered_card then
                if v == self.hovered_card then
                    love.graphics.setColor(255, 255, 255, 200)
                end
            end

            if self.selected_card then
                if v == self.selected_card then
                    love.graphics.setColor(255, 255, 255)
                end
            end

            if self.side == "blue" then
               love.graphics.draw(graphic_sheet, card_back_blue_q, x, y, 0, s, s)
           elseif self.side == "red" then
              love.graphics.draw(graphic_sheet, card_back_red_q, x, y, 0, s, s)
            end

            v:draw(x, y, s, card_height, card_width)
        else
            love.graphics.setColor(255, 255, 255)
            love.graphics.draw(graphic_sheet, card_back_q, x, y, 0, s, s)
        end
    end

    love.graphics.setColor(255, 255, 255)
end

function Hand:mousepressed(x, y, button)
    if self.ai_controlled then
        return
    end

    local clicked_card = self:get_card_at(x, y)
    if clicked_card then
        self.selected_card = clicked_card
    end
end

function Hand:get_card_at(x, y)
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
            return v
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

function Hand:ai_move()
    while 1 == 1 do
        local x = math.random(1, 4)
        local y = math.random(1, 4)

        if card_grid[x][y] == nil then
            local card = self.cards[math.random(1, #self.cards)]

            self.selected_card = card

            place_card(x, y, card)

            self:remove_selected_card()
            return
        end
    end
end

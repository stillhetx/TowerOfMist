function LevelUP.draw()
    local current = LevelUP.current
    if current == nil then
        return
    end

    local page = LevelUP.pages[current.page]
    love.graphics.setColor(0.06, 0.08, 0.14, 0.96)
    love.graphics.rectangle("fill", 20, 24, 600, 432)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle("line", 20, 24, 600, 432)
    love.graphics.printf("LEVEL UP - Nivel " .. current.level, 32, 34, 576, "center")
    love.graphics.printf(page.title or page.id, 32, 470 - 24, 576, "center")
    page.draw(current)
end
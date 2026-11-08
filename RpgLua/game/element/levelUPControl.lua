function LevelUP.control(key)
    if LevelUP.current == nil then
        return
    end
    local page = LevelUP.pages[LevelUP.current.page]
    page.control(LevelUP.current, key)
end

-- Register more pages with LevelUP.registerPage({ id, title, draw, control }).
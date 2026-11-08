LevelUP = {
    --cola de personajes que suben de nivel
    queue = {},
    --Paginas a mostrar
    pages = {},
    current = nil,
    returnView = nil
}

function LevelUP.registerPage(page)
    if type(page) ~= "table" or type(page.draw) ~= "function"
        or type(page.control) ~= "function" then
        error("LevelUP pages must define draw and control functions")
    end
    table.insert(LevelUP.pages, page)
end

function LevelUP.enqueue(character, level)
    table.insert(LevelUP.queue, { character = character, level = level })
end

function LevelUP.hasPending()
    return LevelUP.current ~= nil or #LevelUP.queue > 0
end

function LevelUP.startNext()
    if LevelUP.current ~= nil or #LevelUP.queue == 0 then
        return
    end
    if #LevelUP.pages == 0 then
        error("LevelUP cannot start without registered pages")
    end

    LevelUP.returnView = LevelUP.returnView or Show_view
    LevelUP.current = table.remove(LevelUP.queue, 1)
    LevelUP.current.page = 1
    LevelUP.current.cursor = 1
    LevelUP.current.allocated = {}
    LevelUP.current.pointsRemaining = 5
    Show_view = "levelUP"
end

function LevelUP.nextPage()
    if LevelUP.current == nil then
        return
    end

    LevelUP.current.page = LevelUP.current.page + 1
    if LevelUP.current.page > #LevelUP.pages then
        LevelUP.current = nil
        if #LevelUP.queue > 0 then
            LevelUP.startNext()
        else
            Show_view = LevelUP.returnView
            LevelUP.returnView = nil
        end
        return
    end

    LevelUP.current.cursor = 1
end
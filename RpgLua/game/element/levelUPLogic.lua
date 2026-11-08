local stats = {
    { key = "agi", name = "Agilidad" },
    { key = "fue", name = "Fuerza" },
    { key = "pod", name = "Poder" },
    { key = "con", name = "Constitucion" },
    { key = "dex", name = "Destreza" },
    { key = "per", name = "Percepcion" },
    { key = "int", name = "Inteligencia" },
    { key = "car", name = "Carisma" },
    { key = "mnd", name = "Mente" }
}

local skillLists = {
    "sk", "mg", "art", "beast", "blue", "morph", "swm", "tools",
    "bullet", "spe", "spirit", "powerStone", "mag", "coleccion"
}

--Genera la lista de skill a subir

local function collectSkills(character)
    local skills = {}
    for _, listName in ipairs(skillLists) do
        local list = character[listName]
        if type(list) == "table" then
            for _, skill in ipairs(list) do
                if type(skill) == "table" and skill.id then
                    table.insert(skills, {
                        ability = skill,
                        category = listName
                    })
                end
            end
        end
    end
    return skills
end

--logicas de controles para las vistas
--tengo que adaptar esto para mi otras vistas.

local function controlAttributes(current, key)
    local character = current.character
    local selectedStat = stats[current.cursor]

    if key == "up" then
        current.cursor = (current.cursor - 2) % #stats + 1
    elseif key == "down" then
        current.cursor = current.cursor % #stats + 1
    elseif key == "right" or key == "z" then
        if current.pointsRemaining > 0 then
            character[selectedStat.key] = character[selectedStat.key] + 1
            character[selectedStat.key .. "_"] = character[selectedStat.key .. "_"] + 1
            current.allocated[selectedStat.key] = (current.allocated[selectedStat.key] or 0) + 1
            current.pointsRemaining = current.pointsRemaining - 1
        end
    elseif key == "left" or key == "x" then
        local allocated = current.allocated[selectedStat.key] or 0
        if allocated > 0 then
            character[selectedStat.key] = character[selectedStat.key] - 1
            character[selectedStat.key .. "_"] = character[selectedStat.key .. "_"] - 1
            current.allocated[selectedStat.key] = allocated - 1
            current.pointsRemaining = current.pointsRemaining + 1
        end
    elseif key == "return" and current.pointsRemaining == 0 then
        LevelUP.nextPage()
    end
end

local function controlSkill(current, key)
    local skills = collectSkills(current.character)

    if #skills == 0 then
        if key == "return" or key == "z" then
            LevelUP.nextPage()
        end
        return
    end

    if key == "up" then
        current.cursor = (current.cursor - 2) % #skills + 1
    elseif key == "down" then
        current.cursor = current.cursor % #skills + 1
    elseif key == "return" or key == "z" then
        local selected = skills[current.cursor].ability
        selected.levelUP = (selected.levelUP or 1) + 1
        LevelUP.nextPage()
    end
end

---Vistas de LevelUp

LevelUP.registerPage({
    id = "attributes",
    title = "Reparte 5 puntos de atributo",
    draw = function(current)
        local character = current.character
        love.graphics.print("Personaje: " .. character.name, 40, 58)
        love.graphics.print("Puntos restantes: " .. current.pointsRemaining, 40, 84)
        love.graphics.print("Arriba/abajo: elegir   Derecha/Z: sumar   Izquierda/X: deshacer", 40, 110)
        for index, stat in ipairs(stats) do
            local marker = index == current.cursor and "> " or "  "
            local allocated = current.allocated[stat.key] or 0
            love.graphics.print(
                marker .. stat.name .. ": " .. character[stat.key]
                    .. (allocated > 0 and ("  (+" .. allocated .. ")") or ""),
                72,
                150 + (index - 1) * 24
            )
        end
        love.graphics.print("Enter: continuar (debes repartir los 5 puntos)", 40, 390)
    end,
    control = controlAttributes
})

LevelUP.registerPage({
    id = "skill",
    title = "Elige una habilidad para subir",
    draw = function(current)
        local skills = collectSkills(current.character)
        love.graphics.print("Personaje: " .. current.character.name, 40, 58)
        love.graphics.print("Elige una habilidad y pulsa Z o Enter para subirla.", 40, 86)
        if #skills == 0 then
            love.graphics.print("Este personaje no tiene habilidades aprendidas.", 40, 140)
            love.graphics.print("Z o Enter: continuar", 40, 180)
            return
        end

        local first = math.max(1, math.min(current.cursor - 8, #skills - 9))
        local last = math.min(#skills, first + 9)
        for index = first, last do
            local skill = skills[index]
            local marker = index == current.cursor and "> " or "  "
            love.graphics.print(
                marker .. skill.ability.name .. " [" .. skill.category .. "]"
                    .. "  Nv. " .. (skill.ability.levelUP or 1),
                64,
                130 + (index - first) * 28
            )
        end
    end,
    control = controlSkill
})

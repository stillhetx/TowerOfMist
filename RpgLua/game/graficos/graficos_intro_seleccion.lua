local function centered_text(text, y, color)
    love.graphics.setColor(color or {0.92, 0.95, 1, 1})
    love.graphics.printf(text, 52, y, 536, "center")
end

local function draw_panel(x, y, width, height)
    love.graphics.setColor(0.06, 0.09, 0.14, 0.94)
    love.graphics.rectangle("fill", x, y, width, height, 5, 5)
    love.graphics.setColor(0.2, 0.38, 0.48, 1)
    love.graphics.rectangle("line", x, y, width, height, 5, 5)
end

local function draw_intro_title()
    centered_text("TOWER OF MIST", 64, {0.96, 0.82, 0.48, 1})
    centered_text("Un viaje a traves de la niebla", 91, {0.65, 0.82, 0.88, 1})
    draw_panel(196, 158, 248, 190)

    for index, option in ipairs(IntroControl.main_menu_items()) do
        local y = 190 + (index - 1) * 44
        local selected = index == IntroControl.menu_selection
        if selected then
            love.graphics.setColor(0.12, 0.28, 0.34, 1)
            love.graphics.rectangle("fill", 210, y - 6, 220, 32, 4, 4)
            love.graphics.setColor(0.48, 0.9, 0.92, 1)
            love.graphics.print(">", 222, y)
        end
        love.graphics.setColor(selected and {1, 1, 1, 1} or {0.66, 0.72, 0.78, 1})
        love.graphics.printf(option, 244, y, 170, "center")
    end

    centered_text("Flechas: elegir     Z / Enter: confirmar", 392, {0.65, 0.72, 0.8, 1})
end

local function draw_intro_modes()
    centered_text("ELIGE EL MODO DE JUEGO", 64, {0.96, 0.82, 0.48, 1})
    draw_panel(148, 154, 344, 160)

    for index, mode in ipairs(IntroControl.game_modes()) do
        local y = 196 + (index - 1) * 42
        local selected = index == IntroControl.mode_selection
        if selected then
            love.graphics.setColor(0.12, 0.28, 0.34, 1)
            love.graphics.rectangle("fill", 174, y - 6, 292, 32, 4, 4)
            love.graphics.setColor(0.48, 0.9, 0.92, 1)
            love.graphics.print(">", 188, y)
        end
        love.graphics.setColor(selected and {1, 1, 1, 1} or {0.66, 0.72, 0.78, 1})
        love.graphics.printf(mode.name, 210, y, 240, "center")
    end

    centered_text("Esc: volver     Z / Enter: confirmar", 392, {0.65, 0.72, 0.8, 1})
end

local function draw_intro_party()
    local class_count = #Nuevas_clases
    local first = IntroControl.character_list_start
    local last = math.min(class_count, first + IntroControl.visible_character_rows - 1)

    centered_text("ELIGE TU PARTY", 48, {0.96, 0.82, 0.48, 1})
    centered_text("Selecciona 3 personajes para comenzar el Playtest", 78, {0.65, 0.82, 0.88, 1})
    draw_panel(52, 136, 310, 232)
    draw_panel(382, 136, 206, 232)

    for class_index = first, last do
        local row = class_index - first
        local y = 151 + row * 25
        local selected = class_index == IntroControl.character_selection
        local chosen_count = 0
        for _, chosen_index in ipairs(IntroControl.selected_classes) do
            if chosen_index == class_index then
                chosen_count = chosen_count + 1
            end
        end

        if selected then
            love.graphics.setColor(0.12, 0.28, 0.34, 1)
            love.graphics.rectangle("fill", 64, y - 3, 286, 22, 3, 3)
            love.graphics.setColor(0.48, 0.9, 0.92, 1)
            love.graphics.print(">", 72, y)
        end

        local class = Nuevas_clases[class_index]
        love.graphics.setColor(selected and {1, 1, 1, 1} or {0.72, 0.78, 0.84, 1})
        love.graphics.print(class.name or ("Personaje " .. class_index), 94, y)
        if chosen_count > 0 then
            love.graphics.setColor(0.96, 0.82, 0.48, 1)
            love.graphics.print("x" .. chosen_count, 318, y)
        end
    end

    love.graphics.setColor(0.65, 0.82, 0.88, 1)
    love.graphics.print("PARTY (" .. #IntroControl.selected_classes .. "/3)", 398, 153)
    for slot = 1, 3 do
        local class_index = IntroControl.selected_classes[slot]
        local name = class_index and Nuevas_clases[class_index].name or "-- vacio --"
        love.graphics.setColor(class_index and {1, 1, 1, 1} or {0.48, 0.54, 0.62, 1})
        love.graphics.printf(slot .. ". " .. name, 398, 184 + (slot - 1) * 28, 174, "left")
    end

    love.graphics.setColor(0.65, 0.72, 0.8, 1)
    love.graphics.printf("Arriba / abajo: elegir   Z: anadir   X: quitar ultimo", 52, 384, 536, "center")
    local action = #IntroControl.selected_classes == 3 and "Enter: comenzar" or "Esc: volver al modo"
    centered_text(action .. "     " .. class_count .. " personajes disponibles", 408, {0.65, 0.72, 0.8, 1})
end

local function draw_intro_options()
    centered_text("OPCIONES", 64, {0.96, 0.82, 0.48, 1})
    draw_panel(100, 148, 440, 220)
    love.graphics.setColor(0.92, 0.95, 1, 1)
    love.graphics.printf("Controles", 124, 174, 392, "center")
    love.graphics.print("Flechas arriba / abajo: navegar por los menus", 142, 220)
    love.graphics.print("Z, Espacio o Enter: confirmar / seleccionar", 142, 250)
    love.graphics.print("X o Retroceso: quitar personaje de la party", 142, 280)
    love.graphics.print("Esc: volver o salir desde el titulo", 142, 310)
    centered_text("Z / Enter / Esc: volver", 392, {0.65, 0.72, 0.8, 1})
end

function IntroControl.draw()
    love.graphics.push("all")
    love.graphics.origin()
    love.graphics.clear(0.025, 0.035, 0.065, 1)

    local screen_width, screen_height = love.graphics.getDimensions()
    local canvas_scale = math.min(screen_width / 640, screen_height / 480)
    love.graphics.translate(
        (screen_width - 640 * canvas_scale) / 2,
        (screen_height - 480 * canvas_scale) / 2
    )
    love.graphics.scale(canvas_scale, canvas_scale)

    if img_intro then
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(img_intro, 0, 0)
    end

    love.graphics.setColor(0.025, 0.035, 0.065, 0.88)
    love.graphics.rectangle("fill", 28, 24, 584, 432, 8, 8)
    love.graphics.setColor(0.35, 0.78, 0.85, 1)
    love.graphics.setLineWidth(2)
    love.graphics.rectangle("line", 28, 24, 584, 432, 8, 8)
    love.graphics.line(56, 112, 584, 112)

    if IntroControl.view == "title" then
        draw_intro_title()
    elseif IntroControl.view == "mode" then
        draw_intro_modes()
    elseif IntroControl.view == "party" then
        draw_intro_party()
    elseif IntroControl.view == "options" then
        draw_intro_options()
    end

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.pop()
end
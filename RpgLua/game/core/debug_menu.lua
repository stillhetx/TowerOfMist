local love = love

DebugGame = {
    selected = 1,
    buttons = {
        {label = "Combate", view = "graph"},
        {label = "Perfil", view = "perfil"},
        {label = "Descanso", view = "standBy"},
        {label = "Viaje", view = "travel"},
        {label = "Tienda", view = "tienda"},
        {label = "Mapa local", view = "overWorld"},
        {label = "Mundo", view = "allWorld"},
        {label = "Sigilo", view = "stealthMode"},
    },
}

function DebugGame.open(mode)
    if mode == "travel" then
        Eventos.level_card = lugares["pueblo_inicio_01"]
        Eventos.travel = 1
        Eventos.carta_actual = Eventos.level_card[1]
        Eventos.op_menu = 1
        Eventos.op_character = 1
        Eventos.resulto = false
    elseif mode == "tienda" then
        local store = Tiendas["vendedor_tienda_pueblo_inicio"]
        Tienda.etapa = "begin"
        Tienda.Name_store = store.name
        Tienda.ListaStore = store.itemsList
        Tienda.tipo = store.tipo
        Tienda.inn_cost = store.inn_cost
        Tienda.owner = store.char
        Tienda.npcName = store.owner
        Tienda.Sel_tienda = 1
        Tienda.before = "debug_menu"
    elseif mode == "overWorld" then
        ini_overworld = true
        Open_menu = false
        Inside_menu = false
    elseif mode == "stealthMode" then
        local info = Tabla_infiltracion["infiltracion_basica"]
        InfiltracionData.Info = info
        InfiltracionData.NmInside = info.people
        InfiltracionData.NmOutside = 0
        InfiltracionData.Deck = info.stealth_deck
        InfiltracionData.numero_char = 1
        FiltrarAliadosVivos()
        InfiltracionData.Actual_char = AliadosVivos[1]
        InfiltracionData.State = InfiltracionData.State_table.Organizar
        InfiltracionData.Nivel_busqueda = info.stealth_level
        InfiltracionData.Limit_type = info.stealth_type
        InfiltracionData.Nivel_tension = info.lvTension
        BeforeBattleMode = "debug_menu"
    elseif mode == "perfil" then
        Perfil.showPerfil="perfil"       
    end

    Show_view = mode
end

function DebugGame.move(amount)
    local count = #DebugGame.buttons
    DebugGame.selected = (DebugGame.selected - 1 + amount) % count + 1
end

function DebugGame.control(key)
    if key == "up" or key == "w" then
        DebugGame.move(-2)
    elseif key == "down" or key == "s" then
        DebugGame.move(2)
    elseif key == "left" or key == "a" then
        DebugGame.move(-1)
    elseif key == "right" or key == "d" then
        DebugGame.move(1)
    elseif key == "z" or key == "return" or key == "kpenter" then
        DebugGame.open(DebugGame.buttons[DebugGame.selected].view)
    end
end

function DebugGame.mousepressed(x, y, button)
    if button ~= 1 then
        return
    end

    local width, height = love.graphics.getDimensions()
    local scale = math.min(width / GAME_WIDTH, height / GAME_HEIGHT)
    local x_offset = (width - GAME_WIDTH * scale) / 2
    local y_offset = (height - GAME_HEIGHT * scale) / 2
    x = (x - x_offset) / scale
    y = (y - y_offset) / scale

    for index, item in ipairs(DebugGame.buttons) do
        local column = (index - 1) % 2
        local row = math.floor((index - 1) / 2)
        local button_x = 90 + column * 250
        local button_y = 140 + row * 67
        if x >= button_x and x <= button_x + 210
            and y >= button_y and y <= button_y + 52 then
            DebugGame.selected = index
            DebugGame.open(item.view)
            return
        end
    end
end

function DebugGame.draw()
    love.graphics.clear(0, 0, 0, 1)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf("TOWER OF MIST - DEBUG", 0, 55, GAME_WIDTH, "center")
    love.graphics.printf("Selecciona un modo para probar  |  F1: volver a este menu", 0, 95, GAME_WIDTH, "center")

    for index, item in ipairs(DebugGame.buttons) do
        local column = (index - 1) % 2
        local row = math.floor((index - 1) / 2)
        local x = 90 + column * 250
        local y = 140 + row * 67
        if index == DebugGame.selected then
            love.graphics.setColor(0.39, 0.57, 0.82, 1)
        else
            love.graphics.setColor(0.18, 0.22, 0.29, 1)
        end
        love.graphics.rectangle("fill", x, y, 210, 52)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.rectangle("line", x, y, 210, 52)
        love.graphics.printf(item.label, x, y + 16, 210, "center")
    end
end

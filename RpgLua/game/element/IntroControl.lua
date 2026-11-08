IntroControl = {
    view = "title",
    menu_selection = 1,
    mode_selection = 1,
    character_selection = 1,
    character_list_start = 1,
    selected_classes = {},
    visible_character_rows = 8,
}

local main_menu = {"Iniciar", "Opciones", "Salir"}
local game_modes = {
    {name = "Playtest", id = "playtest"},
}

local function return_to_title()
    IntroControl.view = "title"
    IntroControl.menu_selection = 1
end

local function start_playtest()
    _init(IntroControl.selected_classes)
    OverWorld.Op = 1
    OverWorld.ubicacionID = 1
    OverWorld.state = OverWorld.state_diccionary.seleccion
    OverWorld.travelTime = 0
    OverWorld.moveTimer = false
    Show_view = "allWorld"
end

local function confirm_selection()
    if IntroControl.view == "title" then
        if IntroControl.menu_selection == 1 then
            IntroControl.view = "mode"
            IntroControl.mode_selection = 1
        elseif IntroControl.menu_selection == 2 then
            IntroControl.view = "options"
        else
            love.event.quit()
        end
    elseif IntroControl.view == "mode" then
        if game_modes[IntroControl.mode_selection].id == "playtest" then
            IntroControl.selected_classes = {}
            IntroControl.character_selection = 1
            IntroControl.character_list_start = 1
            IntroControl.view = "party"
        end
    elseif IntroControl.view == "party" then
        if #IntroControl.selected_classes == 3 then
            start_playtest()
        elseif Nuevas_clases[IntroControl.character_selection] then
            table.insert(IntroControl.selected_classes, IntroControl.character_selection)
        end
    elseif IntroControl.view == "options" then
        return_to_title()
    end
end

local function move_selection(direction)
    if IntroControl.view == "title" then
        IntroControl.menu_selection = ((IntroControl.menu_selection - 1 + direction) % #main_menu) + 1
    elseif IntroControl.view == "mode" then
        IntroControl.mode_selection = ((IntroControl.mode_selection - 1 + direction) % #game_modes) + 1
    elseif IntroControl.view == "party" then
        local class_count = #Nuevas_clases
        if class_count == 0 then
            return
        end

        IntroControl.character_selection = ((IntroControl.character_selection - 1 + direction) % class_count) + 1
        if IntroControl.character_selection < IntroControl.character_list_start then
            IntroControl.character_list_start = IntroControl.character_selection
        elseif IntroControl.character_selection >= IntroControl.character_list_start + IntroControl.visible_character_rows then
            IntroControl.character_list_start = IntroControl.character_selection - IntroControl.visible_character_rows + 1
        end
    end
end

function IntroControl.keypressed(key)
    if key == "up" then
        move_selection(-1)
    elseif key == "down" then
        move_selection(1)
    elseif key == "return" or key == "kpenter" or key == "z" or key == "space" then
        if IntroControl.view == "party" and #IntroControl.selected_classes == 3 then
            if key == "return" or key == "kpenter" then
                start_playtest()
            end
        else
            confirm_selection()
        end
    elseif key == "x" or key == "backspace" then
        if IntroControl.view == "party" and #IntroControl.selected_classes > 0 then
            table.remove(IntroControl.selected_classes)
        end
    elseif key == "escape" then
        if IntroControl.view == "title" then
            love.event.quit()
        elseif IntroControl.view == "mode" then
            return_to_title()
        elseif IntroControl.view == "party" then
            IntroControl.view = "mode"
        else
            return_to_title()
        end
    end
end

function IntroControl.main_menu_items()
    return main_menu
end

function IntroControl.game_modes()
    return game_modes
end
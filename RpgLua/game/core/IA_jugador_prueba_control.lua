local skill_lists = {
    ["magic"]="mg",
    ["especiales"]="spe",
    ["tecnica"]="sk",
    ["W.Arts"]="art",
    ["invocar"]="invo",
    ["llamar"]="beast",
    ["tools"]="tools",
    ["transformacion"]="morph",
    ["Blu.magic"]="blue",
    ["bullet"]="bullet",
    ["mix"]="mix",
    ["spirit"]="spirit",
    ["Power.Stone"]="powerStone",
    ["w.magic"]="milagros",
    ["canciones"]="cancion",
    ["bailes"]="bailes",
    ["espada"]="swm",
    ["ninja"]="ninja",
}

local tested_skills = {}
local original_errorhandler = love.errorhandler

local function describe_test_target(label, target, required_fields)
    if type(target) ~= "table" then
        return label..": "..type(target).."; faltan datos del objetivo."
    end

    local fields = {"id", "id_mons", "name", "tipo", "hp_"}
    local values = {}
    local missing = {}
    for _, field in ipairs(fields) do
        values[#values + 1] = field.."="..tostring(target[field])
    end
    for _, field in ipairs(required_fields or {}) do
        if target[field] == nil or (field == "hp_" and type(target[field]) ~= "number") then
            missing[#missing + 1] = field
        end
    end

    local description = label..": {"..table.concat(values, ", ").."}"
    if #missing > 0 then
        description = description.."; faltan campos: "..table.concat(missing, ", ")
    end
    return description
end

local function write_test_error(message, context)
    if not personajes_en_automatico then
        return
    end

    local timestamp = os.date("%Y-%m-%d %H:%M:%S")
    local details = tostring(message)
    if context then
        details = details.."\n"..context
    end
    if Actual and Actual.id then
        details = details.."\nActor: "..tostring(Actual.id)
            .."\nAccion: "..tostring(Acc)
            .."\nHabilidad: "..tostring(Mg_sel)
            .."\nNombre: "..tostring(Name_action)
    end
    if debug and debug.traceback then
        details = debug.traceback(details, 2)
    end
    local text = "["..timestamp.."] Error durante la prueba automatica:\n"
        ..details.."\n\n"
    local ok, result = pcall(love.filesystem.append, "test_error_log", text)
    if not ok or not result then
        print("No se pudo escribir test_error_log: "..tostring(result))
        print(text)
    end
end

function IA_jugador_prueba_registrar_error(message)
    write_test_error(message)
end

function IA_jugador_prueba_registrar_error_objetivo(message, objetivo, protector)
    local context = describe_test_target("Objetivo", objetivo, {"hp_"})
    if protector ~= nil then
        context = context.."\n"..describe_test_target("Protector", protector, {"hp_"})
    end
    if personajes_en_automatico then
        write_test_error(message, context)
    else
        print(tostring(message).."\n"..context)
    end
end

love.errorhandler = function(message)
    write_test_error(message)
    local handler = original_errorhandler or love.errhand
    if handler then
        return handler(message)
    end
    return function()
        love.event.quit(1)
    end
end

local function is_available_skill(action, skill)
    if type(skill) ~= "table" or skill.id == nil then
        return false
    end
    if type(Efectos) ~= "table" or type(Efectos[skill.id]) ~= "function" then
        return false
    end
    if skill.dir ~= "x" and skill.dir ~= "e" and skill.dir ~= "c"
        and skill.dir ~= "d" and skill.dir ~= "a" and skill.dir ~= "m" then
        return false
    end
    if action == "magic" and skill.cost then
        local slot_count = skill.lv and Actual.slots_ and Actual.slots_[skill.lv]
        local has_slot = slot_count and slot_count > 0
        local mp = Actual.mp_ or 0
        if mp < skill.cost or (not has_slot and mp <= skill.cost) then
            return false
        end
    end
    if skill.tCost == "rc" and (Actual.rc_ or 0) <= 0 then
        return false
    end
    return true
end

local function add_action_skills(candidates, action, menu_index, group_index)
    local list_name = skill_lists[action]
    local skills = list_name and Actual[list_name]
    if not skills or not Operacion[action] then
        return
    end

    for skill_index, skill in ipairs(skills) do
        if is_available_skill(action, skill) then
            candidates[#candidates + 1] = {
                action=action,
                menu_index=menu_index,
                group_index=group_index,
                skill_index=skill_index,
                direction=skill.dir,
                key=tostring(Actual.id)..":"..action..":"..tostring(skill.id),
            }
        end
    end
end

local function get_candidates()
    local candidates = {}
    local menu_actions = {}

    for menu_index, action in ipairs(Actual.acc or {}) do
        menu_actions[action] = menu_index
        if action ~= "magics" and action ~= "colecciones" then
            add_action_skills(candidates, action, menu_index)
        end
    end

    for _, selector in ipairs({"magics", "colecciones"}) do
        local menu_index = menu_actions[selector]
        if menu_index then
            local groups = selector == "magics" and Actual.mag or Actual.col
            for group_index, action in ipairs(groups or {}) do
                add_action_skills(candidates, action, menu_index, group_index)
            end
        end
    end

    return candidates
end

local function choose_enemy()
    FiltrarEnemigoVivos()
    return #EnemigosVivos > 0
end

local function select_current_target()
    if State == "select_e" or State == "select_ee" then
        if choose_enemy() then
            Op = 1
        end
    elseif State == "select_c" or State == "select_cc" then
        FiltrarAliadosVivos()
        Op = 1
    elseif State == "select_d" then
        FiltrarAliadosMuertos()
        Op = 1
    elseif State == "select_i" then
        Op = 1
    elseif State == "select_w" then
        Op = 1
    elseif State == "select_v" then
        Op = 1
    elseif State == "select_m" then
        Op = 1
    elseif State == "select_a" then
        Op = 1
    else
        return false
    end
    return true
end

local function execute_candidate(candidate)
    State = "select"
    Acc = ""
    Op = candidate.menu_index
    ini_view = 1
    Execute = false
    acciones()

    if candidate.group_index then
        if State ~= "select_l" then
            return false
        end
        Op = candidate.group_index
        acciones()
    end

    if State ~= "select_o" then
        return false
    end
    Op = candidate.skill_index
    acciones()

    if State == "select_o" then
        if candidate.direction == "e" then
            State = "select_e"
            if not choose_enemy() then
                return false
            end
        elseif candidate.direction == "c" then
            State = "select_c"
            FiltrarAliadosVivos()
            if #AliadosVivos == 0 then
                return false
            end
        elseif candidate.direction == "d" then
            State = "select_d"
            FiltrarAliadosMuertos()
            if #Death_party == 0 then
                return false
            end
        end
    end

    for _ = 1, 3 do
        if State == "select" or Execute then
            return true
        end
        if not select_current_target() then
            return false
        end
        acciones()
    end

    return State == "select" or Execute
end

local function execute_fallback_action()
    local fallback_index
    for index, action in ipairs(Actual.acc or {}) do
        if action == "defensa" then
            fallback_index = index
            break
        end
    end
    if not fallback_index then
        for index, action in ipairs(Actual.acc or {}) do
            if action == "atacar" then
                fallback_index = index
                break
            end
        end
    end
    if not fallback_index then
        return
    end

    State = "select"
    Op = fallback_index
    ini_view = 1
    Execute = false
    acciones()
    if State == "select_e" and select_current_target() then
        acciones()
    end
end

function IA_jugador_prueba_control()
    if not personajes_en_automatico or not Actual or not Actual.id then
        return
    end

    local candidates = get_candidates()
    if #candidates == 0 then
        execute_fallback_action()
        return
    end

    local actor_id = tostring(Actual.id)
    tested_skills[actor_id] = tested_skills[actor_id] or {}
    local tested = tested_skills[actor_id]
    local untested = {}
    for _, candidate in ipairs(candidates) do
        if not tested[candidate.key] then
            untested[#untested + 1] = candidate
        end
    end

    if #untested == 0 then
        tested_skills[actor_id] = {}
        tested = tested_skills[actor_id]
        untested = candidates
    end

    local candidate = untested[love.math.random(#untested)]
    tested[candidate.key] = true
    execute_candidate(candidate)
end

function _update()
    --Actual=Order[Turno]
    executeTrigger()
    bucles()
    boton_press()
    --if modo=="overWorld" then
    if Modo == "overWorld" then
        if love.keyboard.isScancodeDown('w', 'up') then world_y = world_y - speed end
        if love.keyboard.isScancodeDown('s', 'down') then world_y = world_y + speed end
        if love.keyboard.isScancodeDown('a', 'left') then world_X = world_X - speed end
        if love.keyboard.isScancodeDown('d', 'right') then world_X = world_X + speed end
    end

    init_player(Actual)
    isAlive()
    winState()
    wait_enemy()
    if EnemigosVivos[Op] ~= nil then
        Temp_e = EnemigosVivos[Op].id
    end
    if ActiveParty[Op] ~= nil then
        Temp_c = ActiveParty[Op].id
    end
    local key = stat(31)
    if key == "q" then
        Show_view = "graph"
    end
    if key == "w" then
        Show_view = "text"
    end
    if key == "e" then
        Show_view = "debug"
    end
    if key == "r" then
        Show_view = "debug2"
    end
    if B_wait == false then
        if #Reacciones > 0 then
            ejecutar_reaccion()
        else
            start(Actual)
            ejecutar_comando()
            if auto then
                automatico(Actual)
            else
                if Modo == "combat" then
                    if Actual.tipo == "player" and Actual.next_atack ~= '' then
                        Robot(Actual)
                    end
                    if Actual.tipo == "player" and Actual.live == false then
                        next()
                    end
                    if (Actual.tipo == "aliado" or Actual.tipo == "enemy") and Actual.live == true then
                        logic(Actual.tipo)
                        --next()
                    end
                    if (Actual.tipo == "aliado" or Actual.tipo == "enemy") and Actual.live == false then
                        next()
                    end
                end
            end
        end
    end
    updateMonster()
    updateParty()
    cleanDmg()
    isAlive()
end

function _update_travel()

end

--next_comando=""


--Dejar para despues


function cleanEjecutarComando()
    --next_comando=""
    objetivo_global = {}
    clean()
    next()
    wait_start()
end

function boton_press()
    if animated_bonus_boton then
        if love.keyboard.isScancodeDown('z') then
            local exito_time = (bonus_boton_time_max / 3) * 2
            if bonus_boton_time_cont > exito_time then
                Buton_bonus = 1
            else
                Buton_bonus = 0
            end
        end
    end
end

function add_inventary_Weapon_list(t)
    if existList(t.id, weapon_inventary) then
        --si existe el registro
        local temp = getChars(t.id, weapon_inventary)
        if temp.cont ~= nil then
            temp.cont = temp.cont + 1
        end
    else
        -- si no existe el registro
        t.cont = 1
        add(weapon_inventary, t)
    end
end

function add_inventary_Armadura_list(t)
    if existList(t.id, armadura_inventary) then
        --si existe el registro
        local temp = getChars(t.id, armadura_inventary)
        if temp.cont ~= nil then
            temp.cont = temp.cont + 1
        end
    else
        -- si no existe el registro
        t.cont = 1
        add(armadura_inventary, t)
    end
end

function add_inventary_Accesorio_list(t)
    if existList(t.id, Accesorios_inventary) then
        --si existe el registro
        local temp = getChars(t.id, Accesorios_inventary)
        if temp.cont ~= nil then
            temp.cont = temp.cont + 1
        end
    else
        -- si no existe el registro
        t.cont = 1
        add(Accesorios_inventary, t)
    end
end

function add_inventary_Complemento_list(t)
    if existList(t.id, Complemento_inventary) then
        --si existe el registro
        local temp = getChars(t.id, Complemento_inventary)
        if temp.cont ~= nil then
            temp.cont = temp.cont + 1
        end
    else
        -- si no existe el registro
        t.cont = 1
        add(Complemento_inventary, t)
    end
end

function add_inventary_Artefacto_list(t)
    if existList(t.id, Artefacto_inventary) then
        --si existe el registro
        local temp = getChars(t.id, Artefacto_inventary)
        if temp.cont ~= nil then
            temp.cont = temp.cont + 1
        end
    else
        -- si no existe el registro
        t.cont = 1
        add(Artefacto_inventary, t)
    end
end

function count_items(str)
    local count = 0
    if existList(str, items) then
        local temp = getChars(str, items)
        if temp.cont ~= nil then
            count = temp.cont
        end
        return count
    else
        return 0
    end
end

function add_inventary_items_list(t)
    if existList(t.id, items) then
        --si existe el registro
        local temp = getChars(t.id, items)
        if temp.cont ~= nil then
            temp.cont = temp.cont + 1
        end
    else
        -- si no existe el registro
        t.cont = 1
        add(items, t)
    end
end

function remove_inventary_items_list(t)
    if existList(t.id, items) then
        local temp = getChars(t.id, items)
        if temp.cont > 0 then
            temp.cont = temp.cont - 1
        end
    end
end

function filtrarEnemigos()
    Show_enemy = {}
    for k, v in pairs(Order) do
        if v.tipo == "enemy" and v.hp_ > 0 then
            add(Show_enemy, v)
        end
    end
end

function filtrarDerrotados()
    Death_party = {}
    for k, v in pairs(Order) do
        if v.tipo == "player" and v.hp_ < 1 then
            add(Death_party, v)
        end
    end
end

--se puede
function Add_skill_equip(v, ob)
    if #v.extra > 0 then
        for k, i in pairs(v.extra) do
            if i.name == "pasiva" then
                ob.perks[i.value.id] = i.value
            end
            if i.name == "comando" then
                add(ob.acc, i.value)
            end
            if i.name == "spell" then
                for t, ii in pairs(v.extra.value) do
                    add(ob.mg, all_spell[ii])
                end
            end
            if i.name == "spell.list" then
                for t, ii in pairs(v.extra.value) do
                    add(ob.mg, ii)
                end
            end
            if i.name == "perks" then
                ob.perks[i.value.id] = i.value
            end --
        end
    end
end

function Remove_skill_equip(v, ob)
    if v.extra ~= nil then
        for k, i in pairs(v.extra) do
            if i.name == "pasiva" then
                removeKey(ob.perks, i.value.id)
            end
            if i.name == "comando" then
                del(ob.acc, i.value)
            end --
            if i.name == "spell.list" then
                for t, ii in pairs(v.extra.value) do
                    del(v.mg, ii)
                end
            end
            if i.name == "spell" then
                for t, ii in pairs(v.extra.value) do
                    del(ob.mg, ii)
                end
            end
            if i.name == "perks" then
                removeKey(ob.perks, i.value.id)
            end
        end
    end
end

function cambio_equipo()
    if Show_view == "perfil" then
        --texto_help=""
        if Perfil.select_mp_slot == "weapon_izq" then
            --texto_help=texto_help.."izq "
            if Perfil.select_mp_Item ~= "quitar" then
                local arm_inventario = getChars(Perfil.select_mp_Item, weapon_inventary)
                if arm_inventario.cont > 0 then
                    arm_inventario.cont = arm_inventario.cont - 1
                    if ActiveParty[Perfil.seePerfil].weapon.left == {} then
                        --texto_help=texto_help.."A "
                        --Si no tiene arma. agrega la nueva
                        ActiveParty[Perfil.seePerfil].weapon.left = arm_inventario
                    else
                        --texto_help=texto_help.."b "
                        --si ya tiene arma, guarda la vieja para agregar la nueva
                        local arma_left = ActiveParty[Perfil.seePerfil].weapon.left
                        Remove_skill_equip(arma_left, ActiveParty[Perfil.seePerfil])
                        add_inventary_Weapon_list(arma_left)
                        ActiveParty[Perfil.seePerfil].weapon.left = arm_inventario
                    end
                    Add_skill_equip(arm_inventario, ActiveParty[Perfil.seePerfil])
                    if ActiveParty[Perfil.seePerfil].weapon.left ~= {} and ActiveParty[Perfil.seePerfil].weapon.right ~= nil and ActiveParty[Perfil.seePerfil].weapon.left.modo == "2h" then
                        --texto_help=texto_help.."C "
                        if ActiveParty[Perfil.seePerfil].weapon.right ~= {} then
                            local arma_right = ActiveParty[Perfil.seePerfil].weapon.right
                            add_inventary_Weapon_list(arma_right)
                            Remove_skill_equip(arma_right, ActiveParty[Perfil.seePerfil])
                        end

                        ActiveParty[Perfil.seePerfil].weapon.right = {}
                    end
                    if ActiveParty[Perfil.seePerfil].weapon.left ~= {} and ActiveParty[Perfil.seePerfil].weapon.right ~= nil and ActiveParty[Perfil.seePerfil].weapon.left.modo == "1h" then
                        --texto_help=texto_help.."E "
                        if ActiveParty[Perfil.seePerfil].weapon.right ~= {} and ActiveParty[Perfil.seePerfil].weapon.right.modo == "2h" then
                            --texto_help=texto_help.."H "
                            local arma_right = ActiveParty[Perfil.seePerfil].weapon.right
                            add_inventary_Weapon_list(arma_right)
                            Remove_skill_equip(arma_right, ActiveParty[Perfil.seePerfil])
                            ActiveParty[Perfil.seePerfil].weapon.right = {}
                        end
                    end
                end
            else
                add_inventary_Weapon_list(ActiveParty[Perfil.seePerfil].weapon.left)
                ActiveParty[Perfil.seePerfil].weapon.left = {}
            end
        end

        if Perfil.select_mp_slot == "weapon_der" then
            --texto_help=texto_help.."der "
            if Perfil.select_mp_Item ~= "quitar" then
                local arm_inventario = getChars(Perfil.select_mp_Item, weapon_inventary)
                if arm_inventario.cont > 0 then
                    arm_inventario.cont = arm_inventario.cont - 1
                    if ActiveParty[Perfil.seePerfil].weapon.right == {} then
                        --texto_help=texto_help.."A "
                        ActiveParty[Perfil.seePerfil].weapon.right = arm_inventario
                    else
                        --texto_help=texto_help.."b "
                        local arma_right = ActiveParty[Perfil.seePerfil].weapon.right
                        Remove_skill_equip(arma_right, ActiveParty[Perfil.seePerfil])
                        add_inventary_Weapon_list(arma_right)
                        ActiveParty[Perfil.seePerfil].weapon.right = arm_inventario
                    end
                    Add_skill_equip(arm_inventario, ActiveParty[Perfil.seePerfil])
                    if ActiveParty[Perfil.seePerfil].weapon.right ~= {} and ActiveParty[Perfil.seePerfil].weapon.right ~= nil and ActiveParty[Perfil.seePerfil].weapon.right.modo == "2h" then
                        --texto_help=texto_help.."C "
                        if ActiveParty[Perfil.seePerfil].weapon.left ~= {} then
                            --texto_help=texto_help.."D "
                            local arma_left = ActiveParty[Perfil.seePerfil].weapon.left
                            Remove_skill_equip(arma_left, ActiveParty[Perfil.seePerfil])
                            add_inventary_Weapon_list(arma_left)
                        end
                        ActiveParty[Perfil.seePerfil].weapon.left = {}
                    end
                    if ActiveParty[Perfil.seePerfil].weapon.right ~= {} and ActiveParty[Perfil.seePerfil].weapon.right ~= nil and ActiveParty[Perfil.seePerfil].weapon.right.modo == "1h" then
                        --texto_help=texto_help.."E "
                        if ActiveParty[Perfil.seePerfil].weapon.left ~= {} and ActiveParty[Perfil.seePerfil].weapon.left.modo == "2h" then
                            --texto_help=texto_help.."H "
                            local arma_left = ActiveParty[Perfil.seePerfil].weapon.left
                            Remove_skill_equip(arma_left, ActiveParty[Perfil.seePerfil])
                            add_inventary_Weapon_list(arma_left)
                            ActiveParty[Perfil.seePerfil].weapon.left = {}
                        end
                    end
                end
            else
                add_inventary_Weapon_list(ActiveParty[Perfil.seePerfil].weapon.right)
                ActiveParty[Perfil.seePerfil].weapon.right = {}
            end
        end

        if Perfil.select_mp_slot == "armadura" then
            if Perfil.select_mp_Item ~= "quitar" then
                local temp = getChars(Perfil.select_mp_Item, armadura_inventary)
                temp.cont = temp.cont - 1
                local antiguoEquipado = ActiveParty[Perfil.seePerfil].armadura
                ActiveParty[Perfil.seePerfil].armadura = temp
                Add_skill_equip(temp, ActiveParty[Perfil.seePerfil])
                add_inventary_Armadura_list(antiguoEquipado)
            else
                local temp = ActiveParty[Perfil.seePerfil].armadura
                ActiveParty[Perfil.seePerfil].armadura = {}
                Remove_skill_equip(temp, ActiveParty[Perfil.seePerfil])
                add_inventary_Armadura_list(temp)
            end
        end

        -- cabeza

        if Perfil.select_mp_slot == "cabeza" then
            if Perfil.select_mp_Item ~= "quitar" then
                local temp = getChars(Perfil.select_mp_Item, armadura_inventary)
                temp.cont = temp.cont - 1
                local antiguoEquipado = ActiveParty[Perfil.seePerfil].head
                ActiveParty[Perfil.seePerfil].head = temp
                Add_skill_equip(temp, ActiveParty[Perfil.seePerfil])
                add_inventary_Armadura_list(antiguoEquipado)
            else
                local temp = ActiveParty[Perfil.seePerfil].head
                ActiveParty[Perfil.seePerfil].head = {}
                Remove_skill_equip(temp, ActiveParty[Perfil.seePerfil])
                add_inventary_Armadura_list(temp)
            end
        end

        if Perfil.select_mp_slot == "accesorio_1" then
            if Perfil.select_mp_Item ~= "quitar" then
                local temp = getChars(Perfil.select_mp_Item, Accesorios_inventary)
                temp.cont = temp.cont - 1
                local antiguoEquipado = ActiveParty[Perfil.seePerfil].accesorio_1
                ActiveParty[Perfil.seePerfil].accesorio_1 = temp
                Add_skill_equip(temp, ActiveParty[Perfil.seePerfil])
                if antiguoEquipado.id ~= nil then
                    Remove_skill_equip(antiguoEquipado, ActiveParty[Perfil.seePerfil])
                end
                add_inventary_Armadura_list(antiguoEquipado)
            else
                local temp = ActiveParty[Perfil.seePerfil].accesorio_1
                ActiveParty[Perfil.seePerfil].accesorio_1 = {}
                Remove_skill_equip(temp, ActiveParty[Perfil.seePerfil])
                add_inventary_Armadura_list(temp)
            end
        end

        if Perfil.select_mp_slot == "accesorio_2" then
            if Perfil.select_mp_Item ~= "quitar" then
                local temp = getChars(Perfil.select_mp_Item, Accesorios_inventary)
                temp.cont = temp.cont - 1
                local antiguoEquipado = ActiveParty[Perfil.seePerfil].accesorio_2
                ActiveParty[Perfil.seePerfil].accesorio_2 = temp
                Add_skill_equip(temp, ActiveParty[Perfil.seePerfil])
                if antiguoEquipado.id ~= nil then
                    Remove_skill_equip(antiguoEquipado, ActiveParty[Perfil.seePerfil])
                end
                add_inventary_Armadura_list(antiguoEquipado)
            else
                local temp = ActiveParty[Perfil.seePerfil].accesorio_2
                ActiveParty[Perfil.seePerfil].accesorio_2 = {}
                Remove_skill_equip(temp, ActiveParty[Perfil.seePerfil])
                add_inventary_Armadura_list(temp)
            end
        end



        if Perfil.select_mp_slot == "artefacto" then
            if Perfil.select_mp_Item ~= "quitar" then
                local temp = getChars(Perfil.select_mp_Item, Artefacto_inventary)
                temp.cont = temp.cont - 1
                local antiguoEquipado = ActiveParty[Perfil.seePerfil].artefacto
                ActiveParty[Perfil.seePerfil].artefacto = temp
                Add_skill_equip(temp, ActiveParty[Perfil.seePerfil])
                if antiguoEquipado.id ~= nil then
                    Remove_skill_equip(antiguoEquipado, ActiveParty[Perfil.seePerfil])
                end
                add_inventary_Artefacto_list(antiguoEquipado)
            else
                local temp = ActiveParty[Perfil.seePerfil].artefacto
                ActiveParty[Perfil.seePerfil].artefacto = {}
                Remove_skill_equip(temp, ActiveParty[Perfil.seePerfil])
                add_inventary_Artefacto_list(temp)
            end
        end
        if Perfil.select_mp_slot == "complemento" then
            if Perfil.select_mp_Item ~= "quitar" then
                local temp = getChars(Perfil.select_mp_Item, Complemento_inventary)
                temp.cont = temp.cont - 1
                local antiguoEquipado = ActiveParty[Perfil.seePerfil].complemento
                ActiveParty[Perfil.seePerfil].complemento = temp
                Add_skill_equip(temp, ActiveParty[Perfil.seePerfil])
                if antiguoEquipado.id ~= nil then
                    Remove_skill_equip(antiguoEquipado, ActiveParty[Perfil.seePerfil])
                end
                add_inventary_Complemento_list(antiguoEquipado)
            else
                local temp = ActiveParty[Perfil.seePerfil].accesorio_2
                ActiveParty[Perfil.seePerfil].accesorio_2 = {}
                Remove_skill_equip(temp, ActiveParty[Perfil.seePerfil])
                add_inventary_Complemento_list(temp)
            end
        end
    end
end

function bucles()
    --local jump_time=0
    local jump_time_max = 3
    local avanzar_time_max = 8
    local lateral_gravity = 3
    local max_timer_summon = 12
    if Msg_exito_bol then
        Msg_exito_cont_time = Msg_exito_cont_time + 1
        if Msg_exito_max_time == Msg_exito_cont_time then
            Msg_exito_bol = false
            Msg_exito_cont_time = 0
        end
    end
    if animated_bonus_boton then
        bonus_boton_time_cont = bonus_boton_time_cont + 1
        if bonus_boton_time_max == bonus_boton_time_cont then
            animated_bonus_boton = false
            bonus_boton_time_cont = 0
        end
    end
    Animacion.show_Accion_character()
    for k, v in pairs(Order) do
        if v.tipo == "player" then
            if v.react == true then
                if v.react_time < react_time_max_var then
                    v.react_time = v.react_time + 1
                else
                    v.react = false
                    v.react_time = 0
                end
            end
            
            --[[
            if v.rest == false and v.jump then
                if v.jump_time < jump_time_max then
                    v.x = v.x - lerp(0, 20, jump_time_max)
                    v.jump_time = v.jump_time + 1
                end
                v.x = v.x + lateral_gravity
                if v.x >= v.x_ then
                    v.x = v.x_
                    v.rest = true
                    v.jump = false
                    v.jump_time = 0
                end
            end
            if v.rest == false and v.avanzar then
                if v.avanzar_time < avanzar_time_max then
                    v.x = v.x + lerp(0, 60, avanzar_time_max)
                    v.avanzar_time = v.avanzar_time + 1
                end
                v.x = v.x - lateral_gravity
                if v.x <= v.x_ then
                    v.x = v.x_
                    v.rest = true
                    v.avanzar = false
                    v.avanzar_time = 0
                end
            end
            ]]

            if v.attack == true then
                if v.attack_time < 80 then
                    v.attack_time = v.attack_time + 1
                else
                    v.attack_time = 0
                    v.attack = false
                end
            end
            if v.summon then
                if v.summon_time < max_timer_summon then
                    v.summon_x = v.summon_x + lerp(0, v.avanzar_x, max_timer_summon)
                    v.summon_time = v.summon_time + 1
                end
                v.summon_x = v.summon_x - 4
                if v.summon_x <= v.summon_x_ then
                    v.summon_x = v.summon_x_
                    v.summon_time = 0
                    v.summon = false
                end
            end
        end
        if v.tipo == "aliado" then
            if v.react == true then
                if v.react_time < react_time_max_var then
                    v.react_time = v.react_time + 1
                else
                    v.react = false
                    v.react_time = 0
                end
            end
            
            --[[if v.rest == false and v.jump then
                if v.jump_time < jump_time_max then
                    v.x = v.x - lerp(0, 20, jump_time_max)
                    v.jump_time = v.jump_time + 1
                end
                v.x = v.x + lateral_gravity
                if v.x >= v.x_ then
                    v.x = v.x_
                    v.rest = true
                    v.jump = false
                    v.jump_time = 0
                end
            end
            if v.rest == false and v.avanzar then
                if v.avanzar_time < avanzar_time_max then
                    v.x = v.x + lerp(0, 60, avanzar_time_max)
                    v.avanzar_time = v.avanzar_time + 1
                end
                v.x = v.x - lateral_gravity
                if v.x <= v.x_ then
                    v.x = v.x_
                    v.rest = true
                    v.avanzar = false
                    v.avanzar_time = 0
                end
            end
            ]]
            if v.attack == true then
                if v.attack_time < 80 then
                    v.attack_time = v.attack_time + 1
                else
                    v.attack_time = 0
                    v.attack = false
                end
            end
        end
        if v.tipo == "enemy" then
            if v.react == true then
                if v.react_time < react_time_max_var then
                    v.react_time = v.react_time + 1
                else
                    v.react = false
                    v.react_time = 0
                end
            end
            --[[
            if v.rest == false and v.jump then
                if v.jump_time < jump_time_max then
                    v.x = v.x + lerp(0, 20, jump_time_max)
                    v.jump_time = v.jump_time + 1
                end
                v.x = v.x - lateral_gravity
                if v.x <= v.x_ then
                    v.x = v.x_
                    v.rest = true
                    v.jump = false
                    v.jump_time = 0
                end
            end
            if v.rest == false and v.avanzar then
                if v.avanzar_time < avanzar_time_max then
                    v.x = v.x - lerp(0, 60, avanzar_time_max)
                    v.avanzar_time = v.avanzar_time + 1
                end
                v.x = v.x + lateral_gravity
                if v.x >= v.x_ then
                    v.x = v.x_
                    v.rest = true
                    v.avanzar = false
                    v.avanzar_time = 0
                end
            end
            ]]
            if v.attack == true then
                if v.attack_time ~= nil then
                    if v.attack_time < 48 then
                        v.attack_time = v.attack_time + 1
                    else
                        v.attack_time = 0
                        v.attack = false
                    end
                end
            end
        end
    end
end

function executeTrigger()
    --for i, #List_trigger do
    --agregar funcion


    --  del(List_trigger,List_trigger[i])
    --end
end

function signal(str)
    add(List_trigger, str)
end

function new_Order()
    isAlive()
    for k, v in pairs(Order) do
        if v.live then
            v.ini = v.agi + mod(v, "agi") + flr(rnd(20))
        else
            v.ini = 0
        end
    end
    qsort(Order, function(a, b) return abs(a.ini) > abs(b.ini) end)
end

function General_magics(v)
    local lista = {}

    for k, i in pairs(v.magics) do
        lista[#lista + 1] = v.magics[k]
    end

    return lista
end

function General_coleccion(v)
    local lista = {}

    for k, i in pairs(v.coleccion) do
        lista[#lista + 1] = v.coleccion[k]
    end
    return lista
end

function General_lista(v)
    local lista = {}
    --v.acc

    for k, i in pairs(ACC_Default) do
        if ACC_Default[k] == "atacar" then
            lista[#lista + 1] = "atacar"
        end
        if ACC_Default[k] == "secundario" then
            if v.spe_command ~= "" then
                lista[#lista + 1] = v.spe_command
            end
        end
        if ACC_Default[k] == "W.Arts" then
            if v.isWArt then
                lista[#lista + 1] = "W.Arts"
            end
        end
        if ACC_Default[k] == "magic" then
            if #v.magics == 1 then
                lista[#lista + 1] = v.magics[1]
            elseif #v.magics > 1 then
                lista[#lista + 1] = "magics"
            end
        end
        if ACC_Default[k] == "coleccion" then
            if #v.coleccion == 1 then
                lista[#lista + 1] = v.coleccion[1]
            elseif #v.coleccion > 1 then
                lista[#lista + 1] = "colecciones"
            end
        end
        if ACC_Default[k] == "especiales" then
            if #v.spe > 1 then
                lista[#lista + 1] = "especiales"
            end
        end
        if ACC_Default[k] == "tecnica" then
            if #v.sk > 1 then
                lista[#lista + 1] = "tecnica"
            end
        end
        if ACC_Default[k] == "objeto" then
            lista[#lista + 1] = "objeto"
        end
        if ACC_Default[k] == "defensa" then
            lista[#lista + 1] = "defensa"
        end
    end
    return lista
end

function Turnos(o)
    local lista = {}
    local final = {}
    local low = 0

    for i = 1, 6 do
        for k, v in pairs(o) do
            local r = {}
            local speed = 0
            r.obj = v
            r.agi = v.agi
            r.ini = v.agi * i + flr(rnd(20))
            add(lista, r)
            if i == 3 and low == 0 then
                low = r.ini
            elseif i == 3 and r.ini < low then
                low = r.ini
            end
        end
    end

    qsort(lista, function(a, b) return abs(a.ini) > abs(b.ini) end)

    for i = 1, 18 do
        add(final, lista[i].obj)
    end

    return final
end

function AddTurnos(all, order, num)
    local round = num / #all
    local lista = {}

    for k, v in pairs(all) do
        local r = {}
        local speed = 0
        r.obj = v
        r.agi = v.agi
        r.ini = v.agi * round + flr(rnd(20))
        add(lista, r)
    end

    qsort(lista, function(a, b) return abs(a.ini) > abs(b.ini) end)

    for i = 1, #all do
        add(order, lista[i].obj)
    end


    return order
end

function Total(v,str)
    if str=="con" then
        return v.con + mod(v,"con");
    elseif str=="fue"then    
        return v.fue + mod(v,"fue");   
    elseif str=="pod"then    
        return v.pod + mod(v,"pod");    
    elseif str=="dex"then
        return v.dex + mod(v,"dex");
    elseif str=="agi"then    
        return v.agi + mod(v,"agi");
    elseif str=="int"then    
        return v.int + mod(v,"int");
    elseif str=="car"then    
        return v.car + mod(v,"car");
    elseif str=="mnd"then    
        return v.mnd + mod(v,"mnd");
    end

end


function Total(v,tipo)
    return v[tipo]+mod(v,tipo)
end

function mod(v, tipo)
    tipo = "" or tipo
    local value = 0
    if v.tipo == "player" then
        if tipo == "agi" then
            if v.state["lento"] ~= nil then
                value = value + v.state["lento"].value
            end
            if v.state["rapido"] ~= nil then
                value = value + v.state["rapido"].value
            end
            if v.perks["AGI+10%"] ~= nil then
                value = value + v.fue * 0.1
            end
            if v.perks["AGI+30%"] ~= nil then
                value = value + v.fue * 0.3
            end
            if v.perks["AGI+50%"] ~= nil then
                value = value + v.fue * 0.5
            end
            if v.perks["AGI.J"] ~= nil then
                local n = enlaze_j(v, "AGI.J");
                value = value + n * 0.5
            end
            if v.style["cuerpo_de_papel"] then
                value= value +3
            end
        end
        if tipo == "dex" then
            if v.state["lento"] ~= nil then
                value = value + v.state["lento"].value
            end
            if v.state["rapido"] ~= nil then
                value = value + v.state["rapido"].value
            end
            if v.perks["DEX+10%"] ~= nil then
                value = value + v.dex * 0.1
            end
            if v.perks["DEX+30%"] ~= nil then
                value = value + v.dex * 0.3
            end
            if v.perks["DEX+50%"] ~= nil then
                value = value + v.dex * 0.5
            end
            if v.perks["DEX.J"] ~= nil then
                local n = enlaze_j(v, "DEX.J");
                value = value + n * 0.5
            end
        end
        if tipo == "fue" then
            if v.state["super"] ~= nil then
                value = value + v.state["super"].value
            end
            if v.perks["SUPER_FUERZA"] ~= nil then
                value = value + v.fue
            end
            if v.perks["FUE+10%"] ~= nil then
                value = value + v.fue * 0.1
            end
            if v.perks["FUE+30%"] ~= nil then
                value = value + v.fue * 0.3
            end
            if v.perks["FUE+50%"] ~= nil then
                value = value + v.fue * 0.5
            end
            if v.perks["FUE.J"] ~= nil then
                local n = enlaze_j(v, "FUE.J");
                value = value + n * 0.5
            end
        end
        if tipo == "con" then
            if v.state["super"] ~= nil then
                value = value + v.state["super"].value
            end
            if v.perks["SUPER_CONSTITUCION"] ~= nil then
                value = value + v.con
            end
            if v.perks["CON+10%"] ~= nil then
                value = value + v.con * 0.1
            end
            if v.perks["CON+30%"] ~= nil then
                value = value + v.con * 0.3
            end
            if v.perks["CON+50%"] ~= nil then
                value = value + v.con * 0.5
            end
            if v.perks["CON.J"] ~= nil then
                local n = enlaze_j(v, "CON.J");
                value = value + n * 0.5
            end
            if v.style["piel_de_hierro"] then
                value = value + 3
            end
        end
        if tipo == "pod" then
            if v.perks["POD+10%"] ~= nil then
                value = value + v.pod * 0.1
            end
            if v.perks["POD+30%"] ~= nil then
                value = value + v.pod * 0.3
            end
            if v.perks["POD+50%"] ~= nil then
                value = value + v.pod * 0.5
            end
            if v.perks["POD.J"] ~= nil then
                local n = enlaze_j(v, "POD.J");
                value = value + n * 0.5
            end
        end
        if tipo == "mnd" then
            if v.perks["MND+10%"] ~= nil then
                value = value + v.mnd * 0.1
            end
            if v.perks["MND+30%"] ~= nil then
                value = value + v.mnd * 0.3
            end
            if v.perks["MND+50%"] ~= nil then
                value = value + v.mnd * 0.5
            end
            if v.perks["MND.J"] ~= nil then
                local n = enlaze_j(v, "MND.J");
                value = value + n * 0.5
            end
        end
        if tipo == "int" then
            if v.perks["INT+10%"] ~= nil then
                value = value + v.int * 0.1
            end
            if v.perks["INT+30%"] ~= nil then
                value = value + v.int * 0.3
            end
            if v.perks["INT+50%"] ~= nil then
                value = value + v.int * 0.5
            end
            if v.perks["INT.J"] ~= nil then
                local n = enlaze_j(v, "INT.J");
                value = value + n * 0.5
            end
        end
        if tipo == "car" then
            if v.perks["CAR+10%"] ~= nil then
                value = value + v.car * 0.1
            end
            if v.perks["CAR+30%"] ~= nil then
                value = value + v.car * 0.3
            end
            if v.perks["CAR+50%"] ~= nil then
                value = value + v.car * 0.5
            end
            if v.perks["CAR.J"] ~= nil then
                local n = enlaze_j(v, "CAR.J");
                value = value + n * 0.5
            end
        end
        if tipo == "per" then
            if v.perks["PER+10%"] ~= nil then
                value = value + v.per * 0.1
            end
            if v.perks["PER+30%"] ~= nil then
                value = value + v.per * 0.3
            end
            if v.perks["PER+50%"] ~= nil then
                value = value + v.per * 0.5
            end
            if v.perks["PER.J"] ~= nil then
                local n = enlaze_j(v, "PER.J");
                value = value + n * 0.5
            end
        end
        if tipo == "hp" then
            if v.perks["HP_PLUS_VAR"] ~= nil then
                value = value + v.perks["HP_PLUS_VAR"].value
            end
            if v.perks["HP_PLUS_5"] ~= nil then
                value = value + v.perks["HP_PLUS_5"].value
            end
            if v.perks["HP+20%"] ~= nil then
                value = value + v.hp * 0.2
            end
            if v.perks["HP+40%"] ~= nil then
                value = value + v.hp * 0.4
            end
            if v.perks["HP+60%"] ~= nil then
                value = value + v.hp * 0.6
            end
            if v.perks["HP+60%"] ~= nil then
                value = value + v.hp * 0.6
            end
            if v.perks["HP+80%"] ~= nil then
                value = value + v.hp * 0.8
            end
            if v.perks["HP+100%"] ~= nil then
                value = value + v.hp * 1
            end
            if v.perks["HP.J"] ~= nil then
                local n = enlaze_j(v, "HP.J");
                value = value + n * 0.5
            end
        end
        if tipo == "mp" then
            if v.perks["MP_PLUS_VAR"] ~= nil then
                value = value + v.perks["HP_PLUS_VAR"].value
            end
            if v.perks["MP_PLUS_5"] ~= nil then
                value = value + v.perks["HP_PLUS_5"].value
            end
            if v.perks["MP+20%"] ~= nil then
                value = value + v.hp * 0.2
            end
            if v.perks["MP+40%"] ~= nil then
                value = value + v.hp * 0.4
            end
            if v.perks["MP+60%"] ~= nil then
                value = value + v.hp * 0.4
            end
            if v.perks["MP+60%"] ~= nil then
                value = value + v.hp * 0.4
            end
            if v.perks["MP+80%"] ~= nil then
                value = value + v.hp * 0.4
            end
            if v.perks["MP.J"] ~= nil then
                local n = enlaze_j(v, "MP.J");
                value = value + n * 0.5
            end
        end
    end
    return value
end

function enlaze_j(v, str)
    local num = 0
    if str == "MP.J" then
        num = num + count_items("piedra_roja")
    end
    if str == "HP.J" then
        num = num + count_items("piedra_azul")
    end

    if str == "AGI.J" then
        num = num + count_items("piedra_liviana")
    end

    if str == "DEX.J" then
        num = num + count_items("piedra_maleable")
    end

    if str == "FUE.J" then
        num = num + count_items("piedra_pesada")
    end
    if str == "CON.J" then
        num = num + count_items("piedra_resistente")
    end
    if str == "POD.J" then
        num = num + count_items("piedra_energizante")
    end
    if str == "MND.J" then
        num = num + count_items("piedra_clara")
    end
    if str == "INT.J" then
        num = num + count_items("piedra_transparante")
    end
    if str == "CAR.J" then
        num = num + count_items("piedra_hermosa")
    end
    if str == "PER.J" then
        num = num + count_items("piedra_luminosa")
    end

    if num > 200 then
        return 200
    else
        return num
    end
end

function one_line_menu_op(list, hide)
    if Op < 1 then
        if #list > hide then
            Op = hide
        else
            Op = #list
        end
    end
    if Op > #list then
        Op = 1
    end
    if Op > hide then
        Op = 1
    end

    if Op > #list - (ini_view - 1) then
        if #list > 6 then
            if #list - (ini_view - 1) < #list then
                Op = 1
                ini_view = 1
            end
        else
            Op = 1
        end
    end
    if ini_view < 1 then
        ini_view = (math.floor(#Actual.acc / hide) * hide) + 1
        Op = 1
    end
end

function tree_line_menu_op(list, hide)
    if Op < 1 then
        if #list - (ini_view - 1) < hide then
            Op = hide
        else
            Op = #list - (ini_view - 1)
        end
        if ini_view > 1 then
            ini_view = ini_view - 6
        end
    end
    if Op > #list - (ini_view - 1) then
        if #list > hide then
            if #list - (ini_view - 1) < #list then
                Op = 1
                ini_view = 1
            end
        else
            Op = 1
        end
    end
    if Op > hide then
        ini_view = ini_view + 6
        Op = 13
    end
end

function insideSix()
    if State == "select o" then
        if Acc == "magic" or Acc == "tecnica" then

        end
    end
end

maximoInside=0
function inside()
    local max = 18
    local min = 1
    if Actual.acc ~= nil then
        if State == "select" then
            if Op < 1 then
                if #Actual.acc > 6 then
                    Op = 6
                else
                    Op = #Actual.acc
                end
            end
            if Op > #Actual.acc then
                Op = 1
            end
            if Op > 6 then
                Op = 1
            end

            if Op > #Actual.acc - (ini_view - 1) then
                if #Actual.acc > 6 then
                    if #Actual.acc - (ini_view - 1) < #Actual.acc then
                        Op = 1
                        ini_view = 1
                    end
                else
                    Op = 1
                end
            end


            if ini_view < 1 then
                ini_view = (math.floor(#Actual.acc / 6) * 6) + 1
                Op = 1
            end
        end
        if State == "select oo" then
            if Acc == "magic" then
                if Op < 1 then
                    Op = #Actual.mg
                end
                if Op > #Actual.mg then
                    Op = 1
                end
            end
        end
        if State == "select o" then
            if Acc == "magic" then
                logica_arrow_menu(Actual.mg)
                --[[
                if Op < 1 then
                    if #Actual.mg - (ini_view - 1) < 18 then
                        Op = 18
                    else
                        Op = #Actual.mg - (ini_view - 1)
                    end
                    if ini_view > 1 then
                        ini_view = ini_view - 6
                    end
                end
                if Op > #Actual.mg - (ini_view - 1) then
                    if #Actual.mg > 18 then
                        if #Actual.mg - (ini_view - 1) < #Actual.mg then
                            Op = 1
                            ini_view = 1
                        end
                    else
                        Op = 1
                    end
                end
                if Op > 18 then
                    ini_view = ini_view + 6
                    Op = 13
                end
                ]]
            end
            if Acc == "especiales" then
                logica_arrow_menu(Actual.spe)
            end
            if Acc == "tools" then
                logica_arrow_menu(Actual.tools)
            end
            if Acc == "W.Arts" then
                logica_arrow_menu(Actual.art)
            end
            if Acc == "tecnica" then
                logica_arrow_menu(Actual.sk)
            end
            if Acc == "w.magic" then
                logica_arrow_menu(Actual.milagros)
            end
            if Acc == "bullet" then
                logica_arrow_menu(Actual.bullet)
            end
            if Acc == "mix" then
                logica_arrow_menu(Actual.mix)
            end

            if Acc == "transformacion" then
                logica_arrow_menu(Actual.morph)
            end
            if Acc == "Blu.magic" then
                logica_arrow_menu(Actual.blue)
            end
            if Acc == "llamar" then
                logica_arrow_menu(Actual.beast)
            end
            if Acc == "invocar" then
                logica_arrow_menu(Actual.invo)
            end
        end
        if State == "select e" or State == "select ee" then
            if Op < 1 then
                Op = #Show_enemy
            end
            if Op > #Show_enemy then
                Op = 1
            end
        end
        if State == "select c" or State == "select cc" then
            if Op < 1 then
                Op = #ActiveParty
            end
            if Op > #ActiveParty then
                Op = 1
            end
        end
        if State == "select i" then
                if Op < 1 then
                    Op = #items 
                end
                if Op > #items  then
                    Op = 1
                end
        --[[    if #items > 6 then
                if Op > fin_view then
                    ini_view = ini_view + 1
                    fin_view = fin_view + 1
                end
                if Op < ini_view then
                    ini_view = ini_view - 1
                    fin_view = fin_view - 1
                end

                if Op < 1 then
                    ini_view = #items - 6
                    fin_view = #items
                end
                if Op > #items then
                    ini_view = 1
                    fin_view = 6
                end
            end
            if Op < 1 then
                Op = #items
            end
            if Op > #items then
                Op = 1
            end
            ]]
        end
        if State == "select l" then
            if Acc == "magics" then
                if Op < 1 then
                    Op = #Actual.mag
                end
                if Op > #Actual.mag then
                    Op = 1
                end
            end
            if Acc == "colecciones" then
                if Op < 1 then
                    Op = #Actual.col
                end
                if Op > #Actual.col then
                    Op = 1
                end
            end
        end
        if State == "select d" then
            if Op < 1 then
                Op = #Death_party
            end
            if Op > #Death_party then
                Op = 1
            end
        end
        if State == "select a" or State == "select aa" then
            if Op < 1 then
                Op = #lista_todos
            end
            if Op > #lista_todos then
                Op = 1
            end
        end
        if State == "select w" then
            if Op < 1 then
                Op = #weapon_inventary
            end
            if Op > #weapon_inventary then
                Op = 1
            end
        end
    end
end



function logica_arrow_menu(list)
    local finalVista= (ini_view - 1)+18
                
    --paginar



    if Op> finalVista  then
        ini_view=ini_view+6
        Op=13
    end

    
    if Op+(ini_view - 1)<(ini_view - 1) then
        --if ini_view>1 then
            ini_view=ini_view-6
            Op=1
        --end
    end

    if ini_view<0 then
        ini_view=1     
    end



    maximoInside=#list-(ini_view - 1)
    if maximoInside>18 then
        maximoInside=18
    end

    if Op>18 then
        Op=maximoInside
    end

    if Op>maximoInside then
        Op=maximoInside
    end

    if Op==0 or Op<0  then
        Op=1
    end

end

--menu estatos alterados
function Comp_arrow_menu(list)
    if Op < 1 then
        --va hacia el final
        if #list - (ini_view - 1) < 18 then
            Op = 18
        else
            Op=18
            ini_view=math.floor(#list/18)*18+1
            fin_view=#list-(math.floor(#list/18)*18)
            Op=#list-(math.floor(#list/18)*18)
            --Op = #list- (ini_view - 1)
        end
    end
    if Op > 18 then
        ini_view = ini_view + 6
        Op = 13
    end
    if Op > #list - (ini_view - 1) then
        if #list > 18 then
            if #list - (ini_view - 1) < #list then
                Op = 1
                ini_view = 1
            end
        else
            Op = 1
        end
    end

end

function menu_arrow_logic(list)
    if Op < 1 then
        if #list - (ini_view - 1) < 18 then
            Op = 18
        else
            Op = #list - (ini_view - 1)
        end
        if ini_view > 1 then
            ini_view = ini_view - 6
        end
    end
    if Op > #list - (ini_view - 1) then
        if #list > 18 then
            if #list - (ini_view - 1) < #list then
                Op = 1
                ini_view = 1
            end
        else
            Op = 1
        end
    end
    if Op > 18 then
        ini_view = ini_view + 6
        Op = 13
    end
end

function estados_alterados(v)
    for n, i in pairs(v.state) do
        if i.id == "super" then
            if i.perp == false then
                if i.cont > 0 then
                    i.cont = i.cont - 1
                else
                    del(v.state, i)
                end
            end
        end
        if i.id == "rapido" then
            if i.perp == false then
                if i.cont > 0 then
                    i.cont = i.cont - 1
                else
                    del(v.state, i)
                end
            end
        end
        if i.id == "lento" then
            if i.cont > 0 then
                i.cont = i.cont - 1
            else
                del(v.state, i)
            end
        end
        if i.id == "paralisis" then
            if i.cont > 0 then
                i.cont = i.cont - 1
            else
                del(v.state, i)
            end
        end
        if i.id == "congelar" then
            if i.cont > 0 then
                i.cont = i.cont - 1
            else
                del(v.state, i)
            end
        end
        if i.id == "veneno" then
            if i.cont > 0 then
                i.cont = i.cont - 1
                if i.cont == 6 then
                    v.hp_ = v.hp_ - i.value
                end
            else
                del(v.state, i)
            end
        end
    end
end

function Robot(v)
    --[
    local arreglo = {}
    local comando_str = ""

    if #Pendientes > 0 then
        arreglo = obtenerPrimerPendientes()
        eliminarPrimeraAccion()
    else
        next()
    end

    comando_str = arreglo[1]

    if comando_str == "ejecutar_Jump_caer" then
        v.next_atack = ""
        v.see = true
        if arreglo.hp_ > 0 then
            ejecutarMagia("saltar", arreglo[3], Order)
        else
            local nuevoObjetivo = NextObjetivo(arreglo[3], "enemy")
            ejecutarMagia("saltar", nuevoObjetivo, Order)
        end
        clean()
        next()
        wait_start()
    end
end

function reset()
    updateCharacter()
    Config.Pos_monster_Nvg()
    local o = enemyGroups
    Nvg= 1
    Order = {}
    Show_enemy = {}
    Total_enemy = {}
    Show_party = {}
    ActiveParty = {}
    Turno=1

    for i=1,3 do
        local t=flr(rnd(#Nuevas_clases))
        local r=copiar_tabla(Nuevas_clases[t])
        r.ini=Nuevas_clases[t].agi+flr(rnd(20))
        r.p=i
        r.id=Nuevas_clases[t].id..i
        r.name=Nuevas_clases[t].name
        r.x=posiciones_jugadores[i].x   
        r.y=posiciones_jugadores[i].y    
        r.x_=posiciones_jugadores[i].x   
        r.y_=posiciones_jugadores[i].y  
        r.hp_=r.hp+mod(r,"hp")
        r.hp=r.hp_
        r.mp_=r.mp+mod(r,"mp")
        r.mp=r.mp_
        r.mag=General_magics(Nuevas_clases[t])
        r.col=General_coleccion(Nuevas_clases[t])
        r.acc=General_lista(Nuevas_clases[t])
        Init_social(r)
        add(ActiveParty,r)
        add(Show_party,r)
        add(Order, r)
    end

    for k, v in pairs(o[Nvg].enemyTeams) do
        local r = copiar_tabla(v)
        r.ini=r.agi+flr(rnd(20))
        r.id=v.id
        add(Order, r)
        add(All, r)
        add(Total_enemy, r)
        add(Show_enemy, r)
    end
    All=Order
    Atributos_por_nivel()
    Order = Turnos(All)
    --qsort(Order, function(a,b) return abs(a.ini) > abs(b.ini) end)
    State = "select"
    Modo = "combat"

    Actual=Order[1]

end

function nextLevel()
    updateCharacter()
    --Config.Config_table()
    isWin = false
    wait_start()
    Turno = 1
    --Config.Pos_monster_Nvg()
    local o = enemyGroups
    Show_enemy = {}
    Total_enemy = {}
    aliados = {}
    EnemigosVivos = {}
    Order = {}
    TipoLevel = o[Nvg].tipo
    if o[Nvg].tipo == "batalla" then
        Modo = "combat"
    end
    if o[Nvg].tipo == "stand" then
        Modo = "NPC"
        Show_view = "standBy"
    end
    for k, t in pairs(ActiveParty) do
        t.ini = t.agi + flr(rnd(20))
        t.live = true
        add(Order, t)
    end
    if o[Nvg].tipo == "batalla" then
        for k, v in pairs(o[Nvg].enemyTeams) do
            local r = copiar_tabla(v)
            r.ini = r.agi + flr(rnd(20))
            r.id = v.id
            add(Order, r)
            add(Total_enemy, r)
            add(EnemigosVivos, r)
            add(Show_enemy, r)
        end
    end
    All = Order
    Order = Turnos(All)
    --qsort(Order, function(a,b) return abs(a.ini) > abs(b.ini) end)
    State = "select"
    Modo = "combat"
end

function updateCharacter()
    for k, v in pairs(ActiveParty) do
        for t, w in pairs(Order) do
            if v.id == w.id then
                w.hp_ = v.hp_
                w.mp_ = v.mp_
            end
        end
    end
end

function updateMonster()
    for k, v in pairs(Total_enemy) do
        for t, w in pairs(Order) do
            if w.tipo == "enemy" then
                if v.id == w.id then
                    v.hp_ = w.hp_
                    v.mp_ = w.mp_
                    v.lastDmg = w.lastDmg
                    v.lastDmgC = w.lastDmgC
                end
            end
        end
    end

    for k, v in pairs(Show_enemy) do
        for t, w in pairs(Order) do
            if w.tipo == "enemy" then
                if v.id == w.id then
                    v.hp_ = w.hp_
                    v.mp_ = w.mp_
                    v.lastDmg = w.lastDmg
                    v.lastDmgM = w.lastDmgM
                    v.lastDmgC = w.lastDmgC
                end
            end
        end
    end
end

function cleanDmg()
    if b_dmg_txt == false then
        for k, v in pairs(Order) do
            v.lastDmg = 0
            v.slDmg = false
            v.lastDmgM = ""
            v.typeMsg = false
        end
    end
end

function especialCleanDmg()
    if b_dmg_txt == false then
        for k, v in pairs(Order) do
            v.lastDmg = 0
            v.slDmg = false
            v.lastDmgM = ""
            v.typeMsg = false
            v.cou = 0
            v.see = true
            v.next_atack = ''
        end
    end
end

isWin = false

function winState()
    if #Show_enemy <= 0 and isWin == false then
        win_wait = true
        isWin = true

        especialCleanDmg()
        Actualizar_nivel()

        Atributos_por_nivel()

        if enemyGroups[Nvg].tipo ~= "stand" then
            obtenerReconpensa()
        end
        Animacion.clean()
        cleanCharacter()
        --cleanEnemy()
        Nvg = Nvg + 1
        if Nvg > #enemyGroups then
            if BeforeBattleMode=="overWorld" then
                Nvg = 1
                Show_view="overWorld"
            elseif BeforeBattleMode~="overWorld" then
                Nvg = 1
                Show_view = "travel"
                Eventos.travel = Eventos.travel + 1
                if #Eventos.level_card >= Eventos.travel then
                    Eventos.carta_actual = Eventos.level_card[Eventos.travel]
                else
                    Eventos.travel = 1
                    Eventos.carta_actual = Eventos.level_card[Eventos.travel]
                end
            end
        end
        --nextLevel()
    end
end

function posible_new_character()
    if #ActiveParty < 4 then
        --local t=flr(rnd(#allcharacter-1)+1)
        --posible_char=cOpiar_tabla(allcharacter[t])
    end
end

function add_rnd_character()
    if #ActiveParty < 3 then
        local num = #ActiveParty + 1
        local t = flr(rnd(#Allcharacter - 1) + 1)
        local r = copiar_tabla(Allcharacter[t])
        r.ini = Allcharacter[t].agi + flr(rnd(20))
        r.p = num
        r.id = Allcharacter[t].id .. num
        r.name = Allcharacter[t].name
        r.x = posiciones_jugadores[num].x
        r.y = posiciones_jugadores[num].y
        r.x_ = posiciones_jugadores[num].x
        r.y_ = posiciones_jugadores[num].y
        r.hp_ = r.hp + mod(r, "hp")
        r.mp_ = r.mp + mod(r, "mp")
        add(ActiveParty, r)
        add(Show_party, r)
        add(Order, r)
    end
end

function Actualizar_nivel()
    --lv
    --experienceTable

    for k, i in pairs(Order) do
        if i.tipo == "player" then
            local avanzar = true
            if i.lv < 100 then
                while (avanzar) do
                    if i.exp >= experienceTable[i.lv + 1] then
                        i.lv = i.lv + 1
                    else
                        avanzar = false
                    end
                end
            end
        end
    end
end

function subir_nivel(v)
    if v.exp >= experienceTable[v.lv + 1] then
        v.lv = v.lv + 1
    end
end

function Atributos_por_nivel()
    for k, i in pairs(Order) do
        if i.tipo == "player" then
            i.agi = i.agi_ + math.floor(i.lv / i.levelUP.agi)
            i.fue = i.fue_ + math.floor(i.lv / i.levelUP.fue)
            i.pod = i.pod_ + math.floor(i.lv / i.levelUP.pod)
            i.con = i.con_ + math.floor(i.lv / i.levelUP.con)
            i.dex = i.dex_ + math.floor(i.lv / i.levelUP.dex)
            i.per = i.per_ + math.floor(i.lv / i.levelUP.per)
            i.int = i.int_ + math.floor(i.lv / i.levelUP.int)
            i.car = i.car_ + math.floor(i.lv / i.levelUP.car)
            i.mnd = i.mnd_ + math.floor(i.lv / i.levelUP.mnd)

            i.hp = i.hp + i.con * 5 + i.lv * 3
            i.hp_ = i.hp + mod(i, "hp")
            i.mp = i.mp + i.pod * 3 * i.lv
            i.mp_ = i.mp + mod(i, "mp")
        end
    end
end

function add_state_nuevos(v)
    if v.perks["add_super"] ~= nil then
        v.state["super"] = { name = "super", id = "super", spr = 7, value = 5, cont = 5, ini = 5 }
    end
    if v.perks["add_rapido"] ~= nil then
        v.state["rapido"] = { name = "rapido", id = "rapido", spr = 10, value = 5, cont = 5, ini = 5 }
    end
    if v.perks["Auto_reflejo"] ~= nil then
        v.state["reflejo"] = { name = "reflejo", id = "reflejo", spr = 10, value = 5, cont = 5, ini = 5 }
    end
    if v.perks["Auto_coraza"] ~= nil then
        v.state["coraza"] = { name = "coraza", id = "coraza", spr = 10, value = 5, cont = 5, ini = 5 }
    end
    if v.perks["Auto_flotar"] ~= nil then
        v.state["flotar"] = { name = "flotar", id = "flotar", spr = 10, value = 5, cont = 5, ini = 5 }
    end
    if v.perks["Auto_regeneracion"] ~= nil then
        v.state["regeneracion"] = { name = "regeneracion", id = "regeneracion", spr = 10, value = 5, cont = 5, ini = 5 }
    end
end

function add_efecto_perks(v)
    add_state_nuevos(v)
    add_debilidades(v)
    add_ventajas(v)
end

--Mejorar sistema de debilidades
function add_debilidades(v)
    if v.perks["INM.FUE.DEB.HIE"] ~= nil then
        v.weak["hielo"] = "hielo"
    end
    if v.perks["INM.HIE.DEB.ELE"] ~= nil then
        v.weak["electricidad"] = "electricidad"
    end
    if v.perks["INM.ELE.DEB.FUE"] ~= nil then
        v.weak["fuego"] = "fuego"
    end
    if v.perks["ABS.FUE.DEB.HIE.ELE"] ~= nil then
        v.weak["hielo"] = "hielo"
        v.weak["electricidad"] = "electricidad"
    end
    if v.perks["ABS.HIE.DEB.ELE.FUE"] ~= nil then
        v.weak["electricidad"] = "electricidad"
        v.weak["fuego"] = "fuego"
    end
    if v.perks["ABS.ELE.SDEB.FUE.HIE"] ~= nil then
        v.weak["fuego"] = "fuego"
        v.weak["hielo"] = "hielo"
    end
end

function add_ventajas(v)
    if v.perks["RES.FUE"] ~= nil then
        v.ventaja["fuego"] = "fuego"
    end
    if v.perks["RES.ELE"] ~= nil then
        v.ventaja["electricidad"] = "electricidad"
    end
    if v.perks["RES.HIE"] ~= nil then
        v.ventaja["hielo"] = "hielo"
    end
    if v.perks["RES.VEN"] ~= nil then
        v.ventaja["veneno"] = "veneno"
    end
end

msg_reconpensa = ""
msg_exp = ""
msg_dinero = ""

lista_hechizos_azules_obtenidos = {}


function cleanCharacter()
    for k, v in pairs(Order) do
        if v.tipo == "player" then
            v.ext = 0
            v.magicCharge = 0
            v.def = false
            v.prot = false
            v.carga = 0
            v.gl_ = v.gl
            v.sh_ = v.sh
        end
    end
end

function obtenerHechizoAzul()
    lista_hechizos_azules_obtenidos = {}
    for t, h in pairs(enemyGroups[Nvg].enemyTeams) do
        lista_encuentro[h.id_mons] = true
        add(lista_hechizos_azules_obtenidos, monster_diccionario[h.name])
    end
end

function aprender_hechizo(v, f)
    if f.cont > 0 then
        f.cont = f.cont - 1
        for k, h in pairs(f.add) do
            add(v.mg, h)
        end
    else
        Cancel_ejecutar = true
    end
end

--v personaje o --perks
function add_perks(v, o)
    v.perks[o.id] = o
end

--v personaje o --perks
function remove_perks(v, o)
    local t = {}
    t = v.perks[o.id]
    del(v.perks, t)
end

function obtenerReconpensa()
    for i, v in pairs(Order) do
        if v.tipo == "player" then
            v.exp = v.exp + enemyGroups[Nvg].exp
            if v.id_class == "mago_azul" then
                obtenerHechizoAzul()
            end
        end
    end

    Dinero = Dinero + enemyGroups[Nvg].credit



    local list = enemyGroups[Nvg].recompensa
    msg_exp = "Obtiene " .. enemyGroups[Nvg].exp .. " puntos de experiencia"
    msg_dinero = "Obtiene " .. enemyGroups[Nvg].credit .. " guilds"
    local rand = flr(rnd(#list))
    local str = list[rand]
    local item = lista_items_juego[str]


    if item  then
        msg_reconpensa = "Obtiene " .. item.name
        if item.tipo == "equipo" then
            add_inventary_Weapon_list(lista_items_juego[str])
            --add(weapon_inventary,lista_items_juego[str])
        end
        if item.tipo == "consumible" then
            add_inventary_items_list(lista_items_juego[str])
            --add(items,lista_items_juego[str])
        end
    else
        msg_reconpensa = " problema obtener items" .. " id: " .. str .. " n: " .. rand
    end
end

function cleanEnemy()
    for k, t in pairs(Order) do
        if t.tipo == "enemy" then del(Order, t) end
    end
end

function isAlive()
    for k, v in pairs(Order) do
        if v.hp_ <= 0 then
            if v.tipo == "player" and v.live == true then
                add(Death_party, v)
            end
            v.live = false
            delCounter = delMaxCounter
        end
    end
    if delCounter > 0 then
        delCounter = delCounter - 1
    end
end

function checkLive(a)
    if a <= 0 then
        return false
    end
    return true
end

----cambiar random
function logic(str)
    Enemy_action(Actual, str)
    wait_start()
    b_dmg_txt = true
end

function msg_efecto(v, str)
    v.lastDmgC = "W"
    v.slDmg = true
    v.lastDmgM = str
    v.typeMsg = true
end

function jump_start(v)
    if v ~= nil and v.hp > 0 then
        v.jump = true
        v.jump_time = 0
        v.react = true
        v.react_time = 0
        v.rest = false
    end

    Animacion.add_Accion_character(v,"impacto",3)
end

--Mejorar
function selection_objetive()
    party_L = {
        { a = flr(rnd(2)) + 1, b = 1 },
        { a = flr(rnd(6)) + 1, b = 2 },
        { a = flr(rnd(2)) + 1, b = 3 }
    }
    m_list = {}
    party_L = qsort(party_L, function(a, b) return abs(a.a) > abs(b.a) end)
    return party_L[1].b
end

function clean()
    Sel_e = {}
    Sel_i = ""
    Mg_sel = ""
    Acc = ""
end

function GetProtector(v)
    if v.tipo == "player" then
        if #Protectores > 0 then
            local id = Protectores[#Protectores]
            for n, i in pairs(All) do
                if id == i.id then
                    return i
                end
            end
        else
            return v
        end
    else
        return v
    end
end

function Exiliar(v,w)
    v.hp_ = 0

end


function WeaponPower(w)
    
    local left=0
    local right=0
    if w.weapon.left~={} and w.weapon.left.w~=nil  then
        left=flr(rnd(w.weapon.left.w)) + w.weapon.left.bw
    end
    if w.weapon.right~={} and w.weapon.right.w~=nil  then
        right=flr(rnd(w.weapon.right.w)) + w.weapon.right.bw
    end
    return left+right
end

function DamageProccess(v, w, value, crit,tipo)
    --local tdmg=0
    local hit = 1
    local calc = 0
    local defensa = 0
    local inmune = false
    tipo = tipo or "fisico"

    if v.ventaja["etereo"] then
        if tipo == "fisico" then
            if IGNORAR_ETERIO ==false then
                inmune = true
            end
        end
    end

    if v and w then
        if inmune == false then
            if PIFIA == false then
                local obb = GetProtector(v)
                if w.agi ~= nil and v ~= nil and v.agi ~= nil then
                    calc = v.agi + mod(v, "agi") - w.agi + mod(v, "agi")
                end

                if calc > 0 then
                    hit = hit + flr(calc / 5)
                end


                if v.sh_ and v.sh_ > 0 then
                    v.sh_ = v.sh_ - 1
                    obb.lastDmg = 1
                    obb.lastDmgM = "bloqueado"
                    Animacion.add_texto_anima(obb,"bloqueado",30,"White",0,-20,0.1)
                    value=0

                else
                    if TRUE_DAMAGE == false then
                        if obb.def ~= nil and obb.def == true then
                            defensa = 2 * obb.con
                            if obb.ext < 4 then
                                obb.see_extra_turno = true
                                obb.ext = obb.ext + 1
                            end
                        else
                            if obb.con ~= nil then
                                defensa = flr(obb.con / 5)
                            end
                        end
                        if obb.armadura ~= nil and obb.armadura ~= {} and obb.armadura.def ~= nil then
                            defensa = defensa + obb.armadura.def
                        end
                        if value < 0 then
                            value = value + defensa
                            if value > 0 then value = 0 end
                        end
                    end

                    value = StanceMode(value, w, obb, true)
                    value = StanceMode(value, w, obb, false)

                    if obb.modo == "defensa" then
                        value = flr(value * 0.75)
                    end
                    if ANTI_VUELO ==false then
                        if obb.modo == "vuelo" then
                            value = flr(value * 0.75)
                        end
                    end

                    local extraText=""
                    local multiplo=1
                    if  CRITICO then
                        multiplo=multiplo+1
                        crit=crit.."!"
                        extraText=extraText.."Critico!"
                    end
                    if w.isLeveCrit and w.isLeveCrit == true and LEVE_CRITICO then
                        multiplo=multiplo+1
                        crit=crit.."!"
                        extraText=extraText.."Leve Critico!"
                    end
                    if PERFECT_PUNT then
                        multiplo=multiplo+1
                        crit=crit.."!"
                        extraText=extraText.."Perfect Punt!"
                    end
    

                    value = flr(value * multiplo)
                    if CAN_BLOCK == true and value<0 then                        
                       if obb.weapon.left and obb.weapon.left.smodo=="shield" then
                            extraText=extraText.."bloqueado!"
                            if obb.isShieldExpert == true then
                                value=0
                            else    
                                value=flr(value*0.5)
                            end
                            
                       elseif obb.armadura.smode and obb.armadura.smode=="pesada" then
                            if TRUE_DAMAGE == false then
                                extraText=extraText.."Absorbido!"
                                value=flr(value*0.5)
                            end
                       end
                    end
                    if FALLO_LEVE == true and value<0 then                        
                        if obb.weapon and obb.weapon.left and obb.weapon.left.smodo=="shield" then
                            extraText=extraText.."bloqueado!"
                            if obb.isShieldExpert == true then
                                value=0
                            else    
                                value=flr(value*0.5)
                            end    
                       elseif obb.armadura and obb.armadura.smode and obb.armadura.smode=="pesada" then
                            if TRUE_DAMAGE == false then
                                extraText=extraText.."Absorbido!"
                                value=flr(value*0.5)
                            end
                       end
                    end


                    --Debug_temp= Debug_temp.."$"..value
                    obb.hp_ = obb.hp_ + (value * hit)
                    obb.lastDmg = value
                    local dmgTexte= value .. crit .. " " .. defensa .. "# " .. hit .. " hits"
                    local dmgLabel= value .. crit
                    local hitsLabel=hit .. " hits"
                    obb.lastDmgM = dmgTexte
                    local col="Red"
                    if value>0 then
                        col="Green"
                    end
                        Animacion.add_texto_anima(obb,dmgLabel,30,col,0,0,0.1)
                    if value<0 then
                        Animacion.add_texto_anima(obb,hitsLabel,30,col,0,-20,0.1)
                    end
                    Animacion.add_texto_anima(obb,""..extraText,30,"Yellow",0,-60,0.1)
                    --Animacion.add_texto_anima(obb,hit,30,"White",0,-60,0.1)
                end

                if v.gl_ < 5 then
                    v.gl_ = v.gl_ + 1
                end


                if value < 0 then
                    obb.lastDmgC = "R"
                elseif value == 0 then
                    obb.lastDmgC = "Y"
                else
                    obb.lastDmgC = "V"
                end

                return value
            else
                Animacion.add_texto_anima(v,"Pifia",30,"White",0,0,0.1)

            end
        else
            Animacion.add_texto_anima(v,"eterio",30,"White",0,0,0.1)
        end
    else
        Animacion.add_texto_anima(v,"ERROR!!",30,"Red",0,0,0.1)
    end
    return 0
end

function PDamageProccess(v, w, value, crit)

end

function StanceMode(value, w, v, bol)
    if bol then
        --aaaaa
    else
        --aaaaa
    end


    return value
end

function adv_weak_Logic(v, w, list, b)
    local mu = 1
    local crit = ""
    if b then
        for i = 1, #list do
            if v and v.ventaja and v.ventaja[list[i]] ~= nil then
                mu = mu * 0.6
                crit = crit .. "%"
            end
        end
    else
        for i = 1, #list do
            if v and v.weak and v.weak[list[i]] ~= nil then
                mu = mu * 2
                crit = crit .. "!"
            end
        end
    end
    if mu >= 2 then
        if Actual.see_extra_turno == false then
            Actual.ext_elem = true
        end
        --Actual.see_extra_turno=true
    end
    return mu, crit
end

function eludido(v)
    v.lastDmgC = "W"
    v.slDmg = true
    v.lastDmgM = "Eludido"
    v.typeMsg = true
    Animacion.add_texto_anima(v,"Eludido",30,"White",0,-20,0.1)
end

function Msg_enemigo(v, msg)
    v.lastDmgC = "W"
    v.slDmg = true
    v.lastDmgM = msg
    v.typeMsg = true
    Animacion.add_texto_anima(v,msg,30,"White",0,-20,0.1)
end



function GrupoLinea(side) 
    local list= {}
    if side == "enemy" then
        list=EnemigosVivos
    else    
        list=ActiveParty
    end 
    return list 
end

function acertar(v, b)
    SetIndiceExito()
    local at = 0
    local ob = 0
    local modificador=0
    if v.ventaja and v.ventaja["back"] ~= nil then
        modificador=-3
    end    
    if v ~= nil then
        Dice = flr(rnd(20))
        if v.tipo=="enemy" and b.tipo =="player" then
            at = b.dex + mod(b, "dex") + Dice + modificador   
            ob = v.agi + mod(v, "agi") + 6
            GetDiceEffect(at,Dice, ob,"punteria",v,b)
        elseif v.tipo=="player" and b.tipo =="enemy" then
            at = v.agi + mod(v, "agi") + Dice + modificador   
            ob = b.dex + mod(b, "dex") + 6
            GetDiceEffect(at,Dice, ob,"esquivar",v,b)
        else
            if b.dex and v.agi then
                at = b.dex + mod(b, "dex") + Dice + modificador
                ob = v.agi + mod(v, "agi") + 6
            else
                at=Dice + modificador
                ob=6
            end
        end
        

    end
    Animacion.add_texto_anima(v,Dice.."#"..ob.."DC",30,"White",0,-40,0.1)
    return at >= ob
end

function acertarMod(v, b, modificador)
    SetIndiceExito()
    local at=0
    local ob=0
    Dice = flr(rnd(20))
    if v.ventaja and v.ventaja["back"] ~= nil then
        modificador=modificador-3
    end    
    if v.tipo=="enemy" and b.tipo =="player" then
        at = b.dex + mod(b, "dex") + Dice + modificador   
        ob = v.agi + mod(v, "agi") + 6
        GetDiceEffect(at,Dice, ob,"punteria",v,b)
    elseif v.tipo=="player" and b.tipo =="enemy" then
        at = v.agi + mod(v, "agi") + Dice + modificador   
        ob = b.dex + mod(b, "dex") + 6
        GetDiceEffect(at,Dice, ob,"esquivar",v,b)
    else
        --Punteria entre enemigos
        at = b.dex + mod(b, "dex") + Dice + modificador
        ob = v.agi + mod(v, "agi") + 6
    end

    


    --GetDiceEffect(b,Dice,ob,modificador)
    Animacion.add_texto_anima(v,Dice.."+"..modificador.."#"..ob.."DC",30,"White",0,-40,0.1)
    return at >= ob
end



function SetIndiceExito()
    CAN_BLOCK = false
    PERFECT_ESQ = false
    HYPER_REACTION = false
    SUPERADO_ESQ = false
    PERFECT_PUNT= false
    FALLO_LEVE= false
    LEVE_ACIERTO = false
    SUPERADO_PUNT= false
    CRITICO = false
    PIFIA = false
    LEVE_CRITICO=false
    PIFIA_LEVE=false
end




function GetDiceEffect(at,dice, dc,tipo,obj,emi)

    if tipo=="esquivar" then
        if at ==dc then
            PERFECT_ESQ=true
            AgregarReaccion({"parry","",emi,obj})
        end
        if at >= dc-3 and  at < dc then
            CAN_BLOCK=true
        end

        if at >= dc then
            SUPERADO_ESQ = true
            
        end
        
        if at > dc and  at <= dc+3 then
            HYPER_REACTION = true
            AgregarReaccion({"contra_ataque","",emi,obj})
        end
    else
        if at ==dc then
            PERFECT_PUNT=true
        end
        if at >= dc-3 and  at < dc then
            FALLO_LEVE=true
        end
        if at > dc and  at <= dc+3 then
            LEVE_ACIERTO = true
        end
        if at >= dc then
            SUPERADO_PUNT = true
        end
    end

    if dice==20 then
        CRITICO = true
    end


    if dice==1 then
        PIFIA = true
    end

    if dice >=18 and dice <20 then
        LEVE_CRITICO=true
        --AgregarReaccion({"segundo_ataque","",obj,emi})
    end

    if dice <=3 and dice >1 then
        PIFIA_LEVE=true
    end
    
end

function DCMOD(obj,b,DC,str, modi)
    modi = 0 or mod
    DC = DC 
    Dice = flr(rnd(20))
    local at = b[str] + mod(b, str) + Dice  + modi

    if modi>0 then
        Animacion.add_texto_anima(obj,Dice.."+"..modi.."#"..DC.."DC",30,"White",0,-40,0.1)
    else
        Animacion.add_texto_anima(obj,Dice.."#"..DC.."DC",30,"White",0,-40,0.1)
    end
    return DC <= at
end

v_contra_ataque = {}
objetivo_reaccion = {}
ejecutador_reaccion = {}
bool_contra_ataque = false

function activa_Contra_ataque(v)
    if v.tipo == "player" and v.perks["contra_ataque"] ~= nil then
        v_contra_ataque = v
        objetivo_reaccion = v
        ejecutador_reaccion = Actual
        bool_contra_ataque = true
        tipo_reaccion = "contra_ataque"
    end
end

function restablecer(v)
    v.live = checkLive(v.hp_)
    if v.tipo == "player" then
        if v.live == true then
            del(Death_party, v)
        end
    end
end

function checks(v)
    v.live = checkLive(v.hp_)
    if v.tipo == "player" then
        if v.live ~= true then
            del(Show_party, v)
        end
    elseif v.tipo == "enemy" then
        if v.live ~= true then
            del(Show_enemy, v)
        end
    else
        if v.live ~= true then
            del(aliados, v)
        end
    end
end

ContRound = 0
function next()
    if continuar_turno then
        continuar_turno = false
        still_turn = false
    end
    if still_turn then
        Actual.see_extra_turno = false --siepre termina cuando se pasa el turno
        Turno = Turno + 1
        ContRound = ContRound + 1

        if ContRound == #All then
            Order = AddTurnos(All, Order, Turno)
            ContRound = 0
        end

        if false then
            if Turno > #Order then
                Turno = 1
                --new_Order()
                Order = Turnos(All)
            end
        end
        --Actual=Order[Turno]
        start_caracter = true
    else
        Debug_temp = "No pasa turno"
        still_turn = true
    end
    Init_b = true
    State = "select"
end

function wait(count, max, bol)
    if bol then
        count = count + 1
        if count > max then
            count = 0
            bol = false
        end
    end
end

function wait_enemy()
    if B_wait then
        timer_wait = timer_wait + 1
        if timer_wait > max_timer_wait then
            timer_wait = 0
            B_wait = false
        end
    end
end

function count_dmg_timer()
    pass_time = pass_time + 1
    if pass_time == max_pass_time then
        timer_dmg_txt = timer_dmg_txt + 1
        pass_time = 0
    end
    if timer_dmg_txt > max_timer_dmg_txt then
        timer_dmg_txt = 0
        b_dmg_txt = false
    end
end

function updateParty()
    for k, v in pairs(ActiveParty) do
        for t, w in pairs(Order) do
            if w.tipo == "enemy" then
                if v.id == w.id then
                    v.hp_ = w.hp_
                    v.mp_ = w.mp_
                    v.lastDmg = w.lastDmg
                    v.lastDmgC = w.lastDmgC
                end
            end
        end
    end
    for k, v in pairs(Show_party) do
        for t, w in pairs(Order) do
            if w.tipo == "enemy" then
                if v.id == w.id then
                    v.hp_ = w.hp_
                    v.mp_ = w.mp_
                    v.lastDmg = w.lastDmg
                    v.lastDmgC = w.lastDmgC
                end
            end
        end
    end
end

function count_wait_win()
    if win_wait then
        count_win_wait = count_win_wait + 1
        if max_count_win_wait < count_win_wait then
            win_wait = false
            Modo = "WIN"
        end
    end
end

--cont_start=0
function start(v)
    if Init_b then
        Init_b = false
        ini_view = 1
    end
    if start_caracter then
        --cont_start=cont_start+1
        start_caracter = false

        if v.tipo == "player" then
            v.flee_attack = v.flee_attack_
            v.flee_heal = v.flee_heal_
            v.flee_support = v.flee_support_
            v.flee_magic = v.flee_magic_
            add_efecto_perks(v)
        end




        if v.gl_ < 6 then
            v.gl_ = v.gl_ + 2
        end
        if v.gl_ > 5 then
            v.gl_ = 5
        end
        estados_alterados(v)
        v.def = false

        if v.prot then
            v.prot = false
            del(Protectores, v.id)
        end
        if v.state["congelar"] ~= nil then
            msg_efecto(Actual, "congelado")
            next()
        end
    end
end

page = 1

function nextNpc()
    Op = 1
    page = 1
end

function RecuperarEquipo()
    for k, i in pairs(ActiveParty) do
        Recuperar(i)
    end
end

function Recuperar(v)
    v.hp_ = v.hp + mod(v, "hp")
    v.mp_ = v.mp + mod(v, "mp")
end

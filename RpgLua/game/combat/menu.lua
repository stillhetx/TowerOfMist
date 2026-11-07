CombatMenu={}

local function action_list()
    if State=="select" then
        return Actual.acc
    elseif State=="secundario" then
        return Acciones_secundarias
    elseif State=="select_l" then
        if Acc=="magics" then
            return Actual.mag
        elseif Acc=="colecciones" then
            return Actual.col
        end
    elseif State=="select_meta" and Acc=="magic" then
        return Actual.meta
    elseif State=="select_oo" then
        return Actual.mg
    elseif State=="select_o" then
        local lists={
            ["magic"]=Actual.mg,
            ["especiales"]=Actual.spe,
            ["tools"]=Actual.tools,
            ["W.Arts"]=Actual.art,
            ["tecnica"]=Actual.sk,
            ["w.magic"]=Actual.milagros,
            ["bullet"]=Actual.bullet,
            ["mix"]=Actual.mix,
            ["transformacion"]=Actual.morph,
            ["Blu.magic"]=Actual.blue,
            ["llamar"]=Actual.beast,
            ["invocar"]=Actual.invo,
            ["spell.list"]=Actual.mg,
            ["Power.Stone"]=Actual.powerStone,
            ["dual M."]=Actual.mg,
            ["spirit"]=Actual.spirit,
            ["canciones"]=Actual.cancion,
            ["bailes"]=Actual.bailes,
            ["espada"]=Actual.swm,
        }
        return lists[Acc]
    elseif State=="select_a" or State=="select_aa" then
        return lista_todos
    elseif State=="select_e" or State=="select_ee" then
        return EnemigosVivos
    elseif State=="select_c" or State=="select_cc" then
        return AliadosVivos
    elseif State=="select_d" then
        return Death_party
    elseif State=="select_i" then
        return items
    elseif State=="select_w" then
        return weapon_inventary
    elseif State=="select_v" and SelectEnemigo then
        return SelectEnemigo.magicForce
    end
end

function CombatMenu.get_list()
    return action_list()
end

function CombatMenu.get_max_visible()
    if State=="select" then
        return 6
    end
    return 18
end

local function get_state()
    return {
        selected=(ini_view-1)+Op,
        first=ini_view,
        max_visible=CombatMenu.get_max_visible(),
    }
end

local function set_state(state)
    ini_view=state.first
    Op=state.selected-(ini_view-1)
end

local function align_window(state,item_count)
    if item_count<=0 then
        state.selected=1
        state.first=1
        return
    end

    local step=6
    local max_visible=state.max_visible
    state.first=math.max(1,math.floor((state.first-1)/step)*step+1)
    while state.selected<state.first do
        state.first=math.max(1,state.first-step)
    end
    while state.selected>=state.first+max_visible do
        state.first=state.first+step
    end
end

function CombatMenu.sync()
    local list=action_list()
    if not list then
        return false
    end

    local state=get_state()
    MenuPagination.move(state,#list,0)
    align_window(state,#list)
    set_state(state)
    return true
end

function CombatMenu.move(direction)
    local list=action_list()
    if not list then
        return false
    end

    local state=get_state()
    if direction=="left" or direction=="right" then
        if #list>6 then
            MenuPagination.move_grid(state,#list,direction,3,6)
        end
    else
        local offsets={up=-1,down=1}
        MenuPagination.move(state,#list,offsets[direction])
    end
    align_window(state,#list)
    set_state(state)
    return true
end

local function item_label(item)
    if type(item)=="string" then
        return item
    end

    if State=="select_i" then
        return item.name.." "..item.cont
    elseif State=="select_o" and Acc=="Power.Stone" then
        return item.name.." "..item.cant
    elseif (State=="select_o" or State=="select_oo" or State=="select_meta") and
        (Acc=="magic" or Acc=="w.magic" or Acc=="dual M.") then
        local level=item.lv
        if level and Actual.slots_ and Actual.slots_[level] then
            local slot_count=Actual.slots_[level]
            local rest_slot=Acc=="dual M." and State=="select_o"
                and Llv2==level and 1 or 0
            local tax=Acc=="dual M." and State=="select_o"
                and Llv2==level and 1 or 0
            if slot_count>tax then
                return item.name.." x"..(slot_count-rest_slot)
            end
        end

        local cost=item.cost
        if Acc=="dual M." then
            cost=flr(cost*1.5)+Ccost2
        end
        return item.name.." "..cost.."MP"
    elseif State=="select_o" and
        (Acc=="llamar" or Acc=="spirit" or Acc=="canciones" or Acc=="transformacion") then
        return item.name.." "..item.cost
    elseif State=="select_o" and
        (Acc=="tecnica" or Acc=="W.Arts" or Acc=="bailes") then
        if item.isCharge then
            local name=#item.name<12 and item.name or string.sub(item.name,1,10).."..."
            return name.."[C]"
        end
        return #item.name<12 and item.name or string.sub(item.name,1,13).."..."
    end

    return item.name or tostring(item)
end

local function item_color(item)
    if (State=="select_o" or State=="select_oo" or State=="select_meta") and
        (Acc=="magic" or Acc=="w.magic" or Acc=="dual M.") and
        item.lv and Actual.slots_ and Actual.slots_[item.lv] then
        local tax=Acc=="dual M." and State=="select_o"
            and Llv2==item.lv and 1 or 0
        if Actual.slots_[item.lv]>tax then
            return 7
        end
    end
    if (State=="select_o" or State=="select_meta") and
        (Acc=="magic" or Acc=="w.magic" or Acc=="dual M." or
        Acc=="llamar" or Acc=="spirit" or Acc=="canciones" or
        Acc=="transformacion" or Acc=="Power.Stone") and
        item.cost and Actual.mp_<item.cost then
        return 6
    end
    if State=="select_o" and item.isCharge and Actual.carga~=1 then
        return 5
    end
    return 7
end

function CombatMenu.draw(list,x,y)
    local state=get_state()
    state.max_visible=CombatMenu.get_max_visible()
    MenuPagination.draw(list,state,{
        x=x+6,
        y=y+24,
        line_height=16,
        columns=3,
        rows_per_column=6,
        column_width=180,
        marker="> ",
        marker_x=x+6,
        label=item_label,
        draw_item=function(label,item_x,item_y,index)
            local color=type(list[index])=="table" and item_color(list[index]) or 7
            print("  "..label,item_x,item_y,color)
        end,
        draw_marker=function(marker,marker_x,item_y)
            print(marker,marker_x,item_y,7)
        end,
    })
end

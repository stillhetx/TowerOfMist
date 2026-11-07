State_Operacion = {}





State_Operacion["select"] = function(v, o)
    o = o or 1
    sel1 = Op
    Op = 1
    Acc = v.acc[o]
    Eleg = v.acc[o]
    State = Tabla_acciones[Acc]

    if State == "select_e" then
        FiltrarEnemigoVivos()
    end
    if State == "Execute" then
        Execute = true
    end

    if Tabla_acciones_funcion and Tabla_acciones_funcion[Acc] and type(Tabla_acciones_funcion[Acc]) == "function" then
        Tabla_acciones_funcion[Acc]()
    end

    ini_view = 1
    fin_view = 18
end

State_Operacion["select_y"] = function(v, o)
    o = o or 1
    if Acc == "memory" then
        if v.memory[o].isReplace == true then
            Acc = v.memory[o].sub
            State = v.memory[o].sel
        else
            Acc = v.memory[o].sub
            State = v.memory[o].sel
            Mg_sel = v.memory[o].id
            Name_action = v.memory[o].name
            Dirr = v.memory[o].dir
            Ccost = v.memory[o].cost
            Ttipo = v.memory[o].tipo
            Ccolor = v.memory[o].color
            Llv = v.memory[o].lv
        end
    end
end
State_Operacion["select_l"] = function(v, o)
    o = o or 1
    if Acc == "magics" then
        Acc = v.mag[o]
        if Tabla_acciones_funcion and Tabla_acciones_funcion[Acc] and type(Tabla_acciones_funcion[Acc]) == "function" then
            Tabla_acciones_funcion[Acc]()
        end
        if Vacio == false then
            if Acc == "dual M." then
                State = "select_oo"
            else
                State = "select_o"
            end
        else
            Vacio = false
        end
    end
    if Acc == "colecciones" then
        Acc = v.col[o]
        if Tabla_acciones_funcion and Tabla_acciones_funcion[Acc] and type(Tabla_acciones_funcion[Acc]) == "function" then
            Tabla_acciones_funcion[Acc]()
        end
        State = "select_o"
    end
    if State=="select_o" or State=="select_oo" then
        Op=1
        ini_view=1
    end
end
State_Operacion["select_ii"] = function(v, o)
    o = o or 1
    --no utilizado
    if Acc == "mix" then
        Sel_ii = items[o]
        Dirr2 = items[o].dir
        if "e" == Dirr2 then
            State = "select_e"
            FiltrarEnemigoVivos()
        end
        if "c" == Dirr2 then
            State = "select_c"
            FiltrarAliadosVivos()
        end

        if "d" == Dirr2 then
            FiltrarAliadosMuertos()
            if #AliadosMuertos > 0 then
                State = "select_d"
            end
            --filtrarDerrotados()
        end
    end
end
State_Operacion["select_i"] = function(v, o)
    o = o or 1
    IsInterruccion = false
    INTERRUCCION_MSG = ""
    if Acc == "objeto" or Acc == "usar" then
        Sel_i = items[o]
        Dirr = items[o].dir
        if "e" == Dirr then
            State = "select_e"
            FiltrarEnemigoVivos()
        end
        if "c" == Dirr then
            State = "select_c"
            FiltrarAliadosVivos()
        end
        if "d" == Dirr and #Death_party > 0 then
            State = "select_d"
            --filtrarDerrotados()
            FiltrarAliadosMuertos()
        end
        if State~="select_i" then
            Op=1
            ini_view=1
        end
    end
end
State_Operacion["select_oo"] = function(v, o)
    o = o or 1
    if Acc == "dual M." then
        Mg_2sel = v.mg[o].id
        Dirr2 = v.mg[o].dir
        Name_action = "Dual Cast"
        Ttipo2 = v.mg[o].tipo
        Ccolor2 = v.mg[o].color
        Llv2 = v.mg[o].lv
        Ccost2 = v.mg[o].cost


        if "a" == Dirr2 then
            State = "select_aa"
        end
        if "e" == Dirr2 then
            State = "select_ee"
            FiltrarEnemigoVivos()
        end
        if "c" == Dirr2 then
            State = "select_cc"
            FiltrarAliadosVivos()
        end
        --

        if not (v.slots_[Llv2] > 0) and not (v.mp_ > Ccost2) then
            State = "select"
            Acc = ""
        end
        if State~="select_oo" then
            Op=1
            ini_view=1
        end
    end
end
State_Operacion["select_o"] = function(v, o)
    o = o or 1
    local previous_state=State
    Operacion[Acc](v, o)
    Operacion["POS-CONFIG"](v, o)
    ini_view = 1
    if State~=previous_state then
        Op=1
    end
end
State_Operacion["select_meta"] = function(v, o)
    o = o or 1
    if "m" == Dirr and State == "select_o" then
        State = "select_m"
    elseif "x" == Dirr and State == "select_o" then
        State = "select"
        Execute = true
    elseif "a" == Dirr and State == "select_o" then
        State = "select_a"
    elseif "o" == Dirr and State == "select_o" then
        State = "select_o"
    elseif "e" == Dirr and State == "select_o" then
        State = "select_e"
        FiltrarEnemigoVivos()
    elseif "c" == Dirr and State == "select_o" then
        State = "select_c"
        FiltrarAliadosVivos()
    elseif "d" == Dirr and State == "select_o" then
        FiltrarAliadosMuertos()
        --filtrarDerrotados()
        State = "select_d"
        if #AliadosVivos < 1 then
            State = "select_o"
        end
    end
end
State_Operacion["select_a"] = function(v, o)       --all enemy, not tarjet
    o = o or 1
    Execute = true
end
State_Operacion["select_aa"] = function(v, o)
    o = o or 1
    State = "select_o"
    Op=1
    ini_view=1
end
State_Operacion["select_ee"] = function(v, o)
    o = o or 1
    if Acc == "dual M." then
        State = "select_o"
        Sel_ee = EnemigosVivos[o]
        SelectEnemigo = EnemigosVivos[o]
        Sel_cc = Sel_e
        Op=1
        ini_view=1
    end
end
State_Operacion["select_e"] = function(v, o)       --choose enemy
o = o or 1
    FiltrarEnemigoVivos()
    if Acc == "atacar" or Acc == "W.Arts" or Acc == "support.w" or Acc == "atrapar" or Acc == "Power.Stone" or Acc == "asesinar" or Acc == "invocar" or Acc == "usar" or Acc == "darkness" or Acc == "dual M." or Acc == "tools" or Acc == "rapido" or Acc == "magic" or Acc == "dual M." or Acc == "bullet" or Acc == "mix" or Acc == "Blu.magic" or Acc == "cargar" or Acc == "tecnica" or Acc == "objeto" or Acc == "robar" or Acc == "quitar" or Acc == "carga" or Acc == "combo" or Acc == "saltar" or Acc == "spirit" or Acc == "lanzar" or Acc == "spell.list" or Acc == "extraer" or Acc == "especiales" or Acc == "canciones" or Acc == "bailes" or Acc == "w.magic" or Acc == "espada" then
        Execute = true
        State = "select"
        if EnemigosVivos[o] then
            Sel_e = EnemigosVivos[o]
            SelectEnemigo = EnemigosVivos[o]
            Sel_c = Sel_e
        else
            State = "select_o"
        end
    end
    if Acc == "extraer" then
        State = "select_v"   --variable
        Sel_e = EnemigosVivos[o]
        Sel_c = Sel_e
    end
    if State~="select_e" then
        Op=1
        ini_view=1
    end
end
State_Operacion["select_cc"] = function(v, o) --choose character
o = o or 1
    if Acc == "dual M." then
        State = "select_o"
        Sel_cc = AliadosVivos[o]
        Sel_ee = Sel_cc
        Op=1
        ini_view=1
    end
end
State_Operacion["select_c"] = function(v, o) --choose character
o = o or 1
    if Acc == "magic" or Acc == "dual M." or Acc == "usar" or Acc == "tecnica" or Acc == "objeto" or Acc == "tools" or Acc == "atacar" or Acc == "combo" or Acc == "saltar" or Acc == "mix" or Acc == "Blu.magic" or Acc == "spell.list" or Acc == "especiales" then
        Execute = true
        State = "select"
        Sel_c = AliadosVivos[o]
        Sel_e = Sel_c
        Op=1
        ini_view=1
    end
end
State_Operacion["select_d"] = function(v, o)       --death character
o = o or 1
    if Acc == "magic" or Acc == "usar" or Acc == "objeto" or Acc == "especiales" then
        Execute = true
        State = "select"
        Sel_c = Death_party[o]
        Sel_e = Sel_c
        Op=1
        ini_view=1
    end
end
State_Operacion["select_a??"] = function(v, o)     --all enemy, not tarjet
o = o or 1
    if Acc == "tecnica" or Acc == "magic" then
        Execute = true
        State = "select"
    end
end
State_Operacion["select_w"] = function(v, o) --choose weapon
o = o or 1
    if Acc == "lanzar" then
        Sel_w = weapon_inventary[o].id
        State = "select_e"
        FiltrarEnemigoVivos()
        Op=1
        ini_view=1
    end
end

State_Operacion["select_v"] = function(v, o) --Extraer Magic force from enemy
o = o or 1
    if Acc == "extraer" then
        Execute = true
        Mg_sel = SelectEnemigo.magicForce[o]
        State = "select"
        Op=1
        ini_view=1
    end
end


State_Operacion["select_m"] = function(v, o) --Seleccionar un numero
o = o or 1
    Number_sel = Op
    Execute = true
    State = "select"
end

State_Operacion = {}





State_Operacion["select"] = function(v, o)
    local eleg=(ini_view-1)+Op
    sel1 = Op
    Op = 1
    Acc = Actual.acc[eleg]
    Eleg = Actual.acc[eleg]
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
    if Acc == "memory" then
        if Actual.memory[(ini_view - 1) + Op].isReplace == true then
            Acc = Actual.memory[(ini_view - 1) + Op].sub
            State = Actual.memory[(ini_view - 1) + Op].sel
        else
            Acc = Actual.memory[(ini_view - 1) + Op].sub
            State = Actual.memory[(ini_view - 1) + Op].sel
            Mg_sel = Actual.memory[(ini_view - 1) + Op].id
            Name_action = Actual.memory[(ini_view - 1) + Op].name
            Dirr = Actual.memory[(ini_view - 1) + Op].dir
            Ccost = Actual.memory[(ini_view - 1) + Op].cost
            Ttipo = Actual.memory[(ini_view - 1) + Op].tipo
            Ccolor = Actual.memory[(ini_view - 1) + Op].color
            Llv = Actual.memory[(ini_view - 1) + Op].lv
        end
    end
end
State_Operacion["select_l"] = function(v, o)
    if Acc == "magics" then
        Acc = Actual.mag[(ini_view - 1) + Op]
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
        Acc = Actual.col[(ini_view - 1) + Op]
        if Tabla_acciones_funcion and Tabla_acciones_funcion[Acc] and type(Tabla_acciones_funcion[Acc]) == "function" then
            Tabla_acciones_funcion[Acc]()
        end
        State = "select_o"
    end
end
State_Operacion["select_ii"] = function(v, o)
    --no utilizado
    if Acc == "mix" then
        Sel_ii = items[(ini_view - 1) + Op]
        Dirr2 = items[(ini_view - 1) + Op].dir
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
    IsInterruccion = false
    INTERRUCCION_MSG = ""
    if Acc == "objeto" or Acc == "usar" then
        Sel_i = items[(ini_view - 1) + Op]
        Dirr = items[(ini_view - 1) + Op].dir
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
    end
end
State_Operacion["select_oo"] = function(v, o)
    if Acc == "dual M." then
        Mg_2sel = Actual.mg[(ini_view - 1) + Op].id
        Dirr2 = Actual.mg[(ini_view - 1) + Op].dir
        Name_action = "Dual Cast"
        Ttipo2 = Actual.mg[(ini_view - 1) + Op].tipo
        Ccolor2 = Actual.mg[(ini_view - 1) + Op].color
        Llv2 = Actual.mg[(ini_view - 1) + Op].lv
        Ccost2 = Actual.mg[(ini_view - 1) + Op].cost


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

        if not (Actual.slots_[Llv2] > 0) and not (Actual.mp_ > Ccost2) then
            State = "select"
            Acc = ""
        end
    end
end
State_Operacion["select_o"] = function(v, o)
    Operacion[Acc](Actual, (ini_view - 1) + Op)
    Operacion["POS-CONFIG"](Actual, (ini_view - 1) + Op)
    ini_view = 1
end
State_Operacion["select_meta"] = function(v, o)
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
    Execute = true
end
State_Operacion["select_aa"] = function(v, o)
    State = "select_o"
end
State_Operacion["select_ee"] = function(v, o)
    if Acc == "dual M." then
        State = "select_o"
        Sel_ee = EnemigosVivos[Op]
        SelectEnemigo = EnemigosVivos[Op]
        Sel_cc = Sel_e
    end
end
State_Operacion["select_e"] = function(v, o)       --choose enemy
    if Acc == "atacar" or Acc == "W.Arts" or Acc == "support.w" or Acc == "atrapar" or Acc == "Power.Stone" or Acc == "asesinar" or Acc == "invocar" or Acc == "usar" or Acc == "darkness" or Acc == "dual M." or Acc == "tools" or Acc == "rapido" or Acc == "magic" or Acc == "dual M." or Acc == "bullet" or Acc == "mix" or Acc == "Blu.magic" or Acc == "cargar" or Acc == "tecnica" or Acc == "objeto" or Acc == "robar" or Acc == "quitar" or Acc == "carga" or Acc == "combo" or Acc == "saltar" or Acc == "spirit" or Acc == "lanzar" or Acc == "spell.list" or Acc == "extraer" or Acc == "especiales" or Acc == "canciones" or Acc == "bailes" or Acc == "w.magic" or Acc == "espada" then
        Execute = true
        State = "select"
        if EnemigosVivos[Op] then
            Sel_e = EnemigosVivos[Op]
            SelectEnemigo = EnemigosVivos[Op]
            Sel_c = Sel_e
        else
            State = "select_o"
        end
    end
    if Acc == "extraer" then
        State = "select_v"   --variable
        Sel_e = EnemigosVivos[Op]
        Sel_c = Sel_e
    end
end
State_Operacion["select_cc"] = function(v, o) --choose character
    if Acc == "dual M." then
        State = "select_o"
        Sel_cc = ActiveParty[Op]
        Sel_ee = Sel_cc
    end
end
State_Operacion["select_c"] = function(v, o) --choose character
    if Acc == "magic" or Acc == "dual M." or Acc == "usar" or Acc == "tecnica" or Acc == "objeto" or Acc == "tools" or Acc == "atacar" or Acc == "combo" or Acc == "saltar" or Acc == "mix" or Acc == "Blu.magic" or Acc == "spell.list" or Acc == "especiales" then
        Execute = true
        State = "select"
        Sel_c = ActiveParty[Op]
        Sel_e = Sel_c
    end
end
State_Operacion["select_d"] = function(v, o)       --death character
    if Acc == "magic" or Acc == "usar" or Acc == "objeto" or Acc == "especiales" then
        Execute = true
        State = "select"
        Sel_c = Death_party[Op]
        Sel_e = Sel_c
    end
end
State_Operacion["select_a??"] = function(v, o)     --all enemy, not tarjet
    if Acc == "tecnica" or Acc == "magic" then
        Execute = true
        State = "select"
    end
end
State_Operacion["select_w"] = function(v, o) --choose weapon
    if Acc == "lanzar" then
        Sel_w = weapon_inventary[Op].id
        State = "select_e"
        FiltrarEnemigoVivos()
    end
end

State_Operacion["select_v"] = function(v, o) --Extraer Magic force from enemy
    if Acc == "extraer" then
        Execute = true
        Mg_sel = SelectEnemigo.magicForce[Op]
        State = "select"
    end
end


State_Operacion["select_m"] = function(v, o) --Seleccionar un numero
    Number_sel = Op
    Execute = true
    State = "select"
end

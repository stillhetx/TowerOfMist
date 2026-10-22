
Tabla_acciones={}
Tabla_acciones["atacar"]="select_e"     
Tabla_acciones["W.Arts"]="select_o"
Tabla_acciones["support.w"]="select_e"
Tabla_acciones["mix"]="select_o"
Tabla_acciones["slash"]="Execute"
Tabla_acciones["tecnica" ]="select_o"
Tabla_acciones["especiales"]="select_o"
Tabla_acciones["invocar" ]="select_o"
Tabla_acciones["atrapar" ]="select_e"
Tabla_acciones["asesinar" ]="select_e"
Tabla_acciones["esconderse" ]="Execute"
Tabla_acciones["llamar"]="Execute"
Tabla_acciones["tools"]="select_o"
Tabla_acciones["transformacion"]="select_o"
Tabla_acciones["destransformar"]="Execute"
Tabla_acciones["Blu.magic"]="select_o"
Tabla_acciones["bullet"]="select_o"
Tabla_acciones["rapido"]="select_e"
Tabla_acciones["runes"]="select_o"
Tabla_acciones["spell.list"]="select_o"
Tabla_acciones["Power.Stone"]="select_o"
Tabla_acciones["extraer"]="select_e"
Tabla_acciones["cargar"]="select_e"
Tabla_acciones["guardia"]="Execute"
Tabla_acciones["darkness"]="select_e"
Tabla_acciones["quitar"]="select_e"
Tabla_acciones["mimic"]="Execute"
Tabla_acciones["dual M."]="select_oo"
Tabla_acciones["spirit"]="select_o"
Tabla_acciones["magic"]="select_o"
Tabla_acciones["ninja"]="select_o" 
Tabla_acciones["espada"]="select_o"
Tabla_acciones["magics"]="select_l"
Tabla_acciones["coleccion"]="select_l"
Tabla_acciones["colecciones"]="select_l"
Tabla_acciones["canciones"]="select_o"
Tabla_acciones["espada"]="select_o"
Tabla_acciones["ninja"]="select_o"
Tabla_acciones["bailes"]="select_o"
Tabla_acciones["evocar"]="select_o"
Tabla_acciones["robar"]="select_e"
Tabla_acciones["objeto"]="select_i"
Tabla_acciones["usar"]="select_i"
Tabla_acciones["combo"]="select_e"
Tabla_acciones["defensa"]="Execute"
Tabla_acciones["proteger"]="Execute"
Tabla_acciones["saltar"]="select_e"
Tabla_acciones["lanzar"]="select_w"
Tabla_acciones["suerte"]="Execute"
Tabla_acciones["geo"]="Execute"
Tabla_acciones["rezar"]="Execute"
Tabla_acciones["memory"]="select_y"



Tabla_acciones_funcion={}

Tabla_acciones_funcion["rezar"]= function()
    Acc="especiales"
    Mg_sel="rezar"
    Name_action="rezar"
    Dirr="x"
    Ccost=0
    Ttipo="mana"
end

Tabla_acciones_funcion["W.Arts"]= function()
	filtrarWeaponArts()
end
Tabla_acciones_funcion["support.w"]= function()
    FiltrarEnemigoVivos()
end
--
Tabla_acciones_funcion["mix"]= function()
    filtrarHechizos()
end
Tabla_acciones_funcion["llamar"]= function()
    if #Actual.beast <=0 then
        State="select"
        Acc=""
        Vacio=true
    end
end

Tabla_acciones_funcion["tools"]= function()
    filtrarTools()
    if not (#Actual.tools > 0) then
        Acc=""
        State="select"
        Vacio=true
    end
end

Tabla_acciones_funcion["Blu.magic"]= function()
    filtrarHechizosAzules()
    if not(#Actual.blue > 0) then
        Acc=""
        State="select"
        Vacio=true
    end
end

Tabla_acciones_funcion["bullet"]= function()
    filtrarBalas()
    if not(#Actual.bullet > 0) then
        Acc=""
        State="select"
        Vacio=true
    end
end

        --
Tabla_acciones_funcion["runes"]= function()
    FiltrarSpellList()
end
Tabla_acciones_funcion["spell.list"]= function()
    FiltrarSpellList()
end
Tabla_acciones_funcion["Power.Stone"]= function()
    FiltrarPowerStone()
end

Tabla_acciones_funcion["evocar"]= function()
    FiltrarFuerzas()
end
--[[


espada_larga
espada_corta
katana
lanza
alabarda
hachas
martillo
baculo
dagas
baston
cetro
revolver
ballesta
instrumento
escudo
grimorio





]]
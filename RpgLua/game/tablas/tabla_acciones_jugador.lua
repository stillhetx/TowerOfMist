
Tabla_acciones={}
Tabla_acciones["atacar"]="select e"     
Tabla_acciones["W.Arts"]="select o"
Tabla_acciones["support.w"]="select e"
Tabla_acciones["mix"]="select o"
Tabla_acciones["slash"]="Execute"
Tabla_acciones["tecnica" ]="select o"
Tabla_acciones["especiales"]="select o"
Tabla_acciones["invocar" ]="select o"
Tabla_acciones["atrapar" ]="select e"
Tabla_acciones["asesinar" ]="select e"
Tabla_acciones["esconderse" ]="Execute"
Tabla_acciones["llamar"]="Execute"
Tabla_acciones["tools"]="select o"
Tabla_acciones["transformacion"]="select o"
Tabla_acciones["destransformar"]="Execute"
Tabla_acciones["Blu.magic"]="select o"
Tabla_acciones["bullet"]="select o"
Tabla_acciones["rapido"]="select e"
Tabla_acciones["runes"]="select o"
Tabla_acciones["spell.list"]="select o"
Tabla_acciones["Power.Stone"]="select o"
Tabla_acciones["extraer"]="select e"
Tabla_acciones["cargar"]="select e"
Tabla_acciones["guardia"]="Execute"
Tabla_acciones["darkness"]="select e"
Tabla_acciones["quitar"]="select e"
Tabla_acciones["mimic"]="Execute"
Tabla_acciones["dual M."]="select oo"
Tabla_acciones["spirit"]="select o"
Tabla_acciones["magic"]="select o"
Tabla_acciones["ninja"]="select o" 
Tabla_acciones["espada"]="select o"
Tabla_acciones["magics"]="select l"
Tabla_acciones["coleccion"]="select l"
Tabla_acciones["colecciones"]="select l"
Tabla_acciones["canciones"]="select o"
Tabla_acciones["espada"]="select o"
Tabla_acciones["ninja"]="select o"
Tabla_acciones["bailes"]="select o"
Tabla_acciones["evocar"]="select o"
Tabla_acciones["robar"]="select e"
Tabla_acciones["objeto"]="select i"
Tabla_acciones["usar"]="select i"
Tabla_acciones["combo"]="select e"
Tabla_acciones["defensa"]="Execute"
Tabla_acciones["proteger"]="Execute"
Tabla_acciones["saltar"]="select e"
Tabla_acciones["lanzar"]="select w"
Tabla_acciones["suerte"]="Execute"
Tabla_acciones["geo"]="Execute"
Tabla_acciones["rezar"]="Execute"
Tabla_acciones["memory"]="select m"



Tabla_acciones_funcion={}
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
    if not(#Actual.beast >0) then
        State="select"
        Acc=""
    end
end

Tabla_acciones_funcion["tools"]= function()
    filtrarTools()
    if not (#Actual.tools > 0) then
        Acc=""
        State="select"
    end
end

Tabla_acciones_funcion["Blu.magic"]= function()
    filtrarHechizosAzules()
    if not(#Actual.blue > 0) then
        Acc=""
        State="select"
    end
end

Tabla_acciones_funcion["bullet"]= function()
    filtrarBalas()
    if not(#Actual.bullet > 0) then
        Acc=""
        State="select"
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
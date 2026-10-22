Comandos = {}

Comandos["select"] = {}
Comandos["select_l"] = {}
Comandos["select"]["atacar"] = function()
    State = "select_e"
    FiltrarEnemigoVivos()
end


Comandos["select"]["W.Arts"] = function()
    State = "select_o"
    filtrarWeaponArts()
end
Comandos["select"]["support.w"] = function()
    State = "select_e"
    FiltrarEnemigoVivos()
end
--
Comandos["select"]["mix"] = function()
    filtrarHechizos()
    State = "select_o"
end
Comandos["select"]["slash"] = function()
    Execute = true
end
Comandos["select"]["tecnica"] = function()
    State = "select_o"
end
Comandos["select"]["especiales"] = function()
    State = "select_o"
end
Comandos["select"]["invocar"] = function()
    State = "select_o"
end
Comandos["select"]["atrapar"] = function()
    State = "select_e"
    FiltrarEnemigoVivos()
end
Comandos["select"]["asesinar"] = function()
    State = "select_e"
    FiltrarEnemigoVivos()
end
Comandos["select"]["esconderse"] = function()
    State = "select"
    Execute = true
end
Comandos["select"]["llamar"] = function()
    if #Actual.beast > 0 then
        State = "select_o"
    else
        State = "select"
        Acc = ""
    end
end
Comandos["select"]["tools"] = function()
    filtrarTools()
    --Msg_debug="1Tools "
    if #Actual.tools > 0 then
        State = "select_o"
    else
        Acc = ""
        State = "select"
    end
end
Comandos["select"]["transformacion"] = function()
    State = "select_o"
end
Comandos["select"]["destransformar"] = function()
    Execute = true
end
Comandos["select"]["Blu.magic"] = function()
    filtrarHechizosAzules()
    if #Actual.blue > 0 then
        State = "select_o"
    else
        Acc = ""
        State = "select"
    end
end
Comandos["select"]["bullet"] = function()
    filtrarBalas()
    if #Actual.bullet > 0 then
        State = "select_o"
    else
        Acc = ""
        State = "select"
    end
end
Comandos["select"]["rapido"] = function()
    State = "select_e"
    FiltrarEnemigoVivos()
end
--

Comandos["select"]["spell.list"] = function()
    State = "select_o"
    FiltrarSpellList()
end
Comandos["select"]["Power.Stone"] = function()
    State = "select_o"
    FiltrarPowerStone()
end
Comandos["select"]["extraer"] = function()
    State = "select_e"
end
Comandos["select"]["cargar"] = function()
    State = "select_e"
    FiltrarEnemigoVivos()
end
Comandos["select"]["guardia"] = function()
    Execute = true
end
Comandos["select"]["darkness"] = function()
    State = "select_e"
    FiltrarEnemigoVivos()
end
Comandos["select"]["quitar"] = function()
    State = "select_e"
    FiltrarEnemigoVivos()
end
Comandos["select"]["mimic"] = function()
    Execute = true
end
Comandos["select"]["dual M."] = function()
    State = "select_oo"
end
Comandos["select"]["spirit"] = function()
    State = "select_o"
    Acc = "spirit"
end
Comandos["select"]["magic"] = function()
    State = "select_o"
end

Comandos["select"]["magics"] = function()
    State = "select_l"
end
Comandos["select"]["coleccion"] = function()
    State = "select_l"
end
--[[
Comandos["select" ]["atacar"]=function ()
            State="select_l"
            Acc="colecciones"
end
        ]]
Comandos["select"]["canciones"] = function()
    State = "select_o"
end
Comandos["select"]["espada"] = function()
    State = "select_o"
end
Comandos["select"]["ninja"] = function()
    State = "select_o"
end
Comandos["select"]["bailes"] = function()
    State = "select_o"
end
Comandos["select"]["evocar"] = function()
    State = "select_o"
    FiltrarFuerzas()
end
Comandos["select"]["robar"] = function()
    State = "select_e"
    FiltrarEnemigoVivos()
end
Comandos["select"]["objeto"] = function()
    State = "select_i"
end
Comandos["select"]["usar"] = function()
    State = "select_i"
end
Comandos["select"]["combo"] = function()
    State = "select_e"
    FiltrarEnemigoVivos()
end
Comandos["select"]["defensa"] = function()
    Execute = true
end
Comandos["select"]["proteger"] = function()
    Execute = true
end
Comandos["select"]["saltar"] = function()
    State = "select_e"
    FiltrarEnemigoVivos()
end
Comandos["select"]["lanzar"] = function()
    State = "select_w"
end
Comandos["select"]["suerte"] = function()
    Execute = true
end
Comandos["select"]["geo"] = function()
    Execute = true
end


Comandos["select_l"]["magics"] = function()
    Acc = Actual.mag[Op]
    if Acc == "dual M." then
        State = "select_oo"
    else
        State = "select_o"
    end
end

Comandos["select_l"]["colecciones"] = function()
    Acc = Actual.col[Op]
    State = "select_o"
end
--colecciones



function DirrLogica(str)
            if "m"== str  then
                State="select_m"
            elseif "x"== str   then
                State="select"
                Execute=true
            elseif "a"== str   then
                State="select_a"
            elseif "o"== str   then
                State="select_o"
            elseif "e"== str then
                State="select_e"
                FiltrarEnemigoVivos()
            elseif "c"== str  then
                State="select_c"
                FiltrarAliadosVivos()
            elseif "d"== str  then
                FiltrarAliadosMuertos()
                State="select_d"
                if #AliadosVivos<1 then
                    State="select_o"
                end
            end  

    return 
end
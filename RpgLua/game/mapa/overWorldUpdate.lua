function OverWorld.elegirEventoAleatorio()
    if not WorldTravel_random_event_table or #WorldTravel_random_event_table == 0 then
        error("WorldTravel_random_event_table no contiene eventos")
    end

    local totalWeight = 0
    for _, event in ipairs(WorldTravel_random_event_table) do
        if type(event.weight) ~= "number" or event.weight <= 0 then
            error("Peso invalido en WorldTravel_random_event_table")
        end
        totalWeight = totalWeight + event.weight
    end

    local roll = math.random() * totalWeight
    for _, event in ipairs(WorldTravel_random_event_table) do
        roll = roll - event.weight
        if roll <= 0 then
            return event
        end
    end

    error("No se pudo elegir un evento de WorldTravel_random_event_table")
end

function OverWorld.continuarViaje()
    OverWorld.moveTimer=true
    OverWorld.eventMessageTime=0
    OverWorld.eventoActual=nil
    Show_view="allWorld"
end

function OverWorld.regresarDeEvento()
    if OverWorld.eventoTravelActivo then
        OverWorld.eventoTravelActivo=false
        OverWorld.continuarViaje()
        return true
    end
    return false
end

function OverWorld.finalizarViaje()
    OverWorld.state=OverWorld.state_diccionary.seleccion
    OverWorld.travelTime=0
    OverWorld.eachEventTime=0
    OverWorld.moveTimer=false
    OverWorld.ubicacionID=OverWorld.Op
    ini_overworld=true
    Show_view="overWorld"
end

function OverWorld.activarEvento(event)
    OverWorld.eventoActual = event
    OverWorld.eventoDialogo=nil
    OverWorld.moveTimer=false

    if event.type == "batalla" then
        if not event.nodoName or not horda[event.nodoName] then
            error("El evento de batalla '" .. tostring(event.event) .. "' no tiene una horda valida")
        end

        OverWorld.eventoTravelActivo=false
        BeforeBattleMode="allWorld"
        Config.Pos_monster(event.nodoName)
        enemyGroups=horda[event.nodoName]
        Nvg=1
        nextLevel()
        Show_view="graph"
    elseif event.type == "travel" then
        if not event.nodoName or not lugares[event.nodoName] then
            error("El evento de viaje '" .. tostring(event.event) .. "' no tiene una secuencia de cartas valida")
        end

        BeforeBattleMode="travel"
        OverWorld.eventoTravelActivo=true
        Eventos.level_card=lugares[event.nodoName]
        Eventos.travel=1
        Eventos.op_menu=1
        Eventos.op_character=1
        Eventos.resulto=false
        Eventos.carta_actual=Eventos.level_card[1]
        if Eventos.carta_actual.tipo == "mazo" then
            Eventos.carta_actual=Eventos.carta_actual.deck[rnd(#Eventos.carta_actual.deck)]
        end
        Show_view="travel"
    else
        error("Tipo de evento de viaje desconocido: " .. tostring(event.type))
    end
end

function OverWorld.iniciarEvento()
    local event = OverWorld.elegirEventoAleatorio()
    if type(event.alert) ~= "number" then
        error("El evento '" .. tostring(event.event) .. "' no tiene un valor alert valido")
    end

    OverWorld.eventoTravelActivo=false
    local mejorPer = -math.huge
    for _, character in ipairs(ActiveParty) do
        local per = Total(character, "per")
        if per > mejorPer then
            mejorPer = per
        end
    end
    if mejorPer == -math.huge then
        error("No hay personajes en ActiveParty para tirar por la alerta del evento")
    end

    local tirada = rnd(20)
    OverWorld.eventoDialogo = {
        event=event,
        detectado=mejorPer + tirada > event.alert,
    }
    OverWorld.eventoDialogoSeleccion=1
    OverWorld.moveTimer=false
end

function OverWorld.responderEvento()
    local dialog = OverWorld.eventoDialogo
    if not dialog then
        return
    end

    if not dialog.detectado then
        OverWorld.activarEvento(dialog.event)
    elseif OverWorld.eventoDialogoSeleccion == 1 then
        OverWorld.activarEvento(dialog.event)
    else
        OverWorld.eventoDialogo=nil
        OverWorld.eventoActual=nil
        OverWorld.eventoTravelActivo=false
        OverWorld.continuarViaje()
    end
end

function OverWorld.update()
    if OverWorld.eventMessageTime > 0 then
        OverWorld.eventMessageTime=OverWorld.eventMessageTime-1
    end

    local origen = Lugares_importantes[Lugares_conocidos[OverWorld.ubicacionID]]
    local destino = Lugares_importantes[Lugares_conocidos[OverWorld.Op]]
    if origen and destino then
        local dx = destino.x - origen.x
        local dy = destino.y - origen.y
        local distanciaRuta = math.sqrt(dx * dx + dy * dy)
        OverWorld.cantEventos = math.floor(distanciaRuta / 80)
        if OverWorld.cantEventos > 0 then
            OverWorld.eachEventMaxTime = math.max(1, math.floor(OverWorld.travelMaxTime / (OverWorld.cantEventos+1)))
        else
            OverWorld.eachEventMaxTime = OverWorld.travelMaxTime + 1
        end
    end

    if OverWorld.state==OverWorld.state_diccionary.viaje and OverWorld.moveTimer==true then
        OverWorld.travelTime=OverWorld.travelTime+1
        OverWorld.eachEventTime=OverWorld.eachEventTime+1

        if OverWorld.travelTime >= OverWorld.travelMaxTime then
            OverWorld.finalizarViaje()
            return
        end

        if OverWorld.eachEventTime >= OverWorld.eachEventMaxTime then
            OverWorld.eachEventTime=0
            if math.random() < OverWorld.probabilidadEvento then
                OverWorld.eventMessageTime=OverWorld.eventMessageDuration
                OverWorld.iniciarEvento()
                return
            end
        end
    end
end
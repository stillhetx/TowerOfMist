
Min_X=200
Min_Y=20

function OverWorld.lineaPunteada(x1, y1, x2, y2)
    local dx = x2 - x1
    local dy = y2 - y1
    local distancia = math.sqrt(dx * dx + dy * dy)

    if distancia == 0 then
        love.graphics.circle("fill", x1, y1, 1)
        return
    end

    local cantidad_puntos = math.max(1, math.ceil(distancia / 6))
    for i = 0, cantidad_puntos do
        local proporcion = i / cantidad_puntos
        love.graphics.circle(
            "fill",
            x1 + dx * proporcion,
            y1 + dy * proporcion,
            1
        )
    end
end

function OverWorld.draw()
    love.graphics.draw(Finish_fight, 0, 0,0,1,1)
    
    love.graphics.print("seleccionar destino", 240, 20+(20*0) )
    for k,i in ipairs(Lugares_conocidos) do
        if Lugares_importantes[i] then
            love.graphics.print(Lugares_importantes[i].name, 36, 20+(20*k) )
        end
    end
    love.graphics.print(">", 20, 20+(20*OverWorld.Op) )

    --love.graphics.setColor( {0.7,1,0} )
    --love.graphics.rectangle( "fill", Min_X, Min_Y+26, 416, 410)
    --love.graphics.setColor( {1,1,1} )

    love.graphics.draw(ALLWORLD, Min_X, Min_Y+26,0,1,1)

    for k,i in ipairs(Lugares_conocidos) do
        if Lugares_importantes[i] then
            local el=Lugares_importantes[i]
            if OverWorld.Op == k then
                love.graphics.setColor( {0,1,0} )
                love.graphics.rectangle( "fill", Min_X+el.x, Min_Y+el.y, 2, 2)
                love.graphics.setColor( {1,1,1} )
            else
                love.graphics.rectangle( "fill", Min_X+el.x, Min_Y+el.y, 2, 2)
            end
            love.graphics.print(el.name.." "..k, Min_X+el.x+el.r, Min_Y+el.y )
            if el.tipo ~= "nada" then
                if OverWorld.Op == k then
                    love.graphics.setColor( {0,1,0} )
                    love.graphics.circle( "line", Min_X+el.x, Min_Y+el.y, el.r )
                    love.graphics.setColor( {1,1,1} )
                else
                    love.graphics.circle( "line", Min_X+el.x, Min_Y+el.y, el.r )
                end
                
            end
        end
    end


    local origen = Lugares_importantes[Lugares_conocidos[OverWorld.ubicacionID]]
    local destino = Lugares_importantes[Lugares_conocidos[OverWorld.Op]]
    local distanciaRuta = 0
    if origen and destino then
        local dx = destino.x - origen.x
        local dy = destino.y - origen.y
        distanciaRuta = math.sqrt(dx * dx + dy * dy)
        OverWorld.lineaPunteada(
            Min_X + origen.x,
            Min_Y + origen.y,
            Min_X + destino.x,
            Min_Y + destino.y
        )
    end

            love.graphics.print(
            "Distancia: " .. string.format("%.1f", distanciaRuta),
            200 + 10,
            36 + 10
        )

    if OverWorld.state==OverWorld.state_diccionary.viaje then
        local panelX, panelY = 218, 60
        local panelWidth, panelHeight = 380, 160
        local radius = 6
        local sphereY = panelY + panelHeight - 20
        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.rectangle("fill", panelX, panelY, panelWidth, panelHeight)
        love.graphics.setColor(1, 1, 1, 1)


        local partyPadding = 10
        local partyWidth = 0
        for i, character in ipairs(ActiveParty) do
            local spriteWidth = ((character.sheet and character.sheet[3]) or 1) * 32
            partyWidth = partyWidth + spriteWidth
            if i > 1 then
                partyWidth = partyWidth + partyPadding
            end
        end

        local partyX = panelX + (panelWidth - partyWidth) / 2
        local partyBottom = sphereY - radius - 4
        for _, character in ipairs(ActiveParty) do
            local spriteWidth = ((character.sheet and character.sheet[3]) or 1) * 32
            local spriteHeight = ((character.sheet and character.sheet[4]) or 1) * 32
            show_spr(
                character,
                partyX,
                partyBottom - spriteHeight,
                0, 0, 0, 0,
                false,
                false
            )
            partyX = partyX + spriteWidth + partyPadding
        end

        local progress = math.min(OverWorld.travelTime / OverWorld.travelMaxTime, 1)
        if progress > 0 then
            love.graphics.circle(
                "line",
                panelX + radius + (panelWidth - radius * 2) * progress,
                sphereY,
                radius
            )
        end
    end

    if OverWorld.eventMessageTime > 0 then
        local eventText = "Evento activado!"
        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.print(
            eventText,
            408 - love.graphics.getFont():getWidth(eventText) / 2,
            70
        )
        love.graphics.setColor(1, 1, 1, 1)
    end

    if OverWorld.eventoDialogo then
        local dialog=OverWorld.eventoDialogo
        local panelX, panelY, panelWidth, panelHeight = 120, 166, 400, 148
        love.graphics.setColor(0, 0, 0, 0.88)
        love.graphics.rectangle("fill", panelX, panelY, panelWidth, panelHeight)
        love.graphics.setColor(0.35, 0.78, 0.85, 1)
        love.graphics.setLineWidth(2)
        love.graphics.rectangle("line", panelX, panelY, panelWidth, panelHeight)

        love.graphics.setColor(1, 1, 1, 1)
        if dialog.detectado then
            love.graphics.printf(
                "Se ha detectado un evento.\n¿Quieres entrar?",
                panelX + 20,
                panelY + 24,
                panelWidth - 40,
                "center"
            )

            local options={"Sí", "No"}
            for index, option in ipairs(options) do
                local x=panelX + 100 + (index - 1) * 150
                if OverWorld.eventoDialogoSeleccion == index then
                    love.graphics.setColor(0.48, 0.9, 0.92, 1)
                    love.graphics.print(">", x - 22, panelY + 96)
                else
                    love.graphics.setColor(0.72, 0.78, 0.84, 1)
                end
                love.graphics.print(option, x, panelY + 96)
            end
            love.graphics.setColor(0.72, 0.78, 0.84, 1)
            love.graphics.printf("Flechas: elegir   Z / Enter: confirmar", panelX + 20, panelY + 122, panelWidth - 40, "center")
        else
            love.graphics.printf(
                "Evento activado!",
                panelX + 20,
                panelY + 36,
                panelWidth - 40,
                "center"
            )
            love.graphics.setColor(0.48, 0.9, 0.92, 1)
            love.graphics.printf("OK", panelX + 20, panelY + 96, panelWidth - 40, "center")
            love.graphics.setColor(0.72, 0.78, 0.84, 1)
            love.graphics.printf("Z / Enter: confirmar", panelX + 20, panelY + 122, panelWidth - 40, "center")
        end

        love.graphics.setColor(1, 1, 1, 1)
    end
end


function OverWorld.vistaNormal()

end

function OverWorld.vistaMovimiento()

end

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


    if Lugares_importantes[Lugares_conocidos[OverWorld.Op]] then
        OverWorld.lineaPunteada(Min_X+Lugares_importantes[Lugares_conocidos[OverWorld.ubicacionID]].x, Min_Y+Lugares_importantes[Lugares_conocidos[OverWorld.ubicacionID]].y, Min_X+Lugares_importantes[Lugares_conocidos[OverWorld.Op]].x, Min_Y+Lugares_importantes[Lugares_conocidos[OverWorld.Op]].y)
    end
end


function OverWorld.vistaNormal()

end

function OverWorld.vistaMovimiento()

end
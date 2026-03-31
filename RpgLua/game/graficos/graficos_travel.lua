
function EventosCards()
    cls()
    love.graphics.setColor(255,255,255)
    love.graphics.rectangle("fill", 10,10, 620, 460)

    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill", 20,20, 600, 2)

    love.graphics.rectangle("fill", 20,18, 6, 6)

    local step=5
    local dist=lerp(0, 600,step)

    for i=1, step do
        love.graphics.rectangle("fill", 20+(dist*i),18, 6, 6)
    end

    love.graphics.setColor(255,255,255)
    love.graphics.rectangle("fill", 21+(dist*Eventos.travel),19, 4, 4)


    love.graphics.setColor(0,0,0)

    love.graphics.rectangle("fill", 140,30, 364, 120)

    love.graphics.print( Eventos.carta_actual.desq, 30,180)
    --un_boton()
    if not Eventos.resulto then
        if Eventos.carta_actual.tipo~="hub" then
            for k,v in pairs(Eventos.carta_actual.opciones) do
                love.graphics.print( " "..v.label, 25,205+(k*40))
                love.graphics.print( "      "..v.req, 25,225+(k*40))
            end
            love.graphics.print( "> ", 14,205+(Eventos.op_menu*40))
        else
            for k,v in pairs(Eventos.carta_actual.opciones) do
                love.graphics.print( " "..v.label, 25,225+(k*20))
                --love.graphics.print( "      "..v.req, 25,245+(k*20))
            end
            love.graphics.print( "> ", 14,225+(Eventos.op_menu*20))
        end
        
    else
        --msg_resolucion
        love.graphics.print( " "..msg_resolucion, 25,225+(1*40))
    end


love.graphics.print( ActiveParty[Eventos.op_character].name, 450,225+(1*20))
love.graphics.print( "HP: "..ActiveParty[Eventos.op_character].hp_.."/"..ActiveParty[Eventos.op_character].hp+mod(ActiveParty[Eventos.op_character],"hp"), 450,225+(2*20))
love.graphics.print( "MP: "..ActiveParty[Eventos.op_character].mp_.."/"..ActiveParty[Eventos.op_character].mp+mod(ActiveParty[Eventos.op_character],"mp"), 450,225+(3*20))
love.graphics.print( "FUE "..ActiveParty[Eventos.op_character].fue+mod(ActiveParty[Eventos.op_character],"fue"), 450,225+(4*20))
love.graphics.print( "CON "..ActiveParty[Eventos.op_character].con+mod(ActiveParty[Eventos.op_character],"con"), 450,225+(5*20))
love.graphics.print( "AGI "..ActiveParty[Eventos.op_character].agi+mod(ActiveParty[Eventos.op_character],"agi"), 450,225+(6*20))
love.graphics.print( "POD "..ActiveParty[Eventos.op_character].pod+mod(ActiveParty[Eventos.op_character],"pod"), 450,225+(7*20))
love.graphics.print( "DEX "..ActiveParty[Eventos.op_character].dex+mod(ActiveParty[Eventos.op_character],"dex"), 540,225+(4*20))
love.graphics.print( "PER "..ActiveParty[Eventos.op_character].per+mod(ActiveParty[Eventos.op_character],"per"), 540,225+(5*20))
love.graphics.print( "INT "..ActiveParty[Eventos.op_character].int+mod(ActiveParty[Eventos.op_character],"int"), 540,225+(6*20))
love.graphics.print( "CAR "..ActiveParty[Eventos.op_character].car+mod(ActiveParty[Eventos.op_character],"car"), 540,225+(7*20))



--love.graphics.print( "DEBUG "..Debug_temp, 450,245+(9*20))


    --if #carta_actual.opciones==1 then
    --    un_boton()
    --elseif #carta_actual.opciones==2 then
    --    dos_botones()
    --elseif #carta_actual.opciones==3 then  
    --    tres_botones()      
    --elseif #carta_actual.opciones==4 then  
    --    cuatro_botones()      
    --end

    love.graphics.setColor(255,255,255)

    for k,v in pairs(ActiveParty) do
        anim_char(v,56+(k*120),80)
    end

    love.graphics.print( "> ", 48+(Eventos.op_character*120),100)



end    
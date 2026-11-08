function OverWorld.Control(key,scancode,isrepeat)
    if OverWorld.eventoDialogo then
        if OverWorld.eventoDialogo.detectado
            and (key == "left" or key == "right" or key == "up" or key == "down") then
            OverWorld.eventoDialogoSeleccion=3-OverWorld.eventoDialogoSeleccion
        elseif key == "z" or key == "return" or key == "kpenter" or key == "space" then
            OverWorld.responderEvento()
        end
        return
    end

    if key == "up" then
        OverWorld.up()
    end
    if key == "down" then
        OverWorld.down()
    end

    if key == "z" then
        OverWorld.z()
    end

    OverWorld.inside()
end


function OverWorld.inside()
    if OverWorld.Op<1 then
        OverWorld.Op=1
    end
    if OverWorld.Op>#Lugares_conocidos then
        OverWorld.Op=#Lugares_conocidos
    end
    
end

function OverWorld.up()
    OverWorld.Op=OverWorld.Op-1  
end


function OverWorld.down()
    OverWorld.Op=OverWorld.Op+1 
end


function OverWorld.z()
    if OverWorld.state==OverWorld.state_diccionary.seleccion then
        OverWorld.state=OverWorld.state_diccionary.viaje
        OverWorld.moveTimer=true
        OverWorld.travelTime=0
        OverWorld.eachEventTime=0
    end
end
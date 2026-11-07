function OverWorld.Control(key,scancode,isrepeat)
    if key == "up" then
        OverWorld.up()
    end
    if key == "down" then
        OverWorld.down()
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
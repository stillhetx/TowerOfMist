

function load_overWorld()
    world_X=maps[1].ini_x
    world_y=maps[1].ini_y
    ini_overworld=false
end    

function overWorld()
    cls()
    if ini_overworld then
        load_overWorld()
    end    

    spr(25,world_X,world_y,2,2)

end    


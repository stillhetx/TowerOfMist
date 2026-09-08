MapControl = {}

MapControl.Op=1

function MapControl.Control(key, scancode, isrepeat)
    if Open_menu==false then
        if key == "left" then
            MapControl.left()
        end
        if key == "right" then
            MapControl.right()
        end
        if key == "up" then
            MapControl.up()
        end
        if key == "down" then
            MapControl.down()
        end
        if key == "z" then
            MapControl.menu()
        end
    else
        if key == "left" then
            MapControl.arrow_left()
        end
        if key == "right" then
            MapControl.arrow_right()
        end
        if key == "up" then
            MapControl.arrow_up()
        end
        if key == "down" then
            MapControl.arrow_down()
        end
        if key == "x" then
            MapControl.back_menu()
        end
        if key == "z" then
            MapControl.menu()
        end
    end
end


function    MapControl.arrow_left()

end

function    MapControl.arrow_right()

end


function    MapControl.arrow_up()

    MapControl.Op = MapControl.Op-1
    if MapControl.Op<=0 then
        MapControl.Op=#Acciones_base
    end 
    
    if MapControl.Op > #Acciones_base then
        MapControl.Op=1
    end  

end


function    MapControl.arrow_down()
    MapControl.Op = MapControl.Op + 1
    if MapControl.Op<=0 then
        MapControl.Op=#Acciones_base
    end 
    
    if MapControl.Op > #Acciones_base then
        MapControl.Op=1
    end  
end



function MapControl.left()
    if Grupo_signal.move==false and Actual_nodo.left.id  then
        Grupo_signal.xd=Actual_nodo.left.x
        Grupo_signal.yd=Actual_nodo.left.y
        Actual_nodo=Actual_nodo.left
        Grupo_signal.move=true
        MapControl.randon_event()
    end
    
end

function MapControl.right()
    if Grupo_signal.move==false and  Actual_nodo.right.id then
        Grupo_signal.xd=Actual_nodo.right.x
        Grupo_signal.yd=Actual_nodo.right.y
        Actual_nodo=Actual_nodo.right
        Grupo_signal.move=true
        MapControl.randon_event()
    end
end

function MapControl.up()
    if Grupo_signal.move==false and Actual_nodo.up.id then
        Grupo_signal.xd=Actual_nodo.up.x
        Grupo_signal.yd=Actual_nodo.up.y
        Actual_nodo=Actual_nodo.up
        Grupo_signal.move=true
        MapControl.randon_event()
    end

end


function MapControl.down()
    if Grupo_signal.move==false and Actual_nodo.down.id then
        Grupo_signal.xd=Actual_nodo.down.x
        Grupo_signal.yd=Actual_nodo.down.y
        Actual_nodo=Actual_nodo.down
        Grupo_signal.move=true
        MapControl.randon_event()
    end
end


function MapControl.randon_event()
    if Randon_event[Actual_nodo.id] then
        
    end
end

Open_menu=false
Inside_menu=false
function MapControl.menu()
    if Open_menu==false  then
        Open_menu=true
    else
        
            MapControl.menu_event()
        
        --Inside_menu=true
    end

end



function MapControl.menu_event()
    if Acciones_base[MapControl.Op].id== "entrar" then
        if Actual_nodo.info.tipo=="store" or Actual_nodo.info.tipo=="inn" then
            Tienda.etapa="begin"
            Tienda.Name_store=Actual_nodo.info.name
            Tienda.ListaStore=Actual_nodo.info.itemsList
            Tienda.tipo=Actual_nodo.info.tipo
            Tienda.inn_cost=Actual_nodo.info.inn_cost
            Tienda.owner=Actual_nodo.info.char
            Tienda.before="overWorld"
            Open_menu=false
            Inside_menu=false
            Show_view="tienda"
        end
        if Actual_nodo.info.tipo=="level" then
            Show_view="graph"
            Config.Pos_monster(Actual_nodo.info.nodoName)
            enemyGroups=horda[Actual_nodo.info.nodoName]
            Nvg=1
            nextLevel()
            BeforeBattleMode="overWorld"
        end


    end
end

function MapControl.back_menu()
    if Inside_menu==false and Open_menu==true  then
        Open_menu=false
    else
        
    end

end
Menu_rest=0

function MapControl.contadores()

    if Menu_rest>0 then
        Menu_rest=Menu_rest-1
        if Menu_rest <=0 then
            Menu_rest=0
        end
    end

end
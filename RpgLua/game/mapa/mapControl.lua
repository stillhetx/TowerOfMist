MapControl = {}

MapControl.Op=1
MapControl.EventCount=5
MapControl.MaxEventCount=5
MapControl.AccionesMenu={}




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
        MapControl.Op=#MapControl.AccionesMenu
    end 
    
    if MapControl.Op > #MapControl.AccionesMenu then
        MapControl.Op=1
    end  

end


function    MapControl.arrow_down()
    MapControl.Op = MapControl.Op + 1
    if MapControl.Op<=0 then
        MapControl.Op=#MapControl.AccionesMenu
    end 
    
    if MapControl.Op > #MapControl.AccionesMenu then
        MapControl.Op=1
    end  
end



function MapControl.left()
    if Grupo_signal.move==false and Actual_nodo.left.id  then
        Grupo_signal.xd=Actual_nodo.left.x
        Grupo_signal.yd=Actual_nodo.left.y
        if Randon_event[Actual_nodo.left.id]then
            Grupo_signal.event=true
        end
        Actual_nodo=Actual_nodo.left
        Grupo_signal.move=true

        MapControl.randon_event()
    end
    
end

function MapControl.right()
    if Grupo_signal.move==false and  Actual_nodo.right.id then
        Grupo_signal.xd=Actual_nodo.right.x
        Grupo_signal.yd=Actual_nodo.right.y
        if Randon_event[Actual_nodo.right.id]then
            Grupo_signal.event=true
        end
        Actual_nodo=Actual_nodo.right
        Grupo_signal.move=true
        MapControl.randon_event()
    end
end

function MapControl.up()
    if Grupo_signal.move==false and Actual_nodo.up.id then
        Grupo_signal.xd=Actual_nodo.up.x
        Grupo_signal.yd=Actual_nodo.up.y
        if Randon_event[Actual_nodo.up.id]then
            Grupo_signal.event=true
        end
        Actual_nodo=Actual_nodo.up
        Grupo_signal.move=true
        MapControl.randon_event()
    end

end


function MapControl.down()
    if Grupo_signal.move==false and Actual_nodo.down.id then
        Grupo_signal.xd=Actual_nodo.down.x
        Grupo_signal.yd=Actual_nodo.down.y
        if Randon_event[Actual_nodo.down.id]then
            Grupo_signal.event=true
        end
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
        MapControl.filtrarAcciones()
        ---MapControl.AccionesMenu
    else
        
            MapControl.menu_event()
        
        --Inside_menu=true
    end

end

function MapControl.LogicAddEvent()
    local porc=rnd(100)
    if porc<99 then
        local max_i = flr(rnd (Actual_max_event))
        for i=1,max_i do
            local index= flr(rnd (#Indice_event))
            local indexPlace= flr(rnd (#Indice_place))
            --add(Randon_event,Randon_event_type[Randon_event_indice[index]])
            Randon_event[Indice_place[indexPlace]] = Randon_event_type[Indice_event[index]]
        end
    end


end


function MapControl.menu_event()
    local press=false --evita que el contador de eventos suba, con las acciones no terminadas.
    if MapControl.AccionesMenu[MapControl.Op].id== "entrar" then
        
        if Actual_nodo.info.tipo=="store" or Actual_nodo.info.tipo=="inn" then
            press=true
            Tienda.etapa="begin"
            Tienda.Name_store=Actual_nodo.info.name
            Tienda.ListaStore=Actual_nodo.info.itemsList
            Tienda.tipo=Actual_nodo.info.tipo
            Tienda.inn_cost=Actual_nodo.info.inn_cost
            Tienda.owner=Actual_nodo.info.char
            Tienda.npcName=Actual_nodo.info.owner
            Tienda.before="overWorld"
            Open_menu=false
            Inside_menu=false
            Show_view="tienda"
        end
        if Actual_nodo.info.tipo=="level" then
            press=true
            Show_view="graph"
            Config.Pos_monster(Actual_nodo.info.nodoName)
            enemyGroups=horda[Actual_nodo.info.nodoName]
            Nvg=1
            nextLevel()
            BeforeBattleMode="overWorld"
        end
        if Actual_nodo.info.tipo=="stealh_quest"  then

            if not Tabla_nodos_finalizados[InfiltracionData.Info.id] then
                press=true
                --Tabla_infiltracion[Actual_nodo.info.nodoName]

                InfiltracionData.Info=Actual_nodo.info

                InfiltracionData.NmInside=InfiltracionData.Info.people
                InfiltracionData.NmOutside=0
                InfiltracionData.Deck=InfiltracionData.Info.stealth_deck
                
                InfiltracionData.numero_char=1
                FiltrarAliadosVivos()
                InfiltracionData.Actual_char=AliadosVivos[InfiltracionData.numero_char]
                
                InfiltracionData.State = InfiltracionData.State_table.Organizar
                InfiltracionData.Nivel_busqueda = InfiltracionData.Info.stealth_level
                InfiltracionData.Limit_type = InfiltracionData.Info.stealth_type--??
                InfiltracionData.Nivel_tension = InfiltracionData.Info.lvTension

                    --[[

                        stealth_level=InfiltracionData.Niveles_Table.BASICO,
                        stealth_type=InfiltracionData.Limit_Table.TENSION,
                    ]]

                Show_view="stealthMode"
                BeforeBattleMode="overWorld"
            else
                
            end
        end
    elseif MapControl.AccionesMenu[MapControl.Op].id== "luchar" then
            press=true
            Show_view="graph"
            Config.Pos_monster(Actual_nodo.info.nodoName)
            enemyGroups=horda[Actual_nodo.info.nodoName]
            Nvg=1
            nextLevel()
            BeforeBattleMode="overWorld"

    elseif MapControl.AccionesMenu[MapControl.Op].id== "infiltrarse" then
        if Actual_nodo.info.tipo=="stealh_quest"  then
            if not Tabla_nodos_finalizados[InfiltracionData.Info.id] then
                press=true
                --Tabla_infiltracion[Actual_nodo.info.nodoName]

                InfiltracionData.Info=Actual_nodo.info

                InfiltracionData.NmInside=InfiltracionData.Info.people
                InfiltracionData.NmOutside=0
                InfiltracionData.Deck=InfiltracionData.Info.stealth_deck
                
                InfiltracionData.numero_char=1
                FiltrarAliadosVivos()
                InfiltracionData.Actual_char=AliadosVivos[InfiltracionData.numero_char]
                
                InfiltracionData.State = InfiltracionData.State_table.Organizar
                InfiltracionData.Nivel_busqueda = InfiltracionData.Info.stealth_level
                InfiltracionData.Limit_type = InfiltracionData.Info.stealth_type--??
                InfiltracionData.Nivel_tension = InfiltracionData.Info.lvTension

                    --[[

                        stealth_level=InfiltracionData.Niveles_Table.BASICO,
                        stealth_type=InfiltracionData.Limit_Table.TENSION,
                    ]]

                Show_view="stealthMode"
                BeforeBattleMode="overWorld"
            else
                
            end
        elseif MapControl.AccionesMenu[MapControl.Op].id== "saquear" then
            --
            --
        elseif MapControl.AccionesMenu[MapControl.Op].id== "investigar" then
            --
            --
        end


    end
    if press == true then
        MapControl.EventCount=MapControl.EventCount-1
    end
end

function MapControl.filtrarAcciones()
   MapControl.AccionesMenu={}
    if Actual_nodo.info.tipo=="stealh_quest" then
        if Tabla_nodos_finalizados[Actual_nodo.info.id] then
            if not Tabla_nodos_saqueados[Actual_nodo.info.id] then
                --add(MapControl.AccionesMenu,{name="saquear", id="saquear"})
            end    
            ---{name="entrar", id="entrar"},        
        else 
                add(MapControl.AccionesMenu,{name="infiltrarse", id="infiltrarse"})
        end
        add(MapControl.AccionesMenu,{name="Accion", id="Accion"})
    elseif Actual_nodo.info.tipo=="store" or Actual_nodo.info.tipo=="inn" then
        add(MapControl.AccionesMenu,{name="entrar", id="entrar"})
        add(MapControl.AccionesMenu,{name="Accion", id="Accion"})
    elseif Actual_nodo.info.tipo=="level" then
        if not Tabla_nodos_finalizados[Actual_nodo.info.id] then
            add(MapControl.AccionesMenu,{name="luchar", id="luchar"})
        end
        add(MapControl.AccionesMenu,{name="Accion", id="Accion"})
    else
        add(MapControl.AccionesMenu,{name="entrar", id="entrar"})
        add(MapControl.AccionesMenu,{name="Accion", id="Accion"})

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
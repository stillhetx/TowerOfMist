

Grupo_signal={}
Grupo_signal.x=0
Grupo_signal.y=0
--"still"
Grupo_signal.move=false
Grupo_signal.xo=0
Grupo_signal.yo=0
Grupo_signal.xd=0
Grupo_signal.yd=0
Grupo_signal.direction=""
Grupo_signal.event=false
Grupo_signal.show_request_event=false
Grupo_signal.recharge=false

dd=0
function load_overWorld()
    world_X=maps[1].ini_x
    world_y=maps[1].ini_y
    ini_overworld=false
    dd=dd+1
    Grupo_signal.x=Actual_nodo.x
    Grupo_signal.y=Actual_nodo.y
    MapControl.LogicAddEvent()
end    


function AddEvent()


end

function _update_overWorld()
    if ini_overworld then
        load_overWorld()
    end
    if Grupo_signal.recharge == true then
        Grupo_signal.recharge = false
        MapControl.LogicAddEvent()
    end
    if Grupo_signal.event==true and Grupo_signal.move==false and false then --Debug line
    --if Grupo_signal.event==true and Grupo_signal.move==false then
        if Grupo_info.Request_to_fight==false then
            if Randon_event[Actual_nodo.id].tipo=="enemigo" and true then
                Show_view="graph"
                Config.Pos_monster(Randon_event[Actual_nodo.id].nodoName)
                enemyGroups=horda[Randon_event[Actual_nodo.id].nodoName]
                Nvg=1
                nextLevel()
                if true then
                    Randon_event[Actual_nodo.id] = nil
                end
                BeforeBattleMode="overWorld"
            
            elseif Randon_event[Actual_nodo.id].tipo=="evento" and false then
                Show_view="travel"
                BeforeBattleMode="overWorld"
                Eventos.level_card=lugares[Randon_event[Actual_nodo.id].nodoName]
                Eventos.carta_actual=Eventos.level_card[1]

                if Eventos.carta_actual.tipo == "mazo" then
                    local number = rnd(#Eventos.carta_actual.deck)
                    Eventos.carta_actual = Eventos.carta_actual.deck[number]
                end
                if true then
                    Randon_event[Actual_nodo.id] = nil
                end
            end
        else            
            Grupo_signal.show_request_event=false
        end
        Grupo_signal.event=false
        MapControl.EventCount=MapControl.EventCount-1
    end 
    if MapControl.EventCount==0 then
        Grupo_signal.recharge = true
    end

end

function overWorld()
    MapControl.contadores()
    cls()

    Bucles_world()
    love.graphics.draw(Mapa_test,0,0,0,4,4)

    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 0, 0, 16, 480)
    love.graphics.rectangle("fill", 0, 0, 640, 16)

    love.graphics.rectangle("fill", 640-16, 0, 16, 480)
    love.graphics.rectangle("fill", 0,480-16, 640, 16)
    if show_info() then
        love.graphics.rectangle("fill", 115, 30, 410, 70)
    end
    love.graphics.setColor(255, 255, 255)

    love.graphics.draw(Finish_fight,0,0,0,1,1)
    if show_info() and Actual_nodo.info.name then
        love.graphics.print( ""..Actual_nodo.info.name,130,30)
    end
    if show_info() and Actual_nodo.info.tipo=="store" then
        love.graphics.print( "dueño: "..Actual_nodo.info.owner,130,30+(24*1))
        love.graphics.print( "gente: "..Actual_nodo.info.people,130,30+(24*2))
    end


    if Open_menu==true then
        love.graphics.setColor(0, 0, 0)
        love.graphics.rectangle("fill", 460, 250, 152, 10+#MapControl.AccionesMenu*24+6)
        love.graphics.setColor(255, 255, 255)
         love.graphics.print( "> ",460,260+(24*(MapControl.Op-1)))
        for k,i in pairs(MapControl.AccionesMenu) do
            love.graphics.print( "* "..i.name,460+12,260+(24*(k-1)))
        end
    end
    sprSheetV2(578, 4+Grupo_signal.x*4, -8+Grupo_signal.y*4, 2,2,false,false,_G["new_sprites_jobs"],1,1,20)

    for k,i in pairs(Randon_event) do
        MoverHorizontal(i.pos, 2, -6, 26, 1)
        anim_char_avanzadoV2(i.char,World_0_nodos[k].x*4+i.pos.x,World_0_nodos[k].y*4,false,64,2)
        --love.graphics.print( "pos: "..World_0_nodos[k].x.."/"..World_0_nodos[k].y,130,30+(24*3))
    end

    Debug_overWorld()


    --spr(25,world_X,world_y,2,2)

end    

local direction = 1
function MoverHorizontal(obj, velocidad, minX, maxX, dt)

    obj.x = obj.x + (velocidad*obj.direction)
    if obj.x >= maxX then
        obj.direction=-1
    elseif obj.x <= minX then
        obj.x = minX
        obj.direction=1
    end
    

end


function show_info()
    if Actual_nodo.info.tipo=="store" or Actual_nodo.info.tipo=="level" or 
        Actual_nodo.info.tipo=="home" or Actual_nodo.info.tipo=="inn" then
            return true
    end
    return false
end

function Debug_overWorld()
    if false then
        love.graphics.print( "x: "..(4+Actual_nodo.x*4).." y: ".. (-8+Actual_nodo.y*4),30,114+(24*-3))
        love.graphics.print( "gx: "..(4+Grupo_signal.x*4).." gy: ".. (-8+Grupo_signal.y*4),30,114+(24*-4))
        love.graphics.print( "id: "..Actual_nodo.id,30,114+(24*-2))
        love.graphics.print( "right: "..type(Actual_nodo.right),30,114+(24*-1))
        love.graphics.print( "left: "..type(Actual_nodo.left),30,114+(24*-0))
        love.graphics.print( "up: "..type(Actual_nodo.up),30,114+(24*1))
        love.graphics.print( "down: "..type(Actual_nodo.down),30,114+(24*2))
        if Grupo_signal.move==true then
            love.graphics.print( "move: verdadero",30,114+(24*3))
        else
            love.graphics.print( "move: falso",30,114+(24*3))
        end
    end
end

function Bucles_world()
    Signal_move()

end

function Signal_move()
    local max_time=8
    if Grupo_signal.move == true  then

         local sideX=0 
         local sideY=0 
        
        if Grupo_signal.x-Grupo_signal.xd>0 then
            sideX=-1
        elseif Grupo_signal.x-Grupo_signal.xd==0  then   
            sideX=0
        else 
            sideX=1   
        end

        if Grupo_signal.y-Grupo_signal.yd>0 then
            sideY=-1
        elseif Grupo_signal.y-Grupo_signal.yd==0  then  
            sideY=0
        else    
            sideY=1
        end

        Grupo_signal.x= Grupo_signal.x +(lerp(Grupo_signal.x, Grupo_signal.xd, 4))
        Grupo_signal.y= Grupo_signal.y +(lerp(Grupo_signal.y, Grupo_signal.yd, 4))
        local igualar=false


        if sideX~=0 then 
            if math.abs(lerp(Grupo_signal.x, Grupo_signal.xd, 20)) <.01 then
                igualar=true
            end
        end

        if sideY~=0 then 
            if math.abs(lerp(Grupo_signal.y, Grupo_signal.yd, 20)) <.01 then
                igualar=true                
            end
        end

        if igualar==true then
            Grupo_signal.y = Grupo_signal.yd
            Grupo_signal.x = Grupo_signal.xd
            Grupo_signal.direction=""
            Grupo_signal.move=false
        end

    end

end
 

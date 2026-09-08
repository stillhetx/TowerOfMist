Animacion={}
Pila_animacion={}
Accion_character={}

function Animacion.add(v)
    table.insert(Pila_animacion, v)
end

function Animacion.add_Accion_character(obj,state,max_time)
    table.insert(Accion_character, {obj=obj,state=state,time=0,max_time=max_time})
end


function Animacion.add_texto_anima(obj,srt,time,color,dX,dY,speed)
    local v={}
    v.obj=obj
    v.type="texto"
    v.str=srt
    v.time=time
    v.dX=dX
    v.dY=dY
    v.color=List_color[color]
    v.speed=speed
    table.insert(Pila_animacion, v)
end


function Animacion.clean()
    Pila_animacion = {}
end

function Animacion.clean_accion_character()
    Accion_character = {}
end

function Animacion.add_action_animation(obj,id,color)
    local v={}
    if obj.tipo=="player" then
        v.inv=false
    else   
        v.inv=true 
    end
    v.type="Animacion"
    v.obj=obj
    v.id=id
    v.color=color
    v.time=anim_list[id].time
    table.insert(Pila_animacion, v)
end

function Animacion.show_anima_pile()
    if #Pila_animacion>0 then
        for i=1,#Pila_animacion do
            if Pila_animacion[i] then
                local v=Pila_animacion[i]
                if v.type=="texto" then
                    Animacion.show_animacion_texto(v)
                    v.time=v.time-1
                    if v.time<=0 then
                        table.remove(Pila_animacion,i)
                    end
                elseif v.type=="Animacion" then
                    Animacion.show_animacion_action(v)
                    v.time=v.time-1
                    if v.time<=0 then
                        table.remove(Pila_animacion,i)
                    end
                end
            end            
        end
    end
end

function Animacion.show_animacion_action(v)
    local obj=v.obj
    local id=v.id
    local color=v.color
    local inv=v.inv
    if obj.tipo=="player" then
        anim_general(id,obj.x+40,obj.y,2,2,false,color,inv)  
    else
        anim_general(id,obj.x,obj.y,2,2,true,color,inv)  
    end
end

function Animacion.show_animacion_texto(v)
    local obj=v.obj
    local str=v.str
    local time=v.time
    local color=v.color
    local dX=v.dX or 0
    local dY=v.dY or 0
    local speed=v.speed or 1


    -- Aquí puedes implementar la lógica para mostrar el texto animado en la pantalla
    -- Por ejemplo, podrías usar love.graphics.print para dibujar el texto en la posición del objeto
    love.graphics.setColor(color)
    love.graphics.print(str, obj.x-16 + dX, obj.y + 24 + dY+(time*speed)) -- Ajusta la posición según tus necesidades
    love.graphics.setColor(255, 255, 255)
end


function Animacion.show_Accion_character()
        if #Accion_character>0 then
            for i=1,#Accion_character do
                ChaAnimation[Accion_character[i].state](Accion_character[i],i)
            end
        end
end

ChaAnimation = {}

    local jump_time_max = 3
    local avanzar_time_max = 8
    local lateral_gravity = 3
    local max_timer_summon = 12

ChaAnimation["avanzar"]= function (v,index)
        local obj = v.obj
        if v.time < v.max_time then
            obj.x = obj.x + lerp(0, 60, v.max_time)
            v.time = v.time + 1
        end
        obj.x = obj.x - lateral_gravity
        if obj.x <= obj.x_ then
            obj.x = obj.x_
            --v.rest = true
            --v.avanzar = false
            v.time = 0
            table.remove(Accion_character,index)
        end
end


ChaAnimation["impacto"]= function (v,index)
        local obj = v.obj
        if v.time < v.max_time then
            obj.x = obj.x - lerp(0, 20, v.max_time)
            v.time = v.time + 1
        end
        obj.x = obj.x + lateral_gravity
        if obj.x >= obj.x_ then
            obj.x = obj.x_
            --v.rest = true
            --v.jump = false
            v.time = 0
            table.remove(Accion_character,index)
        end
end
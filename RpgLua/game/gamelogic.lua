


function _update()
    --Actual=Order[Turno]
    executeTrigger()
    bucles()
    boton_press()
    --if modo=="overWorld" then
    if Modo=="overWorld" then
        if love.keyboard.isScancodeDown('w', 'up') then world_y=world_y-speed  end
        if love.keyboard.isScancodeDown('s', 'down') then world_y=world_y+speed  end
        if love.keyboard.isScancodeDown('a', 'left') then world_X=world_X-speed  end
        if love.keyboard.isScancodeDown('d', 'right') then world_X=world_X+speed end
    end    

    init_player(Actual)
    isAlive()
    winState()
    wait_enemy()
    if EnemigosVivos[Op]~=nil then
        Temp_e=EnemigosVivos[Op].id
    end
    if ActiveParty[Op]~=nil then
        Temp_c=ActiveParty[Op].id
    end    
    local key = stat(31)
    if key == "q" then
        Show_view="graph"
    end    
    if key == "w" then
        Show_view="text"
    end
    if key == "e" then
        Show_view="debug"
    end
    if key == "r" then
        Show_view="debug2"
    end
    if B_wait==false then 
        if bool_contra_ataque then
            ejecutar_reaccion()
        else        
            start(Actual) 
            ejecutar_comando()
            if auto then
                automatico(Actual)
            else
                if Modo=="combat" then
                    if Actual.tipo=="player" and Actual.next_atack~='' then
                        Robot(Actual)
                    end    
                    if Actual.tipo=="player" and Actual.live==false then
                        next()        
                    end
                    if (Actual.tipo=="aliado" or Actual.tipo=="enemy") and Actual.live==true then
                        logic(Actual.tipo)
                        next()
                    end
                    if (Actual.tipo=="aliado" or Actual.tipo=="enemy") and Actual.live==false then    
                        next()        
                    end
                end
            end
        end
    end  
    updateMonster() 
    updateParty()
    cleanDmg()
    isAlive()    
end


function _update_travel()

end    

--next_comando=""


--Dejar para despues


function cleanEjecutarComando()
        --next_comando=""
        objetivo_global={}
        clean()
        next()
        wait_start()
end    

function boton_press()
    if animated_bonus_boton then
        if love.keyboard.isScancodeDown('z')  then
            local exito_time= (bonus_boton_time_max/3)*2
            if bonus_boton_time_cont > exito_time then
                Buton_bonus=1
            else
                Buton_bonus=0
            end
        end
    end   
end    


function add_inventary_Weapon_list(t)   
    if existList(t.id, weapon_inventary) then
        --si existe el registro
        local temp= getChars(t.id, weapon_inventary)
        if temp.cont ~= nil then
            temp.cont=temp.cont+1
        end    
    else
        -- si no existe el registro
        t.cont=1
        add(weapon_inventary, t)
    end    
end    


function add_inventary_Armadura_list(t)   
    if existList(t.id, armadura_inventary) then
        --si existe el registro
        local temp= getChars(t.id, armadura_inventary)
        if temp.cont ~= nil then
            temp.cont=temp.cont+1
        end    
    else
        -- si no existe el registro
        t.cont=1
        add(armadura_inventary, t)
    end    
end    


function count_items(str)
    local count=0
    if existList(str, items) then
        local temp = getChars(str, items)
        if temp.cont ~= nil then
            count =temp.cont
        end
        return count
    else
        return 0
    end
end

function add_inventary_items_list(t)   
    if existList(t.id, items) then
        --si existe el registro
        local temp= getChars(t.id, items)
        if temp.cont ~= nil then
            temp.cont=temp.cont+1
        end    
    else
        -- si no existe el registro
        t.cont=1
        add(items, t)
    end    
end  

function remove_inventary_items_list(t)
    if existList(t.id, items) then
        local temp= getChars(t.id, items)
        if temp.cont>0 then
            temp.cont=temp.cont-1
        end
    end    
end

function filtrarEnemigos()
    Show_enemy={}
    for k,v in pairs(Order) do
        if v.tipo=="enemy" and v.hp_>0 then
            add(Show_enemy,v)
        end
    end
end    

function filtrarDerrotados()
    Death_party={}
    for k,v in pairs(Order) do
        if v.tipo=="player" and v.hp_<1 then
            add(Death_party,v)
        end
    end
end

function Add_skill_equip(v,ob)
    if #v.extra>0 then
        for k,i in pairs(v.extra) do            
            if i.name=="pasiva" then
                ob.perks[i.value.id]=i.value
            end   
            if i.name=="comando" then
                add(ob.acc, i.value)
            end
            if i.name=="spell" then
                for t,ii in pairs(v.extra.value) do
                    add(ob.mg, all_spell[ii])
                end  
            end
            if i.name=="spell.list" then
                for t,ii in pairs(v.extra.value) do
                    add(ob.mg, ii)
                end    
            end   
            if i.name=="perks" then
                ob.perks[i.value.id]=i.value
            end-- 
        end
    end
end

function Remove_skill_equip(v,ob)
    if v.extra~=nil then
        for k,i in pairs(v.extra) do
            if i.name=="pasiva" then
                removeKey(ob.perks,i.value.id)
            end   
            if i.name=="comando" then
                del(ob.acc, i.value)
            end-- 
            if i.name=="spell.list" then
                for t,ii in pairs(v.extra.value) do
                    del(v.mg,ii)
                end
            end
            if i.name=="spell" then
                for t,ii in pairs(v.extra.value) do
                    del(ob.mg,ii)
                end  
            end
            if i.name=="perks" then            
                    removeKey(ob.perks,i.value.id) 
            end
        end
    end
    
end





function cambio_equipo()

    if Show_view=="perfil" then
        --texto_help=""   
        if select_mp_slot=="weapon_izq" then
            --texto_help=texto_help.."izq " 
            if select_mp_Item ~= "quitar" then 
                local arm_inventario= getChars(select_mp_Item, weapon_inventary)
                if arm_inventario.cont > 0 then
                    arm_inventario.cont=arm_inventario.cont-1
                    if ActiveParty[seePerfil].weapon.left  == {}  then
                        --texto_help=texto_help.."A " 
                        --Si no tiene arma. agrega la nueva
                        ActiveParty[seePerfil].weapon.left=arm_inventario
                    else
                        --texto_help=texto_help.."b " 
                        --si ya tiene arma, guarda la vieja para agregar la nueva
                        local arma_left=ActiveParty[seePerfil].weapon.left
                        Remove_skill_equip(arma_left,ActiveParty[seePerfil])
                        add_inventary_Weapon_list(arma_left)
                        ActiveParty[seePerfil].weapon.left=arm_inventario
                    end
                    Add_skill_equip(arm_inventario,ActiveParty[seePerfil])
                    if ActiveParty[seePerfil].weapon.left~={} and ActiveParty[seePerfil].weapon.right  ~= nil and ActiveParty[seePerfil].weapon.left.modo=="2h" then
                        --texto_help=texto_help.."C " 
                        if  ActiveParty[seePerfil].weapon.right ~= {} then
                            local arma_right = ActiveParty[seePerfil].weapon.right
                            add_inventary_Weapon_list(arma_right)
                            Remove_skill_equip(arma_right,ActiveParty[seePerfil])
                        end
                        
                        ActiveParty[seePerfil].weapon.right={}
                    end  
                    if ActiveParty[seePerfil].weapon.left~={} and ActiveParty[seePerfil].weapon.right  ~= nil and ActiveParty[seePerfil].weapon.left.modo=="1h"  then
                        --texto_help=texto_help.."E " 
                        if  ActiveParty[seePerfil].weapon.right ~= {} and ActiveParty[seePerfil].weapon.right.modo=="2h" then
                            --texto_help=texto_help.."H " 
                            local arma_right = ActiveParty[seePerfil].weapon.right
                            add_inventary_Weapon_list(arma_right)
                            Remove_skill_equip(arma_right,ActiveParty[seePerfil])
                            ActiveParty[seePerfil].weapon.right={}
                        end    
                    end
                end        
            else 
                add_inventary_Weapon_list(ActiveParty[seePerfil].weapon.left)
                ActiveParty[seePerfil].weapon.left={}
            end          
        end  
        
        if select_mp_slot=="weapon_der" then
            --texto_help=texto_help.."der " 
            if select_mp_Item  ~= "quitar" then 
                local arm_inventario= getChars(select_mp_Item, weapon_inventary)
                if arm_inventario.cont > 0 then
                    arm_inventario.cont=arm_inventario.cont-1
                    if ActiveParty[seePerfil].weapon.right  == {} then
                        --texto_help=texto_help.."A " 
                        ActiveParty[seePerfil].weapon.right=arm_inventario
                    else
                        --texto_help=texto_help.."b " 
                        local arma_right=ActiveParty[seePerfil].weapon.right
                        Remove_skill_equip(arma_right,ActiveParty[seePerfil])
                        add_inventary_Weapon_list(arma_right)
                        ActiveParty[seePerfil].weapon.right=arm_inventario
                    end  
                    Add_skill_equip(arm_inventario,ActiveParty[seePerfil])
                    if ActiveParty[seePerfil].weapon.right  ~= {} and ActiveParty[seePerfil].weapon.right  ~= nil and ActiveParty[seePerfil].weapon.right.modo=="2h" then
                        --texto_help=texto_help.."C " 
                        if  ActiveParty[seePerfil].weapon.left ~= {} then
                            --texto_help=texto_help.."D " 
                            local arma_left=ActiveParty[seePerfil].weapon.left
                            Remove_skill_equip(arma_left,ActiveParty[seePerfil])
                            add_inventary_Weapon_list(arma_left)
                        end    
                        ActiveParty[seePerfil].weapon.left={}
                    end  
                    if ActiveParty[seePerfil].weapon.right  ~= {} and ActiveParty[seePerfil].weapon.right  ~= nil and ActiveParty[seePerfil].weapon.right.modo=="1h"  then
                        --texto_help=texto_help.."E " 
                        if  ActiveParty[seePerfil].weapon.left ~= {} and ActiveParty[seePerfil].weapon.left.modo=="2h" then
                            --texto_help=texto_help.."H " 
                            local arma_left=ActiveParty[seePerfil].weapon.left
                            Remove_skill_equip(arma_left,ActiveParty[seePerfil])
                            add_inventary_Weapon_list(arma_left)
                            ActiveParty[seePerfil].weapon.left={}
                        end    
                    end
                end      
            else 
                add_inventary_Weapon_list(ActiveParty[seePerfil].weapon.right)
                ActiveParty[seePerfil].weapon.right={}
            end  
        end 

        if select_mp_slot=="armadura" then
            if select_mp_Item  ~= "quitar" then 
                local temp= getChars(select_mp_Item, armadura_inventary)
                temp.cont=temp.cont-1
                local antiguoEquipado = ActiveParty[seePerfil].armadura
                ActiveParty[seePerfil].armadura=temp
                Add_skill_equip(temp,ActiveParty[seePerfil])
                add_inventary_Armadura_list(antiguoEquipado)
            else 
                local temp= ActiveParty[seePerfil].armadura
                ActiveParty[seePerfil].armadura={}
                Remove_skill_equip(temp,ActiveParty[seePerfil])
                add_inventary_Armadura_list(temp)
            end  
        end 

        if select_mp_slot=="accesorio_1" then
            if select_mp_Item  ~= "quitar" then 
                local temp= getChars(select_mp_Item, Accesorios_inventary)
                temp.cont=temp.cont-1
                local antiguoEquipado = ActiveParty[seePerfil].accesorio_1
                ActiveParty[seePerfil].accesorio_1=temp
                Add_skill_equip(temp,ActiveParty[seePerfil])
                if antiguoEquipado.id~=nil  then
                    Remove_skill_equip(antiguoEquipado,ActiveParty[seePerfil])
                end                
                add_inventary_Armadura_list(antiguoEquipado)
            else 
                local temp= ActiveParty[seePerfil].accesorio_1
                ActiveParty[seePerfil].accesorio_1={}
                Remove_skill_equip(temp,ActiveParty[seePerfil])
                add_inventary_Armadura_list(temp)
            end           
        end 

        if select_mp_slot=="accesorio_2" then
            if select_mp_Item  ~= "quitar" then 
                local temp= getChars(select_mp_Item, Accesorios_inventary)
                temp.cont=temp.cont-1
                local antiguoEquipado = ActiveParty[seePerfil].accesorio_2
                ActiveParty[seePerfil].accesorio_2=temp
                Add_skill_equip(temp,ActiveParty[seePerfil])
                if antiguoEquipado.id~=nil  then
                    Remove_skill_equip(antiguoEquipado,ActiveParty[seePerfil])
                end  
                add_inventary_Armadura_list(antiguoEquipado)
            else 
                local temp= ActiveParty[seePerfil].accesorio_2
                ActiveParty[seePerfil].accesorio_2={}
                Remove_skill_equip(temp,ActiveParty[seePerfil])
                add_inventary_Armadura_list(temp)
            end    
        end 

        if select_mp_slot=="accesorio_3" then

        end 

    end

end    



function bucles()
    --local jump_time=0
    local jump_time_max=3
    local avanzar_time_max=8
    local lateral_gravity=3
    local max_timer_summon=12
    if msg_exito_bol then
        msg_exito_cont_time=msg_exito_cont_time+1
        if msg_exito_max_time==msg_exito_cont_time then
            msg_exito_bol=false
            msg_exito_cont_time=0
        end
    end
    if animated_bonus_boton then
        bonus_boton_time_cont = bonus_boton_time_cont +1
        if bonus_boton_time_max==bonus_boton_time_cont then
            animated_bonus_boton=false
            bonus_boton_time_cont=0
        end
    end
    for k,v in pairs(Order) do
        if v.tipo == "player" then 
            if  v.react==true then
                if  v.react_time < react_time_max_var then
                    v.react_time=v.react_time+1 
                else
                    v.react=false
                    v.react_time=0
                end                
            end 
            if v.rest==false and v.jump then
                if  v.jump_time < jump_time_max then
                    v.x=v.x-lerp(0,20,jump_time_max)
                    v.jump_time=v.jump_time+1                   
                end              
                v.x=v.x+lateral_gravity
                if v.x >= v.x_ then
                    v.x = v.x_
                    v.rest=true
                    v.jump=false
                    v.jump_time=0
                end    
            end 
            if v.rest==false and v.avanzar then 
                if v.avanzar_time < avanzar_time_max then
                    v.x=v.x+lerp(0,60,avanzar_time_max)
                    v.avanzar_time=v.avanzar_time+1
                end  
                v.x=v.x-lateral_gravity
                if v.x <= v.x_ then
                    v.x = v.x_
                    v.rest=true
                    v.avanzar=false
                    v.avanzar_time=0
                end   
            end 

            if v.attack==true then 
                if v.attack_time < 80 then
                    v.attack_time=v.attack_time+1
                else
                    v.attack_time=0
                    v.attack=false
                end  
            end 
            if v.summon then
                if v.summon_time < max_timer_summon then
                    v.summon_x=v.summon_x+lerp(0,v.avanzar_x,max_timer_summon)
                    v.summon_time=v.summon_time+1
                end  
                v.summon_x=v.summon_x-4
                if v.summon_x <= v.summon_x_ then
                    v.summon_x = v.summon_x_
                    v.summon_time=0   
                    v.summon=false
                end 
            end
        end
        if v.tipo == "aliado" then 
            if  v.react==true then
                if  v.react_time < react_time_max_var then
                    v.react_time=v.react_time+1 
                else
                    v.react=false
                    v.react_time=0
                end                
            end 
            if v.rest==false and v.jump then
                if  v.jump_time < jump_time_max then
                    v.x=v.x-lerp(0,20,jump_time_max)
                    v.jump_time=v.jump_time+1                   
                end              
                v.x=v.x+lateral_gravity
                if v.x >= v.x_ then
                    v.x = v.x_
                    v.rest=true
                    v.jump=false
                    v.jump_time=0
                end    
            end 
            if v.rest==false and v.avanzar then 
                if v.avanzar_time < avanzar_time_max then
                    v.x=v.x+lerp(0,60,avanzar_time_max)
                    v.avanzar_time=v.avanzar_time+1
                end  
                v.x=v.x-lateral_gravity
                if v.x <= v.x_ then
                    v.x = v.x_
                    v.rest=true
                    v.avanzar=false
                    v.avanzar_time=0
                end   
            end  
            if v.attack==true then 
                if v.attack_time < 80 then
                    v.attack_time=v.attack_time+1
                else
                    v.attack_time=0
                    v.attack=false
                end  
            end 
        end
        if v.tipo=="enemy" then 
            if  v.react==true then
                if  v.react_time < react_time_max_var then
                    v.react_time=v.react_time+1 
                else
                    v.react=false
                    v.react_time=0
                end                
            end 
            if v.rest==false and v.jump  then
                if  v.jump_time < jump_time_max then
                    v.x=v.x+lerp(0,20,jump_time_max)
                    v.jump_time=v.jump_time+1
                end 
                v.x=v.x-lateral_gravity
                if v.x <= v.x_ then
                    v.x = v.x_
                    v.rest=true
                    v.jump=false
                    v.jump_time=0
                end    
            end 
            if v.rest==false and v.avanzar then 
                if v.avanzar_time < avanzar_time_max then
                    v.x=v.x-lerp(0,60,avanzar_time_max)
                    v.avanzar_time=v.avanzar_time+1
                end  
                v.x=v.x+lateral_gravity
                if v.x >= v.x_ then
                    v.x = v.x_
                    v.rest=true
                    v.avanzar=false
                    v.avanzar_time=0
                end   
            end
            if v.attack==true then 
                if v.attack_time ~= nil then
                    if v.attack_time < 48 then
                        v.attack_time=v.attack_time+1
                    else
                        v.attack_time=0
                        v.attack=false
                    end  
                end
            end 
        end        
    end    
end    

function executeTrigger()
    --for i, #List_trigger do
        --agregar funcion
        
        
    --  del(List_trigger,List_trigger[i])
    --end    
end    


function signal(str)
    add(List_trigger,str)
end    

function new_Order()
    isAlive()
    for k,v in pairs(Order) do
        if v.live then
            v.ini=v.agi+mod(v,"agi")+flr(rnd(20))
        else
            v.ini=0
        end    
    end
    qsort(Order, function(a,b) return abs(a.ini) > abs(b.ini) end)
end

function new_OrderV2()

end

function Turnos(o)

    local lista={}
    local final={}
    local low =0


      for i=1,6 do
        for k,v in pairs(o) do
            local r = {}
            local speed=0
            r.obj=v
            r.agi=v.agi
            r.ini=v.agi*i+flr(rnd(20))
            add(lista, r)
            if i==3 and low==0 then
                low=r.ini
            elseif i==3 and r.ini< low then
                low=r.ini
            end
        end
      end

      qsort(lista, function(a,b) return abs(a.ini) > abs(b.ini) end)

      for i=1,18 do
        add(final, lista[i].obj)
      end  

      return final
end

function AddTurnos(all,order,num)


    local round=num/#all
    local lista={}

        for k,v in pairs(all) do
            local r = {}
            local speed=0
            r.obj=v
            r.agi=v.agi
            r.ini=v.agi*round+flr(rnd(20))
            add(lista, r)
        end

        qsort(lista, function(a,b) return abs(a.ini) > abs(b.ini) end)

        for i=1,#all do
            add(order, lista[i].obj)
        end  


      return order
end

function mod(v,tipo)
    local value = 0
    if v.tipo=="player" then
        if tipo=="agi" then
            if v.state["lento"] ~= nil then
                value= value + v.state["lento"].value
            end
            if v.state["rapido"] ~= nil then
                value= value + v.state["rapido"].value
            end
            if v.perks["AGI+10%"] ~= nil then
                value= value + v.fue*0.1
            end
            if v.perks["AGI+30%"] ~= nil then
                value= value + v.fue*0.3
            end
            if v.perks["AGI+50%"] ~= nil then
                value= value + v.fue*0.5
            end
            if v.perks["AGI.J"] ~= nil then
                local n=enlaze_j(v,"AGI.J");
                value= value + n * 0.5
            end
        end
        if tipo=="dex" then
            if v.state["lento"] ~= nil then
                value= value + v.state["lento"].value
            end
            if v.state["rapido"] ~= nil then
                value= value + v.state["rapido"].value
            end
            if v.perks["DEX+10%"] ~= nil then
                value= value + v.dex*0.1
            end
            if v.perks["DEX+30%"] ~= nil then
                value= value + v.dex*0.3
            end
            if v.perks["DEX+50%"] ~= nil then
                value= value + v.dex*0.5
            end
            if v.perks["DEX.J"] ~= nil then
                local n=enlaze_j(v,"DEX.J");
                value= value + n * 0.5
            end
        end
        if tipo=="fue" then
            if v.state["super"] ~= nil then
                value= value + v.state["super"].value
            end
            if v.perks["SUPER_FUERZA"] ~= nil then
                value= value + v.fue
            end
            if v.perks["FUE+10%"] ~= nil then
                value= value + v.fue*0.1
            end
            if v.perks["FUE+30%"] ~= nil then
                value= value + v.fue*0.3
            end
            if v.perks["FUE+50%"] ~= nil then
                value= value + v.fue*0.5
            end
            if v.perks["FUE.J"] ~= nil then
                local n=enlaze_j(v,"FUE.J");
                value= value + n * 0.5
            end
        end
        if tipo=="con" then
            if v.state["super"] ~= nil then
                value= value + v.state["super"].value
            end
            if v.perks["SUPER_CONSTITUCION"] ~= nil then
                value= value + v.con
            end
            if v.perks["CON+10%"] ~= nil then
                value= value + v.con*0.1
            end
            if v.perks["CON+30%"] ~= nil then
                value= value + v.con*0.3
            end
            if v.perks["CON+50%"] ~= nil then
                value= value + v.con*0.5
            end
            if v.perks["CON.J"] ~= nil then
                local n=enlaze_j(v,"CON.J");
                value= value + n * 0.5
            end
        end
        if tipo=="pod" then
            if v.perks["POD+10%"] ~= nil then
                value= value + v.pod*0.1
            end
            if v.perks["POD+30%"] ~= nil then
                value= value + v.pod*0.3
            end
            if v.perks["POD+50%"] ~= nil then
                value= value + v.pod*0.5
            end
            if v.perks["POD.J"] ~= nil then
                local n=enlaze_j(v,"POD.J");
                value= value + n * 0.5
            end
        end    
        if tipo=="mnd" then
            if v.perks["MND+10%"] ~= nil then
                value= value + v.mnd*0.1
            end
            if v.perks["MND+30%"] ~= nil then
                value= value + v.mnd*0.3
            end
            if v.perks["MND+50%"] ~= nil then
                value= value + v.mnd*0.5
            end
            if v.perks["MND.J"] ~= nil then
                local n=enlaze_j(v,"MND.J");
                value= value + n * 0.5
            end
        end
        if tipo=="int" then
            if v.perks["INT+10%"] ~= nil then
                value= value + v.int*0.1
            end
            if v.perks["INT+30%"] ~= nil then
                value= value + v.int*0.3
            end
            if v.perks["INT+50%"] ~= nil then
                value= value + v.int*0.5
            end
            if v.perks["INT.J"] ~= nil then
                local n=enlaze_j(v,"INT.J");
                value= value + n * 0.5
            end
        end
        if tipo=="car" then
            if v.perks["CAR+10%"] ~= nil then
                value= value + v.car*0.1
            end
            if v.perks["CAR+30%"] ~= nil then
                value= value + v.car*0.3
            end
            if v.perks["CAR+50%"] ~= nil then
                value= value + v.car*0.5
            end
            if v.perks["CAR.J"] ~= nil then
                local n=enlaze_j(v,"CAR.J");
                value= value + n * 0.5
            end
        end
        if tipo=="per" then
            if v.perks["PER+10%"] ~= nil then
                value= value + v.per*0.1
            end
            if v.perks["PER+30%"] ~= nil then
                value= value + v.per*0.3
            end
            if v.perks["PER+50%"] ~= nil then
                value= value + v.per*0.5
            end
            if v.perks["PER.J"] ~= nil then
                local n=enlaze_j(v,"PER.J");
                value= value + n * 0.5
            end
        end
        if tipo=="hp"then
            if v.perks["HP_PLUS_VAR"] ~= nil then
                value= value + v.perks["HP_PLUS_VAR"].value
            end
            if v.perks["HP_PLUS_5"] ~= nil then
                value= value + v.perks["HP_PLUS_5"].value
            end
            if v.perks["HP+20%"] ~= nil then
                value= value + v.hp*0.2
            end
            if v.perks["HP+40%"] ~= nil then
                value= value +   v.hp*0.4
            end
            if v.perks["HP+60%"] ~= nil then
                value= value +   v.hp*0.6
            end
            if v.perks["HP+60%"] ~= nil then
                value= value +   v.hp*0.6
            end
            if v.perks["HP+80%"] ~= nil then
                value= value +   v.hp*0.8
            end
            if v.perks["HP+100%"] ~= nil then
                value= value +   v.hp*1
            end
            if v.perks["HP.J"] ~= nil then
                local n=enlaze_j(v,"HP.J");
                value= value + n * 0.5
            end
        end
        if tipo=="mp"then
            if v.perks["MP_PLUS_VAR"] ~= nil then
                value= value + v.perks["HP_PLUS_VAR"].value
            end
            if v.perks["MP_PLUS_5"] ~= nil then
                value= value + v.perks["HP_PLUS_5"].value
            end
            if v.perks["MP+20%"] ~= nil then
                value= value + v.hp*0.2
            end
            if v.perks["MP+40%"] ~= nil then
                value= value +   v.hp*0.4
            end
            if v.perks["MP+60%"] ~= nil then
                value= value +   v.hp*0.4
            end
            if v.perks["MP+60%"] ~= nil then
                value= value +   v.hp*0.4
            end
            if v.perks["MP+80%"] ~= nil then
                value= value +   v.hp*0.4
            end
            if v.perks["MP.J"] ~= nil then
                local n=enlaze_j(v,"MP.J");
                value= value + n * 0.5
            end
        end
    end
    return value
end    


function enlaze_j(v,str)
    local num=0
    if str=="MP.J" then
        num= num + count_items("piedra_roja")
    end
    if str=="HP.J" then
        num= num + count_items("piedra_azul")
        
    end

    if str=="AGI.J" then
        num= num + count_items("piedra_liviana")
    end

    if str=="DEX.J" then
        num= num + count_items("piedra_maleable")
    end
    
    if str=="FUE.J" then
        num= num + count_items("piedra_pesada")
    end    
    if str=="CON.J" then
        num= num + count_items("piedra_resistente")
    end
    if str=="POD.J" then
        num= num + count_items("piedra_energizante")
    end
    if str=="MND.J" then
        num= num + count_items("piedra_clara")
    end    
    if str=="INT.J" then
        num= num + count_items("piedra_transparante")
    end    
    if str=="CAR.J" then
        num= num + count_items("piedra_hermosa")
    end    
    if str=="PER.J" then
        num= num + count_items("piedra_luminosa")
    end    

    if num > 200 then
        return 200
    else
        return num
    end    
end



function one_line_menu_op(list,hide)
                if Op<1 then
                    if #list>hide then
                        Op=hide
                    else
                        Op=#list
                    end    
                end
                if Op>#list then
                    Op=1
                end
                if Op>hide then
                    Op=1 
                end    

                if  Op>#list-(ini_view-1) then
                    if #list>6 then
                       if #list-(ini_view-1) < #list then
                            Op=1    
                            ini_view=1
                        end
                    else
                        Op=1
                    end
                end
                if ini_view<1 then
                    ini_view=(math.floor(#Actual.acc/hide)*hide)+1
                    Op=1
                end
end


function tree_line_menu_op(list,hide)
     if Op<1 then
                    if #list-(ini_view-1)<hide then
                        Op=hide
                    else
                        Op=#list-(ini_view-1)
                    end
                    if ini_view>1 then
                        ini_view=ini_view-6
                    end
                end
                if  Op>#list-(ini_view-1) then
                    if #list>hide then
                       if #list-(ini_view-1) < #list then
                            Op=1    
                            ini_view=1
                        end

                    else
                        Op=1
                    end

                    
                end
                if Op>hide then
                    ini_view=ini_view+6
                    Op=13
                end

end    

function inside()
    if Actual.acc ~= nil then
        if State=="select" then        
                if Op<1 then
                    if #Actual.acc>6 then
                        Op=6
                    else
                        Op=#Actual.acc
                    end    
                end
                if Op>#Actual.acc then
                    Op=1
                end
                if Op>6 then
                    Op=1 
                end    

                if  Op>#Actual.acc-(ini_view-1) then
                    if #Actual.acc>6 then
                       if #Actual.acc-(ini_view-1) < #Actual.acc then
                            Op=1    
                            ini_view=1
                        end
                    else
                        Op=1
                    end
                end


                if ini_view<1 then
                    ini_view=(math.floor(#Actual.acc/6)*6)+1
                    Op=1
                end
        end
        if State=="select oo" then
            if Acc=="magic" then
                if Op<1 then
                    Op=#Actual.mg

                end
                if  Op>#Actual.mg then
                    Op=1
                end
            end
        end    
        if State=="select o" then
            if Acc=="magic" then
                if Op<1 then
                    if #Actual.mg-(ini_view-1)<18 then
                        Op=18
                    else
                        Op=#Actual.mg-(ini_view-1)
                    end
                    if ini_view>1 then
                        ini_view=ini_view-6
                    end
                end
                if  Op>#Actual.mg-(ini_view-1) then
                    if #Actual.mg>18 then
                       if #Actual.mg-(ini_view-1) < #Actual.mg then
                            Op=1    
                            ini_view=1
                        end

                    else
                        Op=1
                    end

                    
                end
                if Op>18 then
                    ini_view=ini_view+6
                    Op=13
                end

            end
            if Acc=="tools" then
                if Op<1 then
                    Op=#Actual.tools
                end
                if  Op>#Actual.tools then
                    Op=1
                end
            end
            if Acc=="tecnica" then
                if Op<1 then
                    Op=#Actual.sk
                end
                if  Op>#Actual.sk then
                    Op=1
                end
            end
            if Acc=="bullet" then
                if Op<1 then
                    Op=#Actual.bullet
                end
                if  Op>#Actual.bullet then
                    Op=1
                end
            end
            if Acc=="mix" then
                if Op<1 then
                    Op=#Actual.mix
                end
                if  Op>#Actual.mix then
                    Op=1
                end
            end
            if Acc=="W.Arts" then
                if Op<1 then
                    Op=#Actual.art
                end
                if  Op>#Actual.art then
                    Op=1
                end
            end
            if Acc=="transformacion" then
                if Op<1 then
                    Op=#Actual.morph
                end
                if  Op>#Actual.morph then
                    Op=1
                end
            end
            if Acc=="Blu.magic" then
                if Op<1 then
                    Op=#Actual.blue
                end
                if  Op>#Actual.blue then
                    Op=1
                end
            end
            if Acc=="llamar" then
                if Op<1 then
                    Op=#Actual.beast
                end
                if  Op>#Actual.beast then
                    Op=1
                end
            end 
            if Acc=="invocar" then
                if Op<1 then
                    Op=#Actual.invo
                end
                if  Op>#Actual.invo then
                    Op=1
                end
            end 
        end
        if State=="select e" or State=="select ee" then
            if Op<1 then
                Op=#Show_enemy
            end
            if Op>#Show_enemy then
                Op=1
            end
        end
        if State=="select c" or State=="select cc" then
            if Op<1 then
                Op=#ActiveParty
            end
            if Op>#ActiveParty then
                Op=1
            end
        end
        if State=="select i" then

                if #items>6 then
                    if Op > fin_view  then
                        ini_view = ini_view + 1
                        fin_view = fin_view + 1
                    end
                    if Op < ini_view  then
                        ini_view = ini_view - 1
                        fin_view = fin_view - 1
                    end

                    if Op<1 then
                        ini_view = #items-6
                        fin_view = #items
                    end
                    if Op>#items then
                        ini_view=1
                        fin_view =6
                    end
                end
                if Op<1 then
                    Op=#items
                end
                if Op>#items then
                    Op=1
                end
        end
        if State=="select d" then
            if Op<1 then
                Op=#Death_party
            end
            if Op>#Death_party then
                Op=1
            end
        end
        if State=="select a" or State=="select aa" then
            if Op<1 then
                Op=#lista_todos
            end
            if Op>#lista_todos then
                Op=1
            end
        end
        if State=="select w" then
            if Op<1 then
                Op=#weapon_inventary
            end
            if Op>#weapon_inventary then
                Op=1
            end
        end 
    end 
end    

--menu estatos alterados


function estados_alterados(v)
    for n,i in pairs(v.state) do
        if i.id=="super" then
            if i.perp ==false then
                if i.cont>0 then
                    i.cont=i.cont-1
                else
                    del(v.state,i)
                end    
            end           
        end
        if i.id=="rapido" then
            if i.perp ==false then
                if i.cont>0 then
                    i.cont=i.cont-1
                else
                    del(v.state,i)
                end  
            end         
        end
        if i.id=="lento" then
            if i.cont>0 then                
                i.cont=i.cont-1
            else
                del(v.state,i)
            end 
        end
        if i.id=="paralisis" then
            if i.cont>0 then
                i.cont=i.cont-1
            else
                del(v.state,i)
            end 
        end
        if i.id=="congelar" then
            if i.cont>0 then
                i.cont=i.cont-1
            else
                del(v.state,i)
            end 
        end
        if i.id=="veneno" then
            if i.cont>0 then
                i.cont=i.cont-1
                if i.cont ==6 then
                    v.hp_=v.hp_-i.value
                end
            else
                del(v.state,i)
            end 
        end
    end
end





function Robot(v)
    --[
    local arreglo={}
    local comando_str = ""

    if #Pendientes>0 then
        arreglo = obtenerPrimerPendientes()
        eliminarPrimeraAccion()
    else
        next()
    end

    comando_str = arreglo[1]

    if comando_str=="ejecutar_Jump_caer" then
        v.next_atack = ""
        v.see = true
        if arreglo.hp_>0 then
            ejecutarMagia("saltar",arreglo[3], Order)
        else
            local nuevoObjetivo=NextObjetivo(arreglo[3], "enemy")
            ejecutarMagia("saltar",nuevoObjetivo, Order)
        end
        clean()
        next()
        wait_start()

    end

end    




function reset() 
    updateCharacter()   
    o=enemyGroups
    Order={}
    Show_enemy={}
    Total_enemy={}
    Show_party={}
    ActiveParty={}

    for i=1,3 do
        t=flr(rnd(#Nuevas_clases-1)+1)
        local r=copiar_tabla(Nuevas_clases[t])
        r.ini=Nuevas_clases[t].agi+flr(rnd(20))
        r.p=i
        r.id=Nuevas_clases[t].id..i
        r.name=Nuevas_clases[t].name
        r.x=posiciones_jugadores[i].x   
        r.y=posiciones_jugadores[i].y    
        r.x_=posiciones_jugadores[i].x   
        r.y_=posiciones_jugadores[i].y  
        r.hp_=r.hp+mod(r,"hp")
        r.mp_=r.mp+mod(r,"mp")
        add(ActiveParty,r)
        add(Show_party,r)
        add(Order, r)
    end

    for k,v in pairs(o[Nvg].enemyTeams) do
        v.ini=v.agi+flr(rnd(20))
        add(Order, v)
        add(All, v)
        add(Total_enemy,v)
        add(Show_enemy,v)
    end
    Order=Turnos(o)
    --qsort(Order, function(a,b) return abs(a.ini) > abs(b.ini) end)
    State="select"
    Modo="combat"
end  




function nextLevel() 
    updateCharacter()

    isWin=false
    wait_start()
    Turno=1   
    o=enemyGroups
    Show_enemy={}
    Total_enemy={}
    aliados={}
    Order={}
    TipoLevel=o[Nvg].tipo
    if o[Nvg].tipo=="batalla" then
        Modo="combat" 
    end
    if o[Nvg].tipo=="stand" then
        Modo = "NPC"
        Show_view = "standBy"
    end
    for k,t in pairs(ActiveParty) do
            t.ini=t.agi+flr(rnd(20))
            t.live=true
            add(Order, t)
    end
    if o[Nvg].tipo=="batalla"then
        for k,v in pairs(o[Nvg].enemyTeams) do
            local r = copiar_tabla(v)
            v.ini=r.agi+flr(rnd(20))
            add(Order, r)
            add(All, r)
            add(Total_enemy,r)
            add(Show_enemy,r)
        end   
    end
    Order=Turnos(o)
    --qsort(Order, function(a,b) return abs(a.ini) > abs(b.ini) end)
    State="select"
    Modo="combat"
end    



function updateCharacter()
    for k,v in pairs(ActiveParty) do
        for t,w in pairs(Order) do
            if v.id == w.id then
                w.hp_=v.hp_
                w.mp_=v.mp_
            end     
        end    
    end    
end    


function updateMonster()
    for k,v in pairs(Total_enemy) do
        for t,w in pairs(Order) do
            if w.tipo=="enemy" then
                if v.id == w.id then
                    v.hp_=w.hp_
                    v.mp_=w.mp_
                    v.lastDmg=w.lastDmg
                    v.lastDmgC=w.lastDmgC
                end
            end     
        end    
    end 

    for k,v in pairs(Show_enemy) do
        for t,w in pairs(Order) do
            if w.tipo=="enemy" then
                if v.id == w.id then
                    v.hp_=w.hp_
                    v.mp_=w.mp_
                    v.lastDmg=w.lastDmg
                    v.lastDmgM=w.lastDmgM
                    v.lastDmgC=w.lastDmgC
                end
            end     
        end    
    end 
end    


function cleanDmg()
    if b_dmg_txt==false then
        for k,v in pairs(Order) do
            v.lastDmg=0
            v.slDmg=false
            v.lastDmgM = ""
            v.typeMsg=false
        end
    end    
end  

function especialCleanDmg()
    if b_dmg_txt==false then
        for k,v in pairs(Order) do
            v.lastDmg=0
            v.slDmg=false
            v.lastDmgM = ""
            v.typeMsg=false
            v.cou = 0
            v.see = true
            v.next_atack=''
        end
    end    
end 

isWin=false

function winState()
    if #Show_enemy <=0 and isWin==false then
        win_wait=true
        isWin=true

        especialCleanDmg()
        Actualizar_nivel()

        Atributos_por_nivel()

        if enemyGroups[Nvg].tipo~="stand" then
            obtenerReconpensa() 
        end
        
        cleanCharacter()
        --cleanEnemy()
        Nvg=Nvg+1
        if Nvg>#enemyGroups then
            Nvg=1
            Show_view="travel"
            Eventos.travel=Eventos.travel+1
            Eventos.carta_actual = Eventos.level_card[Eventos.travel]
        end   
        --nextLevel()  
    end    
end    


function posible_new_character()
    if #ActiveParty<4 then
        --local t=flr(rnd(#allcharacter-1)+1)
        --posible_char=cOpiar_tabla(allcharacter[t])
    end
end

function add_rnd_character()
    if #ActiveParty<3 then
                local num= #ActiveParty+1
                local t=flr(rnd(#allcharacter-1)+1)
                local r=cOpiar_tabla(allcharacter[t])
                r.ini=allcharacter[t].agi+flr(rnd(20))
                r.p=num
                r.id=allcharacter[t].id..num
                r.name=allcharacter[t].name
                r.x=posiciones_jugadores[num].x   
                r.y=posiciones_jugadores[num].y    
                r.x_=posiciones_jugadores[num].x   
                r.y_=posiciones_jugadores[num].y  
                r.hp_=r.hp+mod(r,"hp")
                r.mp_=r.mp+mod(r,"mp")
                add(ActiveParty,r)
                add(Show_party,r)
                add(Order, r)
    end
end    

function Actualizar_nivel()
--lv
--experienceTable

    for k,i in pairs(Order) do
        if i.tipo=="player" then
            local avanzar=true
            if i.lv <100 then
                while(avanzar) do
                    if i.exp>=experienceTable[i.lv+1] then
                        i.lv=i.lv+1
                    else
                        avanzar=false    
                    end
                end
            end

        end
    end

end


function subir_nivel(v)
    if v.exp>=experienceTable[v.lv+1] then
                v.lv=v.lv+1
    end

end

function Atributos_por_nivel()
    for k,i in pairs(Order) do
        if i.tipo=="player" then
            i.agi=i.agi_+math.floor(i.lv/i.levelUP.agi)
            i.fue=i.fue_+math.floor(i.lv/i.levelUP.fue)
            i.pod=i.pod_+math.floor(i.lv/i.levelUP.pod)
            i.con=i.con_+math.floor(i.lv/i.levelUP.con)
            i.dex=i.dex_+math.floor(i.lv/i.levelUP.dex)
            i.per=i.per_+math.floor(i.lv/i.levelUP.per)
            i.int=i.int_+math.floor(i.lv/i.levelUP.int)
            i.car=i.car_+math.floor(i.lv/i.levelUP.car)
            i.mnd=i.mnd_+math.floor(i.lv/i.levelUP.mnd)
            i.hp=i.con*5+i.lv
            i.hp_=i.hp+mod(i,"hp")
            i.mp=i.pod*3
            i.mp_=i.mp+mod(i,"mp")
        end
    end

end    

function add_state_nuevos(v)
    if v.perks["add_super"] ~= nil then
        v.state["super"]={name="super",id="super",spr=7,value=5,cont=5,ini=5}
    end
    if v.perks["add_rapido"] ~= nil then
        v.state["rapido"]={name="rapido",id="rapido",spr=10,value=5,cont=5,ini=5}
    end
    if v.perks["Auto_reflejo"] ~= nil then
        v.state["reflejo"]={name="reflejo",id="reflejo",spr=10,value=5,cont=5,ini=5}
    end
    if v.perks["Auto_coraza"] ~= nil then
        v.state["coraza"]={name="coraza",id="coraza",spr=10,value=5,cont=5,ini=5}
    end
    if v.perks["Auto_flotar"] ~= nil then
        v.state["flotar"]={name="flotar",id="flotar",spr=10,value=5,cont=5,ini=5}
    end
    if v.perks["Auto_regeneracion"] ~= nil then
        v.state["regeneracion"]={name="regeneracion",id="regeneracion",spr=10,value=5,cont=5,ini=5}
    end
end   
function add_efecto_perks(v)
    add_state_nuevos(v)
    add_debilidades(v)
    add_ventajas(v)
end    
--Mejorar sistema de debilidades
function add_debilidades(v)
    if v.perks["INM.FUE.DEB.HIE"] ~= nil then
        v.weak["hielo"]="hielo"
    end
    if v.perks["INM.HIE.DEB.ELE"] ~= nil then
        v.weak["electricidad"]="electricidad"
    end
    if v.perks["INM.ELE.DEB.FUE"] ~= nil then
        v.weak["fuego"]="fuego"
    end
    if v.perks["ABS.FUE.DEB.HIE.ELE"] ~= nil then
        v.weak["hielo"]="hielo"
        v.weak["electricidad"]="electricidad"
    end
    if v.perks["ABS.HIE.DEB.ELE.FUE"] ~= nil then
        v.weak["electricidad"]="electricidad"
        v.weak["fuego"]="fuego"
    end
    if v.perks["ABS.ELE.SDEB.FUE.HIE"] ~= nil then
        v.weak["fuego"]="fuego"
        v.weak["hielo"]="hielo"
    end
end    


function add_ventajas(v)
    if v.perks["RES.FUE"] ~= nil then
        v.ventaja["fuego"]="fuego"
    end
    if v.perks["RES.ELE"] ~= nil then
        v.ventaja["electricidad"]="electricidad"
    end
    if v.perks["RES.HIE"] ~= nil then
        v.ventaja["hielo"]="hielo"
    end
    if v.perks["RES.VEN"] ~= nil then
        v.ventaja["veneno"]="veneno"
    end

end    

msg_reconpensa=""
msg_exp=""
msg_dinero=""

lista_hechizos_azules_obtenidos={}


function cleanCharacter()
    for k,v in pairs(Order) do
        if v.tipo=="player" then
            v.ext=0
            v.magicCharge=0
            v.def=false
            v.prot=false
            v.carga=0
            v.gl_=v.gl
            v.sh_=v.sh
        end
    end
end    

function obtenerHechizoAzul()
    lista_hechizos_azules_obtenidos={}
    for t,h in pairs(enemyGroups[Nvg].enemyTeams) do
        lista_encuentro[h.id_mons]=true
        add(lista_hechizos_azules_obtenidos,monster_diccionario[h.name])
    end
end

function aprender_hechizo(v, f)
        if f.cont > 0 then
            f.cont=f.cont-1
            for k,h in pairs(f.add) do
                add(v.mg,h)
            end
        else
            Cancel_ejecutar=true    
        end
end 

--v personaje o --perks
function add_perks(v, o)
    v.perks[o.id]=o
end 

--v personaje o --perks
function remove_perks(v, o)
    local t={}
    t= v.perks[o.id]
    del(v.perks,t)
end 

function obtenerReconpensa()
    
    for i,v in pairs(Order) do
        if v.tipo=="player" then
            v.exp=v.exp+enemyGroups[Nvg].exp
            if v.id_class=="mago_azul"then
                
                obtenerHechizoAzul()
            end
        end

    end

    Dinero=Dinero+enemyGroups[Nvg].credit



    local list=enemyGroups[Nvg].recompensa
    msg_exp="Obtiene "..enemyGroups[Nvg].exp.." puntos de experiencia"
    msg_dinero="Obtiene "..enemyGroups[Nvg].credit.." guilds"
    local rand=flr(rnd(#list-1)+1)
    local str=list[rand]
    local item=lista_items_juego[str]


    if item ~= nil and item.name ~= nil then
        msg_reconpensa="Obtiene ".. item.name
        if item.tipo=="equipo" then
            add_inventary_Weapon_list(lista_items_juego[str])
            --add(weapon_inventary,lista_items_juego[str])
        end
        if item.tipo=="consumible" then
            add_inventary_items_list(lista_items_juego[str])
            --add(items,lista_items_juego[str])
        end
    else 
        msg_reconpensa=" problema obtener items".." id: ".. str .." n: "..rand
    end 
    
    
end    

function cleanEnemy()
    for k,t in pairs(Order) do 
        if t.tipo=="enemy" then del(Order,t) end
    end


end    

function isAlive()
    for k,v in pairs(Order) do
        if v.hp_<=0 then
            if v.tipo=="player" and v.live==true then
                add(Death_party,v)
            end
            v.live=false
            delCounter=delMaxCounter 
        end    
    end 
    if delCounter>0 then
        delCounter= delCounter-1
    end
end    

function checkLive(a)
    if a<=0 then
        return false
    end  
    return true
end    

----cambiar random
function logic(str)
    enemy_action(Actual,str)
    wait_start()
    b_dmg_txt=true
end    


function msg_efecto(v,str)
    v.lastDmgC="W"
    v.slDmg=true    
    v.lastDmgM=str
    v.typeMsg=true
end  

function jump_start(v)
    if v.hp>0 then
        v.jump=true
        v.jump_time=0
        v.react=true
        v.react_time=0
        v.rest=false
    end    
end    

--Mejorar
function selection_objetive()
    party_L={
    {a=flr(rnd(2))+1,b=1},
    {a=flr(rnd(6))+1,b=2},
    {a=flr(rnd(2))+1,b=3}
    }
    m_list={}
    party_L=qsort(party_L, function(a,b) return abs(a.a) > abs(b.a) end)
    return party_L[1].b
end    



function clean()
    Sel_e=""
    Sel_i=""
    Mg_sel=""
    Acc=""
end    




function getProtector(v)
    if v.tipo=="player" then
        if #Protectores >0 then
            local id= Protectores[#Protectores]
            for n,i in pairs(Order) do
                if id==i.id then
                    return i
                end    
            end
        else
            return v
        end        
    else 
        return v
    end    
end 


function DamageProccess(v, w,value, crit)
    local hit=1
    local calc=0
    if w~=nil and w.agi then
        calc = v.agi+mod(v,"agi") -w.agi+mod(v,"agi")
    end
    
    if calc > 0 then
        hit=hit+flr(calc/5)
    end

    local defensa=0
    local obb=getProtector(v)
    if v.sh_>0 then
        v.sh_=v.sh_-1
        obb.lastDmg=1
        obb.lastDmgM="bloqueado"
    else    
        if obb.def ~=nil and obb.def==true then 
            defensa=2*obb.con 
            if obb.ext<4 then
                obb.see_extra_turno=true
                obb.ext=obb.ext+1 
            end
        else 
             defensa=flr(obb.con/2) 
        end
        if obb.armadura~=nil and obb.armadura~={} and obb.armadura.def~=nil  then 
            defensa=defensa+obb.armadura.def  
        end
        if value < 0 then
            value=value + defensa
            if value > 0 then value=0  end
        end 
        
        value=StanceMode(value,w,obb,true)
        value=StanceMode(value,w,obb,false)

       -- if w.modo=="defensa" then
          --  value=flr(value*0.75)
        --end
        --if w.modo=="vuelo" then
          --  value=flr(value*1.25)
        --end
        if obb.modo=="defensa" then
            value=flr(value*0.75)
        end
        if obb.modo=="vuelo" then
            value=flr(value*0.75)
        end
        --Debug_temp= Debug_temp.."$"..value 
        obb.hp_=obb.hp_+(value*hit)
        obb.lastDmg=value
        obb.lastDmgM=value..crit.." "..defensa.."# "..hit.." hits"
    end
    
    if v.gl_<5 then
        v.gl_=v.gl_+1
    end  


    if value<0 then
        obb.lastDmgC="R"
    elseif value==0 then
        obb.lastDmgC="Y"
    else
        obb.lastDmgC="V"
    end
end    

function StanceMode(value,w,v,bol)

    if bol then
        --aaaaa
    else
        --aaaaa
    end


    return value
    
end

function adv_weak_Logic(v,w,list,b)
    local mu=1
    local crit=""
    if b then
        for i=1,#list do
            if v.ventaja[list[i]] ~= nil then
                mu=mu*0.6
                crit=crit.."%"
            end  
        end 
    else
        for i=1,#list do
            if v.weak[list[i]] ~= nil then
                mu=mu*2
                crit=crit.."!"
            end  
        end 
    end
    if mu>=2 then
        if Actual.see_extra_turno == false then
            Actual.ext_elem=true
        end
        --Actual.see_extra_turno=true
    end
    return mu, crit
end    

function eludido(v)
    v.lastDmgC="W"
    v.slDmg=true    
    v.lastDmgM="Eludido"
    v.typeMsg=true
end    

function Msg_enemigo(v,msg)
    v.lastDmgC="W"
    v.slDmg=true    
    v.lastDmgM=msg
    v.typeMsg=true
end    


Dice=0

function acertar(v,b)
    local at=0
    local ob=0
    if v.ventaja["back"] ~= nil then
        Dice=flr(rnd(20))
        at=b.dex+mod(b,"dex")+Dice-3
    else
        Dice=flr(rnd(20))
        at=b.dex+mod(b,"dex")+Dice
    end    
    ob=v.agi+mod(b,"agi")+8
    if at>=ob then
        activa_Contra_ataque(v)
    end
    return at>=ob 
end

function acertarMod(v,b, modificador)
    if v.ventaja["back"] ~= nil then
        Dice=flr(rnd(20))
        at=b.dex+mod(b,"dex")+Dice-3+modificador
    else
        Dice=flr(rnd(20))
        at=b.dex+mod(b,"dex")+Dice+modificador
    end    
    ob=v.agi+8
    if at>=ob then
        activa_Contra_ataque(v)
    end
    return at>=ob 
end   

v_contra_ataque={}
objetivo_reaccion={}
ejecutador_reaccion={}
bool_contra_ataque=false

function activa_Contra_ataque(v)

    if v.tipo=="player" and v.perks["contra_ataque"] ~= nil then
        v_contra_ataque=v
        objetivo_reaccion=v
        ejecutador_reaccion=Actual
        bool_contra_ataque=true
        tipo_reaccion="contra_ataque"
    end
end



function restablecer(v)
    v.live=checkLive(v.hp_)
    if v.tipo=="player" then
        if v.live==true then
            del(Death_party,v)
        end     
    end 
end    

function checks(v)
    v.live=checkLive(v.hp_)
    if v.tipo=="player" then
        if v.live~=true then
            del(Show_party,v)
        end  
    elseif v.tipo=="enemy" then 
        if v.live~=true then
            del(Show_enemy,v)            
        end 
    else  
        if v.live~=true then
            del(aliados,v)            
        end    
    end    
end

ContRound = 0
function next()
    if continuar_turno then
        continuar_turno=false
        still_turn=false
    end 
    if still_turn then
        Actual.see_extra_turno=false --siepre termina cuando se pasa el turno
        Turno = Turno + 1
        ContRound = ContRound + 1
        
        if ContRound == #All then
             Order=AddTurnos(All,Order,Turno)
             ContRound=0
        end
        
        if false then
            if Turno > #Order then
                Turno=1
                --new_Order()
                Order=Turnos(All)
            end
        end
        --Actual=Order[Turno]
        start_caracter=true    
    else
        Debug_temp="No pasa turno"
        still_turn=true
    end
    Init_b=true
    State="select"
end     

function wait(count,max,bol)
    if bol then
        count=count+1
        if count> max then
            count=0
            bol=false
        end
    end    
end    

function wait_enemy()
    if B_wait then
        timer_wait=timer_wait+1
        if timer_wait> max_timer_wait then
            timer_wait=0
            B_wait=false
        end
    end   
end



function count_dmg_timer()
    pass_time=pass_time+1
    if pass_time == max_pass_time then
        timer_dmg_txt=timer_dmg_txt+1
        pass_time=0
    end
    if timer_dmg_txt> max_timer_dmg_txt then
        timer_dmg_txt=0
        b_dmg_txt=false
    end    
end    



function updateParty()
    for k,v in pairs(ActiveParty) do
        for t,w in pairs(Order) do
            if w.tipo=="enemy" then
                if v.id == w.id then
                    v.hp_=w.hp_
                    v.mp_=w.mp_
                    v.lastDmg=w.lastDmg
                    v.lastDmgC=w.lastDmgC
                end
            end     
        end    
    end 
    for k,v in pairs(Show_party) do
        for t,w in pairs(Order) do
            if w.tipo=="enemy" then
                if v.id == w.id then
                    v.hp_=w.hp_
                    v.mp_=w.mp_
                    v.lastDmg=w.lastDmg
                    v.lastDmgC=w.lastDmgC
                end
            end     
        end    
    end 
end    


function count_wait_win()
    if win_wait then
        count_win_wait=count_win_wait+1
        if max_count_win_wait < count_win_wait then
            win_wait = false
            Modo="WIN"
        end    
    end
end    
--cont_start=0
function start(v)
    if Init_b then
        Init_b=false
        ini_view=1
    end
    if start_caracter then
        --cont_start=cont_start+1
        start_caracter=false
        
        if v.tipo=="player" then
            
            v.flee_attack=v.flee_attack_
            v.flee_heal=v.flee_heal_
            v.flee_support=v.flee_support_
            v.flee_magic=v.flee_magic_
            add_efecto_perks(v)
        end




        if v.gl_<6 then
            v.gl_=v.gl_+2
        end
        if v.gl_>5 then
            v.gl_=5
        end
        estados_alterados(v)
        v.def=false
        
        if v.prot then
            v.prot=false
            del(Protectores,v.id)
        end   
        if v.state["congelar"] ~= nil then
            msg_efecto(Actual, "congelado")
            next()
        end
    end
end   

page=1

function nextNpc()
    Op=1
    page=1
end    

function RecuperarEquipo()
    for k,i in pairs(ActiveParty) do
        Recuperar(i)
    end
end
function Recuperar(v)
    v.hp_=v.hp+mod(v,"hp")
    v.mp_=v.mp+mod(v,"mp")
end

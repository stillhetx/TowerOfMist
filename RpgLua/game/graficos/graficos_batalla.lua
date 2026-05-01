
function graph_mode()
    cls()

    --love.graphics.draw(fondo,0,0)

    if Modo=="WIN" then
        love.graphics.draw(Finish_fight, 0, 0,0,1,1)
    else
        love.graphics.draw(img_intro, 0, 0,0,1,1)
    end

    --love.graphics.rectangle("fill", 16,16, 608,60)
    --608,60
    

    fondo_background()
  

    count_dmg_timer()
    count_wait_win()

    if Modo=="combat" then
        
        for i=1,#ActiveParty do
            if State=="select" or State=="secundario" then
                if ActiveParty[i].live  then
                    love.graphics.print(ActiveParty[i].name.." HP: "..ActiveParty[i].hp_.."/"..(ActiveParty[i].hp+mod(ActiveParty[i],"hp")).." MP: "..ActiveParty[i].mp_.."/"..ActiveParty[i].mp.."",220,338+(40*(i-1)))
                    if #ActiveParty[i].mag~=nil then
                        --love.graphics.print("mag"..#ActiveParty[i].mag,550,338+(40*(i-1)))
                    end
                    if #ActiveParty[i].col~=nil then
                        --love.graphics.print("col"..#ActiveParty[i].col,550,338+(40*(i-1)))
                    end
                    Mostrar_estados(ActiveParty[i],236,334+16+(40*(i-1)),false)
                else
                    love.graphics.print(ActiveParty[i].name.." HP: "..ActiveParty[i].hp_.."/"..(ActiveParty[i].hp+mod(ActiveParty[i],"hp")).." MP: "..ActiveParty[i].mp_.."/"..ActiveParty[i].mp,220,338+(40*(i-1)))
                    Mostrar_estados(ActiveParty[i],236,334+16+(40*(i-1)),false)            
                end    
            else 
                local str_name=""
                if false then
                    if #ActiveParty[i].name>9 then
                        str_name=string.sub(ActiveParty[i].name, 1, 6).."..."
                    else
                        str_name=string.sub(ActiveParty[i].name, 1, 9)
                    end

                    if ActiveParty[i].live then
                        love.graphics.print(str_name.." HP: "..ActiveParty[i].hp_.." MP: "..ActiveParty[i].mp_.."/"..ActiveParty[i].mp,300,340+(18*i))
                    else
                        love.graphics.print(str_name.." HP: "..ActiveParty[i].hp_.." MP: "..ActiveParty[i].mp_.."/"..ActiveParty[i].mp,300,340+(18*i))
                    end 
                end
            end
        end
    end



    --love.graphics.print( "Debug: #Sprites "..  #fondo_sprites.quads.." ",30,114+(24*-4))

     if Cancel_ejecutar then
       -- love.graphics.print( "Cancel: true",30,120+(24*-2))
     else   
        --love.graphics.print( "Cancel: false",30,120+(24*-2))
     end

    if Execute then
        --love.graphics.print( "timer: ".." true "..timer_wait.." ",30,120+(24*-3))
    else
        --love.graphics.print( "timer: ".." false "..timer_wait.." ",30,120+(24*-3))
    end


    if Replace_Acc then
        love.graphics.print( "T debug: "..Acc.." "..State.." "..Msg_debug,30,120+(24*-3))
     else   
         love.graphics.print( "F debug: "..Acc.." "..State.." "..Msg_debug,30,120+(24*-3))
     end


     if true and not ERROR_MSG=="" then
        love.graphics.print( "ERROR: "..ERROR_MSG,30,120+(24*-3))
     end

    if true and not INTERRUCCION_MSG=="" then
        love.graphics.print( "ERROR: "..ERROR_MSG,30,120+(24*-4))
     end

    placeHolder()
    --love.graphics.print( "debug: "..Acc.." "..State,30,120+(24*-4))

        --love.graphics.print( "debug: "..Debug_temp.." ",30,120+(24*-3))
        --love.graphics.print( "debug: "..Modo.." "..Show_view,30,120+(24*-2))

    --timer_wait
    if State=="select o" and Acc=="magic" then
    end
    love.graphics.print( "nivel:  "..Nvg.." ",500,16+(24*0))

    if Modo=="combat" then
        mostrar_background()
        --spr(0,0,0,4,4,false,false,fondo_sprites)
        
        for k,v in pairs(ActiveParty) do
            if v.see then  
                if true then
                    love.graphics.print( "  "..Name_action.." ",200,20+(24*0))
                end
                
                Mostrar_enlaze(v, (v.x)+10,(v.y),false)
                show_spr(v, (v.x),(v.y), v.x,v.y+20-timer_dmg_txt,(v.x),(v.y+20),Temp_c==v.id and State=="select c",false)  
                show_msg_dmg(v,v.x,v.y+20-timer_dmg_txt,false)
                Barra_vida(v, (v.x-14),(v.y)) --- -10 0     0   +20
                --Mostrar_estados(v,(v.x-60),(v.y),false) --50 0
                Mostrar_animacion_ataque(v, (v.x+40),(v.y),false)
                Mostrar_icon_mode(v, (v.x),(v.y),false)
                Mostrar_animacion_dmg(v, (v.x),(v.y),false)
                Mostrar_animacion_summon(v, (v.summon_x),(v.summon_y),false)
                Mostrar_extra(v, (v.x+56),(v.y),false)
                Mostrar_shield(v,(v.x-26),v.y+26,false)
                Mostrar_barra(v, (v.x-16),(v.y+62),false)
                Mostrar_rc(v, (v.x-16),(v.y),false)
                Mostrar_extra_acciones(v, (v.x),(v.y),false)
            end 

        end    
        for k,v in pairs(Total_enemy) do
                --love.graphics.print( ":"..v.react_time.."-"..react_time_max_var,(v.x),(v.y-40))

                show_spr(v, (v.x),(v.y), v.x,v.y-timer_dmg_txt, (v.x),(v.y),Temp_e==v.id and State=="select e",false)
                show_msg_dmg(v,v.x,v.y-timer_dmg_txt,false)
                Barra_vida(v, (v.x+40), (v.y))
                Mostrar_estados(v,(v.x+76),(v.y),true)
                Mostrar_debilidades(v,(v.x+76),(v.y+20))
                Mostrar_animacion_ataque(v, (v.x),(v.y),true)
                Mostrar_animacion_dmg(v, (v.x+60),(v.y),true)
                
        end     
        
        for k,v in pairs(aliados) do
                --love.graphics.print( "debug: X "..v.x.." Y "..v.y,30,120+(24*0))
                show_spr(v, (v.x),(v.y), v.x,v.y-timer_dmg_txt, (v.x),(v.y),Temp_e==v.id and State=="select e",true)
                show_msg_dmg(v,v.x,v.y-timer_dmg_txt,false)
                Mostrar_barra(v, (v.x-16),(v.y+62),false)
                Mostrar_estados(v,(v.x+76),(v.y),false)
                Mostrar_animacion_ataque(v, (v.x),(v.y),false)
                Mostrar_animacion_dmg(v, (v.x),(v.y),false)
                
        end 
        
        local menu_x=12
        local menu_y=314
        local menu_select_x=menu_x+12+60
        barra_turnos(600,100)
        bonus_boton()

        --for k,v in pairs(enemyGroups[Nvg].enemyTeams) do
        for k,v in pairs(EnemigosVivos) do
            print("#"..k.." "..v.id,350,222+(16*k),7)
        end
        print(">"..Op,350,222+(16*-1),7)

        

        if B_wait==false then
            --cuadroTexto(16,306,36,600/4)
            print(Actual.name.." X"..(Actual.ext+1),menu_x+38,menu_y+22,7)
            
            print("  ",menu_x+100,menu_y+24,7)

            spr_sheet(Actual.ico,menu_x+12,menu_y + 24,1,1,1,1,spritesIcon) 

            if Actual.tipo=="player" then

                local posAva={}
                posAva.x=30
                --posAva.x=120+26
                posAva.y=360

                show_spr(Actual, (posAva.x),(posAva.y), 0,0,(posAva.x),(posAva.y+20),Temp_c==Actual.id and State=="select c",false)  

                if State=="select" then
                    show_menus_name_wide(Actual.acc ,menu_select_x,menu_y)
                end
                if State=="secundario" then
                    show_menus(Acciones_secundarias ,menu_select_x,menu_y)
                end
                if State=="select l" and Acc=="magics" then 
                    Show_menus_list(Actual.mag,menu_select_x,menu_y)
                end
                if State=="select l" and Acc=="colecciones" then 
                    Show_menus_list(Actual.col,menu_select_x,menu_y)
                end
                if State=="select o" and Acc=="magic" then   
                    Show_menus_name_cost_magic(Actual.mg,menu_select_x,menu_y)
                end
                if State=="select o" and Acc=="w.magic" then   
                    Show_menus_name_cost_magic(Actual.milagros,menu_select_x,menu_y)
                end
                if State=="select v" and Acc=="extraer" then   
                    show_menus_name(SelectEnemigo.magicForce,menu_select_x,menu_y)
                end
                if State=="select m" and SubState=="number" then   
                    show_number_dial(menu_select_x,menu_y)
                end
                if State=="select o" and Acc=="spell.list" then   
                    show_menus_cont(Actual.mg,menu_select_x,menu_y)
                end
                if State=="select o" and Acc=="Power.Stone" then   
                    show_menus_name_cantidad(Actual.powerStone,menu_select_x,menu_y)
                end
                if State=="select o" and Acc=="transformacion" then   
                    show_menus_name_cost(Actual.morph,menu_select_x,menu_y)
                end
                if State=="select o" and Acc=="dual M." then   
                    Show_menus_name_cost_magic(Actual.mg,menu_select_x,menu_y)
                    --show_menus_name_cost(Actual.mg,menu_select_x,menu_y)
                end
                if State=="select o" and Acc=="llamar" then   
                    show_menus_name_cost(Actual.beast,menu_select_x,menu_y)
                end
                if State=="select o" and Acc=="spirit" then   
                    show_menus_name_cost(Actual.spirit,menu_select_x,menu_y)
                end
                if State=="select o" and Acc=="canciones" then   
                    show_menus_name_cost(Actual.cancion,menu_select_x,menu_y)
                end
                if State=="select o" and Acc=="bailes" then   
                    show_menus_tecnica(Actual.bailes,menu_select_x,menu_y)
                end
                if State=="select oo" and Acc=="dual M." then   
                    Show_menus_name_cost_magic(Actual.mg,menu_select_x,menu_y)
                    --show_menus_name_cost(Actual.mg,menu_select_x,menu_y)
                end
                if State=="select o" and Acc=="tecnica" then   
                    show_menus_tecnica(Actual.sk,menu_select_x,menu_y)
                end
                if State=="select o" and Acc=="W.Arts" then   
                    show_menus_tecnica(Actual.art,menu_select_x,menu_y)
                end
                if State=="select o" and Acc=="mix" then   
                    show_menus_name(Actual.mix,menu_select_x,menu_y)
                end
                if State=="select o" and Acc=="bullet" then   
                    show_menus_name(Actual.bullet,menu_select_x,menu_y)
                end 
                if State=="select o" and Acc=="Blu.magic" then   
                    show_menus_name(Actual.blue,menu_select_x,menu_y)
                end
                if State=="select o" and Acc=="invocar" then   
                    show_menus_name(Actual.invo,menu_select_x,menu_y)
                end
                if State=="select o" and Acc=="tools" then   
                    show_menus_name(Actual.tools,menu_select_x,menu_y)
                end
                if State=="select o" and Acc=="especiales" then   
                    show_menus_name(Actual.spe,menu_select_x,menu_y)
                end
                if State=="select a" or  State=="select aa"then
                    show_menus(lista_todos,menu_select_x,menu_y)
                end
                if State=="select e" or State=="select ee" then
                    show_menus_name(EnemigosVivos,menu_select_x,menu_y)
                end 
                if State=="select c" or State=="select cc" then
                    show_menus_name(AliadosVivos,menu_select_x,menu_y)
                end
                if State=="select d" then
                    show_menus_name(AliadosMuertos,menu_select_x,menu_y)
                end
                if State=="select i" then
                    menu_cont_name(items,6,menu_select_x+12+4,menu_y+24)
                end
                if State=="select w" then
                    menu_cont_name(weapon_inventary,6,menu_select_x+12+4,menu_y+24)
                end
                --arrow_menu(Op,menu_x, menu_y)
                arrow_menu_OLD(Op,menu_x+60, menu_y)
            end
        end 
    elseif Modo=="NPC" then 
        for k,v in pairs(ActiveParty) do
            if v.see then  
                show_spr(v, (v.x),(v.y), v.x,v.y+20-timer_dmg_txt,(v.x),(v.y+20),Temp_c==v.id and State=="select c")  
                Barra_vida(v, (v.x-10),(v.y)) --- -10 0     0   +20
            end 
        end      
        
    else

        local off=120
        local offx=50
        print("you win",240+offx,240-off)
        print(msg_reconpensa,100+offx,280-off)
        print(msg_exp,100+offx,300-off)
        print(msg_dinero,100+offx,320-off)

        for i,v in pairs(lista_hechizos_azules_obtenidos) do
            print(v,100+offx,320+(i*20)-off)
        end
    end                          
end


function placeHolder()
    if false then
        spr_sheet_avanzado(1,posiciones_jugadores[4].x,posiciones_jugadores[4].y,2,2,1,1,sprites)
        spr_sheet_avanzado(2,posiciones_jugadores[5].x,posiciones_jugadores[5].y,2,2,1,1,sprites)
        spr_sheet_avanzado(5,posiciones_jugadores[6].x,posiciones_jugadores[6].y,2,2,1,1,sprites)
    end

end


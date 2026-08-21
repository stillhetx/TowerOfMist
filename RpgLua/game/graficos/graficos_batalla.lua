Graficos_Batalla={}
require("game/graficos/graficos_batalla_menu")
require("game/graficos/graficos_batalla_debug_menu")
require("game/graficos/graficos_batalla_show_character")
require("game/graficos/graficos_batalla_show_enemy")
require("game/graficos/graficos_batalla_show_otros")
require("game/graficos/graficos_batalla_offview_panels")


function graph_mode()
    cls()

    --love.graphics.draw(fondo,0,0)

 

    --love.graphics.rectangle("fill", 16,16, 608,60)
    --608,60
    
    Graficos_Batalla.off_panel()

    fondo_background()
  

    count_dmg_timer()
    count_wait_win()



    if true then
        Graficos_Batalla.debug_log()
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
        

        Graficos_Batalla.show_character()

        Graficos_Batalla.show_enemy()
   
        Graficos_Batalla.show_otros()
        
        Animacion.show_anima_pile()

        love.graphics.setColor(0,0,0)
        love.graphics.rectangle("fill", 0,320, 800,200)
        love.graphics.setColor(255,255,255) -- reset colours

        if Modo=="combat" then
            
            for i=1,#ActiveParty do
                
                if State=="select" or State=="secundario" then
                --if State=="select"  then
                    --love.graphics.print("show"..State,20,40)
                    if ActiveParty[i].live  then
                    --if true  then
                        --love.graphics.print("show"..State.." "..ActiveParty[i].name,220,338-30)
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
        
        local menu_x=12
        local menu_y=314
        local menu_select_x=menu_x+12+60
        barra_turnos(600,100)
        bonus_boton()

        --for k,v in pairs(enemyGroups[Nvg].enemyTeams) do
        for k,v in pairs(EnemigosVivos) do
            --print("#"..k.." "..v.id,350,222+(16*k),7)
        end
        --print(">"..Op,350,222+(16*-1),7)
        
        if State~="select" and State~="secundario"  then
            love.graphics.setColor(0,0,0)
            love.graphics.rectangle("fill", 0,320, 800,200)
            love.graphics.setColor(255,255,255) -- reset colours
        end
        
        Graficos_Batalla.menu()
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
    
    if Modo=="WIN" then
        love.graphics.draw(Finish_fight, 0, 0,0,1,1)
    else
        love.graphics.draw(img_intro, 0, 0,0,1,1)
    end
end


function placeHolder()
    if false then
        spr_sheet_avanzado(1,posiciones_jugadores[4].x,posiciones_jugadores[4].y,2,2,1,1,sprites)
        spr_sheet_avanzado(2,posiciones_jugadores[5].x,posiciones_jugadores[5].y,2,2,1,1,sprites)
        spr_sheet_avanzado(5,posiciones_jugadores[6].x,posiciones_jugadores[6].y,2,2,1,1,sprites)
    end

end


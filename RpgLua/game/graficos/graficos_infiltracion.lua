function InfiltracionData.draw()
--InfiltracionData.Nivel_busqueda
    love.graphics.draw(Finish_fight, 0, 0,0,1,1)

        love.graphics.print("# infiltracion  ",16,16)

        if InfiltracionData.Action_label~="" then
            love.graphics.print("["..InfiltracionData.Action_label.."]",16,16+(24*1))
        end
        --nivel de vigilancia
        sprSheetV2(1408, 300, 16+(24*0), 1,1,false,false,_G["new_sprites_jobs"],1,1,64)
        local enemigos=""
        if InfiltracionData.seeEnemys == true then
            love.graphics.print("N.E frente: "..InfiltracionData.NmOutside,16,16+(24*2))
            love.graphics.print("N.E dentro: "..InfiltracionData.NmInside,16,16+(24*3))
        else
            love.graphics.print("N.E frente: ? ",16,16+(24*2))
            love.graphics.print("N.E dentro: ? ",16,16+(24*3))
        end

        

        local cont_x=0
        if true then
            for k,v in pairs(ActiveParty) do
                if v.see then 
                    --show_spr(v, 100+cont_x,((36*(3-v.sheet[4])))+120, 0,0,(v.x),(v.y+20),Temp_c==v.id and State=="select c",true)  
                    anim_char_avanzadoV2(v,40+cont_x,((32*(3-v.sheet[4])))+120,true,64)
                    if v.stealh_inside ==true then
                        if InfiltracionData.numero_char==k then
                            love.graphics.print("> [Infiltrado]",40+cont_x,16+(24*9))
                        else
                            love.graphics.print(" [Infiltrado]",40+cont_x,16+(24*9))

                        end
                    else
                        if InfiltracionData.numero_char==k then
                            love.graphics.print("> [Frente]",40+cont_x,16+(24*9))
                        else
                            love.graphics.print(" [Frente]",40+cont_x,16+(24*9))
                        end
                    end  
                            
                
                end  
                cont_x=cont_x + 100 + (32*(v.sheet[3])) 
                --cont_n=cont_n+1
            end  
        end
        local charr={}
        charr=InfiltracionData.Actual_char
        --love.graphics.print(InfiltracionData.posiciones[InfiltracionData.numero_char],16,16+(24*2))
        --InfiltracionData.posiciones
        if charr.stealh_inside ==true then
           -- love.graphics.print(" [Infiltrado]",16,16+(24*4))
        else

           -- love.graphics.print(" [Frente]",16,16+(24*4))
        end    
        
       -- anim_char_avanzadoV2(charr,150,((32*(3-charr.sheet[4])))+120,false,64)


        Draw_nivel_busqueda()

        --nivel de alerta
        --sprSheetV2(1347, 600-60, 24+(24*0), 1,1,false,false,_G["new_sprites_jobs"],1,1,64)
        for i=1 , InfiltracionData.Nivel_tension do
            sprSheetV2(1348, 600-16, 24+(32*i), 1,1,false,false,_G["new_sprites_jobs"],1,1,64)
        end

        for k,v in pairs(InfiltracionData.RollList) do
           -- sprSheetV2(1350+v, 100+(24*k), 116, 1,1,false,false,_G["new_sprites_jobs"],1,1,64)
            sprSheetV2(1350+(v-1), 200+(34*k), 48, 1,1,false,false,_G["new_sprites_jobs"],1,1,64)

        end

        --ojos
        sprSheetV2(1284, 100, 116+(24*4), 1,1,false,false,_G["new_sprites_jobs"],1,1,64)


end

function Draw_nivel_busqueda()

    local tiles=0

   


    if InfiltracionData.tiles[InfiltracionData.Nivel_busqueda] then
        tiles = InfiltracionData.tiles[InfiltracionData.Nivel_busqueda]
    end


            --InfiltracionData.Nivel_infiltracion
    if InfiltracionData.Nivel_infiltracion ~= 0 then
                sprSheetV2(tiles+(InfiltracionData.Nivel_infiltracion-1), 80+100, 40, 1,1,false,false,_G["new_sprites_jobs"],1,1,64)
    end    

    if InfiltracionData.Actual_char.stealh_inside == true then
        for k,v in pairs(InfiltracionData.Acciones_base_inside) do
            love.graphics.print(" "..v.name,30,244+(24*k))
        end
    else

        for k,v in pairs(InfiltracionData.Acciones_base_outside) do
            love.graphics.print(" "..v.name,30,244+(24*k))
        end

    end

    love.graphics.print(">",24,244+(24*InfiltracionData.Op))


    Debug_draw()
    
end


function Debug_draw()
    love.graphics.setColor(0,255,0)
        love.graphics.print(" "..InfiltracionData.State,450,24+(24*0))
      -- love.graphics.print(" "..InfiltracionData.NmOutside.."/"..InfiltracionData.NmInside,450,24+(24*1))
       --love.graphics.print("infil: "..InfiltracionData.Nivel_infiltracion ,450,24+(24*2))
       --love.graphics.print("Busq: "..InfiltracionData.Nivel_busqueda ,450,24+(24*3))
       --love.graphics.print("Char: "..InfiltracionData.numero_char ,450,24+(24*4))
       --love.graphics.print("ROLLL: "..#InfiltracionData.RollList ,450,24+(24*5))


       love.graphics.setColor(255,255,255)

end
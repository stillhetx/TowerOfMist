function Graficos_Batalla.show_enemy()
        for k,v in pairs(Total_enemy) do

                if v.NoActivo == true then
                        --love.graphics.print( "NO activo",(v.x),(v.y-40))
                else
                       -- love.graphics.print( "NO activo",(v.x),(v.y-40))
                end
                
                
                local side = false
                if v.NoActivo and v.NoActivo == true then
                        side = true
                else
                        side = false
                end

                show_spr(v, (v.x),(v.y), v.x,v.y-timer_dmg_txt, (v.x),(v.y),Temp_e==v.id and State=="select e",side)
                --show_msg_dmg(v,v.x,v.y-timer_dmg_txt,false)
                Barra_vida(v, (v.x+40), (v.y))
                Mostrar_estados(v,(v.x+76),(v.y),true)
                Mostrar_debilidades(v,(v.x+76),(v.y+20))
                --Mostrar_animacion_ataque(v, (v.x),(v.y),true)
                --Mostrar_animacion_dmg(v, (v.x+60),(v.y),true)
                
        end  
end
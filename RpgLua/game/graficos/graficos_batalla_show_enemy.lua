function Graficos_Batalla.show_enemy()
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
end
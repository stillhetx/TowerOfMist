function Graficos_Batalla.show_otros()
        for k,v in pairs(aliados) do
                --love.graphics.print( "debug: X "..v.x.." Y "..v.y,30,120+(24*0))
                show_spr(v, (v.x),(v.y), v.x,v.y-timer_dmg_txt, (v.x),(v.y),Temp_e==v.id and State=="select e",true)
                show_msg_dmg(v,v.x,v.y-timer_dmg_txt,false)
                Mostrar_barra(v, (v.x-16),(v.y+62),false)
                Mostrar_estados(v,(v.x+76),(v.y),false)
                Mostrar_animacion_ataque(v, (v.x),(v.y),false)
                Mostrar_animacion_dmg(v, (v.x),(v.y),false)
                
        end 
end
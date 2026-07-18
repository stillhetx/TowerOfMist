function Graficos_Batalla.show_character()
    for k,v in pairs(ActiveParty) do
            if v.see then  
                if true then
                    love.graphics.print( "  "..Name_action.." ",200,20+(24*0))
                end
                if Actual.id==v.id then
                    Mostrar_enlaze(v, (v.x)+10,(v.y),false)
                    Mostrar_icon_mode(v, (v.x),(v.y),false)
                    Mostrar_extra(v, (v.x+v.hub.x+56),(v.y+v.hub.y+(32*(3-v.sheet[4]))),false)
                    Mostrar_shield(v,(v.x-26),v.y+26,false)
                    Mostrar_rc(v, (v.x-16),(v.y),false)
                    Mostrar_extra_acciones(v, (v.x),(v.y),false)
                    
                end
                
                show_spr(v, (v.x),(v.y+(36*(3-v.sheet[4]))), v.x,v.y+20-timer_dmg_txt,(v.x),(v.y+20),Temp_c==v.id and State=="select c",false)  
                show_msg_dmg(v,v.x,v.y+20-timer_dmg_txt,false)
                Barra_vida(v, (v.x-14),(v.y)) --- -10 0     0   +20
                --Mostrar_estados(v,(v.x-60),(v.y),false) --50 0
                Mostrar_animacion_ataque(v, (v.x+40),(v.y),false)
                Mostrar_animacion_dmg(v, (v.x),(v.y),false)
                Mostrar_animacion_summon(v, (v.summon_x),(v.summon_y),false)
                Mostrar_barra(v, (v.x-16),(v.y+62),false)

            end 

    end    

end

function Graficos_Batalla.menu()

    local menu_x=12
    local menu_y=314
    local menu_select_x=menu_x+12+60

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

                show_spr(Actual, (posAva.x),(posAva.y), 0,0,(posAva.x),(posAva.y+20),Temp_c==Actual.id and State=="select_c",false)  
                love.graphics.setColor(0,0,0)
                love.graphics.rectangle("fill", 0,464, 800,20)
                love.graphics.setColor(255,255,255) -- reset colours

                if State=="select" then
                    show_menus_name_wide(Actual.acc ,menu_select_x,menu_y)
                end
                if State=="secundario" then
                    show_menus(Acciones_secundarias ,menu_select_x,menu_y)
                end
                if State=="select_l" and Acc=="magics" then 
                    Show_menus_list(Actual.mag,menu_select_x,menu_y)
                end
                if State=="select_l" and Acc=="colecciones" then 
                    Show_menus_list(Actual.col,menu_select_x,menu_y)
                end
                if State=="select_o" and Acc=="magic" then   
                    Show_menus_name_cost_magic(Actual.mg,menu_select_x,menu_y)
                end
                if State=="select_meta" and Acc=="magic" then   
                    Show_menus_name_cost_magic(Actual.meta,menu_select_x,menu_y)
                end
                if State=="select_o" and Acc=="w.magic" then   
                    Show_menus_name_cost_magic(Actual.milagros,menu_select_x,menu_y)
                end
                if State=="select_v" and Acc=="extraer" then   
                    show_menus_name(SelectEnemigo.magicForce,menu_select_x,menu_y)
                end
                if State=="select_m" and SubState=="number" then   
                    show_number_dial(menu_select_x,menu_y)
                end
                if State=="select_o" and Acc=="spell.list" then   
                    show_menus_cont(Actual.mg,menu_select_x,menu_y)
                end
                if State=="select_o" and Acc=="Power.Stone" then   
                    show_menus_name_cantidad(Actual.powerStone,menu_select_x,menu_y)
                end
                if State=="select_o" and Acc=="transformacion" then   
                    show_menus_name_cost(Actual.morph,menu_select_x,menu_y)
                end
                if State=="select_o" and Acc=="dual M." then   
                    Show_menus_name_cost_magic(Actual.mg,menu_select_x,menu_y)
                    --show_menus_name_cost(Actual.mg,menu_select_x,menu_y)
                end
                if State=="select_o" and Acc=="llamar" then   
                    show_menus_name_cost(Actual.beast,menu_select_x,menu_y)
                end
                if State=="select_o" and Acc=="spirit" then   
                    show_menus_name_cost(Actual.spirit,menu_select_x,menu_y)
                end
                if State=="select_o" and Acc=="canciones" then   
                    show_menus_name_cost(Actual.cancion,menu_select_x,menu_y)
                end
                if State=="select_o" and Acc=="bailes" then   
                    show_menus_tecnica(Actual.bailes,menu_select_x,menu_y)
                end
                if State=="select_oo" and Acc=="dual M." then   
                    Show_menus_name_cost_magic(Actual.mg,menu_select_x,menu_y)
                    --show_menus_name_cost(Actual.mg,menu_select_x,menu_y)
                end
                if State=="select_o" and Acc=="tecnica" then   
                    show_menus_tecnica(Actual.sk,menu_select_x,menu_y)
                end
                if State=="select_o" and Acc=="W.Arts" then   
                    show_menus_tecnica(Actual.art,menu_select_x,menu_y)
                end
                if State=="select_o" and Acc=="mix" then   
                    show_menus_name(Actual.mix,menu_select_x,menu_y)
                end
                if State=="select_o" and Acc=="bullet" then   
                    show_menus_name(Actual.bullet,menu_select_x,menu_y)
                end 
                if State=="select_o" and Acc=="Blu.magic" then   
                    show_menus_name(Actual.blue,menu_select_x,menu_y)
                end
                if State=="select_o" and Acc=="invocar" then   
                    show_menus_name(Actual.invo,menu_select_x,menu_y)
                end
                if State=="select_o" and Acc=="tools" then   
                    show_menus_name(Actual.tools,menu_select_x,menu_y)
                end
                if State=="select_o" and Acc=="especiales" then   
                    show_menus_name(Actual.spe,menu_select_x,menu_y)
                end
                if State=="select_o" and Acc=="espada" then   
                    show_menus_name(Actual.swm,menu_select_x,menu_y)
                end
                if State=="select_a" or  State=="select_aa"then
                    show_menus(lista_todos,menu_select_x,menu_y)
                end
                if State=="select_e" or State=="select_ee" then
                    show_menus_name(EnemigosVivos,menu_select_x,menu_y)
                end 
                if State=="select_c" or State=="select_cc" then
                    show_menus_name(AliadosVivos,menu_select_x,menu_y)
                end
                if State=="select_d" then
                    show_menus_name(AliadosMuertos,menu_select_x,menu_y)
                end
                if State=="select_i" then
                    --menu_cont_name(items,6,menu_select_x+12+4,menu_y+24)
                    --show_menus(items,menu_select_x,menu_y)
                    show_menus_name_cont(items,menu_select_x,menu_y)

                end
                if State=="select_w" then
                    menu_cont_name(weapon_inventary,6,menu_select_x+12+4,menu_y+24)
                end
                --arrow_menu(Op,menu_x, menu_y)
                arrow_menu_OLD(Op,menu_x+60, menu_y)
            end
        end 

end
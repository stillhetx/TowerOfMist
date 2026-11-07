
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

                local list=CombatMenu.get_list()
                if list then
                    CombatMenu.draw(list,menu_select_x,menu_y)
                elseif State=="select_m" and SubState=="number" then
                    show_number_dial(menu_select_x,menu_y)
                    arrow_menu_OLD(Op,menu_x+60, menu_y)
                end
            end
        end 

end
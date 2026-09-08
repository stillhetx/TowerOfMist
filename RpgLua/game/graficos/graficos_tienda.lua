function Tienda_mode()
    love.graphics.draw(Finish_fight, 0, 0,0,1,1)
    love.graphics.print("Tienda",36,2+(24*1))
    love.graphics.print("\""..Tienda.Name_store.."\"",36,2+(24*2))
    love.graphics.print("$: "..Dinero,360,2+(24*1))
    love.graphics.print("##: "..Tienda.tipo.." "..Tienda.etapa,360,2+(24*2))

    local cont_x=0
    local cont_n=0
    if false then
    --if Tienda.etapa=="front" or Tienda.etapa=="begin" then
        for k,v in pairs(ActiveParty) do
            if v.see then 
                show_spr(v, (v.x)+160,(v.y+(36*(3-v.sheet[4])))+120, v.x,v.y+20-timer_dmg_txt,(v.x),(v.y+20),Temp_c==v.id and State=="select c",true)  
            end    
        end  

        anim_char_avanzadoV2(Tienda.owner,50,220,false,64)
    else
        for k,v in pairs(ActiveParty) do
            if v.see then 
                --show_spr(v, 100+cont_x,((36*(3-v.sheet[4])))+120, 0,0,(v.x),(v.y+20),Temp_c==v.id and State=="select c",true)  
                anim_char_avanzadoV2(v,150+cont_x,((32*(3-v.sheet[4])))+120,true,64)
            end  
            love.graphics.setColor(0,200,0)
            --love.graphics.rectangle("line", 160+(cont_n*100),((36*(3-v.sheet[4])))+120,32*v.sheet[3] ,32*v.sheet[4])
            love.graphics.setColor(0,200,200)
            --love.graphics.rectangle("line", 100+(cont_n*100),((36*(3-v.sheet[4])))+120,64*v.sheet[3] ,32*v.sheet[4])
            love.graphics.setColor(255,255,255) -- reset colours
            cont_x=cont_x + 26 + (32*(v.sheet[3])) 
            --cont_n=cont_n+1
        end  
        anim_char_avanzadoV2(Tienda.owner,50-16,116,false,64)

        sprSheetV2(579, 50+40, 116+32, 1,1,false,false,_G["new_sprites_jobs"],2,2,64)

    end
    --love.graphics.print("##DEBUG: "..Debug_temp,360,2+(24*4))

    if Tienda.etapa=="show" and existList(Tienda.ListaStore[Tienda.Sel_tienda].id,items)  then
        local obj={}
        obj = getChars(Tienda.ListaStore[Tienda.Sel_tienda].id, items)
        love.graphics.print(" Tienes "..obj.cont.." "..obj.name,16,220+24)

        

    elseif Tienda.etapa=="show" then
        love.graphics.print("Posee ninguna "..Tienda.ListaStore[Tienda.Sel_tienda].name,30,220+24)
        if Tienda.ListaStore[Tienda.Sel_tienda].itemType=="arma" then
            love.graphics.print( Tienda.ListaStore[Tienda.Sel_tienda].objeto.name.." DMG (1-"..(Tienda.ListaStore[Tienda.Sel_tienda].objeto.w)..")+"..(Tienda.ListaStore[Tienda.Sel_tienda].objeto.bw) ,30,2+(24*5))
        end     
        if Tienda.ListaStore[Tienda.Sel_tienda].itemType=="escudo" then
            love.graphics.print( Tienda.ListaStore[Tienda.Sel_tienda].objeto.name.." DEF "..(Tienda.ListaStore[Tienda.Sel_tienda].objeto.def) ,30,2+(24*5))
        end   

        if Tienda.ListaStore[Tienda.Sel_tienda].itemType=="equip" then
            love.graphics.print( Tienda.ListaStore[Tienda.Sel_tienda].objeto.name.." DEF "..(Tienda.ListaStore[Tienda.Sel_tienda].objeto.def) ,30,2+(24*5))
        end   
        
    end


    if Tienda.etapa=="show" and Tienda.ListaStore[Tienda.Sel_tienda].itemType=="equip" then
            if GetDefense(ActiveParty[1].armadura)==GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then
                --
            elseif GetDefense(ActiveParty[1].armadura)>GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then 
                love.graphics.setColor(1, 0, 0)
            else
                love.graphics.setColor(0, 1, 0)
            end
            love.graphics.print(" def: "..GetDefense(ActiveParty[1].armadura).." "..GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*7))
            love.graphics.setColor(1, 1, 1)


            if GetMDefense(ActiveParty[1].armadura)==GetMDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then
                --
            elseif GetMDefense(ActiveParty[1].armadura)>GetMDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then 
                love.graphics.setColor(1, 0, 0)
            else
                love.graphics.setColor(0, 1, 0)
            end
            love.graphics.print(" mdef: "..GetMDefense(ActiveParty[1].armadura).." "..GetMDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*8))
            love.graphics.setColor(1, 1, 1)

            --#region
            if GetDefense(ActiveParty[2].armadura)==GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then
                --
            elseif GetDefense(ActiveParty[2].armadura)>GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then 
                love.graphics.setColor(1, 0, 0)
            else
                love.graphics.setColor(0, 1, 0)
            end
            love.graphics.print(" def: "..GetDefense(ActiveParty[2].armadura).." "..GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*10))
            love.graphics.setColor(1, 1, 1)


            if GetMDefense(ActiveParty[2].armadura)==GetMDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then
                --
            elseif GetMDefense(ActiveParty[2].armadura)>GetMDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then 
                love.graphics.setColor(1, 0, 0)
            else
                love.graphics.setColor(0, 1, 0)
            end
            love.graphics.print(" mdef: "..GetMDefense(ActiveParty[2].armadura).." "..GetMDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*11))
            love.graphics.setColor(1, 1, 1)

            -- 
            if GetDefense(ActiveParty[3].armadura)==GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then
                --
            elseif GetDefense(ActiveParty[3].armadura)>GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then 
                love.graphics.setColor(1, 0, 0)
            else
                love.graphics.setColor(0, 1, 0)
            end
            love.graphics.print(" def: "..GetDefense(ActiveParty[3].armadura).." "..GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*13))
            love.graphics.setColor(1, 1, 1)


            if GetMDefense(ActiveParty[3].armadura)==GetMDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then
                --
            elseif GetMDefense(ActiveParty[3].armadura)>GetMDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then 
                love.graphics.setColor(1, 0, 0)
            else
                love.graphics.setColor(0, 1, 0)
            end
            love.graphics.print(" mdef: "..GetMDefense(ActiveParty[3].armadura).." "..GetMDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*14))
            love.graphics.setColor(1, 1, 1)

    end    


    if Tienda.etapa=="show" and Tienda.ListaStore[Tienda.Sel_tienda].itemType=="escudo" then
        if ActiveParty[1].prof[Tienda.ListaStore[Tienda.Sel_tienda].objeto.familia]~= nil then
            if GetDefense(ActiveParty[1].weapon.left)==GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then
                --
            elseif GetDefense(ActiveParty[1].weapon.left)>GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then 
                love.graphics.setColor(1, 0, 0)
            else
                love.graphics.setColor(0, 1, 0)
            end
            love.graphics.print(" left  def: "..GetDefense(ActiveParty[1].weapon.left).." "..GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*7))
            love.graphics.setColor(1, 1, 1)

            if GetDefense(ActiveParty[1].weapon.right)==GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then
                --
            elseif GetDefense(ActiveParty[1].weapon.right)>GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then 
                love.graphics.setColor(1, 0, 0)
            else
                love.graphics.setColor(0, 1, 0)
            end
            love.graphics.print(" right def: "..GetDefense(ActiveParty[1].weapon.right).." "..GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*8))
            love.graphics.setColor(1, 1, 1)


        else
            love.graphics.print(" left  def: -- --",36,2+(24*6))
            love.graphics.print(" right def: -- --",36,2+(24*7))
        end
        

        if ActiveParty[2].prof[Tienda.ListaStore[Tienda.Sel_tienda].objeto.familia]~= nil then
            if GetDefense(ActiveParty[2].weapon.left)==GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then
                --
            elseif GetDefense(ActiveParty[2].weapon.left)>GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then 
                love.graphics.setColor(1, 0, 0)
            else
                love.graphics.setColor(0, 1, 0)
            end
            love.graphics.print(" left  def: "..GetDefense(ActiveParty[2].weapon.left).." "..GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*10))
            love.graphics.setColor(1, 1, 1)
            ---
            if GetDefense(ActiveParty[2].weapon.right)==GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then
                --
            elseif GetDefense(ActiveParty[2].weapon.right)>GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then 
                love.graphics.setColor(1, 0, 0)
            else
                love.graphics.setColor(0, 1, 0)
            end
            love.graphics.print(" right def: "..GetDefense(ActiveParty[2].weapon.right).." "..GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*11))
            love.graphics.setColor(1, 1, 1)


        else
                        love.graphics.print(" left def: -- --",36,2+(24*9))
                        love.graphics.print(" right def: -- --",36,2+(24*10))

        end

        if ActiveParty[3].prof[Tienda.ListaStore[Tienda.Sel_tienda].objeto.familia]~= nil then
            if GetDefense(ActiveParty[3].weapon.left)==GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then
                --
            elseif GetDefense(ActiveParty[3].weapon.left)>GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then 
                love.graphics.setColor(1, 0, 0)
            else
                love.graphics.setColor(0, 1, 0)
            end
            love.graphics.print(" left  def: "..GetDefense(ActiveParty[3].weapon.left).." "..GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*13))
            love.graphics.setColor(1, 1, 1)

            if GetDefense(ActiveParty[3].weapon.left)==GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then
                --
            elseif GetDefense(ActiveParty[3].weapon.left)>GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then 
                love.graphics.setColor(1, 0, 0)
            else
                love.graphics.setColor(0, 1, 0)
            end
            love.graphics.print(" right def: "..GetDefense(ActiveParty[3].weapon.left).." "..GetDefense(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*14))
            love.graphics.setColor(1, 1, 1)
        else
                        love.graphics.print(" left def: -- --",36,2+(24*12))
                        love.graphics.print(" right def: -- --",36,2+(24*13))

        end
    end    

    if Tienda.etapa=="show" and Tienda.ListaStore[Tienda.Sel_tienda].itemType=="arma" then
        
        if ActiveParty[1].prof[Tienda.ListaStore[Tienda.Sel_tienda].objeto.familia]~= nil then
            if GetPromDamage(ActiveParty[1].weapon.left)==GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then
                love.graphics.print(" left Dmg: "..GetPromDamage(ActiveParty[1].weapon.left).." "..GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*7))
            elseif GetPromDamage(ActiveParty[1].weapon.left)>GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then 
                love.graphics.setColor(1, 0, 0)
                love.graphics.print(" left Dmg: "..GetPromDamage(ActiveParty[1].weapon.left).." "..GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*7))    
                love.graphics.setColor(1, 1, 1)
            else
                love.graphics.setColor(0, 1, 0)
                love.graphics.print(" left Dmg: "..GetPromDamage(ActiveParty[1].weapon.left).." "..GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*7))    
                love.graphics.setColor(1, 1, 1)
            end
            
            if GetPromDamage(ActiveParty[1].weapon.right)==GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then
                love.graphics.print(" right Dmg: "..GetPromDamage(ActiveParty[1].weapon.right).." "..GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*8))
            elseif GetPromDamage(ActiveParty[1].weapon.right)>GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then 
                love.graphics.setColor(1, 0, 0)
                love.graphics.print(" right Dmg: "..GetPromDamage(ActiveParty[1].weapon.right).." "..GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*8))
                love.graphics.setColor(1, 1, 1)
            else
                love.graphics.setColor(0, 1, 0)
                love.graphics.print(" right Dmg: "..GetPromDamage(ActiveParty[1].weapon.right).." "..GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*8))
                love.graphics.setColor(1, 1, 1)
            end
        else
            love.graphics.print(" left Dmg: -- --",36,2+(24*7))
            love.graphics.print(" right Dmg: -- --",36,2+(24*8))


        end


        if ActiveParty[2].prof[Tienda.ListaStore[Tienda.Sel_tienda].objeto.familia]~= nil then

            if GetPromDamage(ActiveParty[2].weapon.left)==GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then
                love.graphics.print(" left Dmg: "..GetPromDamage(ActiveParty[2].weapon.left).." "..GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*10))
            elseif GetPromDamage(ActiveParty[2].weapon.left)>GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then 
                love.graphics.setColor(1, 0, 0)
                love.graphics.print(" left Dmg: "..GetPromDamage(ActiveParty[2].weapon.left).." "..GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*10))
                love.graphics.setColor(1, 1, 1)
            else
                love.graphics.setColor(0, 1, 0)
                love.graphics.print(" left Dmg: "..GetPromDamage(ActiveParty[2].weapon.left).." "..GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*10))
                love.graphics.setColor(1, 1, 1)
            end


            if GetPromDamage(ActiveParty[2].weapon.right)==GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then
                love.graphics.print(" right Dmg: "..GetPromDamage(ActiveParty[2].weapon.right).." "..GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*11))
            elseif GetPromDamage(ActiveParty[2].weapon.right)>GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then 
                love.graphics.setColor(1, 0, 0)
                love.graphics.print(" right Dmg: "..GetPromDamage(ActiveParty[2].weapon.right).." "..GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*11))
                love.graphics.setColor(1, 1, 1)
            else
                love.graphics.setColor(0, 1, 0)
                love.graphics.print(" right Dmg: "..GetPromDamage(ActiveParty[2].weapon.right).." "..GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*11))
                love.graphics.setColor(1, 1, 1)
            end
        else
            love.graphics.print(" left Dmg: -- --",36,2+(24*10))
            love.graphics.print(" right Dmg: -- --",36,2+(24*11))

        end


        if ActiveParty[3].prof[Tienda.ListaStore[Tienda.Sel_tienda].objeto.familia]~= nil then

            if GetPromDamage(ActiveParty[3].weapon.left)==GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then
                love.graphics.print(" left Dmg: "..GetPromDamage(ActiveParty[3].weapon.left).." "..GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*13))
            elseif GetPromDamage(ActiveParty[3].weapon.left)>GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then 
                love.graphics.setColor(1, 0, 0)
                love.graphics.print(" left Dmg: "..GetPromDamage(ActiveParty[3].weapon.left).." "..GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*13))
                love.graphics.setColor(1, 1, 1)
            else
                love.graphics.setColor(0, 1, 0)
                love.graphics.print(" left Dmg: "..GetPromDamage(ActiveParty[3].weapon.left).." "..GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*13))
                love.graphics.setColor(1, 1, 1)
            end


            if GetPromDamage(ActiveParty[3].weapon.right)==GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then
                love.graphics.print(" right Dmg: "..GetPromDamage(ActiveParty[3].weapon.right).." "..GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*14))
            elseif GetPromDamage(ActiveParty[3].weapon.right)>GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto) then 
                love.graphics.setColor(1, 0, 0)
                love.graphics.print(" right Dmg: "..GetPromDamage(ActiveParty[3].weapon.right).." "..GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*14))
                love.graphics.setColor(1, 1, 1)
            else
                love.graphics.setColor(0, 1, 0)
                love.graphics.print(" right Dmg: "..GetPromDamage(ActiveParty[3].weapon.right).." "..GetPromDamage(Tienda.ListaStore[Tienda.Sel_tienda].objeto).." ",36,2+(24*14))
                love.graphics.setColor(1, 1, 1)
            end
        else
            love.graphics.print(" left Dmg: -- --",36,2+(24*13))
            love.graphics.print(" right Dmg: -- --",36,2+(24*14))

        end


    end

    if Tienda.etapa=="front" or Tienda.etapa=="begin" then
        if Tienda.tipo=="store" then
            for k,i in pairs(Tienda.menu) do
                if Tienda.Sel_tienda==k then 
                    love.graphics.print( ">"..Tienda.menu[k].name ,400,220+(24*k))
                else 
                    love.graphics.print( " "..Tienda.menu[k].name ,400,220+(24*k))
                end
            end
        elseif Tienda.tipo=="inn" then
            for k,i in pairs(Tienda.inn) do
                if Tienda.Sel_tienda==k then 
                    love.graphics.print( ">"..Tienda.inn[k].name ,400,220+(24*k))
                else 
                    love.graphics.print( " "..Tienda.inn[k].name ,400,220+(24*k))
                end
            end
        end
    end    
    -- Tienda.ListaStore[Tienda.Sel_tienda].itemType=="arma"
    if Tienda.etapa=="show" then
        for k,i in pairs(Tienda.ListaStore) do
            if Tienda.Sel_tienda==k then
                love.graphics.print( ">"..i.name ,300,220+(24*k))
            else
                love.graphics.print( i.name ,300,220+(24*k))
            end
        end
    end    
    if Tienda.etapa=="show_sell" then
        --love.graphics.print( "mis items" ,300,220+(24*-1))
        for k,i in pairs(items) do
            if Tienda.Sel_tienda==k then
                love.graphics.print( ">"..i.name.." $"..i.cost.." ["..i.cont.."]" ,300,220+(24*k))
            else
                love.graphics.print( i.name.." $"..i.cost.." ["..i.cont.."]"  ,300,220+(24*k))
            end
        end
    end  
    if Tienda.etapa=="buy" or Tienda.etapa=="sell" or Tienda.etapa=="descanzar" then
        if Tienda.Sel_tienda==1 then 
            love.graphics.print( ">"..Tienda.confirmar[1].name ,300,220+(24*1))
        else 
            love.graphics.print( " "..Tienda.confirmar[1].name ,300,220+(24*1))
        end
        
        if Tienda.Sel_tienda==2 then 
            love.graphics.print( ">"..Tienda.confirmar[2].name  ,300,220+(24*2))
        else 
            love.graphics.print( " "..Tienda.confirmar[2].name ,300,220+(24*2))
        end
    end    
    if Tienda.etapa=="comprado" then
        love.graphics.print( " Articulo comprado " ,300,220+(24*1))
    end
    if Tienda.etapa=="vendido" then
        love.graphics.print( " Articulo vendido " ,300,220+(24*1))
    end
    if Tienda.etapa=="descanzado" then
        love.graphics.print( " El Equipo ha descanzado " ,300,220+(24*1))
    end
end
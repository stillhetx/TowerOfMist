function perfil_mode()
    --love.graphics.print("info_label:  state: "..state,10,5)
    love.graphics.draw(fondo,0,0)
    local l=seePerfil
    love.graphics.print(ActiveParty[l].name,20,2+(24*1))
    love.graphics.print("$: "..Dinero,360,2+(24*1))
    love.graphics.print("EXP: "..ActiveParty[l].exp,180,2+(24*1))
    love.graphics.print(" HP: "..ActiveParty[l].hp_.."/"..(ActiveParty[l].hp+mod(ActiveParty[l],"hp")).." MP: "..ActiveParty[l].mp_.."/"..(ActiveParty[l].mp+mod(ActiveParty[l],"mp")),20,2+(24*2))
    love.graphics.print("CON: "..(ActiveParty[l].con+mod(ActiveParty[l],"con")).." POD: "..(ActiveParty[l].pod+mod(ActiveParty[l],"pod")),20,20+(24*3))
    love.graphics.print("AGI: "..(ActiveParty[l].agi+mod(ActiveParty[l],"agi")).." DES: "..(ActiveParty[l].dex+mod(ActiveParty[l],"dex")),20,20+(24*4))
    love.graphics.print("FUE: "..(ActiveParty[l].fue+mod(ActiveParty[l],"fue")),20,20+(24*5))

    love.graphics.print("Lv: "..ActiveParty[l].lv,180,20+(24*5))
    love.graphics.print("ATTACK: "..(ActiveParty[l].fue+mod(ActiveParty[l],"fue")+promWeaponDmg(ActiveParty[l])),220,20+(24*3))
    love.graphics.print("defensa: "..(flr((ActiveParty[l].con+mod(ActiveParty[l],"con"))/2) + ModArmadura(ActiveParty[l])),220,20+(24*4))

    love.graphics.print( "debug:   "..Debug_temp,240,140+(24*0))
    --love.graphics.print( "debug:  "..#armadura_inventary_see.."/"..#armadura_inventary,400,120+(24*0))


    anim_char(ActiveParty[l],280,30)

    if showPerfil=="perfil" or showPerfil=="equip"  then

        if ActiveParty[l].weapon.left ~= nil and ActiveParty[l].weapon.left ~= {} and ActiveParty[l].weapon.left.name ~= nil then 
            love.graphics.print( "weapon L: "..ActiveParty[l].weapon.left.name,100,160+(24*0)) 
        else
            love.graphics.print( "weapon L: ",100,160+(24*0))
        end    

        if ActiveParty[l].weapon.right ~= nil and ActiveParty[l].weapon.right ~= {} and ActiveParty[l].weapon.right.name ~= nil then 
            love.graphics.print( "weapon R: "..ActiveParty[l].weapon.right.name,100,180+(24*0)) 
        else
            love.graphics.print( "weapon R: ",100,180+(24*0))
        end    

    end

    if showPerfil=="perfil" then

        love.graphics.print( ">" ,480,20+(24*Opm))

        for k,i in pairs(ActiveParty[l].opciones) do
            love.graphics.print( i ,500,20+(24*k))
        end

        love.graphics.print( "skill: ",30,220+(24*0))
        if #ActiveParty[l].mg>0 then
            for k,t in pairs(ActiveParty[l].mg) do
                love.graphics.print( t.name ,30,220+(24*k))
            end
        end
        if ActiveParty[l].sk~=nil then
            local nline=#ActiveParty[l].mg+1
            for k,i in pairs(ActiveParty[l].sk) do
                love.graphics.print( i.name ,30,220+(24*nline))
                nline=nline+1
            end
        end

        love.graphics.print( "Acciones:",300,220+(24*0))
        for k,i in pairs(ActiveParty[l].acc) do
            love.graphics.print( i ,300,220+(24*k))
        end

        love.graphics.print( "perks:",450,220+(24*0))
        local line=1
        for k,i in pairs(ActiveParty[l].perks) do
            love.graphics.print( i.name ,450,220+(24*line))
            line=line+1
        end

    end

    if showPerfil=="equip" then
        love.graphics.print( ">" ,80,220+(24*Opm))
        if select_mp=="equipo" then
            for k,i in pairs(equipo_slot) do
                love.graphics.print( i.id ,100,220+(24*k))
                if i.id == "weapon_izq" and ActiveParty[seePerfil].weapon.left ~= nil and ActiveParty[seePerfil].weapon.left.name ~= nil then
                    love.graphics.print( " : "..ActiveParty[seePerfil].weapon.left.name ,300,220+(24*k))
                end
                if i.id == "weapon_der" and ActiveParty[seePerfil].weapon.right ~= nil and ActiveParty[seePerfil].weapon.right.name ~= nil then
                    love.graphics.print( " : "..ActiveParty[seePerfil].weapon.right.name ,300,220+(24*k))
                end  
                if i.id == "armadura" and ActiveParty[seePerfil].armadura ~= nil  and ActiveParty[seePerfil].armadura ~= {} and ActiveParty[seePerfil].armadura.name ~= nil then
                    love.graphics.print( " : "..ActiveParty[seePerfil].armadura.name ,300,220+(24*k))
                end
                if i.id == "accesorio_1" and ActiveParty[seePerfil].accesorio_1 ~= nil  and ActiveParty[seePerfil].accesorio_1 ~= {} and ActiveParty[seePerfil].accesorio_1.name ~= nil then
                    love.graphics.print( " : "..ActiveParty[seePerfil].accesorio_1.name ,300,220+(24*k))
                end 
                if i.id == "accesorio_2" and ActiveParty[seePerfil].accesorio_2 ~= nil  and ActiveParty[seePerfil].accesorio_2 ~= {} and ActiveParty[seePerfil].accesorio_2.name ~= nil then
                    love.graphics.print( " : "..ActiveParty[seePerfil].accesorio_2.name ,300,220+(24*k))
                end
            end
        end    

        if select_mp=="weapon" then
            love.graphics.print( "armas: ",100,220+(24*0))
            menu_weapon(weapon_inventary_see,9)
        end    

        if select_mp=="armadura" then
            love.graphics.print( "armadura: ",100,220+(24*0))
            menu_armor(armadura_inventary_see,9)
        end 

        if select_mp=="accesorio" then
            love.graphics.print( "accesorio: ",100,220+(24*0))
            menu(Accesorios_inventary_see,9)
        end 
    end

    if showPerfil=="inventario" then
        if select_mp=="inventario" then
            love.graphics.print( ">" ,80,220+(24*Opm))
            for k,i in pairs(items) do
                love.graphics.print( i.name.."["..i.cont.."]" ,100,220+(24*k))
            end
        end     
        if select_mp=="aceptar" then
            love.graphics.print( ">" ,80,220+(24*Opm))         
            love.graphics.print( "Si" ,100,220+(24*1))
            love.graphics.print( "No" ,100,220+(24*2))              
        end
        if select_mp=="usado" then
            love.graphics.print( "Objeto utilizado" ,100,220+(24*1))   
        end
    end

    if showPerfil=="magia" then
        if #ActiveParty[seePerfil].mg>0 then
            love.graphics.print( "Magia" ,80,200)
            --love.graphics.print( ">" ,80,220+(24*Opm))
            for k,i in pairs(ActiveParty[seePerfil].mg) do
                love.graphics.print( i.name .." "..i.cost.."MP",100,220+(24*k))
            end
            --[[
            if existList(ActiveParty[seePerfil].mg[Opm].id, Desc_Spells) then
                love.graphics.print( ActiveParty[seePerfil].mg[Opm].name..": " ,100,160+(24*0))
                love.graphics.print( Desc_Spells[ActiveParty[seePerfil].mg[Opm].id] ,100,160+(24*1))
            end
            ]]
        end
    end

    if showPerfil=="perks" then
        love.graphics.print( "Perks" ,80,200)
        if #ActiveParty[seePerfil].perks>0 then
            local nline=1
            for k,i in pairs(ActiveParty[seePerfil].perks) do
                love.graphics.print( i.name ,100,220+(24*nline))
                nline=nline+1
            end
        end

    end
    if showPerfil=="acciones" then
        love.graphics.print( "Acciones" ,80,200)
        if #ActiveParty[seePerfil].acc>0 then
            for k,i in pairs(ActiveParty[seePerfil].acc) do
                love.graphics.print( i ,100,220+(24*k))
            end
        end

    end

    if showPerfil=="runas" then

    end



end    





function menu_armor(list,mx)
    if #list>mx then
        local i=list
        local r=1
        for k=ini_view, fin_view do
            if i[k].name ~= nil then 
                love.graphics.print( ""..i[k].cont .."x "..i[k].name.." def: "..i[k].def ,100,220+(24*r))
            end    
            r=r+1
        end
    else
        for k,i in pairs(list) do
            if i.name ~= nil then 
                love.graphics.print( ""..i.cont .."x "..i.name.." def: "..i.def ,100,220+(24*k))
            end    
        end   
    end

end    


function menu_weapon(list,mx)


    if #list>mx then
        local i=list
        local r=1
        for k=ini_view, fin_view do
            if i[k].name ~= nil then 
                love.graphics.print( ""..i[k].cont .."x "..i[k].name .."DMG (1-"..i[k].w..")+"..i[k].bw,100,220+(24*r))
            end    
            r=r+1
        end
    else
        for k,i in pairs(list) do
            if i.name ~= nil then 
                love.graphics.print( ""..i.cont .."x "..i.name.."DMG (1-"..i.w..")+"..i.bw ,100,220+(24*k))
            end    
        end   
    end
end    

function equip_mode()
    local l=seePerfil
    love.graphics.print(ActiveParty[l].name,20,2+(24*1))
    love.graphics.print(" HP: "..ActiveParty[l].hp_.."/"..(ActiveParty[l].hp+mod(ActiveParty[l],"hp")).." MP: "..ActiveParty[l].mp_.."/"..(ActiveParty[l].mp+mod(ActiveParty[l],"mp")),20,2+(24*2))
    love.graphics.print("CON: "..(ActiveParty[l].con+mod(ActiveParty[l],"con")).." POD: "..(ActiveParty[l].pod+mod(ActiveParty[l],"pod")),20,20+(24*3))
    love.graphics.print("AGI: "..(ActiveParty[l].agi+mod(ActiveParty[l],"agi")).." DES: "..(ActiveParty[l].dex+mod(ActiveParty[l],"dex")),20,20+(24*4))
    love.graphics.print("FUE: "..(ActiveParty[l].fue+mod(ActiveParty[l],"fue")),20,20+(24*5))

    if ActiveParty[l].weapon.left ~= nil and ActiveParty[l].weapon.left ~= {} and ActiveParty[l].weapon.left.name ~= nil then 
        love.graphics.print( "weapon L: "..ActiveParty[l].weapon.left.name,100,160+(24*0)) 
    else
        love.graphics.print( "weapon L: ",100,160+(24*0))
    end    

    
    if ActiveParty[l].weapon.right ~= nil and ActiveParty[l].weapon.right ~= {} and ActiveParty[l].weapon.right.name ~= nil then 
        love.graphics.print( "weapon R: "..ActiveParty[l].weapon.right.name,100,180+(24*0)) 
    else
        love.graphics.print( "weapon R: ",100,180+(24*0))
    end    


    love.graphics.print( "skill: ",100,220+(24*0))
    for k,i in pairs(ActiveParty[l].mg) do
        love.graphics.print( i.name ,100,220+(24*k))
    end

    love.graphics.print( "Acciones:",260,220+(24*0))
    for k,i in pairs(ActiveParty[l].acc) do
        love.graphics.print( i ,260,220+(24*k))
    end

    anim_char(ActiveParty[l],280,30)
end
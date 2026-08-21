function perfil_mode()
    --love.graphics.print("info_label:  state: "..state,10,5)



    love.graphics.draw(fondo,0,0)
    local l=Perfil.seePerfil
    show_spr(ActiveParty[l], 36,46, 0,0,280,50,Temp_c==ActiveParty[l].id and State=="select c",false)  


    love.graphics.print(ActiveParty[l].name,20,2+(24*1))
    love.graphics.print("$: "..Dinero,360,2+(24*1))
    love.graphics.print("Lv: "..ActiveParty[l].lv.." EXP: "..ActiveParty[l].exp,180,2+(24*1))
    love.graphics.print("",20+(24*1))
    love.graphics.print("HP: "..ActiveParty[l].hp_.."/"..(ActiveParty[l].hp+mod(ActiveParty[l],"hp")).." MP: "..ActiveParty[l].mp_.."/"..(ActiveParty[l].mp+mod(ActiveParty[l],"mp")),120,20+(24*2))
    love.graphics.print("CON: "..(ActiveParty[l].con+mod(ActiveParty[l],"con")).." POD: "..(ActiveParty[l].pod+mod(ActiveParty[l],"pod")),120,20+(24*3))
    love.graphics.print("AGI: "..(ActiveParty[l].agi+mod(ActiveParty[l],"agi")).." DES: "..(ActiveParty[l].dex+mod(ActiveParty[l],"dex")),120,20+(24*4))
    love.graphics.print("FUE: "..(ActiveParty[l].fue+mod(ActiveParty[l],"fue")),120,20+(24*5))

    --
    love.graphics.print("ATTACK: "..(ActiveParty[l].fue+mod(ActiveParty[l],"fue")+promWeaponDmg(ActiveParty[l])),260,20+(24*3))
    love.graphics.print("defensa: "..(flr((ActiveParty[l].con+mod(ActiveParty[l],"con"))/2) + ModArmadura(ActiveParty[l])),260,20+(24*4))

    --
    
    love.graphics.print( "debug:   "..Perfil.select_mp .." ".. Perfil.showPerfil.." ",260,140+(24*0))
    --love.graphics.print( "debug:  "..Debug_temp,400,120+(24*0))


    --anim_char(ActiveParty[l],280,30)




    if Perfil.showPerfil=="perfil" or Perfil.showPerfil=="equip"  then

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

    if Perfil.showPerfil=="perfil" then

        love.graphics.print( ">" ,480,20+(24*Opm))

        for k,i in pairs(ActiveParty[l].opciones) do
            love.graphics.print( i ,500,20+(24*k))
        end

        love.graphics.print( "skill: ",30,220+(24*0))
        local skillCount=0
        if #ActiveParty[l].mg>0 then
            for k,t in pairs(ActiveParty[l].mg) do
                love.graphics.print( t.name ,30,220+(24*k))
                skillCount=skillCount+1
                if skillCount>=8 then
                    love.graphics.print( "..." ,30,220+(24*(k+1)))
                    break
                end
            end
        end
        if ActiveParty[l].sk~=nil then
            local nline=#ActiveParty[l].mg+1
            for k,i in pairs(ActiveParty[l].sk) do
                love.graphics.print( i.name ,30,220+(24*nline))
                nline=nline+1
                skillCount=skillCount+1
                if skillCount>=8 then
                    love.graphics.print( "..." ,30,220+(24*(nline)))
                    break
                end
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
            if line>=8 then
                    love.graphics.print( "..." ,30,220+(24*(line)))
                    break
            end            
        end

    end

    if Perfil.showPerfil=="equip" then
        love.graphics.print( ">" ,80,220+(24*Opm))
        if Perfil.select_mp=="equipo" then
            for k,i in pairs(equipo_slot) do
                love.graphics.print( i.id ,100,220+(24*k))
                if i.id == "weapon_izq" and ActiveParty[Perfil.seePerfil].weapon.left ~= nil and ActiveParty[Perfil.seePerfil].weapon.left.name ~= nil then
                    love.graphics.print( " : "..ActiveParty[Perfil.seePerfil].weapon.left.name ,300,220+(24*k))
                end
                if i.id == "weapon_der" and ActiveParty[Perfil.seePerfil].weapon.right ~= nil and ActiveParty[Perfil.seePerfil].weapon.right.name ~= nil then
                    love.graphics.print( " : "..ActiveParty[Perfil.seePerfil].weapon.right.name ,300,220+(24*k))
                end  
                if i.id == "cabeza" and ActiveParty[Perfil.seePerfil].head ~= nil and ActiveParty[Perfil.seePerfil].head.name ~= nil then
                    love.graphics.print( " : "..ActiveParty[Perfil.seePerfil].weapon.right.name ,300,220+(24*k))
                end  
                if i.id == "armadura" and ActiveParty[Perfil.seePerfil].armadura ~= nil  and ActiveParty[Perfil.seePerfil].armadura ~= {} and ActiveParty[Perfil.seePerfil].armadura.name ~= nil then
                    love.graphics.print( " : "..ActiveParty[Perfil.seePerfil].armadura.name ,300,220+(24*k))
                end
                if i.id == "accesorio_1" and ActiveParty[Perfil.seePerfil].accesorio_1 ~= nil  and ActiveParty[Perfil.seePerfil].accesorio_1 ~= {} and ActiveParty[Perfil.seePerfil].accesorio_1.name ~= nil then
                    love.graphics.print( " : "..ActiveParty[Perfil.seePerfil].accesorio_1.name ,300,220+(24*k))
                end 
                if i.id == "accesorio_2" and ActiveParty[Perfil.seePerfil].accesorio_2 ~= nil  and ActiveParty[Perfil.seePerfil].accesorio_2 ~= {} and ActiveParty[Perfil.seePerfil].accesorio_2.name ~= nil then
                    love.graphics.print( " : "..ActiveParty[Perfil.seePerfil].accesorio_2.name ,300,220+(24*k))
                end
                if i.id == "artefacto" and ActiveParty[Perfil.seePerfil].artefacto ~= nil  and ActiveParty[Perfil.seePerfil].artefacto ~= {} and ActiveParty[Perfil.seePerfil].artefacto.name ~= nil then
                    love.graphics.print( " : "..ActiveParty[Perfil.seePerfil].artefacto.name ,300,220+(24*k))
                end
                if i.id == "complemento" and ActiveParty[Perfil.seePerfil].complemento ~= nil  and ActiveParty[Perfil.seePerfil].complemento ~= {} and ActiveParty[Perfil.seePerfil].complemento.name ~= nil then
                    love.graphics.print( " : "..ActiveParty[Perfil.seePerfil].complemento.name ,300,220+(24*k))
                end
            end
        end    

        --[[
        
        {name="mano izq", id="weapon_izq"},
{name="mano der", id="weapon_der"},
{name="complemento", id="complemento"},
{name="armadura", id="armadura"},
{name="accesorio 1", id="accesorio_1"},
{name="accesorio 2", id="accesorio_2"},
{name="Artefacto", id="Artefacto"},

        ]]

        if Perfil.select_mp=="weapon" then
            love.graphics.print( "armas: ",100,220+(24*0))

            if weapon_inventary_see[Opm]~=nil and weapon_inventary_see[Opm].familia=="escudo" then
                love.graphics.print( "DEF: "..GetDefense(weapon_inventary_see[Opm]),460,160+(24*0))
                love.graphics.print( "MDEF: "..GetMDefense(weapon_inventary_see[Opm]),460,160+(24*1))
            else    
                if weapon_inventary_see[Opm]~=nil then
                love.graphics.print( "DMG: "..GetPromDamage(weapon_inventary_see[Opm]),460,160+(24*0))
                end
            end
            menu_weapon(weapon_inventary_see,9)
        end    

        if Perfil.select_mp=="armadura" then
            love.graphics.print( "armadura: ",100,220+(24*0))
            menu_armor(armadura_inventary_see,9)
        end 

        if Perfil.select_mp=="accesorio" then
            love.graphics.print( "accesorio: ",100,220+(24*0))
            menu(Accesorios_inventary_see,9)
        end 

        if Perfil.select_mp=="cabeza" then
            love.graphics.print( "cabeza: ",100,220+(24*0))
            menu(armadura_inventary_see,9)
        end

        if Perfil.select_mp=="artefacto" then
            love.graphics.print( "artefacto: ",100,220+(24*0))
            menu(Artefacto_inventary_see,9)
        end
        if Perfil.select_mp=="complemento" then
            love.graphics.print( "complemento: ",100,220+(24*0))
            menu(Complemento_inventary_see,9)
        end
    end

    if Perfil.showPerfil=="inventario" then
        if Perfil.select_mp=="inventario" then
            love.graphics.print( ">" ,80,220+(24*Opm))
            for k,i in pairs(items) do
                love.graphics.print( i.name.."["..i.cont.."]" ,100,220+(24*k))
            end
        end     
        if Perfil.select_mp=="aceptar" then
            love.graphics.print( ">" ,80,220+(24*Opm))         
            love.graphics.print( "Si" ,100,220+(24*1))
            love.graphics.print( "No" ,100,220+(24*2))              
        end
        if Perfil.select_mp=="usado" then
            love.graphics.print( "Objeto utilizado" ,100,220+(24*1))   
        end
    end

    if Perfil.showPerfil=="magia" then
        if #ActiveParty[Perfil.seePerfil].mg>0 then
            love.graphics.print( "Magia" ,80,200)
            --love.graphics.print( ">" ,80,220+(24*Opm))
            for k,i in pairs(ActiveParty[Perfil.seePerfil].mg) do
                love.graphics.print( i.name .." "..i.cost.."MP",100,220+(24*k))
            end
            --[[
            if existList(ActiveParty[Perfil.seePerfil].mg[Opm].id, Desc_Spells) then
                love.graphics.print( ActiveParty[Perfil.seePerfil].mg[Opm].name..": " ,100,160+(24*0))
                love.graphics.print( Desc_Spells[ActiveParty[Perfil.seePerfil].mg[Opm].id] ,100,160+(24*1))
            end
            ]]
        end
    end

    if Perfil.showPerfil=="perks" then
        love.graphics.print( "Perks" ,80,200)
        if #ActiveParty[Perfil.seePerfil].perks>0 then
            local nline=1
            for k,i in pairs(ActiveParty[Perfil.seePerfil].perks) do
                love.graphics.print( i.name ,100,220+(24*nline))
                nline=nline+1
            end
        end

    end
    if Perfil.showPerfil=="acciones" then
        love.graphics.print( "Acciones" ,80,200)
        if #ActiveParty[Perfil.seePerfil].acc>0 then
            for k,i in pairs(ActiveParty[Perfil.seePerfil].acc) do
                love.graphics.print( i ,100,220+(24*k))
            end
        end

    end

    if Perfil.showPerfil=="runas" then

    end

    if Perfil.showPerfil=="hiden" then
        if  ActiveParty[l].social then
            love.graphics.print( countTableElements(ActiveParty[l].social) ,500,120+(24*-1))
                local a=1


                 love.graphics.print("Ojo "..ActiveParty[l].social["Ojo"],26,160+(24*a))
                 a=a+1
                 love.graphics.print("pintura "..ActiveParty[l].social["pintura"],26,160+(24*a))
                 a=a+1
                 love.graphics.print("je_ne_sais_pa "..ActiveParty[l].social["je_ne_sais_pa"],26,160+(24*a))
                 a=a+1
                 love.graphics.print("sennal "..ActiveParty[l].social["sennal"],26,160+(24*a))
                 a=a+1
                 love.graphics.print("lupa "..ActiveParty[l].social["lupa"],26,160+(24*a))
                 a=a+1
                 love.graphics.print("energy "..ActiveParty[l].social["energy"],26,160+(24*a))
                 a=a+1
                 love.graphics.print("Cabello "..ActiveParty[l].social["Cabello"],26,160+(24*a))

                 a=1
                 love.graphics.print("Numero "..ActiveParty[l].social["Numero"],300,160+(24*a))
                 a=a+1
                 love.graphics.print("escultura "..ActiveParty[l].social["escultura"],300,160+(24*a))
                 a=a+1
                 love.graphics.print("linea "..ActiveParty[l].social["linea"],300,160+(24*a))
                 a=a+1
                 love.graphics.print("algodon "..ActiveParty[l].social["algodon"],300,160+(24*a))
                 a=a+1
                 love.graphics.print("retrovizor "..ActiveParty[l].social["retrovizor"],300,160+(24*a))
                 a=a+1
                 love.graphics.print("rueda "..ActiveParty[l].social["rueda"],300,160+(24*a))
                 a=a+1
                 love.graphics.print("armadura "..ActiveParty[l].social["armadura"],300,160+(24*a))
                 a=a+1
                 love.graphics.print("corazon "..ActiveParty[l].social["corazon"],300,160+(24*a))
                 
        end
        
    end



end    





function menu_armor(list,mx)
    if #list>mx then
        local i=list
        local r=1
        for k=ini_view, fin_view do
            if i[k].name ~= nil then 
                if i[k].id~="quitar" then
                    love.graphics.print( ""..i[k].cont .."x "..i[k].name.." def: "..i[k].def ,100,220+(24*r))
                else
                    love.graphics.print( i[k].name,100,220+(24*r))
                end    
            end    
            r=r+1
        end
    else
        for k,i in pairs(list) do
            if i.name ~= nil then 
                if i.id~="quitar" then
                    love.graphics.print( ""..i.cont .."x "..i.name.." def: "..i.def ,100,220+(24*k))
                else
                    love.graphics.print( i.name,100,220+(24*k))
                end  
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
    local l=Perfil.seePerfil
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
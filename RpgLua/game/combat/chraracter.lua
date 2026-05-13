function NextObjetivo(obj,str)
    for _, o in ipairs(Order) do
        if o.tipo=="enemy" and o.hp_>0  and obj~=o then
            return o
        end
    end
    return nil
end


function recuperar_ultima_accion()
-- no copiar habilidades que tengan objetos como requerimiento o que potencien otra habilidades
    if Last_acc~="usar" or Last_acc~="objeto" or Last_acc~="bullet" 
    or Last_acc~="mix" or Last_acc~="bullet" or Last_acc~="dual M." or Last_acc~="usar" or Last_acc~="lanzar" then
            Sel_e=Last_sel_e
            Sel_c=Last_sel_c
            Acc=Last_acc
            Mg_sel=Last_mg_sel
            Dirr=Last_dirr
        if Dirr=="e" then 
            State="select e"
        end
        if Dirr=="c" then 
            State="select c"
        end
        if Dirr=="a" then 
            State="select a"
        end
    else
        --cancelar
    end
end


function guardar_ultima_accion()
    if Acc ~= "mimic" then
        Last_sel_e=Sel_e
        Last_sel_ee=sel_ee
        Last_sel_c=sel_c
        Last_sel_cc=Sel_cc
        Last_acc=Acc
        Last_mg_2sel=Mg_2sel
        Last_mg_sel=Mg_sel
        Last_dirr=Dirr
    end
end    



function isLeft()
    if Actual.weapon.left ~= nil or Actual.weapon.left~={} then
        return true
    end    
    return false
end    

function isLeftEquip(e)
    if e.weapon.left ~= nil or e.weapon.left~={} then
        return true
    end    
    return false
end   

function isRight()
    if Actual.weapon.right ~= nil or Actual.weapon.right~={} then
        return true
    end    
    return false
end   

function isRightEquip(e)
    if e.weapon.right ~= nil or e.weapon.right~={} then
        return true
    end    
    return false
end 

function isTwoHandle()
    if Actual.weapon.left.modo=="2h" then
        return true
    end
    return false
end

function isDesarmado()
    if (Actual.weapon.left == nil or Actual.weapon.left=={}) and (Actual.weapon.right == nil or Actual.weapon.right=={})  then
        return true
    end    
    return false
end    

function isDesarmadoEquipo(e)
    if (e.weapon.left == nil or e.weapon.left=={}) and (e.weapon.right == nil or e.weapon.right=={})  then
        return true
    end    
    return false
end  

function isHasWeapon()
    if (Actual.weapon.left ~= nil or Actual.weapon.left~={}) or (Actual.weapon.right ~= nil or Actual.weapon.right~={})  then
        return true
    end    
    return false
end    



calidad_table={
["S"]=2,
["A"]=1,
["B"]=0.5,
["C"]=0.25,
["D"]=0.1,
}

function bono_calidad(v,o) 
    local value=0
    if v.pod~="" then
        value=value + flr(v.w*calidad_table[v.pod]*o.pod*(1/40))
    end
    if v.int~="" then
        value=value + flr(v.w*calidad_table[v.int]*o.pod*(1/40))
    end
    if v.dex~="" then
        value=value + flr(v.w*calidad_table[v.dex]*o.pod*(1/40))
    end
    if v.fue~="" then
        value=value + flr(v.w*calidad_table[v.fue]*o.pod*(1/40))
    end
    return value
end





function multiplicador_estado(v)
    local c=1
    if v.state["dormir"] ~=nil then
        c=c+1
    end
    if v.state["paralisis"] ~=nil  then
        c=c+1
    end
    if v.state["aturdir"] ~=nil  then
        c=c+1
    end
    if v.state["congelar"] ~=nil  then
        c=c+1
    end
    if v.state["marca"] ~=nil  then
        c=c+1
    end 
    return c
end    





--E: enemigos C: personaje y aliados a: todos x: todos

function selecionar_objetivo()
    local objetivo={}

        if Dirr=="e" then
            objetivo=getChars(Sel_e,Order)
        end 
        if Dirr=="a" then
            objetivo={}
        end
        if Dirr=="x" then
            objetivo=Actual
        end
        if Dirr=="c" then
            objetivo=getChars(Sel_c,Order)
        end
        
    return objetivo
end






function puedeLanzar(ingredientes)
    for _, ing in ipairs(ingredientes) do
        if existList(ing, items) then
            return true
        end
    end
    return false
end

function puedeLanzarHechizos(ingredientes)
    for _, ing in ipairs(ingredientes) do
        if lista_encuentro[ing] then
            return true
        end
    end
    return false
end

function puedeLanzarTools(ingredientes)
    for _, ing in ipairs(ingredientes) do
        if objetos_especiales[ing] then
            return true
        end
    end
    return false
end


function puedeUsarWeaponArts(ingredientes)
    for i=1, #ingredientes do
        if Actual.weapon.left ~= nil and Actual.weapon.left ~= {} then
            if Actual.weapon["left"].familia == ingredientes[i] then
               -- Debug_temp=Debug_temp.." L-"..Actual.weapon["left"].familia.."-"..ingredientes[i]
                return true
            end
        end
        if Actual.weapon.left ~= nil and Actual.weapon.right ~= {} then
            --Debug_temp=Debug_temp.." R-"..#Actual.weapon
            if Actual.weapon["right"].familia == ingredientes[i] then
                return true
            end
        end
    end
    return false
end


function GetEnemigoVivos()
    EnemigosVivos={}
    for _, o in ipairs(Order) do
        if o.tipo=="enemy" and o.hp_>0 then
                table.insert(EnemigosVivos, o) 
        end
    end
    return EnemigosVivos
end

function FiltrarFuerzas()
    for _, o in ipairs(lista_items_juego) do
        if ListaFuerzasMagicas[o.id]~= nil then
            if not existList(o.id, Evocaciones) then
                table.insert(Evocaciones, all_spell[ListaFuerzasMagicas[o.id]]) 
            end
        end
    end
end


function FiltrarEnemigoVivos()
    EnemigosVivos={}
    for _, o in ipairs(All) do
        if o.tipo=="enemy" and o.hp_>0 then
            table.insert(EnemigosVivos, o) 
        end
    end
end


function FiltrarSpellList()

end

function FiltrarPowerStone()

end

function LlenarListaExtraer(objetivo)
    for _,o in ipairs(objetivo.magicForce) do
        table.insert(Actual.blue, mix)
    end

                    


end

function GetGrupoEnemigoVivos()
    GruposEnemigos={}
    for _, o in ipairs(Order) do
        if o.tipo=="enemy" and o.hp_>0 then
                table.insert(GruposEnemigos, NombreEspecie[o.id_mons]) 
        end
    end
    return GruposEnemigos
end




function FiltrarGrupoEnemigoVivos()
    GruposEnemigos={}
    local num=0
    for _, o in ipairs(Order) do
        if o.tipo=="enemy" and o.hp_>0 then
                table.insert(GruposEnemigos, NombreEspecie[o.id_mons]) 
        end
    end
end


function GetAliadosVivos()
    AliadosVivos={}
    for _, o in ipairs(Order) do
        if (o.tipo=="player" or o.tipo=="aliado")  and o.hp_>0 then
                table.insert(AliadosVivos, o) 
        end
    end
    return AliadosVivos
end

function FiltrarAliadosVivos()
    AliadosVivos={}
    for _, o in ipairs(Order) do
        if (o.tipo=="player" or o.tipo=="aliado")  and o.hp_>0 then
                table.insert(AliadosVivos, o) 
        end
    end
end

function GetAliadosMuerto()
    AliadosMuertos={}
    for _, o in ipairs(Order) do
        if (o.tipo=="player" or o.tipo=="aliado")  and o.hp_<=0 then
                table.insert(AliadosVivos, o) 
        end
    end
    return AliadosMuertos
end

function FiltrarAliadosMuertos()
    AliadosMuertos={}
    for _, o in ipairs(Order) do
        if (o.tipo=="player" or o.tipo=="aliado")  and o.hp_<=0 then
                table.insert(AliadosVivos, o) 
        end
    end
end


function filtrarWeapons()
    weapon_inventary_see={}
    for _, mix in ipairs(weapon_inventary) do
        if mix.cont>0 then
            if ActiveParty[seePerfil].prof[mix.familia] ~= nil then
                table.insert(weapon_inventary_see, mix) 
            end
        end
    end
end


function filtrarArmadura()
    armadura_inventary_see={}
    for _, mix in ipairs(armadura_inventary) do
        if mix.cont>0 and mix.tipo_item=="torso" then
            table.insert(armadura_inventary_see, mix) 
        end
    end
end


function filtrarCabeza()
    armadura_inventary_see={}
    for _, mix in ipairs(armadura_inventary) do
        if mix.cont>0 and mix.tipo_item=="cabeza" then
            table.insert(armadura_inventary_see, mix) 
        end
    end
end

function filtrarAccesorio()
    Accesorios_inventary_see={}
    for _, mix in ipairs(Accesorios_inventary) do
        if mix.cont>0 then
            table.insert(Accesorios_inventary_see, mix) 
        end
    end
end


function filtrarComplementos()
    Complemento_inventary_see={}
    for _, mix in ipairs(Complemento_inventary) do
        if mix.cont>0 then
            table.insert(Complemento_inventary_see, mix) 
        end
    end
end


function filtrarArtefactos()
    Artefacto_inventary_see={}
    for _, mix in ipairs(Artefacto_inventary) do
        if mix.cont>0 then
            table.insert(Artefacto_inventary_see, mix) 
        end
    end
end

function filtrarTools()
    for _, mix in pairs(lista_tools) do
        if puedeLanzarTools(mix.ingredientes) then            
            if not existList(mix.id,Actual.tools) then
                table.insert(Actual.tools, mix)
            end    
        end
    end
end

function filtrarWeaponArts()
    for _, mix in pairs(Lista_Weapon_Arts) do
            --Debug_temp=Debug_temp.."# "..#mix.requerimiento
        if puedeUsarWeaponArts(mix.requerimiento) then            
            if not existList(mix.id,Actual.art) then
                table.insert(Actual.art, mix)
            end    
        end
    end
    if Actual.weapon.left~={} 
        and Actual.weapon.left~=nil 
        and Actual.weapon.left.extra~=nil
        and Actual.weapon.left.extra~={}
        and Actual.weapon.left.extra.name~=nil 
        and Actual.weapon.left.extra.name=="spells" then
            for k,v in pairs(Actual.weapon.left.extra.value) do
                if not existList(v.id,Actual.art) then
                    local temp= Spell_books[v.id]
                    temp.cant_=v.cant
                    temp.cant=v.max
                    table.insert(Actual.art, temp)
                end  
            end
    end
    
    if Actual.weapon.right~={} 
        and  Actual.weapon.right~=nil 
        and Actual.weapon.right.extra~=nil
        and Actual.weapon.right.extra~={}
        and Actual.weapon.right.extra.name~=nil 
        and Actual.weapon.right.extra.name=="spells" then
            for k,v in pairs(Actual.weapon.right.extra.value) do
                if not existList(v.id,Actual.art) then
                    local temp= Spell_books[v.id]
                    temp.cant_=v.cant
                    temp.cant=v.max
                    table.insert(Actual.art, temp)
                end  
            end
    end
    

end

function TableSize(table)
    local count = 0
    for _ in pairs(table) do 
        count = count + 1 
    end
    return count
end


function filtrarHechizosAzules()
    for _, mix in ipairs(lista_azul) do
        if puedeLanzarHechizos(mix.ingredientes) then
            if not existList(mix.id,Actual.blue) then
                table.insert(Actual.blue, mix)
            end    
        end
    end
end

function filtrarHechizos()
    for _, mix in ipairs(lista_mix) do
        if puedeLanzar(mix.ingredientes) then
            table.insert(Actual.mix, mix)
        end
    end
end

function filtrarBalas()
    for _, mix in ipairs(lista_bullet) do
        if puedeLanzar(mix.ingredientes) then
            table.insert(Actual.bullet, mix)
        end
    end
end
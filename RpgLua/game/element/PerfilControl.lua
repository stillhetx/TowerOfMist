
function main_perfil(key,scancode,isrepeat)
                if key=="left" then
                    perfil_left()
                end
                if key=="right" then
                    perfil_right()
                end
                if key=="up" then
                    perfil_up()
                end
                if key=="down" then
                    perfil_down()
                end
                if key=="z" then
                    perfil_z()
                end
                if key=="x" then
                    perfil_X()
                end

                if key=="p" then
                    if ComeBackView=="travel" then
                        Show_view="travel"
                    elseif ComeBackView=="tienda" then
                        --
                    elseif ComeBackView=="graph" then
                        show_combat_mode()    
                    else    
                        show_combat_mode()
                    end
                end


                
                
                if key=="escape"  then
                    if ComeBackView=="travel" then
                        Show_view="travel"
                    elseif ComeBackView=="tienda" then
                        --
                    elseif ComeBackView=="graph" then
                        show_combat_mode()    
                    else    
                        show_combat_mode()
                    end
                    
                end

end


function perfil_left()
    seePerfil=seePerfil-1
    if seePerfil<=0 then
        seePerfil=3
    end 
    
    if seePerfil>3 then
        seePerfil=1
    end  
end 

function perfil_right()
    seePerfil=seePerfil+1
    if seePerfil<=0 then
        seePerfil=3
    end 
    
    if seePerfil>3 then
        seePerfil=1
    end  
end   




function perfil_z()
local ejecutar_menu=false
    if select_mp=="select" then
        if ActiveParty[seePerfil].opciones[Opm] == "equipo" then
            showPerfil="equip"
            select_mp="equipo"
            accion_mp="equipo"
        end
        if ActiveParty[seePerfil].opciones[Opm] == "inventario" then
            showPerfil="inventario"
            select_mp="inventario"
            accion_mp="inventario"
        end
        if ActiveParty[seePerfil].opciones[Opm] == "magia"  then
            showPerfil="magia"
            select_mp="magia"
            accion_mp="magia"
        end
        if ActiveParty[seePerfil].opciones[Opm] == "perks"  then
            showPerfil="perks"
            select_mp="perks"
            accion_mp="perks"
        end
        if ActiveParty[seePerfil].opciones[Opm] == "acciones"  then
            showPerfil="acciones"
            select_mp="acciones"
            accion_mp="acciones"
        end
    elseif select_mp=="inventario" then
        Objeto_selec = items[Opm]
        Debug_temp=Objeto_selec.id
        select_mp="aceptar"
        
    elseif select_mp=="aceptar" then
        if Opm == 1 then
            
            EjecutarItem(ActiveParty[seePerfil],ActiveParty[seePerfil],Objeto_selec)
            select_mp = "usado"
        elseif Opm==2 then
           select_mp="inventario"
        end
    elseif select_mp=="usado" then 
           select_mp="inventario"
    elseif select_mp=="equipo" then            
            select_mp_slot=equipo_slot[Opm].id
            if select_mp_slot=="weapon_izq" or select_mp_slot=="weapon_der" then
                filtrarWeapons()
                Opm=1
                select_mp="weapon"
                ini_view=1
                fin_view=9
            end
            if select_mp_slot=="armadura" then
                filtrarArmadura()
                Opm=1
                select_mp="armadura"
                ini_view=1
                fin_view=9
            end
            if select_mp_slot=="accesorio_1" then
                filtrarAccesorio()
                Opm=1
                select_mp="accesorio"
                ini_view=1
                fin_view=9
            end
            if select_mp_slot=="accesorio_2" then
                filtrarAccesorio()
                Opm=1
                select_mp="accesorio"
                ini_view=1
                fin_view=9
            end
            if select_mp_slot=="cabeza" then
                filtrarCabeza()
                Opm=1
                select_mp="cabeza"
                ini_view=1
                fin_view=9
            end
            if select_mp_slot=="artefacto" then
                filtrarArtefactos()
                Opm=1
                select_mp="artefacto"
                ini_view=1
                fin_view=9
            end
            if select_mp_slot=="complemento" then
                filtrarComplementos()
                Opm=1
                select_mp="complemento"
                ini_view=1
                fin_view=9
            end
    elseif select_mp=="weapon" then
        select_mp_Item=weapon_inventary_see[((ini_view-1))+Opm].id 
        ejecutar_menu=true
        select_mp="equipo"
    elseif select_mp=="armadura" then
        select_mp_Item=armadura_inventary_see[((ini_view-1))+Opm].id 
        ejecutar_menu=true
        select_mp="equipo"    
    elseif select_mp=="accesorio" then
        select_mp_Item=Accesorios_inventary_see[((ini_view-1))+Opm].id 
        ejecutar_menu=true
        select_mp="equipo"        
    end

    if ejecutar_menu==true then
        if accion_mp=="equipo" then
            cambio_equipo()
        end
    end    
        
    row_comprobar()

end    


function perfil_X()

    if select_mp=="select" then
        --//

    elseif  showPerfil=="magia" then    
            showPerfil="perfil"
            select_mp="select"
            accion_mp=""
    elseif  showPerfil=="perks" then   
            showPerfil="perfil"
            select_mp="select"
            accion_mp="" 
    elseif  showPerfil=="acciones" then  
            showPerfil="perfil"
            select_mp="select"
            accion_mp=""  
    elseif select_mp=="equipo" and showPerfil=="equip" then
            showPerfil="perfil"
            select_mp="select"
            accion_mp=""
    elseif select_mp=="weapon" and showPerfil=="equip" then
        
        select_mp="equipo"
        select_mp_Item=""
        select_mp_slot=""

    elseif select_mp=="armadura" and showPerfil=="equip" then
        select_mp="equipo"
        select_mp_Item=""
        select_mp_slot=""   

    elseif select_mp=="accesorio" and showPerfil=="equip" then
        select_mp="equipo"
        select_mp_Item=""
        select_mp_slot=""   

    elseif select_mp=="inventario" and showPerfil=="inventario" then
        showPerfil="perfil"
        select_mp="select"
        accion_mp=""
    elseif select_mp=="aceptar" and showPerfil=="inventario" then
        showPerfil="perfil"
        select_mp="inventario"
        accion_mp=""    
    elseif select_mp=="inventario" and showPerfil=="armadura" then
        showPerfil="perfil"
        select_mp="select"
        accion_mp=""  
    elseif select_mp=="inventario" and showPerfil=="accesorio" then
        showPerfil="perfil"
        select_mp="select"
        accion_mp=""
    elseif select_mp=="inventario" and showPerfil=="artefacto" then
        showPerfil="perfil"
        select_mp="select"
        accion_mp=""
    elseif select_mp=="inventario" and showPerfil=="complemento" then
        showPerfil="perfil"
        select_mp="select"
        accion_mp=""    
    elseif select_mp=="inventario" and showPerfil=="cabeza" then
        showPerfil="perfil"
        select_mp="select"
        accion_mp=""       
    end
    
    row_comprobar()

end    

function perfil_up()
    Opm=Opm-1
    row_comprobar()
end

function perfil_down()
    Opm=Opm+1
    row_comprobar()
end



function row_comprobar()

    if showPerfil=="equip" and select_mp=="equipo" then
        if Opm<1 then
            Opm=#equipo_slot
        end
    end
    if showPerfil=="equip" and select_mp=="weapon" then
        if #weapon_inventary>9 then
            if Opm<1 and ini_view==1 then
                Opm=9
                ini_view=#weapon_inventary-8
                if ini_view < 1 then ini_view=1 end
                fin_view=#weapon_inventary
            end

            if  Opm<1 and ini_view >1 then
                ini_view=ini_view-1
                fin_view=fin_view-1
                Opm=1
            end
        else
            if Opm<1 then
                Opm=#weapon_inventary
            end
        end
    end
    if showPerfil=="equip" and select_mp=="armadura" then
        if #armadura_inventary>9 then
            if Opm<1 and ini_view==1 then
                Opm=9
                ini_view=#armadura_inventary-8
                if ini_view < 1 then ini_view=1 end
                fin_view=#armadura_inventary
            end
            if  Opm<1 and ini_view >1 then
                ini_view=ini_view-1
                fin_view=fin_view-1
                Opm=1
            end
        else
            if Opm<1 then
                Opm=#armadura_inventary
            end
        end
    end



    if showPerfil=="equip" and select_mp=="accesorio" then
        if #Accesorios_inventary>9 then
            if Opm<1 and ini_view==1 then
                Opm=9
                ini_view=#Accesorios_inventary-8
                if ini_view < 1 then ini_view=1 end
                fin_view=#Accesorios_inventary
            end

            if  Opm<1 and ini_view >1 then
                ini_view=ini_view-1
                fin_view=fin_view-1
                Opm=1
            end
        else
            if Opm<1 then
                Opm=#Accesorios_inventary
            end
        end
    end



    if showPerfil=="inventario" and select_mp=="inventario" then
        if Opm<1 then
            Opm=#items
        end
    end

    if showPerfil=="perfil" then
        if Opm<1 then
            Opm=#ActiveParty[seePerfil].opciones 
        end
    end


    if showPerfil=="equip" and select_mp=="equipo" then
        if Opm>#equipo_slot then
            Opm=1
        end  
    end

    if showPerfil=="equip" and select_mp=="weapon" then
        if #weapon_inventary_see>9 then        
            if  Opm>9 then
                ini_view=ini_view+1
                fin_view=fin_view+1
                Opm=9
            end
            if fin_view>#weapon_inventary_see then
                Opm=1
                ini_view=1
                fin_view=9
            end
        else
            if Opm>#weapon_inventary_see then
                Opm=1
            end
        end
    end
    if showPerfil=="equip" and (select_mp=="armadura" or select_mp=="cabeza" ) then
        if #armadura_inventary_see>9 then
            if  Opm>9 then
                ini_view=ini_view+1
                fin_view=fin_view+1
                Opm=9
            end
            if fin_view>#armadura_inventary_see then
                Opm=1
                ini_view=1
                fin_view=9
            end
        else
            if Opm>#armadura_inventary_see then
                Opm=1
            end
        end
    end
    if showPerfil=="equip" and select_mp=="accesorio" then
        if #Accesorios_inventary_see>9 then
            if  Opm>9 then
                ini_view=ini_view+1
                fin_view=fin_view+1
                Opm=9
            end
            if fin_view>#Accesorios_inventary_see then
                Opm=1
                ini_view=1
                fin_view=9
            end
        else
            if Opm>#Accesorios_inventary_see then
                Opm=1
            end
        end    
    end

 if showPerfil=="equip" and select_mp=="artefacto" then
        if #Artefacto_inventary_see>9 then
            if  Opm>9 then
                ini_view=ini_view+1
                fin_view=fin_view+1
                Opm=9
            end
            if fin_view>#Artefacto_inventary_see then
                Opm=1
                ini_view=1
                fin_view=9
            end
        else
            if Opm>#Artefacto_inventary_see then
                Opm=1
            end
        end    
    end

     if showPerfil=="equip" and select_mp=="complemento" then
        if #Complemento_inventary_see>9 then
            if  Opm>9 then
                ini_view=ini_view+1
                fin_view=fin_view+1
                Opm=9
            end
            if fin_view>#Complemento_inventary_see then
                Opm=1
                ini_view=1
                fin_view=9
            end
        else
            if Opm>#Complemento_inventary_see then
                Opm=1
            end
        end    
    end


    if showPerfil=="inventario" and select_mp=="inventario" then
        if Opm>#items then
            Opm=1
        end  
    end

    if showPerfil=="perfil" then
        if Opm>#ActiveParty[seePerfil].opciones then
            Opm=1
        end  
    end


end   

function show_combat_mode()
    Show_view="graph" 
    showPerfil="perfil"
    select_mp_Item=""
    select_mp_slot=""
    select_mp=""
    accion_mp=""
end 
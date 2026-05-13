Perfil={}
Perfil.seePerfil=1
Perfil.select_mp=""
Perfil.select_mp_slot=""
Perfil.select_mp_Item=""
Perfil.showPerfil=""
Perfil.accion_mp=""

function Perfil.main_perfil(key,scancode,isrepeat)
                if key=="left" then
                    Perfil.perfil_left()
                end
                if key=="right" then
                    Perfil.perfil_right()
                end
                if key=="up" then
                    Perfil.perfil_up()
                end
                if key=="down" then
                    Perfil.perfil_down()
                end
                if key=="z" then
                    Perfil.perfil_z()
                end
                if key=="x" then
                    Perfil.perfil_X()
                end

                if key=="p" then
                    if ComeBackView=="travel" then
                        Show_view="travel"
                    elseif ComeBackView=="tienda" then
                        --
                    elseif ComeBackView=="graph" then
                        Perfil.show_combat_mode()    
                    else    
                        Perfil.show_combat_mode()
                    end
                end


                
                
                if key=="escape"  then
                    if ComeBackView=="travel" then
                        Show_view="travel"
                    elseif ComeBackView=="tienda" then
                        --
                    elseif ComeBackView=="graph" then
                        Perfil.show_combat_mode()    
                    else    
                        Perfil.show_combat_mode()
                    end
                    
                end

end


function Perfil.perfil_left()
    Perfil.seePerfil=Perfil.seePerfil-1
    if Perfil.seePerfil<=0 then
        Perfil.seePerfil=3
    end 
    
    if Perfil.seePerfil>3 then
        Perfil.seePerfil=1
    end  
end 

function Perfil.perfil_right()
    Perfil.seePerfil=Perfil.seePerfil+1
    if Perfil.seePerfil<=0 then
        Perfil.seePerfil=3
    end 
    
    if Perfil.seePerfil>3 then
        Perfil.seePerfil=1
    end  
end   




function Perfil.perfil_z()
local ejecutar_menu=false
    if Perfil.select_mp=="select" then
        if ActiveParty[Perfil.seePerfil].opciones[Opm] == "equipo" then
            Perfil.showPerfil="equip"
            Perfil.select_mp="equipo"
            Perfil.accion_mp="equipo"
        end
        if ActiveParty[Perfil.seePerfil].opciones[Opm] == "inventario" then
            Perfil.showPerfil="inventario"
            Perfil.select_mp="inventario"
            Perfil.accion_mp="inventario"
        end
        if ActiveParty[Perfil.seePerfil].opciones[Opm] == "magia"  then
            Perfil.showPerfil="magia"
            Perfil.select_mp="magia"
            Perfil.accion_mp="magia"
        end
        if ActiveParty[Perfil.seePerfil].opciones[Opm] == "perks"  then
            Perfil.showPerfil="perks"
            Perfil.select_mp="perks"
            Perfil.accion_mp="perks"
        end
        if ActiveParty[Perfil.seePerfil].opciones[Opm] == "acciones"  then
            Perfil.showPerfil="acciones"
            Perfil.select_mp="acciones"
            Perfil.accion_mp="acciones"
        end
    elseif Perfil.select_mp=="inventario" then
        Objeto_selec = items[Opm]
        Debug_temp=Objeto_selec.id
        Perfil.select_mp="aceptar"
        
    elseif Perfil.select_mp=="aceptar" then
        if Opm == 1 then
            
            EjecutarItem(ActiveParty[Perfil.seePerfil],ActiveParty[Perfil.seePerfil],Objeto_selec)
            Perfil.select_mp = "usado"
        elseif Opm==2 then
           Perfil.select_mp="inventario"
        end
    elseif Perfil.select_mp=="usado" then 
           Perfil.select_mp="inventario"
    elseif Perfil.select_mp=="equipo" then            
            Perfil.select_mp_slot=equipo_slot[Opm].id
            if Perfil.select_mp_slot=="weapon_izq" or Perfil.select_mp_slot=="weapon_der" then
                filtrarWeapons()
                Opm=1
                Perfil.select_mp="weapon"
                ini_view=1
                fin_view=9
            end
            if Perfil.select_mp_slot=="armadura" then
                filtrarArmadura()
                Opm=1
                Perfil.select_mp="armadura"
                ini_view=1
                fin_view=9
            end
            if Perfil.select_mp_slot=="accesorio_1" then
                filtrarAccesorio()
                Opm=1
                Perfil.select_mp="accesorio"
                ini_view=1
                fin_view=9
            end
            if Perfil.select_mp_slot=="accesorio_2" then
                filtrarAccesorio()
                Opm=1
                Perfil.select_mp="accesorio"
                ini_view=1
                fin_view=9
            end
            if Perfil.select_mp_slot=="cabeza" then
                filtrarCabeza()
                Opm=1
                Perfil.select_mp="cabeza"
                ini_view=1
                fin_view=9
            end
            if Perfil.select_mp_slot=="artefacto" then
                filtrarArtefactos()
                Opm=1
                Perfil.select_mp="artefacto"
                ini_view=1
                fin_view=9
            end
            if Perfil.select_mp_slot=="complemento" then
                filtrarComplementos()
                Opm=1
                Perfil.select_mp="complemento"
                ini_view=1
                fin_view=9
            end
    elseif Perfil.select_mp=="weapon" then
        Perfil.select_mp_Item=weapon_inventary_see[((ini_view-1))+Opm].id 
        ejecutar_menu=true
        Perfil.select_mp="equipo"
    elseif Perfil.select_mp=="armadura" then
        Perfil.select_mp_Item=armadura_inventary_see[((ini_view-1))+Opm].id 
        ejecutar_menu=true
        Perfil.select_mp="equipo"    
    elseif Perfil.select_mp=="accesorio" then
        Perfil.select_mp_Item=Accesorios_inventary_see[((ini_view-1))+Opm].id 
        ejecutar_menu=true
        Perfil.select_mp="equipo"        
    end

    if ejecutar_menu==true then
        if Perfil.accion_mp=="equipo" then
            cambio_equipo()
        end
    end    
        
    Perfil.row_comprobar()

end    


function Perfil.perfil_X()

    if Perfil.select_mp=="select" then
        --//

    elseif  Perfil.showPerfil=="magia" then    
            Perfil.showPerfil="perfil"
            Perfil.select_mp="select"
            Perfil.accion_mp=""
    elseif  Perfil.showPerfil=="perks" then   
            Perfil.showPerfil="perfil"
            Perfil.select_mp="select"
            Perfil.accion_mp="" 
    elseif  Perfil.showPerfil=="acciones" then  
            Perfil.showPerfil="perfil"
            Perfil.select_mp="select"
            Perfil.accion_mp=""  
    elseif Perfil.select_mp=="equipo" and Perfil.showPerfil=="equip" then
            Perfil.showPerfil="perfil"
            Perfil.select_mp="select"
            Perfil.accion_mp=""
    elseif Perfil.select_mp=="weapon" and Perfil.showPerfil=="equip" then
        
        Perfil.select_mp="equipo"
        Perfil.select_mp_Item=""
        Perfil.select_mp_slot=""

    elseif Perfil.select_mp=="armadura" and Perfil.showPerfil=="equip" then
        Perfil.select_mp="equipo"
        Perfil.select_mp_Item=""
        Perfil.select_mp_slot=""   

    elseif Perfil.select_mp=="accesorio" and Perfil.showPerfil=="equip" then
        Perfil.select_mp="equipo"
        Perfil.select_mp_Item=""
        Perfil.select_mp_slot=""   

    elseif Perfil.select_mp=="inventario" and Perfil.showPerfil=="inventario" then
        Perfil.showPerfil="perfil"
        Perfil.select_mp="select"
        Perfil.accion_mp=""
    elseif Perfil.select_mp=="aceptar" and Perfil.showPerfil=="inventario" then
        Perfil.showPerfil="perfil"
        Perfil.select_mp="inventario"
        Perfil.accion_mp=""    
    elseif Perfil.select_mp=="inventario" and Perfil.showPerfil=="armadura" then
        Perfil.showPerfil="perfil"
        Perfil.select_mp="select"
        Perfil.accion_mp=""  
    elseif Perfil.select_mp=="inventario" and Perfil.showPerfil=="accesorio" then
        Perfil.showPerfil="perfil"
        Perfil.select_mp="select"
        Perfil.accion_mp=""
    elseif Perfil.select_mp=="inventario" and Perfil.showPerfil=="artefacto" then
        Perfil.showPerfil="perfil"
        Perfil.select_mp="select"
        Perfil.accion_mp=""
    elseif Perfil.select_mp=="inventario" and Perfil.showPerfil=="complemento" then
        Perfil.showPerfil="perfil"
        Perfil.select_mp="select"
        Perfil.accion_mp=""    
    elseif Perfil.select_mp=="inventario" and Perfil.showPerfil=="cabeza" then
        Perfil.showPerfil="perfil"
        Perfil.select_mp="select"
        Perfil.accion_mp=""       
    end
    
    Perfil.row_comprobar()

end    

function Perfil.perfil_up()
    Opm=Opm-1
    Perfil.row_comprobar()
end

function Perfil.perfil_down()
    Opm=Opm+1
    Perfil.row_comprobar()
end



function Perfil.row_comprobar()

    if Perfil.showPerfil=="equip" and Perfil.select_mp=="equipo" then
        if Opm<1 then
            Opm=#equipo_slot
        end
    end
    if Perfil.showPerfil=="equip" and Perfil.select_mp=="weapon" then
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
    if Perfil.showPerfil=="equip" and Perfil.select_mp=="armadura" then
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



    if Perfil.showPerfil=="equip" and Perfil.select_mp=="accesorio" then
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



    if Perfil.showPerfil=="inventario" and Perfil.select_mp=="inventario" then
        if Opm<1 then
            Opm=#items
        end
    end

    if Perfil.showPerfil=="perfil" then
        if Opm<1 then
            Opm=#ActiveParty[Perfil.seePerfil].opciones 
        end
    end


    if Perfil.showPerfil=="equip" and Perfil.select_mp=="equipo" then
        if Opm>#equipo_slot then
            Opm=1
        end  
    end

    if Perfil.showPerfil=="equip" and Perfil.select_mp=="weapon" then
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
    if Perfil.showPerfil=="equip" and (Perfil.select_mp=="armadura" or Perfil.select_mp=="cabeza" ) then
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
    if Perfil.showPerfil=="equip" and Perfil.select_mp=="accesorio" then
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

 if Perfil.showPerfil=="equip" and Perfil.select_mp=="artefacto" then
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

     if Perfil.showPerfil=="equip" and Perfil.select_mp=="complemento" then
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


    if Perfil.showPerfil=="inventario" and Perfil.select_mp=="inventario" then
        if Opm>#items then
            Opm=1
        end  
    end

    if Perfil.showPerfil=="perfil" then
        if Opm>#ActiveParty[Perfil.seePerfil].opciones then
            Opm=1
        end  
    end


end   

function Perfil.show_combat_mode()
    Show_view="graph" 
    Perfil.showPerfil="perfil"
    Perfil.select_mp_Item=""
    Perfil.select_mp_slot=""
    Perfil.select_mp=""
    Perfil.accion_mp=""
end 
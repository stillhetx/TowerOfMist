Perfil={}
Perfil.seePerfil=1
Perfil.select_mp="select"
Perfil.select_mp_slot=""
Perfil.select_mp_Item=""
Perfil.showPerfil=""
Perfil.accion_mp=""

Perfil.Total_opciones={"equipo", "inventario","magia","perks","acciones","runas"}

function Perfil.item_usable(objeto)
    return type(objeto)=="table" and objeto.menuAct==true
end

function Perfil.main_perfil(key,scancode,isrepeat)
                if Perfil.showPerfil=="perfil" and Perfil.select_mp=="" then
                    Perfil.select_mp="select"
                end
                Perfil.row_comprobar()

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
                if key=="q" then
                    Perfil.perfil_Q()
                end

                if key=="h" then
                    Perfil.perfil_H()
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
    local party_size=#ActiveParty
    if party_size==0 then
        Perfil.seePerfil=1
        return
    end
    if type(Perfil.seePerfil)~="number" then
        Perfil.seePerfil=1
    end
    Perfil.seePerfil=(Perfil.seePerfil-2)%party_size+1
    Perfil.row_comprobar()
end 

function Perfil.perfil_right()
    local party_size=#ActiveParty
    if party_size==0 then
        Perfil.seePerfil=1
        return
    end
    if type(Perfil.seePerfil)~="number" then
        Perfil.seePerfil=1
    end
    Perfil.seePerfil=Perfil.seePerfil%party_size+1
    Perfil.row_comprobar()
end   


function Perfil.perfil_H()
    if Perfil.showPerfil ~= "hiden" then
        Perfil.showPerfil ="hiden"
    else
        Perfil.showPerfil ="perfil"
    end

end

function Perfil.perfil_z()
local ejecutar_menu=false
Debug_temp="press "..Perfil.select_mp.." "
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
        if ActiveParty[Perfil.seePerfil].opciones[Opm] == "runas" then
            --Perfil.showPerfil="runas"
            --Perfil.select_mp="runas"
            --Perfil.accion_mp="runas"
        end
    elseif Perfil.select_mp=="inventario" then
        if items[Opm] then
            Objeto_selec = items[Opm]
            Debug_temp=Objeto_selec.id
            if Perfil.item_usable(Objeto_selec) and CumpleLasCondiciones(Objeto_selec, ActiveParty[Perfil.seePerfil]) then
                Perfil.select_mp="aceptar"
            else
                Perfil.select_mp="inventario"
            end
        end
        
    elseif Perfil.select_mp=="aceptar" then
        if Opm == 1 and Perfil.item_usable(Objeto_selec) then
            
            EjecutarItem(ActiveParty[Perfil.seePerfil],ActiveParty[Perfil.seePerfil],Objeto_selec)
            Perfil.select_mp = "usado"
        elseif Opm==2 then
           Perfil.select_mp="inventario"
        end
    elseif Perfil.select_mp=="no_usable" then
        Perfil.select_mp="inventario"
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
        local item=weapon_inventary_see[(ini_view-1)+Opm]
        if item then
            Perfil.select_mp_Item=item.id
            ejecutar_menu=true
            Perfil.select_mp="equipo"
        end
    elseif Perfil.select_mp=="armadura" then
        local item=armadura_inventary_see[(ini_view-1)+Opm]
        if item then
            Perfil.select_mp_Item=item.id
            ejecutar_menu=true
            Perfil.select_mp="equipo"
        end
    elseif Perfil.select_mp=="accesorio" then
        local item=Accesorios_inventary_see[(ini_view-1)+Opm]
        if item then
            Perfil.select_mp_Item=item.id
            ejecutar_menu=true
            Perfil.select_mp="equipo"
        end
    end

    if ejecutar_menu==true then
        if Perfil.accion_mp=="equipo" then
            cambio_equipo()
        end
    end    
        
    Perfil.row_comprobar()

end    


  function CumpleLasCondiciones(item, personaje)

    if item.req then
        if item.req == "magia" and personaje.isMagicTalent==true then
            return true            
        end
        if item.req == "tecnica" and personaje.isProFighter==true then
            return true 
        end
        if item.req =="hp" then
            
        end
        if item.req =="mp" then
            
        end
        return false
    end

    return true
end


function Perfil.perfil_X()

    if Perfil.select_mp=="select" then
        --//
    elseif Perfil.select_mp=="no_usable" then
            Perfil.select_mp="inventario"

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
    elseif Perfil.showPerfil=="runas" then
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
        Perfil.showPerfil="inventario"
        Perfil.select_mp="inventario"
        Perfil.accion_mp="inventario"
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
    elseif Perfil.select_mp=="complemento" and Perfil.showPerfil=="equip" then
        Perfil.select_mp="equipo"
        Perfil.select_mp_Item=""
        Perfil.select_mp_slot=""   
    elseif Perfil.select_mp=="cabeza" and Perfil.showPerfil=="equip" then
        Perfil.select_mp="equipo"
        Perfil.select_mp_Item=""
        Perfil.select_mp_slot=""    
    elseif Perfil.select_mp=="artefacto" and Perfil.showPerfil=="equip" then
        Perfil.select_mp="equipo"
        Perfil.select_mp_Item=""
        Perfil.select_mp_slot=""    
    end
    
    Perfil.row_comprobar()

end    

function Perfil.perfil_Q()
--remover
    if  Perfil.select_mp=="equipo" then 
            Perfil.select_mp_slot=equipo_slot[Opm].id
            RemoveEquip(Perfil.select_mp_slot,ActiveParty[Perfil.seePerfil]);
    end

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
    if type(Opm)~="number" or Opm~=Opm then
        Opm=1
    else
        Opm=math.floor(Opm)
    end

    if Perfil.showPerfil=="perfil" and Perfil.select_mp=="" then
        Perfil.select_mp="select"
    end

    local party_size=#ActiveParty
    if party_size==0 then
        Perfil.seePerfil=1
        Opm=1
        return
    end
    if type(Perfil.seePerfil)~="number" or Perfil.seePerfil~=Perfil.seePerfil then
        Perfil.seePerfil=1
    else
        Perfil.seePerfil=math.floor(Perfil.seePerfil)
        if Perfil.seePerfil<1 or Perfil.seePerfil>party_size then
            Perfil.seePerfil=1
        end
    end

    local personaje=ActiveParty[Perfil.seePerfil]
    if not personaje then
        Opm=1
        return
    end

    local lista
    local lista_paginada=false
    local cantidad
    local seleccion=Perfil.select_mp

    if seleccion=="select" then
        lista=personaje.opciones
    elseif seleccion=="equipo" then
        lista=equipo_slot
    elseif seleccion=="weapon" then
        lista=weapon_inventary_see
        lista_paginada=true
    elseif seleccion=="armadura" then
        lista=armadura_inventary_see
        lista_paginada=true
    elseif seleccion=="cabeza" then
        lista=armadura_inventary_see
        lista_paginada=true
    elseif seleccion=="accesorio" then
        lista=Accesorios_inventary_see
        lista_paginada=true
    elseif seleccion=="artefacto" then
        lista=Artefacto_inventary_see
        lista_paginada=true
    elseif seleccion=="complemento" then
        lista=Complemento_inventary_see
        lista_paginada=true
    elseif seleccion=="inventario" then
        lista=items
    elseif seleccion=="aceptar" then
        cantidad=2
    elseif seleccion=="no_usable" then
        lista=items
    elseif seleccion=="usado" then
        cantidad=1
    elseif seleccion=="magia" then
        lista=personaje.mg
    elseif seleccion=="perks" then
        lista=personaje.perks
    elseif seleccion=="acciones" then
        lista=personaje.acc
    elseif seleccion=="runas" then
        lista=runas
    end

    if cantidad==nil then
        if type(lista)~="table" then
            cantidad=0
        elseif seleccion=="perks" or seleccion=="runas" then
            cantidad=0
            for _ in pairs(lista) do
                cantidad=cantidad+1
            end
        else
            cantidad=#lista
        end
    end

    if lista_paginada and cantidad>9 then
        local visibles=9
        local inicio_maximo=cantidad-visibles+1
        if type(ini_view)~="number" then
            ini_view=1
        end
        ini_view=math.max(1,math.min(ini_view,inicio_maximo))

        if Opm<1 then
            if ini_view>1 then
                ini_view=ini_view-1
                Opm=1
            else
                ini_view=inicio_maximo
                Opm=visibles
            end
        elseif Opm>visibles then
            if ini_view<inicio_maximo then
                ini_view=ini_view+1
                Opm=visibles
            else
                ini_view=1
                Opm=1
            end
        end
        fin_view=ini_view+visibles-1
        return
    end

    if lista_paginada then
        ini_view=1
        fin_view=cantidad
    end

    if cantidad==0 then
        Opm=1
    elseif Opm<1 then
        Opm=cantidad
    elseif Opm>cantidad then
        Opm=1
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
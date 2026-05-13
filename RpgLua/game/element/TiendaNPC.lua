Tienda={}
Tienda.ListaStore={}
Tienda.Name_store=""
Tienda.tipo=""
Tienda.etapa="front" --"front","Show","buy", "comprado"
Tienda.Sel_tienda=1
Tienda.inn_cost=0
-----
Tienda.Objeto={}
Tienda.itemType=""
Tienda.cost=0
Tienda.menu={{id="hablar",name="hablar"},
            {id="comprar",name="comprar"},
            {id="vender",name="vender"},
            {id="salir",name="salir"},}
Tienda.inn={{id="hablar",name="hablar"},
            {id="descanzar",name="descanzar"},
            {id="comprar",name="comprar"},
            {id="salir",name="salir"},}
Tienda.confirmar={{id="yes",name="Si"},   
                {id="No",name="No"}}


function Tienda.control_tienda(key,scancode,isrepeat)
    if key=="z" then
        Tienda.Tienda_Z()
    end
    if key=="x" then
        Tienda.Tienda_X()
    end
    if key=="up" then
        Tienda.Tienda_up()
    end
    if key=="down" then
        Tienda.Tienda_down()
    end
    if key=="left" then
        Tienda.Tienda_left()
    end
    if key=="right" then
        Tienda.Tienda_right()
    end


    if key=="esc" and Tienda.etapa=="front" then
        Show_view="travel"
    end

    Tienda.regular()
end


function Tienda.regular()
    if Tienda.etapa=="show" then
        if Tienda.Sel_tienda<1 then
            Tienda.Sel_tienda=#Tienda.ListaStore
        end
        if Tienda.Sel_tienda>#Tienda.ListaStore then
            Tienda.Sel_tienda=1
        end
    end
    if Tienda.etapa=="front" then
        if Tienda.Sel_tienda<1 then
            Tienda.Sel_tienda=#Tienda.menu
        end
        if Tienda.Sel_tienda>#Tienda.menu then
            Tienda.Sel_tienda=1
        end
    end
end

function Tienda.Tienda_Z()
    if Tienda.etapa=="front" and Tienda.tipo=="store" and Tienda.menu[Tienda.Sel_tienda].id=="comprar" then
       Tienda.etapa="show"
       Tienda.Sel_tienda=1
    elseif Tienda.etapa=="front" and Tienda.tipo=="store" and Tienda.menu[Tienda.Sel_tienda].id=="vender" then
       Tienda.etapa="show_sell"    
       Tienda.Sel_tienda=1
    elseif Tienda.etapa=="front" and Tienda.tipo=="store" and Tienda.menu[Tienda.Sel_tienda].id=="salir" then
        Show_view="travel"
        Tienda.Sel_tienda=1
    elseif Tienda.etapa=="front" and Tienda.tipo=="inn" and Tienda.inn[Tienda.Sel_tienda].id=="descanzar" then
       Tienda.etapa="descanzar"    
       Tienda.Sel_tienda=1
    elseif Tienda.etapa=="front" and Tienda.tipo=="inn" and Tienda.inn[Tienda.Sel_tienda].id=="vender" then
       Tienda.etapa="show_sell"    
       Tienda.Sel_tienda=1
    elseif Tienda.etapa=="front" and Tienda.tipo=="inn" and Tienda.inn[Tienda.Sel_tienda].id=="salir" then
        Show_view="travel"
        Tienda.Sel_tienda=1
    elseif Tienda.etapa=="show" then
        Tienda.Objeto=Tienda.ListaStore[Tienda.Sel_tienda].objeto
        --Debug_temp=Tienda.ListaStore[Tienda.Sel_tienda].name
        Tienda.itemType=Tienda.ListaStore[Tienda.Sel_tienda].itemType
        Tienda.cost=Tienda.ListaStore[Tienda.Sel_tienda].cost
        Tienda.etapa="buy"
        Tienda.Sel_tienda=1
    elseif Tienda.etapa=="show_sell" then
        Tienda.Objeto=items[Tienda.Sel_tienda]
        Tienda.etapa="sell"
        Tienda.Sel_tienda=1
    elseif Tienda.etapa=="buy" and Tienda.confirmar[Tienda.Sel_tienda].id=="yes" then
        --Debug_temp=Tienda.ListaStore[Tienda.Sel_tienda].itemType
        if Comprar(Tienda.Objeto, Tienda.itemType,Tienda.cost) then
            Tienda.etapa="comprado"
        else    
            Tienda.etapa="buy"
        end
        Tienda.Sel_tienda=1
    elseif Tienda.etapa=="sell" and Tienda.confirmar[Tienda.Sel_tienda].id=="yes" then
        if Vender(items[Tienda.Objeto]) then
            Tienda.etapa="vendido"
        else    
            Tienda.etapa="sell"
        end
        Tienda.Sel_tienda=1
    elseif Tienda.etapa=="descanzar" and Tienda.confirmar[Tienda.Sel_tienda].id=="yes" then
        if Descanzar() then
            Tienda.etapa="descanzado"
        else    
            Tienda.etapa="front"
        end
        Tienda.Sel_tienda=1
    elseif Tienda.etapa=="buy" and Tienda.confirmar[Tienda.Sel_tienda].id=="No" then    
        Tienda.etapa="show" 
        Tienda.Sel_tienda=1
    elseif Tienda.etapa=="sell" and Tienda.confirmar[Tienda.Sel_tienda].id=="No" then    
        Tienda.etapa="show_sell" 
        Tienda.Sel_tienda=1
    elseif Tienda.etapa=="comprado" then
        Tienda.etapa="front"
        Tienda.Sel_tienda=1
    elseif Tienda.etapa=="vendido" then
        Tienda.etapa="front"
        Tienda.Sel_tienda=1
    elseif Tienda.etapa=="descanzado" then
        Tienda.etapa="front"
        Tienda.Sel_tienda=1
    elseif Tienda.etapa=="begin" then
        Tienda.etapa="front"
        Tienda.Sel_tienda=1
    end
end


function Tienda.Tienda_X()


    if Tienda.etapa=="front" and Tienda.tipo=="store"  then
        Show_view="travel"
        Tienda.Sel_tienda=1
    elseif Tienda.etapa=="show" then
        Tienda.etapa="front"
        Tienda.Sel_tienda=1
    elseif Tienda.etapa=="show_sell" then
        Tienda.etapa="front"
        Tienda.Sel_tienda=1
    end

end


function Comprar(objeto,type,cost)
    cost= cost or 0
    if Dinero>=cost then
        Dinero=Dinero-cost
    else
        return false
    end
    if type=="arma" or type =="escudo"  then
        Debug_temp="ID"..objeto.id
        add_inventary_Weapon_list(objeto)
        return true
    elseif type =="equip" then
        Debug_temp=Debug_temp.."ID"..objeto.id
        add_inventary_Armadura_list(objeto)  
        return true
    else
        add_inventary_items_list(objeto)
        return true
    end
   
   return false
end    

function Vender(objeto)
    Dinero=Dinero + objeto.cost
    remove_inventary_items_list(objeto)
    return true
end

function  Descanzar()
    if Dinero>=Dinero then
        Dinero=Dinero-Tienda.inn_cost
    else
        return false
    end
    RecuperarEquipo()
    return true
end

function Tienda.Tienda_up()
    Tienda.Sel_tienda=Tienda.Sel_tienda-1
end


function Tienda.Tienda_down()
 Tienda.Sel_tienda=Tienda.Sel_tienda+1
end

function Tienda.Tienda_left()

end

function Tienda.Tienda_right()

end
function Tienda_mode()
    love.graphics.print("Tienda",10,2+(24*1))
    love.graphics.print(" "..Tienda.Name_store,10,2+(24*2))
    love.graphics.print("$: "..Dinero,360,2+(24*1))
    love.graphics.print("##: "..Tienda.tipo.." "..Tienda.etapa,360,2+(24*2))

    if Tienda.etapa=="show" and existList(Tienda.ListaStore[Tienda.Sel_tienda].id,items)  then
        local obj={}
        obj = getChars(Tienda.ListaStore[Tienda.Sel_tienda].id, items)
        love.graphics.print(" Tienes "..obj.cont.." "..obj.name,10,2+(24*4))
    elseif Tienda.etapa=="show" then
        love.graphics.print("Posee ninguna "..Tienda.ListaStore[Tienda.Sel_tienda].name,10,2+(24*4))
    end

    if Tienda.etapa=="front" or Tienda.etapa=="begin" then
        if Tienda.tipo=="store" then
            for k,i in pairs(Tienda.menu) do
                if Tienda.Sel_tienda==k then 
                    love.graphics.print( ">"..Tienda.menu[k].name ,300,220+(24*k))
                else 
                    love.graphics.print( " "..Tienda.menu[k].name ,300,220+(24*k))
                end
            end
        elseif Tienda.tipo=="inn" then
            for k,i in pairs(Tienda.inn) do
                if Tienda.Sel_tienda==k then 
                    love.graphics.print( ">"..Tienda.inn[k].name ,300,220+(24*k))
                else 
                    love.graphics.print( " "..Tienda.inn[k].name ,300,220+(24*k))
                end
            end
        end
    end    
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
                love.graphics.print( ">"..i.name.." $"..i.cost.." ["..i.cont.."]" ,300,70+(24*k))
            else
                love.graphics.print( i.name.." $"..i.cost.." ["..i.cont.."]"  ,300,70+(24*k))
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
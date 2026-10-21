
function InfiltracionData.control(key,scancode,isrepeat)
    if InfiltracionData.IsFinished==false then
        if key=="up" then
            InfiltracionData.up()
        end
        if key=="down" then
            InfiltracionData.down()
        end
        if key=="z" then
            InfiltracionData.z()
        end
        InfiltracionData.logica_arrow_menu({})
    elseif InfiltracionData.IsEscape==true then
        if key=="z" then
            InfiltracionData.escape()
        end
    elseif   InfiltracionData.IsFinished==true then     
        if key=="z" then
            InfiltracionData.finish()
        end
    end
    
end

function InfiltracionData.z()
    InfiltracionData.EjecutarAcccion()
end

function InfiltracionData.escape()
    InfiltracionData.IsFinished=false
    InfiltracionData.IsWin=false
    InfiltracionData.IsEscape=false
end

function InfiltracionData.finish()
    Tabla_nodos_finalizados[InfiltracionData.Info.id]=true
    InfiltracionData.IsFinished=false
    InfiltracionData.IsWin=false
    InfiltracionData.IsEscape=false
    InfiltracionData.State=InfiltracionData.State_table.Organizar
    InfiltracionData.Nivel_busqueda=InfiltracionData.Niveles_Table.BASICO
    InfiltracionData.list_used_action={}
    InfiltracionData.Nivel_alerta=0
    InfiltracionData.Nivel_infiltracion=0 
    InfiltracionData.Nivel_tension=0
    InfiltracionData.Timer_dice=0
    InfiltracionData.DC_AREA=8
    InfiltracionData.Limit_type=InfiltracionData.Limit_Table.TENSION


    Show_view="overWorld"
end

function InfiltracionData.up()
    InfiltracionData.Op=InfiltracionData.Op-1  
end

function InfiltracionData.down()
    InfiltracionData.Op=InfiltracionData.Op+1  
end


function InfiltracionData.inside()

end


function InfiltracionData.logica_arrow_menu(list)
    local finalVista= 9
    
    if finalVista> #InfiltracionData.Acciones_base_outside then
        finalVista=#InfiltracionData.Acciones_base_outside
    end
    --paginar



    if InfiltracionData.Op> finalVista  then
        --InfiltracionData.ini_view=InfiltracionData.ini_view+6
        InfiltracionData.Op=finalVista
    end

    
    if InfiltracionData.Op+(InfiltracionData.ini_view - 1)<(InfiltracionData.ini_view - 1) then
        --if ini_view>1 then
            --InfiltracionData.ini_view=InfiltracionData.ini_view-6
            Op=1
        --end
    end

    if InfiltracionData.ini_view<0 then
        InfiltracionData.ini_view=1     
    end

    --[[

    local maximoInside=#list-(InfiltracionData.ini_view - 1)
    if maximoInside>18 then
        maximoInside=18
    end

    if InfiltracionData.Op>18 then
        InfiltracionData.Op=maximoInside
    end

    if InfiltracionData.Op>maximoInside then
        InfiltracionData.Op=maximoInside
    end
]]
    if InfiltracionData.Op==0 or InfiltracionData.Op<0  then
        InfiltracionData.Op=1
    end

end

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
    InfiltracionData.move_menu(-1)
end

function InfiltracionData.down()
    InfiltracionData.move_menu(1)
end


function InfiltracionData.inside()

end


function InfiltracionData.logica_arrow_menu(list)
    local actions=InfiltracionData.Actual_char.stealh_inside
        and InfiltracionData.Acciones_base_inside
        or InfiltracionData.Acciones_base_outside
    local state={
        selected=InfiltracionData.Op,
        first=InfiltracionData.ini_view,
        max_visible=InfiltracionData.MaxVisibleActions,
    }
    MenuPagination.move(state,#actions,0)
    InfiltracionData.Op=state.selected
    InfiltracionData.ini_view=state.first
end

function InfiltracionData.move_menu(direction)
    local actions=InfiltracionData.Actual_char.stealh_inside
        and InfiltracionData.Acciones_base_inside
        or InfiltracionData.Acciones_base_outside
    local state={
        selected=InfiltracionData.Op,
        first=InfiltracionData.ini_view,
        max_visible=InfiltracionData.MaxVisibleActions,
    }
    MenuPagination.move(state,#actions,direction)
    InfiltracionData.Op=state.selected
    InfiltracionData.ini_view=state.first

end
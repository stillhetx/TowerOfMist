Action={}

Action["disfrazarse"] = function (v)
    InfiltracionData.Actual_char.stealh_state["disfrazarse"]=true
    --InfiltracionData.Char_state["disfrazado"]=true

end
Action["investigar"] = function (v)
    --(obj,b,DC,str, modi)
    InfiltracionData.Action_label="investigar"
    if DCMOD(v,v,InfiltracionData.DC_AREA-2,"int",0) then
        --Get Info
        InfiltracionData.list_used_action["investigar"]=true
    else
        InfiltracionData.Nivel_alerta=InfiltracionData.Nivel_alerta + 1
    end

    InfiltracionData.seeEnemys=true

end
Action["distraer_en_puerta"] = function (v)
    InfiltracionData.Action_label="distraer en puerta"
    local d4=flr(rnd(4))
    d4 = math.min(InfiltracionData.NmInside,d4)
    InfiltracionData.NmInside=InfiltracionData.NmInside-d4
    InfiltracionData.NmOutside=InfiltracionData.NmOutside+d4
        --increase from
    InfiltracionData.list_used_action["distraer_en_puerta"]=true
    if DCMOD(v,v,InfiltracionData.DC_AREA-2,"int",0) then
        InfiltracionData.Nivel_tension=InfiltracionData.Nivel_tension-2
    else
        InfiltracionData.Nivel_tension=InfiltracionData.Nivel_tension+1
    end

end

--What???
Action["tarea_afuera"] = function (v)


end
Action["atacar_frente"] = function (v)
    InfiltracionData.Action_label="atacar frente"
        local d6=6
        d6 = math.min(InfiltracionData.NmInside,d6)
        InfiltracionData.NmInside=InfiltracionData.NmInside-d6
        InfiltracionData.NmOutside=InfiltracionData.NmOutside+d6
        InfiltracionData.Nivel_tension=InfiltracionData.Nivel_tension-d6
        if InfiltracionData.Nivel_tension<0 then
            InfiltracionData.Nivel_tension=0
        end
        InfiltracionData.StartCombat=true
        InfiltracionData.where=InfiltracionData.where_table.afuera
        InfiltracionData.CombatType=InfiltracionData.CombatType_Table.FULL

end
Action["pedir_ayuda"] = function (v)
    InfiltracionData.Action_label="pedir ayuda"

    if DCMOD(v,v,InfiltracionData.DC_AREA-2,"car",0) then
        local d4=flr(rnd(4))
        d4 = math.min(InfiltracionData.NmInside,d4)
        InfiltracionData.NmInside=InfiltracionData.NmInside-d4
        InfiltracionData.NmOutside=InfiltracionData.NmOutside+d4
        --increase from
        InfiltracionData.Nivel_tension=InfiltracionData.Nivel_tension - 2
        InfiltracionData.list_used_action["pedir_ayuda"]=true
    else
        InfiltracionData.Nivel_tension=InfiltracionData.Nivel_tension+1
    end

end

Action["infiltrarse"] = function (v)
    InfiltracionData.Action_label="infiltrarse"
    InfiltracionData.Actual_char.stealh_inside=true
    InfiltracionData.Nivel_infiltracion=InfiltracionData.Nivel_infiltracion+1
    InfiltracionData.posiciones[InfiltracionData.numero_char] = InfiltracionData.posiciones_table.dentro
    if DCMOD(v,v,InfiltracionData.DC_AREA-2,"agi",0) then
        --Reduce inside
        --increase from
        InfiltracionData.Nivel_tension=InfiltracionData.Nivel_tension+1
    else
        InfiltracionData.Nivel_tension=InfiltracionData.Nivel_tension+2
    end

    if InfiltracionData.Nivel_infiltracion == InfiltracionData.Nivel_busqueda then
        InfiltracionData.IsFinished=true
    end



end
--[[  {name="infiltrarse", id="infiltrarse"},
    {name="enfrentar enemigos", id="enfrentar_enemigos"},
    {name="buscar", id="buscar"},
    {name="bloquear puerta", id="bloquear_puerta"},
    {name="ocultarse", id="ocultarse"},
]]
Action["buscar"]  = function (v)

    InfiltracionData.Action_label="buscar"
    InfiltracionData.Nivel_tension=InfiltracionData.Nivel_tension + 1
    if DCMOD(v,v,InfiltracionData.DC_AREA-2,"per",0) then
        --getITEMS
        --increase from
        
        InfiltracionData.list_used_action["buscar"]=true
    end

end

Action["ocultarse"]  = function (v)
    InfiltracionData.Action_label="ocultarse"
    if DCMOD(v,v,InfiltracionData.DC_AREA-2,"int",0) then
        --getITEMS
        --increase from
        InfiltracionData.Nivel_tension=InfiltracionData.Nivel_tension - 2    
    end
end

Action["bloquear_puerta"]  = function (v)
    InfiltracionData.Action_label="bloquear_puerta"
    if DCMOD(v,v,InfiltracionData.DC_AREA-2,"int",0) then
        --No fight one turn
        InfiltracionData.Nivel_tension=InfiltracionData.Nivel_tension + 1    
    end

end

Action["enfrentar_enemigos"]  = function (v)
    InfiltracionData.StartCombat=true
    InfiltracionData.where=InfiltracionData.where_table.dentro
    InfiltracionData.CombatType=InfiltracionData.CombatType_Table.oculto
end

--Encontrar conveniencia
Action["enfrentar_enemigos_frontal"]  = function (v)
    InfiltracionData.StartCombat=true
    InfiltracionData.where=InfiltracionData.where_table.dentro
    InfiltracionData.CombatType=InfiltracionData.CombatType_Table.sorpresa
end

Action["Escapar"]  = function (v)
    InfiltracionData.Action_label="infiltrarse"
    InfiltracionData.Actual_char.stealh_inside=false

    if DCMOD(v,v,InfiltracionData.DC_AREA-2,"agi",0) then
        InfiltracionData.Nivel_tension=InfiltracionData.Nivel_tension+1
    else
        InfiltracionData.Nivel_tension=InfiltracionData.Nivel_tension+2
    end
    local escapar=true
    for k,v in pairs(ActiveParty) do
        if v.stealh_inside==true then
            escapar=false
        end
    end

    if escapar==true then
        InfiltracionData.IsEscape=true
    end

end

Action["robar_sigilo"]  = function (v)

end

function InfiltracionData.EjecutarAcccion()
    local toAction=""
    
    if InfiltracionData.Actual_char.stealh_inside ==true then
        toAction=InfiltracionData.Acciones_base_inside[InfiltracionData.Op].id
    else   
        toAction=InfiltracionData.Acciones_base_outside[InfiltracionData.Op].id 
    end
    
    if  Action[toAction] then 
        Action[toAction](InfiltracionData.Actual_char)
    end

    if InfiltracionData.IsFinished==true then
        
        
    end

    InfiltracionData.numero_char=InfiltracionData.numero_char+1

    if InfiltracionData.Nivel_tension < 0 then
        InfiltracionData.Nivel_tension=0
    end
    if InfiltracionData.Nivel_tension>InfiltracionData.MAX_TENSION then
        InfiltracionData.Nivel_tension=InfiltracionData.MAX_TENSION
    end
    local isRoll=false
    if InfiltracionData.Nivel_tension == InfiltracionData.MAX_TENSION then
        isRoll=true
    end    

    if InfiltracionData.numero_char > 3 then
        isRoll=true
        InfiltracionData.numero_char=1
    end

    if isRoll == true then
        InfiltracionData.RollTension()
        --InfiltracionData.State=InfiltracionData.State_table.Resolver
        InfiltracionData.StartEvent=true
    end
    
    InfiltracionData.Actual_char=ActiveParty[InfiltracionData.numero_char]

    if InfiltracionData.StartEvent == true then
        InfiltracionData.StartEvent = false
        InfiltracionData.ChooseEvent()
    end

    if InfiltracionData.StartCombat == true then
        InfiltracionData.StartCombat = false
        InfiltracionData.Init_Combat()
    end

end


function InfiltracionData.iniciar_combat()

end

function InfiltracionData.ChooseEvent()
   -- InfiltracionData.StartCombat=true

   if InfiltracionData.Nivel_alerta>0 then
        InfiltracionData.StartCombat=true
        InfiltracionData.CombatType=InfiltracionData.CombatType_Table.sorpresa
        InfiltracionData.where=InfiltracionData.where_table.dentro
    end



end


function InfiltracionData.Init_Combat()



    if InfiltracionData.where == InfiltracionData.where_table.afuera then
        if InfiltracionData.NmOutside<=0 then
            return
        end
    elseif InfiltracionData.where == InfiltracionData.where_table.dentro then 
        if InfiltracionData.NmInside<=0 then
            return
        end
    end
    Show_view="graph"
    Nvg=1
    --Msg_debug="before ini"..""

    InfiltracionData.Numero_adversarios=0
    if InfiltracionData.CombatType==InfiltracionData.CombatType_Table.oculto then
        if InfiltracionData.NmInside+InfiltracionData.NmOutside>0 then
            local d2 = flr(rnd(2))
            if InfiltracionData.where == InfiltracionData.where_table.afuera then
                d2=math.min(d2,InfiltracionData.NmOutside)
            elseif InfiltracionData.where == InfiltracionData.where_table.dentro then 
                d2=math.min(d2,InfiltracionData.NmInside)
            end
            InfiltracionData.Numero_adversarios=d2
            enemyGroups=horda["Castillo_maniacos_enemigos#"..d2]
           -- Msg_debug="oculto Castillo_maniacos_enemigos#"..""..d2
            Config.Pos_monster_Nvg()
            Config.modo_sigilo()
            Temp_Order=copiar_tabla(ActiveParty)
            ActiveParty=Vaciar_tabla()
            InfiltracionData.filtrarTemp_group()

        end
    end
    if InfiltracionData.CombatType==InfiltracionData.CombatType_Table.FULL then
        if InfiltracionData.NmInside+InfiltracionData.NmOutside>0 then
            local all = 6
            if InfiltracionData.where == InfiltracionData.where_table.afuera then
                all=math.min(all,InfiltracionData.NmOutside)
            elseif InfiltracionData.where == InfiltracionData.where_table.dentro then 
                all=math.min(all,InfiltracionData.NmInside)
            end

            
            InfiltracionData.Numero_adversarios=all
            Msg_debug="full Castillo_maniacos_enemigos#"..""..all
            enemyGroups=horda["Castillo_maniacos_enemigos#"..all]
            --Msg_debug="full Castillo_maniacos_enemigos#"..""..all
            Config.Pos_monster_Nvg()

            Temp_Order=copiar_tabla(ActiveParty)
            ActiveParty=Vaciar_tabla()
            
            InfiltracionData.filtrarTemp_group()
            
        end
    end
    if InfiltracionData.CombatType==InfiltracionData.CombatType_Table.sorpresa then
        if InfiltracionData.NmInside+InfiltracionData.NmOutside>0 then

            --local d4 = flr(rnd(4))
            --d4=math.min(d4,InfiltracionData.NmInside)
            --InfiltracionData.Numero_adversarios=d4
            local enemigos=InfiltracionData.Nivel_alerta
            if InfiltracionData.where == InfiltracionData.where_table.afuera then
                enemigos=math.min(enemigos,InfiltracionData.NmOutside)
            elseif InfiltracionData.where == InfiltracionData.where_table.dentro then 
                enemigos=math.min(enemigos,InfiltracionData.NmInside)
            end
            if enemigos>0 then
                InfiltracionData.Numero_adversarios=enemigos
                InfiltracionData.Nivel_alerta=0
                enemyGroups=horda["Castillo_maniacos_enemigos#"..enemigos]
                --Msg_debug="sorpresa Castillo_maniacos_enemigos#"..""..d4
                Config.Pos_monster_Nvg()
                InfiltracionData.filtrarTemp_group()
            end
        end
    end
    

    --nextLevel()
    nextLevel()
    BeforeBattleMode="stealthMode"
    CombatType=InfiltracionData.CombatType




end


function InfiltracionData.filtrarTemp_group()
            if InfiltracionData.where == InfiltracionData.where_table.afuera then
                for k,v in pairs(Temp_Order) do
                    if v.stealh_inside ==false then
                        add(ActiveParty,v)
                    end
                end
            elseif InfiltracionData.where == InfiltracionData.where_table.dentro then 
                for k,v in pairs(Temp_Order) do
                    if v.stealh_inside ==true then
                        add(ActiveParty,v)
                    end
                end
            end
end

function InfiltracionData.RollTension()
    InfiltracionData.RollList={}
    local ones=0
    local sixs=0
    local result=0
    for k=1 , InfiltracionData.Nivel_tension do
        InfiltracionData.RollList[k]=flr(rnd(6))
        if InfiltracionData.RollList[k]==1 then
            ones=ones+1
        end 
        if InfiltracionData.RollList[k]==6 then
            sixs=sixs+1
        end 
    end
    result = ones - sixs
    if result >0 then
        InfiltracionData.Nivel_alerta=result
        InfiltracionData.StartEvent=true
    end

end
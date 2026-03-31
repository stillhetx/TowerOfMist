

function enemy_action(Enemy,alineamiento)
    local accion_elegida=false
    local objetivo=0   --Deprecado
    local last_e=Actual.id --Deprecado
    local last_a=Actual.ia[1] --Deprecado
    local num_accion=flr(rnd(#Actual.ia-1))+1 --Deprecado
    local dice100=flr(rnd(100-1))+1

    local action=""

    if Enemy.id_class=="murcielago" then
        if dice100<50 then 
            action="atacar"
        end
        if dice100>=50  and dice100<80 then 
            action="drenar"
        end
        if  dice100>=80 then 
            action="veneno"
        end
        accion_elegida=true
    end

    if accion_elegida==false then
        action="atacar"
    end

    local atacar=true
    local razon=""
    if  Actual.state['congelar'] ~= nil then atacar=false razon=razon.."congelar" end
    if  Actual.state['paralisis'] ~= nil then atacar=false razon=razon.."paralisis" end
    if atacar then
        Accion_enemiga(action,alineamiento)
    else
        msg_efecto(Actual, razon)
    end       
end


function Accion_enemiga(str,alineamiento) 
    local objetivo={}

    if alineamiento=="enemy" then
        objetivo=obtener_objetivo()
    else
        objetivo=obtener_enemigo()
    end
    
    if objetivo~= nil and objetivo~= {} then
        B_wait=true
        if str=="atacar" then
            Actual.avanzar=true
            Actual.rest=false
            Actual.anim_acc="ataque_arma"
            Actual.anim_col={1,1,1,1}
            if acertar(objetivo, Actual) then
                objetivo.lastDmg=0
                objetivo.slDmg=true
                objetivo.lastDmgC="V"
                local crit =""
                local mult=1
                mult, crit =  adv_weak_Logic(objetivo,Actual,{"cosmic"},false )
                DamageProccess(objetivo,Actual,-(((Actual.fue + flr(rnd(2)))*mult)),crit)
                jump_start(objetivo)
                checks(objetivo)
                objetivo.anim_acc="corte"
                objetivo.anim_col={1,0,0,1}
            else
                eludido(objetivo)    
            end
        end
        if str=="drenar" then
            Actual.avanzar=true
            Actual.rest=false
            Actual.anim_acc="ataque_arma"
            Actual.anim_col={1,1,1,1}
            if acertar(objetivo, Actual) then
                objetivo.lastDmg=0
                objetivo.slDmg=true
                objetivo.lastDmgC="V"
                local crit =""
                local mult=1
                mult, crit =  adv_weak_Logic(objetivo,Actual,{"cosmic"},false )
                local drenar=-(((Actual.fue + flr(rnd(2)))*mult))
                DamageProccess(objetivo,Actual,drenar,crit)
                Actual.hp_=Actual.hp_+(-(drenar/4))
                jump_start(objetivo)
                checks(objetivo)
                objetivo.anim_acc="corte"
                objetivo.anim_col={1,0,0,1}
            else
                eludido(objetivo)    
            end
        end
        if str=="mordisco_venenozo" then
            Actual.avanzar=true
            Actual.rest=false
            Actual.anim_acc="ataque_arma"
            Actual.anim_col={1,1,1,1}
            if acertar(objetivo, Actual) then
                objetivo.lastDmg=0
                objetivo.slDmg=true
                objetivo.lastDmgC="V"
                local crit =""
                local mult=1
                mult, crit =  adv_weak_Logic(objetivo,Actual,{"cosmic"},false )
                DamageProccess(objetivo,Actual,-((((Actual.fue/4) + flr(rnd(2)))*mult)),crit)
                objetivo.state["veneno"]={name="veneno",id="veneno",spr=3,value=Actual.pod/4,val=Actual.pod/4,cont=3,ini=5}
                jump_start(objetivo)
                checks(objetivo)
                objetivo.anim_acc="corte"
                objetivo.anim_col={1,0,0,1}
            else
                eludido(objetivo)    
            end
        end
    end

end


function obtener_objetivo()
    local obj={}
    local objetivos=get_Personaje_disponible()
    local numero_objetivo=flr(rnd(#objetivos-1))+1
    obj=objetivos[numero_objetivo]
    return obj
end

function get_Personaje_disponible()
    local list={}
    for k,v in pairs(Order) do
        if v.tipo=="player" and v.jump==false and v.see==true and v.hp_>0 then
            add(list,v)
        end 
    end
    if #list==0 then
        add(list,ActiveParty[1])
    end
    return list
end


function obtener_enemigo()
    local obj={}
    local objetivos=get_Enemigo_disponible()
    local numero_objetivo=flr(rnd(#objetivos))
    obj=objetivos[numero_objetivo]
    return obj
end


function get_Enemigo_disponible()
    local list={}
    for k,v in pairs(Order) do
        if v.tipo=="enemy" and v.jump==false and v.see==true and v.hp_>0 then
            add(list,v)
        end 
    end
    if #list==0 then
        add(list,Show_enemy[1])
    end
    return list
end
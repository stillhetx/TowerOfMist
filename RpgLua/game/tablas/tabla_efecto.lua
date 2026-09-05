Efectos={}

Bonificador={}
--(v objetivo ,w lanzador ,f Objeto , bol --boolean de potenciado, bono multiplicador)
--commando

-- v objetivo {}
-- w ejecutor{}
-- f objeto {}
-- arm  brazo type=string
-- punteria bono a punteria type=number
-- bono multiplicador de daño
-- bcrit bono a critico type=number
-- tipo  tipos del ataque {}  
Efectos ["ejecutar_ataque_basico_INIT"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    --Debug_temp=Debug_temp.." "..str.." "
    w.carga=1
    if v~= nil and v~={} then
        if isDesarmadoObj(w)  then
            Efectos["ejecutar_ataque_desarmado_beta"](v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            checks(v)
        else
            Efectos["ejecutar_ataque_base"](v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            checks(v) 
        end 
    end
end    

Efectos["ejecutar_ataque_base_tipo"]= function (v,w,f,arm,punteria,bono,tipos,extra)
    punteria = 0 or punteria
    bono = 1 or bono
    arm = "left" or arm
    tipos = {"volar"} or tipos
    if v~=nil and v~={} then
            if w.weapon[arm].smodo== "white" then
                w.avanzar=true
                w.rest=false
                Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
                w.anim_acc="ataque_arma"
                w.anim_col={1,1,1,1}    
                if acertarMod(v,w,punteria) then
                    local crit=""
                    local mult=1
                    local calidad=bono_calidad(w.weapon[arm],w)
                    local attt=0
                    attt=attt+flr((w.con + flr(rnd(w.weapon[arm].w)) + w.weapon[arm].bw+calidad)*mult)
                    mult, crit =  adv_weak_Logic(v,w,tipos,true )
                    DamageProccess(v,w,-attt*bono,crit)
                    jump_start(v)
                    v.anim_acc="corte"
                    v.anim_col={1,1,1,1}
                    Animacion.add_action_animation(v,"corte",{1,1,1,1})
                else
                    eludido(v)    
                end               
            elseif w.weapon[arm].smodo== "fire" then
                w.avanzar=true
                w.rest=false
                w.anim_acc="ataque_arma"
                w.anim_col={1,1,1,1}    
                if acertarMod(v,w,punteria) then
                    local crit=""
                    local mult=1
                    local calidad=bono_calidad(w.weapon[arm],w)
                    local attt=0
                    attt=attt+flr((w.dex + flr(rnd(w.weapon[arm].w)) + w.weapon[arm].bw+calidad)*mult)
                    mult, crit =  adv_weak_Logic(v,w,tipos,true )
                    DamageProccess(v,w,-attt,crit)
                    jump_start(v)
                    v.anim_acc="corte"
                    v.anim_col={1,1,1,1}
                    Animacion.add_action_animation(v,"corte",{1,1,1,1})
                else
                    eludido(v)    
                end   
            elseif w.weapon[arm].smodo== "fist" then
                --Debug_temp=Debug_temp.." Fist"
                w.avanzar=true
                w.rest=false
                w.anim_acc="puñetazos"
                w.anim_col={1,1,1,1}
                if acertarMod(v,w,punteria) then
                    local crit=""
                    local mult=1 
                    local calidad=bono_calidad(w.weapon[arm],w)
                    mult, crit =  adv_weak_Logic(v,w,tipos,true )
                    DamageProccess(v,w,-flr(((w.con*2) + flr(rnd(w.weapon[arm].w)) + w.weapon[arm].bw+calidad)*mult),crit)
                    jump_start(v)
                    v.anim_acc="puñetazos"
                    v.anim_col={1,1,1,1}
                else
                    eludido(v)    
                end 
            else
                local sub_arm="left"
                if arm=="right" then 
                    sub_arm="right"
                end    
                if w.weapon[sub_arm].smodo== "fist" then
                    w.avanzar=true
                    w.rest=false
                    w.anim_acc="puñetazos"
                    w.anim_col={1,1,1,1}
                    if acertarMod(v,w,punteria) then
                        local crit=""
                        local mult=1 
                        local calidad=bono_calidad(w.weapon[sub_arm],w)
                        mult, crit =  adv_weak_Logic(v,w,tipos,true )
                        DamageProccess(v,w,-flr(((w.con*2) + flr(rnd(w.weapon[sub_arm].w)) + w.weapon[sub_arm].bw+calidad)*mult),crit)
                        jump_start(v)
                        v.anim_acc="puñetazos"
                        v.anim_col={1,1,1,1}
                    else
                        eludido(v)    
                    end                    
                end
            end
    end
end 

Efectos["danno_elemental"]= function (v,w,f,arm,punteria,bono,bcrit,tipos,extra)
    if w.weapon and w.weapon[arm].isCast==true then
        for k,i in pairs(w.weapon[arm].cast) do
            --Efectos[i](v,w,f,arm,punteria,bono,bcrit,tipos,extra)
            agregarAccion({"ejecutar_elemental_damage",i,v,w})

        end
    end
end

Efectos["ejecutar_ataque_base"]= function (v,w,f,arm,punteria,bono,bcrit,tipos,extra)
    punteria = 0 or punteria
    bono = 1 or bono
    arm = "left" or arm
    bcrit = 0 or bcrit
    if v~=nil and v~={} then
            if w.weapon[arm].smodo== "white" then
                w.avanzar=true
                w.rest=false
                Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
                w.anim_acc="ataque_arma"
                w.anim_col={1,1,1,1}    
                if acertarMod(v,w,punteria) then
                    local crit=""
                    local mult=1
                    local calidad=bono_calidad(w.weapon[arm],w)
                    local attt=0
                    mult, crit =  adv_weak_Logic(v,w,{"volar"},true )
                    attt=attt+flr((w.con + flr(rnd(w.weapon[arm].w)) + w.weapon[arm].bw+calidad)*(mult+bcrit))
                    DamageProccess(v,w,-attt*bono,crit)
                    if v.hp_>0 then
                        Efectos["danno_elemental"](v,w,f,arm,punteria,bono,bcrit,tipos,extra)
                    end
                    jump_start(v)
                    v.anim_acc="corte"
                    v.anim_col={1,1,1,1}
                    Animacion.add_action_animation(v,"corte",{1,1,1,1})
                else
                    eludido(v)    
                end               
            elseif w.weapon[arm].smodo== "fire" then
                w.avanzar=true
                w.rest=false
                w.anim_acc="ataque_arma"
                w.anim_col={1,1,1,1}    
                if acertarMod(v,w,punteria) then
                    local crit=""
                    local mult=1
                    local calidad=bono_calidad(w.weapon[arm],w)
                    local attt=0
                    attt=attt+flr((w.dex + flr(rnd(w.weapon[arm].w)) + w.weapon[arm].bw+calidad)*(mult+bcrit))
                    mult, crit =  adv_weak_Logic(v,w,{"volar"},true )
                    DamageProccess(v,w,-attt,crit)
                    if v.hp_>0 then
                        Efectos["danno_elemental"](v,w,f,arm,punteria,bono,bcrit,tipos,extra)
                    end
                    jump_start(v)
                    v.anim_acc="corte"
                    v.anim_col={1,1,1,1}
                    Animacion.add_action_animation(v,"corte",{1,1,1,1})
                else
                    eludido(v)    
                end   
            elseif w.weapon[arm].smodo== "fist" then
                --Debug_temp=Debug_temp.." Fist"
                w.avanzar=true
                w.rest=false
                w.anim_acc="puñetazos"
                w.anim_col={1,1,1,1}
                if acertarMod(v,w,punteria) then
                    local crit=""
                    local mult=1 
                    local calidad=bono_calidad(w.weapon[arm],w)
                    mult, crit =  adv_weak_Logic(v,w,{"volar"},true )
                    DamageProccess(v,w,-flr(((w.con*2) + flr(rnd(w.weapon[arm].w)) + w.weapon[arm].bw+calidad)*(mult+bcrit)),crit)
                    if v.hp_>0 then
                        Efectos["danno_elemental"](v,w,f,arm,punteria,bono,bcrit,tipos,extra)
                    end
                    jump_start(v)
                    v.anim_acc="puñetazos"
                    v.anim_col={1,1,1,1}
                else
                    eludido(v)    
                end 
            else
                local sub_arm="left"
                if arm=="right" then 
                    sub_arm="right"
                end    
                if w.weapon[sub_arm].smodo== "fist" then
                    w.avanzar=true
                    w.rest=false
                    w.anim_acc="puñetazos"
                    w.anim_col={1,1,1,1}
                    if acertarMod(v,w,punteria) then
                        local crit=""
                        local mult=1 
                        local calidad=bono_calidad(w.weapon[sub_arm],w)
                        mult, crit =  adv_weak_Logic(v,w,tipos,true )
                        DamageProccess(v,w,-flr(((w.con*2) + flr(rnd(w.weapon[sub_arm].w)) + w.weapon[sub_arm].bw+calidad)*(mult+bcrit)),crit)
                        if v.hp_>0 then
                            Efectos["danno_elemental"](v,w,f,arm,punteria,bono,bcrit,tipos,extra)
                        end
                        jump_start(v)
                        v.anim_acc="puñetazos"
                        v.anim_col={1,1,1,1}
                    else
                        eludido(v)    
                    end                    
                end                
            end
    end
end    

Efectos["ejecutar_ataque_desarmado_beta"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side) 
        punteria = 0 or punteria
        bono = 1 or bono
        bcrit=0 or bcrit
        w.avanzar=true
        w.rest=false
        w.anim_acc="puñetazos"
        w.anim_col={1,1,1,1}
        if acertarMod(v,Actual,punteria) then
            local crit=""
            local mult=1
            mult, crit =  adv_weak_Logic(v,w,{"volar"},true )
            DamageProccess(v,w,-flr((w.con)*(mult+bcrit)*1.5*bono),crit)
            jump_start(v)
            v.anim_acc="golpe"
            v.anim_col={1,1,1,1}
        else
            eludido(v)    
        end   
end

Efectos["atacar_normal"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    local objetivo_global=v
	wait_start()
    agregarAccion({"ejecutar_atacar_A","",objetivo_global})
    --[[if w.weapon and w.weapon.right.isCast==true then
        for k,i in pairs(w.weapon.right.cast) do
            agregarAccion({"ejecutar_elemental_damage",i,objetivo_global})
        end
    end]]
    agregarAccion({"ejecutar_atacar_B","",objetivo_global})
    --[[if w.weapon and w.weapon.left.isCast==true then
        for k,i in pairs(w.weapon.left.cast) do
            agregarAccion({"ejecutar_elemental_damage",i,objetivo_global})
        end
    end ]]   
end

Efectos["atrapar"] = function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    agregarAccion({"ejecutar_capturar","",v})
end

Efectos["incontrolable"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    agregarAccion({"ejecutar_comando","desenbocado",v,w})
    agregarAccion({"ejecutar_comando","desenbocado",v,w})
    agregarAccion({"ejecutar_comando_final","desenbocado",v,w})
end

Efectos["extraer"] = function (v,w,f,arm,punteria,bono,bcrit,tipo,str,side)

    if str == "fuego" then
        --add()
    elseif str == "hielo"  then
        --save()
    else
    --
    end
    
end



Efectos["extraer_all"] = function (v,w,f,arm,punteria,bono,bcrit,tipo,str,side)
    Animacion.add_action_animation(w,"magia",{1,1,1,1})
    --Extrae todos los elementos
    
end


Efectos["rezar"] = function (v,w,f,arm,punteria,bono,bcrit,tipo,str,side)
    Animacion.add_action_animation(w,"magia",{0,1,0,1})
    local mult, crit =  adv_weak_Logic(w,w,{"curar"},false )
    DamageProccess(w,w,((w.pod + mod(w,"pod"))*3)*mult,crit) 
    jump_start(w)
    
end

Efectos["centrarse"] = function (v,w,f,arm,punteria,bono,bcrit,tipo,str,side)
    Animacion.add_action_animation(w,"magia",{1,1,1,1})
    w.state["centrarse"]={name="centrarse",id="centrarse",spr=11,value=2,cont=5,ini=5}

    --Extrae todos los elementos
    
end

Efectos["premonicion"] = function (v,w,f,arm,punteria,bono,bcrit,tipo,str,side)
    Animacion.add_action_animation(w,"magia",{1,1,1,1})
    w.state["premonicion"]={name="premonicion",id="premonicion",spr=11,value=2,cont=5,ini=5}    
end


Efectos["esconderse"] = function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    w.anim_acc="magia"
    w.anim_col={1,1,1,1}
    Animacion.add_action_animation(w,"magia",{1,1,1,1})
    w.hide=true    
    --v.hide=true    
end

--Actual.hide=true

Efectos["asesinar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

    if Actual.weapon.left.w then 
        agregarAccion({"ejecutar_comando","asesinar_left",v,w})
    end
    if Actual.weapon.right.w then 
        agregarAccion({"ejecutar_comando","asesinar_right",v,w})
    end
end

Efectos["asesinar_left"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)


        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            local escon=1
            if w.hide then
                escon=2
            end
            local ultra=1
            ultra = multiplicador_estado(v)
            local mult, crit =  adv_weak_Logic(v,w,{"fisico"},false )
            DamageProccess(v,w,-(((flr(rnd(Actual.weapon.left.w)) + Actual.weapon.left.bw)+(w.dex*3 + mod(w,"dex") ))*bono*escon*ultra*mult),crit)
             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
        
end


Efectos["asesinar_right"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)


        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            local escon=1
            if w.hide then
                escon=2
            end
            local ultra=1
            ultra = multiplicador_estado(v)
            local mult, crit =  adv_weak_Logic(v,w,{"fisico"},false )
            DamageProccess(v,w,-(((flr(rnd(Actual.weapon.right.w)) + Actual.weapon.right.bw)+(w.dex*3 + mod(w,"dex") ))*bono*escon*ultra*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
        
end

--funcional
Efectos["saltar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

    if Actual.weapon.left.w then 
        agregarAccion({"ejecutar_comando","saltar_left",v,w})
    end
    if Actual.weapon.right.w then 
        agregarAccion({"ejecutar_comando","saltar_right",v,w})
    end
end


Efectos["saltar_left"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        Actual.avanzar=true
        Actual.rest=false
        if acertarMod(v,w,6) then
            v.lastDmg=0
            v.slDmg=true
            v.lastDmgC="R"
            local mult, crit =  adv_weak_Logic(v,w,{"fisico"},false )
            DamageProccess(v,w,-flr((w.con+ mod(w,"con") + flr(rnd(w.weapon.left.w)) + w.weapon.left.bw)*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
end

Efectos["saltar_right"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        Actual.avanzar=true
        Actual.rest=false
        if acertarMod(v,w,6) then
            v.lastDmg=0
            v.slDmg=true
            v.lastDmgC="R"
            local mult, crit =  adv_weak_Logic(v,w,{"fisico"},false )
            DamageProccess(v,w,-flr((Actual.con + flr(rnd(Actual.weapon.right.w)) + Actual.weapon.right.bw)*3*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
end

    --tools

Efectos["metralleta"]= function(v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"oscuridad","magia"},false )
            DamageProccess(v,w,-(((Total(w,"dex"))*3 + 9)*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
        
    end

Efectos["generador_electrico"]= function(v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"oscuridad","magia"},false )
            DamageProccess(v,w,-(((Total(w,"dex"))*3 + 9)*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
        
    end

Efectos["disparador_sonico"]= function(v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"sonido","fisico"},false )
            DamageProccess(v,w,-((Total(w,"dex")*3 + 9)*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["misiles"]= function(v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"explosion","fisico"},false )
            DamageProccess(v,w,-((Total(w,"dex")*3 + 16)*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

    
Efectos["generador_de_gravedad"]= function(v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"gravedad","fisico"},false )
            DamageProccess(v,w,-((Total(w,"dex")*3 + 16)*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end


Efectos["tecnologia_prohibida"]= function(v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"oscuridad","fisico"},false )
            DamageProccess(v,w,-((Total(w,"dex")*3 + 32)*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Local_debug=""
Efectos["lanza_llamas"]= function(v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            Local_debug=v.name
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","elemental"},false )
            DamageProccess(v,w,-((Total(w,"dex")*3 + 9)*bono*mult),crit,"elemental")
            Animacion.add_action_animation(v,"fuego",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

    --- TRANSFORMACIONES

Efectos["destransformar"]= function(v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        v.forma=false
        v.acc=v.accResp
    end

Efectos["forma_murcielago"]= function(v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
        Animacion.add_action_animation(v,"magia",{1,1,1,1})
        v.forma=true
        v.sec_anim={ti=0,ac=1,frm={{t=32,spr=3},{t=32,spr=32},}}
        v.acc={"atacar","destransformar","defensa","objetos"}
    end

Efectos["forma_serpiente"]= function(v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
        Animacion.add_action_animation(v,"magia",{1,1,1,1})
        v.forma=true
        v.sec_anim={ti=0,ac=1,frm={{t=32,spr=66},{t=32,spr=67},}}
        v.acc={"atacar","destransformar","defensa","objetos"}
    end

Efectos["forma_slime"]= function(v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
        Animacion.add_action_animation(v,"magia",{1,1,1,1})
        v.forma=true
        v.sec_anim={ti=0,ac=1,frm={{t=32,spr=70},{t=32,spr=71},}}
        v.acc={"atacar","destransformar","defensa","objetos"}
    end

    ---OSCURIDAD
    
Efectos["darkness"]= function(v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"oscuridad","magia"},false )
            DamageProccess(v,w,-((Total(w,"pod")*3 + 12)*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

---invocaciones ataque
    
Efectos["anomalia"]= function(v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        w.summon=true
        w.ani_summon="anomalia"
        w.avanzar_x=400
        w.summon_x=-60
        w.summon_x_=-60
        w.summon_y=150
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fisico"},false )
            DamageProccess(v,w,-((Total(w,"pod")*3 + 12)*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end




Efectos["Demonio_protector"]= function(v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        w.summon=true
        w.ani_summon="Demonio_protector"
        w.avanzar_x=400
        w.summon_x=-300
        w.summon_x_=-300
        w.summon_y=150
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            DamageProccess(v,w,-((Total(w,"pod")*3 + 12)*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end
    
Efectos["dragon_de_fuego "]= function(v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            DamageProccess(v,w,-((Total(w,"pod")*3 + 12)*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end


---Combinaciones Fisico y elemental
Efectos["Tiphon_de_agua"]= function(v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fisico","magia"},false )
            DamageProccess(v,w,-((Total(w,"pod")*3 + 12)*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["relampago_divino"]= function(v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"electricidad","magia"},false )
            DamageProccess(v,w,-((Total(w,"pod")*3 + 12)*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["petalos_cortantes"]= function(v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"corte","magia"},false )
            DamageProccess(v,w,-((Total(w,"pod")*3 + 12)*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end
Efectos["danza_helada"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"frio","magia"},false )
            DamageProccess(v,w,-((Total(w,"pod")*3 + 12)*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["fuerza_del_bosque"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"golpe","magia"},false )
            DamageProccess(v,w,-((Total(w,"pod")*3 + 12)*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["voluntad_de_la_tierra"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"golpe","magia"},false )
            DamageProccess(v,w,-((Total(w,"pod")*3 + 12)*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["corte_infernal"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"corte","fuego","magia"},false )
            DamageProccess(v,w,-((Total(w,"pod")*3 + 12)*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

---Ataque con mecha    

Efectos["giga_mecha"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","fisico"},false )
            DamageProccess(v,w,-((Total(w,"pod")*3 + 12)*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
end
---Ataque de nivel alto y sagrado
Efectos["voluntad_divina"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"sagrado","magia"},false )
            DamageProccess(v,w,-((Total(w,"pod")*3 + 12)*bono*mult),crit)

            Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
end

---////Invocaciones

Efectos["Elemental_de_fuego"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
            Animacion.add_action_animation(w,"magia",{1,1,1,1})
            local char=copiar_tabla(invocaciones_fisicas["murcielago_aliado"])
            add(aliados,char)
            char.x=aliadosPosicion[#aliados].x
            char.y=aliadosPosicion[#aliados].y
            char.ini=char.agi+flr(rnd(20))
            add(Order,char)
        end
end


Efectos["Elemental_de_agua"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
            Animacion.add_action_animation(w,"magia",{1,1,1,1})
            local char=copiar_tabla(invocaciones_fisicas["murcielago_aliado"])
            add(aliados,char)
            char.x=aliadosPosicion[#aliados].x
            char.y=aliadosPosicion[#aliados].y
            char.ini=char.agi+flr(rnd(20))
            add(Order,char)
        end
end

Efectos["Elemental_de_relampago"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
            Animacion.add_action_animation(w,"magia",{1,1,1,1})
            local char=copiar_tabla(invocaciones_fisicas["murcielago_aliado"])
            add(aliados,char)
            char.x=aliadosPosicion[#aliados].x
            char.y=aliadosPosicion[#aliados].y
            char.ini=char.agi+flr(rnd(20))
            add(Order,char)
        end
end

Efectos["Elemental_de_aire"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
            Animacion.add_action_animation(w,"magia",{1,1,1,1})
            local char=copiar_tabla(invocaciones_fisicas["murcielago_aliado"])
            add(aliados,char)
            char.x=aliadosPosicion[#aliados].x
            char.y=aliadosPosicion[#aliados].y
            char.ini=char.agi+flr(rnd(20))
            add(Order,char)
        end
end

Efectos["Elemental_del_bosque"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
            Animacion.add_action_animation(w,"magia",{1,1,1,1})
            local char=copiar_tabla(invocaciones_fisicas["murcielago_aliado"])
            add(aliados,char)
            char.x=aliadosPosicion[#aliados].x
            char.y=aliadosPosicion[#aliados].y
            char.ini=char.agi+flr(rnd(20))
            add(Order,char)
        end
end

Efectos["Elemental_de_tierra"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
            Animacion.add_action_animation(w,"magia",{1,1,1,1})
            local char=copiar_tabla(invocaciones_fisicas["murcielago_aliado"])
            add(aliados,char)
            char.x=aliadosPosicion[#aliados].x
            char.y=aliadosPosicion[#aliados].y
            char.ini=char.agi+flr(rnd(20))
            add(Order,char)
        end
    end


---Invoca regalo
Efectos["regalo"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
            Animacion.add_action_animation(w,"magia",{1,1,1,1})
            local char=copiar_tabla(invocaciones_fisicas["murcielago_aliado"])
            add(aliados,char)
            char.x=aliadosPosicion[#aliados].x
            char.y=aliadosPosicion[#aliados].y
            char.ini=char.agi+flr(rnd(20))
            add(Order,char)
        end
    end


---invoca una roca que obstruye el camino
Efectos["roca!!"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
            Animacion.add_action_animation(w,"magia",{1,1,1,1})
            local char=copiar_tabla(invocaciones_fisicas["murcielago_aliado"])
            add(aliados,char)
            char.x=aliadosPosicion[#aliados].x
            char.y=aliadosPosicion[#aliados].y
            char.ini=char.agi+flr(rnd(20))
            add(Order,char)
        end
    end

--invoca un fantasma

Efectos["fantasma"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
            Animacion.add_action_animation(w,"magia",{1,1,1,1})
            local char=copiar_tabla(invocaciones_fisicas["murcielago_aliado"])
            add(aliados,char)
            char.x=aliadosPosicion[#aliados].x
            char.y=aliadosPosicion[#aliados].y
            char.ini=char.agi+flr(rnd(20))
            add(Order,char)
        end
end

--invocaciones
Efectos["murcielago"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
            Animacion.add_action_animation(w,"magia",{1,1,1,1})
            local char=copiar_tabla(invocaciones_fisicas["murcielago_aliado"])
            char.id="murcielago_aliado"..(#aliados+1)
            char.x=aliadosPosicion[#aliados+1].x
            char.y=aliadosPosicion[#aliados+1].y
            char.x_=aliadosPosicion[#aliados+1].x
            char.y_=aliadosPosicion[#aliados+1].y
            char.ini=char.agi+flr(rnd(20))
            add(aliados,char)
            add(Order,char)
        end
    end

Efectos["zombie"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
            Animacion.add_action_animation(w,"magia",{1,1,1,1})
            local char=copiar_tabla(invocaciones_fisicas["zombie_aliado"])
            char.id="zombie_aliado"..(#aliados+1)
            char.x=aliadosPosicion[#aliados+1].x
            char.y=aliadosPosicion[#aliados+1].y
            char.x_=aliadosPosicion[#aliados+1].x
            char.y_=aliadosPosicion[#aliados+1].y
            char.ini=char.agi+flr(rnd(20))
            add(aliados,char)
            add(Order,char)
        end
    end

Efectos["esqueleto"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
            Animacion.add_action_animation(w,"magia",{1,1,1,1})
            local char=copiar_tabla(invocaciones_fisicas["Esqueleto_aliado"])
            char.id="Esqueleto_aliado"..(#aliados+1)
            char.x=aliadosPosicion[#aliados+1].x
            char.y=aliadosPosicion[#aliados+1].y
            char.x_=aliadosPosicion[#aliados+1].x
            char.y_=aliadosPosicion[#aliados+1].y
            char.ini=char.agi+flr(rnd(20))
            add(aliados,char)
            add(Order,char)
        end
    end
Efectos["demonio"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
            Animacion.add_action_animation(w,"magia",{1,1,1,1})
            local char=copiar_tabla(invocaciones_fisicas["demonio_aliado"])
            char.id="demonio_aliado"..(#aliados+1)
            char.x=aliadosPosicion[#aliados+1].x
            char.y=aliadosPosicion[#aliados+1].y
            char.x_=aliadosPosicion[#aliados+1].x
            char.y_=aliadosPosicion[#aliados+1].y
            char.ini=char.agi+flr(rnd(20))
            add(aliados,char)
            add(Order,char)
        end
    end

    ---clima
    
    ---  "dia lluvioso"= cambia la naturaleza del area a agua
Efectos["dia_lluvioso"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        enemyGroups[Nvg].terrain="agua"
        for k,i in pairs(EnemigosVivos)do
            if i.hp_>0 then
                if acertarMod(i,w,0) then
                    Msg_debug=Msg_debug.." //Dia lluvioso"
                    local mult, crit =  adv_weak_Logic(i,w,{"golpe","agua","natural","magia"},false )
                    DamageProccess(i,w,-((w.pod + mod(w,"pod") + flr(rnd(20)))*bono*mult),crit)
                    i.anim_acc="corte"
                    i.anim_col={1,1,1,1}
                    jump_start(i)
                    checks(i)
                else
                    eludido(i)    
                end

            end
        end
    end    
    --"dia caluroso"= cambia la naturaleza del area a fuego
Efectos["dia_caluroso"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        enemyGroups[Nvg].terrain="fuego"
        Debug_temp = " //this"
        FiltrarEnemigoVivos()
        for k,i in pairs(EnemigosVivos)do
            if i.hp_>0 then
                if acertarMod(i,w,0) then
                    local mult, crit =  adv_weak_Logic(i,w,{"fuego","natural","magia"},false )
                    DamageProccess(i,w,-((w.pod + mod(w,"pod") + flr(rnd(4)))*bono*mult),crit)
                    i.anim_acc="corte"
                    i.anim_col={1,1,1,1}
                    jump_start(i)
                    checks(i)
                else
                    eludido(i)    
                end

            end
        end
    end 
    --"dia nebado"= cambia la naturaleza del area a hielo
Efectos["dia_nevado"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        enemyGroups[Nvg].terrain="nevado"
        FiltrarEnemigoVivos()
        for k,i in pairs(EnemigosVivos)do
            if i.hp_>0 then
                if acertarMod(i,w,0) then
                    Msg_debug=Msg_debug.." //dia_nevado"
                    local mult, crit =  adv_weak_Logic(i,w,{"hielo","natural","magia"},false )
                    DamageProccess(i,w,-((w.pod + mod(w,"pod") + flr(rnd(4)))*bono*mult),crit)
                    i.anim_acc="corte"
                    i.anim_col={1,1,1,1}
                    jump_start(i)
                    checks(i)
                else
                    eludido(i)    
                end

            end
        end
    end 
    --"dia con viento"= cambia la naturaleza del area a aire
Efectos["dia_con_viento"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        enemyGroups[Nvg].terrain="pladera"
        FiltrarEnemigoVivos()
        for k,i in pairs(EnemigosVivos)do
            if i.hp_>0 then
                if acertarMod(i,w,0) then
                    Msg_debug=Msg_debug.." //dia_con_viento"
                    local mult, crit =  adv_weak_Logic(i,w,{"corte","viento","natural","magia"},false )
                    DamageProccess(i,w,-((w.pod + mod(w,"pod") + flr(rnd(2)))*bono*mult),crit)
                    i.anim_acc="corte"
                    i.anim_col={1,1,1,1}
                    jump_start(i)
                    checks(i)
                else
                    eludido(i)    
                end

            end
        end
    end 


Efectos["dia_harucanado"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        enemyGroups[Nvg].terrain="pladera"
        FiltrarEnemigoVivos()
        for k,i in pairs(EnemigosVivos)do
            if i.hp_>0 then
                if acertarMod(i,w,0) then
                    local mult, crit =  adv_weak_Logic(i,w,{"corte","viento","natural","magia"},false )
                    DamageProccess(i,w,-((w.pod + mod(w,"pod") + flr(rnd(2)))*bono*mult),crit)
                    i.anim_acc="corte"
                    i.anim_col={1,1,1,1}
                    jump_start(i)
                    checks(i)
                else
                    eludido(i)    
                end
            end
        end
    end 


    ---blue magic 
    
Efectos["aliento_de_hielo"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        FiltrarEnemigoVivos()
        for k,i in pairs(EnemigosVivos)do
            if i.hp_>0 then
                if acertarMod(i,w,6) then
                    local mult, crit =  adv_weak_Logic(i,w,{"hielo","magia"},false )
                    DamageProccess(i,w,-((flr(w.pod*1.5) + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
                    i.anim_acc="corte"
                    i.anim_col={1,1,1,1}
                    jump_start(i)
                    checks(i)
                else
                    eludido(i)    
                end
            end
        end
    end    
    
Efectos["aliento_de_fuego"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        FiltrarEnemigoVivos()
        for k,i in pairs(EnemigosVivos)do
            if i.hp_>0 then
                if acertarMod(i,w,6) then
                    local mult, crit =  adv_weak_Logic(i,w,{"fuego","magia"},false )
                    DamageProccess(i,w,-((flr(w.pod*1.5) + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
                    i.anim_acc="corte"
                    i.anim_col={1,1,1,1}
                    jump_start(i)
                    checks(i)
                else
                    eludido(i)    
                end
            end
        end
    end


Efectos["auto_destruccion"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        FiltrarEnemigoVivos()
        for k,i in pairs(EnemigosVivos)do
            if i.live then
                if acertarMod(i,w,6) then
                    local mult, crit =  adv_weak_Logic(i,w,{"fuego","magia"},false )
                    DamageProccess(i,w,-((flr(w.hp*1.5) + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
                    i.anim_acc="corte"
                    i.anim_col={1,1,1,1}
                    jump_start(i)
                    checks(i)
                else
                    eludido(i)    
                end
            end
        end
    end


Efectos["mega_destruccion"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        for k,i in pairs(Order)do
            if i.live then
                if acertarMod(v,w,6) then
                    local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
                    DamageProccess(v,w,-((flr(w.hp*1.5) + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
                    v.anim_acc="corte"
                    v.anim_col={1,1,1,1}
                    jump_start(v)
                    checks(v)
                else
                    eludido(v)    
                end
            end
        end
    end

    



Efectos["condena"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end


Efectos["viento_milagroso"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        for k,i in pairs(Order) do
            if i.tipo=="player" then
                local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
                DamageProccess(v,w,((w.hp  )),crit)
                v.anim_acc="corte"
                v.anim_col={1,1,1,1}
                jump_start(v)
                checks(v)
            end
        end
    end

    
Efectos["ruleta"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        local muerto= flr(rnd(5))+1
        if acertarMod(Order[muerto],w,6) then
            Order[muerto].hp_=0
            Order[muerto].live=false
            Order[muerto].anim_acc="corte"
            Order[muerto].anim_col={1,1,1,1}
            jump_start(Order[muerto])
            checks(Order[muerto])
        else
            eludido(Order[muerto])    
        end
    end


        
Efectos["anular"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            v.state={}

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

            
Efectos["1000"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            v.hp_=v.hp_-1000

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["10000"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            v.hp_=v.hp_-10000

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end


Efectos["77777"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            v.hp_=v.hp_-77777

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end


    
Efectos["aliento_toxico"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then



             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["ataque_mental"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"mental"},false )
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["esencia_de_oscuridad"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"oscuridad","magia"},false )
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["explosion"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end


    


Efectos["desintegrar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["Disminuir_nivel"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["the_end"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        for k,i in pairs(Order) do
            if i.tipo=="enemy" then
                v.hp_=0
                v.live=false
                v.anim_acc="corte"
                v.anim_col={1,1,1,1}
                jump_start(v)
                checks(v)
            end
        end
    end

---borrar
Efectos["ultima_duplicado"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            DamageProccess(v,w,-((w.pod*27 + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["regeneracion"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        w.state["regeneracion"]={name="regeneracion",id="regeneracion",spr=11,value=w.pod/2,cont=5,ini=5}
    end

Efectos["berserk"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
    end

Efectos["coraza"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
    end
Efectos["barrera"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
    end



Efectos["runa_absorcion"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
    end
-- ninja: tecnicas magicas ninja

Efectos["humo"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
    end

Efectos["imagen"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
    end

Efectos["doble"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
    end


    
--elemental dmg: Daño secundario elemental


Efectos["elemental_fuego"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            local left=0
            local right=0
            if  w.weapon~=nil and 
                w.weapon.left~={} and w.weapon.left~=nil and w.weapon.left.w~=nil --then
                and  w.weapon.left.isCast == true and w.weapon.left.cast=="elemental_fuego" then
                left = w.weapon.left.bw
            end
            if w.weapon~=nil and 
                w.weapon.right~={} and w.weapon.right~=nil and w.weapon.right.w~=nil  --then
                and  w.weapon.left.isCast == true and w.weapon.right.cast=="elemental_fuego" then
                right = w.weapon.right.bw
            end
            local mult, crit =  adv_weak_Logic(v,w,{"fuego"},false )
            local poder = ( flr(w.pod)*0.5 +  flr(mod(w,"pod")*0.5)) or 4
            DamageProccess(v,w,-(( poder + left + right)*mult),crit) 

            Animacion.add_action_animation(v,"fuego",{1,1,1,1})
            jump_start(v)
            checks(v)
end

Efectos["elemental_luz"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        if  v.hp_>0 then
            local left=0
            local right=0
            if w.weapon.left~={} and w.weapon.left.w~=nil 
                and  w.weapon.left.isCast and w.weapon.left.cast=="elemental_luz" then
                left = w.weapon.left.bw
            end
            if w.weapon.right~={} and w.weapon.right.w~=nil  
                and  w.weapon.left.isCast and w.weapon.right.cast=="elemental_luz" then
                right = w.weapon.right.bw
            end
            local mult, crit =  adv_weak_Logic(v,w,{"luz"},false )
            DamageProccess(v,w,-((flr(w.pod)*0.5 +  flr(mod(w,"pod")*0.5) + left + right)*mult),crit) 
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v) 
        end
end

Efectos["elemental_electrico"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        if w and v.hp_>0 then
            local left=0
            local right=0
            if w.weapon.left~={} and w.weapon.left.w~=nil 
                and  w.weapon.left.isCast and w.weapon.left.cast=="elemental_electrico" then
                left = w.weapon.left.bw
            end
            if w.weapon.right~={} and w.weapon.right.w~=nil  
                and  w.weapon.left.isCast and w.weapon.right.cast=="elemental_electrico" then
                right = w.weapon.right.bw
            end
            local mult, crit =  adv_weak_Logic(v,w,{"electricidad"},false )
            DamageProccess(v,w,-((flr(w.pod)*0.5 +  flr(mod(w,"pod")*0.5) + left + right)*mult),crit) 
            v.anim_acc="hielo"
            v.anim_col={1,1,1,1}
            Animacion.add_action_animation(v,"hielo",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)   
        end
end

Efectos["elemental_hielo"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        if w and v.hp_>0 then
            local left=0
            local right=0
            if w.weapon.left~={} and w.weapon.left.w~=nil 
                and  w.weapon.left.isCast and w.weapon.left.cast=="elemental_hielo" then
                left = w.weapon.left.bw
            end
            if w.weapon.right~={} and w.weapon.right.w~=nil  
                and  w.weapon.left.isCast and w.weapon.right.cast=="elemental_hielo" then
                right = w.weapon.right.bw
            end
            local mult, crit =  adv_weak_Logic(v,w,{"hielo"},false )
            DamageProccess(v,w,-((flr(w.pod)*0.5 +  flr(mod(w,"pod")*0.5) + left + right)*mult),crit) 
            v.anim_acc="hielo"
            v.anim_col={1,1,1,1}
            Animacion.add_action_animation(v,"hielo",{1,1,1,1})
            jump_start(v)
            checks(v)
        end
end

Efectos["elemental_oscuridad"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        if w and v.hp_>0 then
            local left=0
            local right=0
            if w.weapon.left~={} and w.weapon.left.w~=nil 
                and  w.weapon.left.isCast and w.weapon.left.cast=="elemental_oscuridad" then
                left = w.weapon.left.bw
            end
            if w.weapon.right~={} and w.weapon.right.w~=nil  
                and  w.weapon.left.isCast and w.weapon.right.cast=="elemental_oscuridad" then
                right = w.weapon.right.bw
            end
            local mult, crit =  adv_weak_Logic(v,w,{"oscuridad"},false )
            DamageProccess(v,w,-((flr(w.pod)*0.5 +  flr(mod(w,"pod")*0.5) + left + right)*mult),crit) 
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            Animacion.add_action_animation(v,"magia",{1,1,1,1})
            jump_start(v)
            checks(v)
        end
end

    -- comandos 

Efectos["Balas_Rapidas"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        Animacion.add_action_animation(v,"ataque_arma",{1,1,1,1})
        if acertarMod(v,w,6) then
            local left=0
            local right=0
            if w.weapon.left~={} and w.weapon.left.w~=nil  then
                left = w.weapon.left.bw
            end
            if w.weapon.right~={} and w.weapon.right.w~=nil  then
                right = w.weapon.right.bw
            end
            local mult, crit =  adv_weak_Logic(v,w,{"perforante"},false )
            DamageProccess(v,w,-((flr(w.dex *0.5) +  flr(mod(w,"dex")*0.5) + left + right)*mult),crit) 

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)   
        end
    end

    ---tipos de balas

Efectos["Balas_Potentes"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        if acertarMod(v,w,6) then
            --local it2 = getChars("plus",items)
            --it2.cont=it2.cont-1
            local mult, crit =  adv_weak_Logic(v,w,{"fuego",},false )
            DamageProccess(v,w,-((w.dex + (5)+ mod(w,"dex"))*mult),crit) 

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

    ---MIX

Efectos["Ultra_pocion"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(v,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end

    Efectos["Ultra_ether"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(v,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
    Efectos["Ultra_veneno"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(v,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
    Efectos["Ultra_Dormir"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Ultra_paralisis"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Ultra_bomba"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
    Efectos["ultra_elixir"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Ultra_revivir"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Ultra_potencia"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Ultra_evacion"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Ultra_rapidez"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Ultra_defenza"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["panacea_spray"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Pocion_spray"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Ether_spray"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["elixir_spray"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Gas_de_resureccion"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Gas_Venenoso"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Gas_dormir"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Gas_paralisante"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Gas_de_potencia"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Gas_de_evacion"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Gas_de_rapidez"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Gas_de_defenza"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["bomba_fuego"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        v.anim_acc="corte"
        v.anim_col={1,1,1,1}
        jump_start(v)
        checks(v)
    end

Efectos["bomba_electrico"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        v.anim_acc="corte"
        v.anim_col={1,1,1,1}
        jump_start(v)
        checks(v)
    end
    Efectos["bomba_Frio"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        v.anim_acc="corte"
        v.anim_col={1,1,1,1}
        jump_start(v)
        checks(v)
    end
    Efectos["Bomba_veneno"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        v.anim_acc="corte"
        v.anim_col={1,1,1,1}
        jump_start(v)
        checks(v)
    end
    Efectos["Bomba_dormir"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
    Efectos["Mix_Pocion_ether"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
    Efectos["Mix_Panacea_pocion"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Mix_Panacea_ether"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end

Efectos["cancion_de_la_vida"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        local mult, crit =  adv_weak_Logic(v,w,{"curar"},false )
        if v.weak["curar"] ~= nil then
            mult=-1
        end
        DamageProccess(v,Actual,((Actual.pod + flr(rnd(6)) + 1)*mult) ,crit)
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
    end

Efectos["cancion_de_alegria"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
    end

Efectos["Cancion_de_burla"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
    end

Efectos["cancion_encantadora"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
    end
Efectos["cancion_del_viento"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
    end

Efectos["cuatro_pasos"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
        for i=1,4 do
            if acertar(v,w) then
                local mult, crit =  adv_weak_Logic(v,w,{"perforante","fisico"},false )
                DamageProccess(v,w,-((w.con*0.5 + flr(rnd(4)))*mult),crit)
            end
        end
    end
Efectos["baile_de_miradas"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
    end
Efectos["vuelta"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
    end

Efectos["controlar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
    end

    
Efectos["encantar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
    end

Efectos["enfocarse"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"lanzar",{1,1,1,1})
    end

    ---tecnicas de ataques a distancia
    ---
    ---
    ---




Efectos["disparo_preciso"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            ANTI_VUELO=true
            DamageProccess(v,w,-((w.dex + mod(w,"dex") +WeaponPower(w))*mult),crit) 
            ANTI_VUELO=false
             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end





Efectos["patada_rapida"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            local left=0
            local right=0
            if w.weapon.left~={} and w.weapon.left.w~=nil  then
                left=flr(rnd(w.weapon.left.w)) + w.weapon.left.bw
            end
            if w.weapon.right~={} and w.weapon.right.w~=nil  then
                right=flr(rnd(w.weapon.right.w)) + w.weapon.right.bw
            end
            DamageProccess(v,w,-((w.dex + mod(w,"dex") +left+right)*mult),crit) 

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   

end


Efectos["puñetazo_rapido"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            local left=0
            local right=0
            if w.weapon.left~={} and w.weapon.left.w~=nil  then
                left=flr(rnd(w.weapon.left.w)) + w.weapon.left.bw
            end
            if w.weapon.right~={} and w.weapon.right.w~=nil  then
                right=flr(rnd(w.weapon.right.w)) + w.weapon.right.bw
            end
            DamageProccess(v,w,-((w.dex + mod(w,"dex") +left+right)*mult),crit) 

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   

end


Efectos["rodillazo_rapido"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            local left=0
            local right=0
            if w.weapon.left~={} and w.weapon.left.w~=nil  then
                left=flr(rnd(w.weapon.left.w)) + w.weapon.left.bw
            end
            if w.weapon.right~={} and w.weapon.right.w~=nil  then
                right=flr(rnd(w.weapon.right.w)) + w.weapon.right.bw
            end
            DamageProccess(v,w,-((w.dex + mod(w,"dex") +left+right)*mult),crit) 

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   

end

Efectos["Berserk_Attack"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

end

Efectos["Berserk_move"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

end


---Efectos Disparos

Efectos["disparos_multiples"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        agregarAccion({"ejecutar_disparos_multiples_shot","disparos_multiples_shot",v,w})
        agregarAccion({"ejecutar_disparos_multiples_shot","disparos_multiples_shot",v,w})
        agregarAccion({"ejecutar_disparos_multiples_shot_final","disparos_multiples_shot",v,w})
end

Efectos["disparos_multiples_shot"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
            --Actual.next_atack="disparo_rapido"
            --count_auto=count_auto+1
            --auto=true
            --auto_obj=v.id
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","perforante"},false )

            ANTI_VUELO=true
            DamageProccess(v,w,-((w.dex + mod(w,"dex") +WeaponPower(w))*mult),crit)
            ANTI_VUELO=false
            Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
            if v.live==false then
                auto=false
                count_auto=0
            end 
        else
            eludido(v)    
        end      

end





---Ataque light para fp
Efectos["disparo_rapido"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,0.8,0.2,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"perforante"},false )
        ANTI_VUELO=true
        DamageProccess(v,w,-((w.dex*3 + mod(w,"dex"))*mult),crit)
        ANTI_VUELO=false
        v.anim_acc="corte"
        v.anim_col={1,0.8,0.2,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end

Efectos["super_disparo"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,0.8,0.2,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"perforante"},false )
        ANTI_VUELO=true
        DamageProccess(v,w,-((w.dex*3 + mod(w,"dex") + flr(rnd(10))+10)*mult),crit)
        ANTI_VUELO=false
        v.anim_acc="corte"
        v.anim_col={1,0.8,0.2,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end

Efectos["flecha_aerea"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{0.8,0.9,1,1})
    if DCMOD(w,v,w.per+6,"dex",3) then
        local mult, crit =  adv_weak_Logic(v,w,{"perforante","viento"},false )
        ANTI_VUELO=true
        DamageProccess(v,w,-((w.dex*1.2 + w.pod*0.5 + flr(rnd(6)))*mult),crit)
        ANTI_VUELO=false
        v.anim_acc="corte"
        v.anim_col={0.8,0.9,1,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end

Efectos["flecha_pesada"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{0.6,0.6,0.5,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"contundente"},false )
        ANTI_VUELO=true
        DamageProccess(v,w,-((w.dex*0.8 + w.con*0.5 + flr(rnd(6)))*mult),crit)
        ANTI_VUELO=false
        v.anim_acc="corte"
        v.anim_col={0.6,0.6,0.5,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end


Efectos["lluvia_de_flechas"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        --w.carga=0
        for k,i in pairs(Total_enemy)do
            if i.live then
                if acertar(i,w) then  
                        local mult, crit =  adv_weak_Logic(i,w,{"fuego","magia"},false )
                        ANTI_VUELO=true
                        DamageProccess(i,w,-((w.dex + mod(w,"dex") +WeaponPower(w))*mult),crit)
                        ANTI_VUELO=false
                        i.anim_acc="corte"
                        i.anim_col={1,1,1,1}
                        jump_start(i)
                        checks(i)
                else
                    eludido(i)    
                end
            end
        end 
    end

--- tecnicas berserk
Efectos["desenbocado"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            w.anim_acc="puñetazos"
            w.anim_col={1,1,1,1}
            Animacion.add_action_animation(w,"puñetazos",{1,1,1,1})
            FiltrarEnemigoVivos()
            local enemy=flr(rnd(#EnemigosVivos))
            --Msg_debug="num "..enemy.."/"..#EnemigosVivos
            local enemy_target=EnemigosVivos[enemy]
            if enemy_target then
                if acertar(enemy_target,w) then
                    local mult, crit =  adv_weak_Logic(enemy_target,w,{"fuego","magia"},false )
                    DamageProccess(enemy_target,w,-((w.con + mod(w,"con") + WeaponPower(w))*mult),crit)
                    Animacion.add_action_animation(enemy_target,"impacto",{1,1,1,1})
                    jump_start(enemy_target)
                    checks(enemy_target)
                else
                    eludido(enemy_target)    
                end
            else 
                --
            end
    end    




---TECNICAS NUEVAS
    Efectos["rompe_defensa"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        Animacion.add_action_animation(w,"puñetazos",{1,1,1,1})
        if acertar(v,w)  then
            v.state["rompe_defensa"]={name="rompe_defensa",id="rompe_defensa",spr=18,value=w.pod,val=v.pod,cont=3,ini=5}

             Animacion.add_action_animation(v,"impacto",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 

    end

    Efectos["rompe_espiritu"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"puñetazos",{1,1,1,1})
        if acertar(v,w)  then
            v.state["rompe_espiritu"]={name="rompe_espiritu",id="rompe_espiritu",spr=18,value=w.pod,val=v.pod,cont=3,ini=5}
            Animacion.add_action_animation(v,"impacto",Green)
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end
    Efectos["rompe_magia"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            Animacion.add_action_animation(w,"puñetazos",{1,1,1,1})
            if acertar(v,w)  then
                v.state["rompe_magia"]={name="rompe_magia",id="rompe_magia",spr=18,value=w.pod,val=v.pod,cont=3,ini=5}
                Animacion.add_action_animation(v,"impacto",Blue)
                jump_start(v)
                checks(v)
            else
                eludido(v)    
            end 
    end
    Efectos["rompe_ataque"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

            Animacion.add_action_animation(w,"puñetazos",{1,1,1,1})
            if acertar(v,w)  then
                v.state["rompe_ataque"]={name="rompe_ataque",id="rompe_ataque",spr=18,value=w.pod,val=v.pod,cont=3,ini=5}
                Animacion.add_action_animation(v,"corte",{1,1,1,1})
                jump_start(v)
                checks(v)
            else
                eludido(v)    
            end 
    end
    Efectos["ataque_erradicos"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            agregarAccion({"ejecutar_comando","desenbocado",v,w})
            agregarAccion({"ejecutar_comando","desenbocado",v,w})
            agregarAccion({"ejecutar_comando_final","desenbocado",v,w})
    end
    Efectos["ataque_critico"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            Efectos ["ejecutar_ataque_basico_INIT"] (v,w,{},"left",5,2,1,{})
            Efectos ["ejecutar_ataque_basico_INIT"] (v,w,{},"right",5,2,1,{})
    end

--tecnicas brutales

    Efectos["pisoton_de_puas"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            --pizoton
            Animacion.add_action_animation(w,"puñetazos",{1,1,1,1})
            for k,i in pairs(Total_enemy)do
                if acertar(i,w) then
                    local mult, crit =  adv_weak_Logic(v,w,{"piedra","perforante","magia"},false )
                    DamageProccess(i,w,-flr((w.pod + mod(w,"pod") + flr(rnd(2)) + 1)*12*bono*mult)  ,crit)
                    Animacion.add_action_animation(i,"magic_effect",{1,1,1,1})
                    jump_start(i)
                    checks(i)
                else
                    eludido(i)    
                end 
            end
            
    end
    Efectos["punnetazo_de_tierra"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        Efectos ["ejecutar_ataque_basico_INIT"] (v,w,{},"left",0,1.5,1,{})
        Efectos ["ejecutar_ataque_basico_INIT"] (v,w,{},"right",0,1.5,1,{})
    end
    Efectos["pisoton_terremoto"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            Animacion.add_action_animation(w,"puñetazos",{1,1,1,1})
            for k,i in pairs(Total_enemy)do
                if i.live then
                    if acertar(i,w) then
                        local mult, crit =  adv_weak_Logic(i,w,{"biologico","aire","magia"},false )
                        DamageProccess(i,w,-flr(((w.con*16) + mod(w,"con") +  1)*bono*mult)  ,crit)
                        i.state["stun"]={name="stun",id="stun",spr=18,value=w.con,val=v.con,cont=3,ini=5}
                        Animacion.add_action_animation(i,"magic_effect",{1,1,1,1})
                        jump_start(i)
                        checks(i)
                    else
                        eludido(i)    
                    end 
                end
            end
    end
    Efectos["lanza_roca"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            Efectos["piedra"] (v,w,f,arm,punteria,bono*1.5,bcrit,tipo,extra,side)
    end

--tecnicas avanzadas
    ---ignora armadura y estado eterio
    IGNORAR_ETERIO=false
    Efectos["golpe_espiritu"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            IGNORAR_ETERIO=true
            Efectos ["ejecutar_ataque_basico_INIT"] (v,w,{},"left",0,1,1,{})
            Efectos ["ejecutar_ataque_basico_INIT"] (v,w,{},"right",0,1,1,{})
            IGNORAR_ETERIO=false
    end

    Efectos["presion_espiritual"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            Animacion.add_action_animation(w,"puñetazos",{1,1,1,1})

    end

    Efectos["sed_de_sangre"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            Animacion.add_action_animation(w,"magia",Red)
            for k,i in pairs(Total_enemy)do
                if i.live then
                    local dc=0
                    if i.pod then
                        dc=i.pod+3
                    else
                        dc=12    
                    end
                    if DCMOD(w,v,dc,"mnd",0) then ---Crear DC de enemigos
                        Animacion.add_action_animation(i,"magic_effect",Red)
                        i.state["asustar"]={name="asustar",id="asustar",spr=18,value=w.con,val=v.con,cont=3,ini=5}
                        i.state["rompe_defensa"]={name="rompe_defensa",id="rompe_defensa",spr=18,value=w.con,val=v.con,cont=3,ini=5}
                    else
                        eludido(i)
                    end
                end
            end

    end


    Efectos["cuerpo_de_papel"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            Animacion.add_action_animation(w,"magia",{1,1,1,1})
            --Animacion.add_action_animation(v,"magic_effect",Red)
            v.style["cuerpo_de_papel"]={name="cuerpo de papel",id="cuerpo_de_papel",spr=18,value=w.con,val=v.con,cont=3,ini=5}

    end

    Efectos["piel_de_hierro"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            Animacion.add_action_animation(v,"magia",{1,1,1,1})
            v.style["piel_de_hierro"]={name="piel_de_hierro",id="piel_de_hierro",spr=18,value=w.con,val=v.con,cont=3,ini=5}

    end

    Efectos["camino_lunar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
             Animacion.add_action_animation(v,"magia",{1,1,1,1})
            v.state["volar"]={name="volar",id="volar",spr=18,value=w.con,val=v.con,cont=3,ini=5}
    end
    Efectos["salto_fantasma"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            Animacion.add_action_animation(v,"magia",{1,1,1,1})
            v.state["salto_fantasma"]={name="salto_fantasma",id="salto_fantasma",spr=18,value=w.con,val=v.con,cont=3,ini=5}

    end
    Efectos["corte_de_aire"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        Animacion.add_action_animation(w,"corte",{0,1,0,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"corte","fisico","aire","magia"},false )
            DamageProccess(v,w,-flr((w.con + mod(w,"con") + flr(rnd(12)) )*5*bono*mult) ,crit)
            Animacion.add_action_animation(v,"corte",{0,1,0,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end  
    end
    Efectos["balas_de_aire"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        Animacion.add_action_animation(w,"puñetazos",{0,1,0,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"perforante","fisico","aire","magia"},false )
            DamageProccess(v,w,-flr((w.con + mod(w,"con") + flr(rnd(12)) )*5*bono*mult) ,crit)
            Animacion.add_action_animation(v,"corte",{0,1,0,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end  
    end

    Efectos["golpe_vibratorio"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        Animacion.add_action_animation(w,"puñetazos",{0,1,0,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"golpe","fisico","aire","magia"},false )
            DamageProccess(v,w,-flr((w.con + mod(w,"con") + flr(rnd(12)) )*5*bono*mult) ,crit)
            Animacion.add_action_animation(v,"impacto",{0,1,0,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end  
    end

    Efectos["ataque_concentrado"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            Efectos ["ejecutar_ataque_basico_INIT"] (v,w,{},"left",0,2,0,{})
            Efectos ["ejecutar_ataque_basico_INIT"] (v,w,{},"right",0,2,0,{})
    end

    Efectos["cuerpo_concentrado"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            Animacion.add_action_animation(v,"magia",{1,1,1,1})
            v.state["cuerpo_concentrado"]={name="cuerpo_concentrado",id="cuerpo_concentrado",spr=18,value=w.con,val=v.con,cont=3,ini=5}
    end

    Efectos["golpe_atmosferico"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        Animacion.add_action_animation(w,"puñetazos",{0,1,0,1})
        for k,i in pairs(Total_enemy)do
            if i.live then
                if acertar(v,w) then
                    local mult, crit =  adv_weak_Logic(v,w,{"golpe","fisico","aire","magia"},false )
                    DamageProccess(i,w,-flr((w.con + mod(w,"con") + flr(rnd(12)) )*5*bono*mult) ,crit)
                    Animacion.add_action_animation(i,"impacto",{0,1,0,1})
                    jump_start(i)
                    checks(i)
                else
                    eludido(i)    
                end  
            end
        end
    end


    Efectos["gotas_de_agua"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        Animacion.add_action_animation(w,"magia",{0,1,0,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"golpe","fisico","agua","magia"},false )
            DamageProccess(v,w,-flr((w.con + mod(w,"con") + flr(rnd(12)) )*5*bono*mult) ,crit)
            Animacion.add_action_animation(v,"impacto",{0,1,0,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end  
    end
    Efectos["Modo_salvaje"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            Animacion.add_action_animation(v,"magia",{1,1,1,1})
            v.style["Modo_salvaje"]={name="Modo_salvaje",id="Modo_salvaje",spr=18,value=w.con,val=v.con,cont=3,ini=5}
    end

    Efectos["doble_imagen"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            Animacion.add_action_animation(v,"magia",{1,1,1,1})
            v.state["doble_imagen"]={name="doble_imagen",id="doble_imagen",spr=18,value=w.con,val=v.con,cont=3,ini=5}
    end

    Efectos["escupir_fuego"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        Animacion.add_action_animation(w,"magia",{0,1,0,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"fisico","fuego"},false )
            DamageProccess(v,w,-flr((w.con + mod(w,"con") + flr(rnd(12)) )*5*bono*mult) ,crit)
            Animacion.add_action_animation(v,"fuego",{0,1,0,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end
    Efectos["Estilo_borracho"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            Animacion.add_action_animation(v,"magia",{1,1,1,1})
            v.style["Estilo_borracho"]={name="Estilo_borracho",id="Estilo_borracho",spr=18,value=w.con,val=v.con,cont=3,ini=5}
    end
    Efectos["Estilo_ciego"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            Animacion.add_action_animation(v,"magia",{1,1,1,1})
            v.style["Estilo_ciego"]={name="Estilo_ciego",id="Estilo_ciego",spr=18,value=w.con,val=v.con,cont=3,ini=5}
    end


    ---bailes
    ---
Efectos["Tres_pasos"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            w.anim_acc="puñetazos"
            w.anim_col={1,1,1,1}
            local enemy_target=v
            --Msg_debug= "TRES pasos ..... "..enemy_target.id_mons
        
            if acertar(enemy_target,w) then
                local mult, crit =  adv_weak_Logic(enemy_target,w,{"fuego","magia"},false )
                DamageProccess(enemy_target,w,-((w.con + mod(w,"con") +WeaponPower(w))*mult),crit)
                enemy_target.anim_acc="corte"
                enemy_target.anim_col={1,1,1,1}
                jump_start(enemy_target)
                checks(enemy_target)
            else
                eludido(enemy_target)    
            end
    end 


Efectos["alegria"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            --Que hacia alegria// era un buff
            w.anim_acc="puñetazos"
            w.anim_col={1,1,1,1}
            FiltrarEnemigoVivos()
            local enemy=flr(rnd(#EnemigosVivos))
            local enemy_target=EnemigosVivos[enemy]
            --Msg_debug= " "..enemy_target.id
            if acertar(enemy_target,w) then
            --if false then
                local mult, crit =  adv_weak_Logic(enemy_target,w,{"fuego","magia"},false )
                DamageProccess(enemy_target,w,-((w.con + mod(w,"con") +WeaponPower(w))*mult),crit)
                enemy_target.anim_acc="corte"
                enemy_target.anim_col={1,1,1,1}
                jump_start(enemy_target)
                checks(enemy_target)
            else
                eludido(enemy_target)    
            end
    end 

    --- tecnicas fighter

Efectos["golpe_fuerte"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            local weaponPower = WeaponPower(w)
            DamageProccess(v,w,-((w.con + 12+ mod(w,"con") + weaponPower)*0.8*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end      
    end



Efectos["golpe_cargado"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            DamageProccess(v,w,-((w.con + mod(w,"con") +WeaponPower(w))*1.5*mult),crit)
             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end      
    end

    --- Magia General
    --- 
Efectos["marca"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side) ---completar estado
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        Animacion.add_action_animation(w,"magia",{0,1,0,1})
        if acertar(v,w)  then
            v.state["marca"]={name="marca",id="marca",spr=18,value=w.pod,val=v.pod,cont=3,ini=5}

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end

Efectos["sangrado"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            DamageProccess(v,w,-((flr(v.hp/2) )),crit)
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["petrificacion"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        Animacion.add_action_animation(w,"magia",{0,1,0,1})

        if acertar(v,w)  then
            v.state["trasmutado"]={name="trasmutado",id="trasmutado",spr=84,value=w.pod,val=v.pod,cont=3,ini=5}
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end


Efectos["stun"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        if acertar(v,w)  then
            v.state["stun"]={name="stun",id="stun",spr=48,value=w.pod,val=v.pod,cont=3,ini=5}
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end

Efectos["ceguera"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        if acertar(v,w)  then
            v.state["ceguera"]={name="ceguera",id="ceguera",spr=3,value=w.pod,val=v.pod,cont=3,ini=5}
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end
    
Efectos["confundir"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        if acertar(v,w)  then
            v.state["confundir"]={name="confundir",id="confundir",spr=0,value=w.pod,val=v.pod,cont=3,ini=5}
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end
    
Efectos["silencio"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        if acertar(v,w)  then
            v.state["silencio"]={name="silencio",id="silencio",spr=3,value=w.pod,val=v.pod,cont=3,ini=5}
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end
    

Efectos["dormir"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        if acertar(v,w)  then
            v.state["dormir"]={name="dormir",id="dormir",spr=29,value=w.pod,val=v.pod,cont=3,ini=5}
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end

Efectos["confundir_duplicado"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        name_action="confundir"

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        if acertar(v,w)  then
            v.state["confundir"]={name="confundir",id="confundir",spr=3,value=w.pod,val=v.pod,cont=3,ini=5}
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end         
    end
Efectos["aturdir"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        name_action="aturdir"

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        if acertar(v,w)  then
            v.state["stun"]={name="stun",id="stun",spr=48,value=w.pod,val=v.pod,cont=3,ini=5}
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end        
    end

Efectos["muerte"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        name_action="muerte"

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        if acertar(v,w)  then
            v.state["muerte"]={name="muerte",id="muerte",spr=3,value=w.pod,val=v.pod,cont=3,ini=5}
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end  
    end

Efectos["lianas"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        name_action="lianas"

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"planta","magia"},false )            
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*5*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["lianas+"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        name_action="hechizo "..Mg_sel

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"planta","magia"},false )            
            DamageProccess(v,w,-(((w.pod*5) + mod(w,"pod") + flr(rnd(6)))*12*bono*mult),crit)

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["enredadera"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        name_action="hechizo "..Mg_sel

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            v.state["atrapado"]={name="atrapado",id="atrapado",spr=5,value=0,cont=3,ini=5}
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["fuego"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        name_action="fuego"
        Animacion.add_action_animation(w,"magia",{1,0,0,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            DamageProccess(v,w,-flr((w.pod + mod(w,"pod") + flr(rnd(6)))*5*bono*mult),crit,"elemental")

            Animacion.add_action_animation(v,"fuego",{})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["fuego+"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        name_action="fuego+"
        Animacion.add_action_animation(w,"magia",{1,0,0,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            DamageProccess(v,w,-flr(((w.pod*5) + mod(w,"pod") + flr(rnd(6)))*12*bono*mult),crit,"elemental")
            Animacion.add_action_animation(v,"fuego",{})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end


Efectos["fuego++"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        name_action="fuego++"
        Animacion.add_action_animation(w,"magia",{1,0,0,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            DamageProccess(v,w,-flr(((w.pod*5) + mod(w,"pod") + flr(rnd(6)))*25*bono*mult),crit,"elemental")
            Animacion.add_action_animation(v,"fuego",{})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end    


Efectos["hielo"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="magia"
        w.anim_col={0,0,1,1}
        Animacion.add_action_animation(w,"magia",{0,0,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"hielo","magia"},false )
            DamageProccess(v,w,-flr((w.pod + mod(w,"pod") + flr(rnd(6)))*5*bono*mult),crit,"elemental")
            v.anim_acc="hielo"
            v.anim_col={1,1,1,1}
            Animacion.add_action_animation(v,"hielo",{0,0,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["hielo+"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="magia"
        w.anim_col={0,0,1,1}
        Animacion.add_action_animation(w,"magia",{0,0,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"hielo","magia"},false )
            DamageProccess(v,w,-flr(((w.pod*5) + mod(w,"pod") + flr(rnd(6)))*12*bono*mult),crit,"elemental")
            v.anim_acc="hielo"
            v.anim_col={1,1,1,1}
            Animacion.add_action_animation(v,"hielo",{0,0,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end


Efectos["hielo++"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="magia"
        w.anim_col={0,0,1,1}
        Animacion.add_action_animation(w,"magia",{0,0,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"hielo","magia"},false )
            DamageProccess(v,w,-flr(((w.pod*5) + mod(w,"pod") + flr(rnd(6)))*26*bono*mult),crit,"elemental")
            v.anim_acc="hielo"
            v.anim_col={1,1,1,1}
            Animacion.add_action_animation(v,"hielo",{0,0,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["electro"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,0,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"electricidad","magia"},false )
            DamageProccess(v,w,-flr((w.pod + mod(w,"pod") + flr(rnd(4)))*5*bono*mult),crit,"elemental")
            v.anim_acc="rayo"
            v.anim_col={1,1,1,1}
            Animacion.add_action_animation(v,"rayo",{1,1,0,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["electro+"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,0,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"electricidad","magia"},false )
            DamageProccess(v,w,-flr(((w.pod*5)+ mod(w,"pod") + flr(rnd(4)))*12*bono*mult),crit,"elemental")
            v.anim_acc="rayo"
            v.anim_col={1,1,1,1}
            Animacion.add_action_animation(v,"rayo",{1,1,0,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["electro++"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,0,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"electricidad","magia"},false )
            DamageProccess(v,w,-flr(((w.pod*5)+ mod(w,"pod") + flr(rnd(4)))*26*bono*mult),crit,"elemental")
            v.anim_acc="rayo"
            v.anim_col={1,1,1,1}
            Animacion.add_action_animation(v,"rayo",{1,1,0,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end




Efectos["aire"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{0,1,0,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"corte","fisico","aire","magia"},false )
            DamageProccess(v,w,-flr((w.pod + mod(w,"pod") + flr(rnd(2)) )*5*bono*mult) ,crit,"fisico")
            Animacion.add_action_animation(v,"corte",{0,1,0,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["aire+"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"corte","fisico","aire","magia"},false )
            DamageProccess(v,w,-flr(((w.pod*5) + mod(w,"pod") + flr(rnd(2)) )*12*bono*mult) ,crit,"fisico")
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["aire++"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"corte","fisico","aire","magia"},false )
            DamageProccess(v,w,-flr(((w.pod*5) + mod(w,"pod") + flr(rnd(2)) )*26*bono*mult) ,crit,"fisico")
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["agua"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="magia"
        w.anim_col={0,1,1,1}
        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"agua","fisico","contundente","magia"},false )
            DamageProccess(v,w,-flr((w.pod + mod(w,"pod") + flr(rnd(2)) )*5*bono*mult)  ,crit,"fisico")
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)            
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["agua+"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="magia"
        w.anim_col={0,1,1,1}
        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"agua","fisico","contundente","magia"},false )
            DamageProccess(v,w,-flr(((w.pod*5) + mod(w,"pod") + flr(rnd(2)) )*12*bono*mult)  ,crit,"fisico")
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)            
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["agua++"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="magia"
        w.anim_col={0,1,1,1}
        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"agua","fisico","contundente","magia"},false )
            DamageProccess(v,w,-flr(((w.pod*5) + mod(w,"pod") + flr(rnd(2)) )*26*bono*mult)  ,crit,"fisico")
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)            
            checks(v)
        else
            eludido(v)    
        end   
    end
    

Efectos["choque"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"fisico","contundente","aire","magia"},false )
            DamageProccess(v,w,-flr((w.con + mod(w,"con") + flr(rnd(2)) + 1)*5*bono*mult)  ,crit,"fisico")
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["choque+"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"fisico","contundente","aire","magia"},false )
            DamageProccess(v,w,-flr(((w.con*5) + mod(w,"con") + flr(rnd(2)) + 1)*12*bono*mult)  ,crit,"fisico")
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

    Efectos["choque++"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"fisico","contundente","aire","magia"},false )
            DamageProccess(v,w,-flr(((w.con*5) + mod(w,"con") + flr(rnd(2)) + 1)*26*bono*mult)  ,crit,"fisico")
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["sagrado"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"sagrado","magia"},false )
            DamageProccess(v,w,-flr((w.pod + mod(w,"pod") + flr(rnd(2)) + 1)*100*bono*mult)  ,crit,"magico")
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end
Efectos["sagrado+"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"sagrado","magia"},false )
            DamageProccess(v,w,-flr(((w.pod * 5 )+ mod(w,"pod") + flr(rnd(2)) + 1)*260*bono*mult)  ,crit,"magico")
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end

Efectos["oscuridad"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"oscuridad","aire","magia"},false )
            DamageProccess(v,w,-flr((w.pod + mod(w,"pod") + flr(rnd(2)) + 1)*6*bono*mult)  ,crit,"magico")
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end

Efectos["oscuridad+"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"oscuridad","aire","magia"},false )
            DamageProccess(v,w,-flr(((w.pod*5) + mod(w,"pod") + flr(rnd(2)) + 1)*12*bono*mult)  ,crit,"magico")
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end

Efectos["oscuridad++"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"piedra","magia"},false )
            DamageProccess(v,w,-flr(((w.pod*5) + mod(w,"pod") + flr(rnd(2)) + 1)*26*bono*mult)  ,crit,"magico")
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end


Efectos["piedra"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        bono = 1 or bono
        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"piedra","contundente","magia"},false )
            DamageProccess(v,w,-flr((w.pod + mod(w,"pod") + flr(rnd(2)) + 1)*6*bono*mult)  ,crit)
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end


Efectos["piedra+"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        bono = 1 or bono
        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"piedra","contundente","magia"},false )
            DamageProccess(v,w,-flr((w.pod + mod(w,"pod") + flr(rnd(2)) + 1)*12*bono*mult)  ,crit)
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end


Efectos["piedra++"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        bono = 1 or bono
        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"oscuridad","aire","magia"},false )
            DamageProccess(v,w,-flr((w.pod + mod(w,"pod") + flr(rnd(2)) + 1)*26*bono*mult)  ,crit)
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end

Efectos["bio"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"biologico","aire","magia"},false )
            DamageProccess(v,w,-flr((w.pod + mod(w,"pod") + flr(rnd(2)) + 1)*6*bono*mult)  ,crit)
            v.state["veneno"]={name="veneno",id="veneno",spr=11,value=w.pod/2,cont=5,ini=5}
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end

Efectos["bio+"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"biologico","aire","magia"},false )
            DamageProccess(v,w,-flr(((w.pod*5) + mod(w,"pod") + flr(rnd(2)) + 1)*12*bono*mult)  ,crit)
            v.state["veneno"]={name="veneno",id="veneno",spr=11,value=w.pod/2,cont=5,ini=5}
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end

Efectos["terremoto"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)    
        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        for k,i in pairs(Total_enemy)do
            if i.live then
                if acertar(i,w) then
                    local mult, crit =  adv_weak_Logic(i,w,{"biologico","aire","magia"},false )
                    DamageProccess(i,w,-flr(((w.pod*16) + mod(w,"pod") + flr(rnd(2)) + 1)*bono*mult)  ,crit)
                    i.anim_acc="magia"
                    i.anim_col={1,1,1,1}
                    jump_start(i)
                    checks(i)
                else
                    eludido(i)    
                end 

            end
        end
    end



Efectos["gravedad"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    
        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"gravedad","magia"},false )
            DamageProccess(v,w,-flr(((w.pod*5)  + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit,"elemental")
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["tornado"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    
        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        for k,i in pairs(Total_enemy)do
            if i.live then
                if acertar(i,w) then
                    local mult, crit =  adv_weak_Logic(i,w,{"corte","aire","magia"},false )
                    DamageProccess(i,w,-flr(((w.pod*16) + mod(w,"pod") + flr(rnd(2)) + 1)*bono*mult)  ,crit)
                    i.anim_acc="magia"
                    i.anim_col={1,1,1,1}
                    jump_start(i)
                    checks(i)
                else
                    eludido(i)    
                end 

            end
        end
    end



Efectos["meteoro"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    
        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        for k,i in pairs(Total_enemy)do
            if i.live then
                if acertar(i,w) then
                    local mult, crit =  adv_weak_Logic(i,w,{"fuego","magia"},false )
                    DamageProccess(i,w,-flr(((w.pod*16) + mod(w,"pod") + flr(rnd(2)) + 1)*bono*mult)  ,crit,"cosmico")
                    i.anim_acc="magia"
                    i.anim_col={1,1,1,1}
                    jump_start(i)
                    checks(i)
                else
                    eludido(i)    
                end 

            end
        end
    end

    
Efectos["ultima"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    
        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        for k,i in pairs(Total_enemy)do
            if i.live then
                if acertar(i,w) then
                    local mult, crit =  adv_weak_Logic(i,w,{"ultima"},false )
                    DamageProccess(i,w,-flr((w.pod*27 + mod(w,"pod") + flr(rnd(2)) + 1)*bono*mult)  ,crit,"cosmico")
                    i.anim_acc="magia"
                    i.anim_col={1,1,1,1}
                    jump_start(i)
                    checks(i)
                else
                    eludido(i)    
                end 

            end
        end
    end





    --- Magia de espada
    
Efectos["Sw_Fire"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="ataque_arma"
        w.anim_col={1,0,0,1}
        
        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            local mult2, crit2 =  adv_weak_Logic(v,w,{"fisico","corte",},false )
            local ecc=(w.con + mod(w,"con") + flr(rnd(6)) + 1 )*3*bono*mult +
                      (w.pod + mod(w,"pod") + flr(rnd(6)) + 1 )*3*bono*mult2
            DamageProccess(v,w,-flr(ecc)  ,crit..crit2,"hibrido")

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["Sw_Fire+"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="ataque_arma"
        w.anim_col={1,0,0,1}
        
        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            local mult2, crit2 =  adv_weak_Logic(v,w,{"fisico","corte",},false )
            local ecc=(w.con + mod(w,"con") + flr(rnd(6)) + 1 )*6*bono*mult +
                      (w.pod + mod(w,"pod") + flr(rnd(6)) + 1 )*6*bono*mult2
            DamageProccess(v,w,-flr(ecc)  ,crit..crit2,"hibrido")

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["Sw_Fire++"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="ataque_arma"
        w.anim_col={1,0,0,1}
        
        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            local mult2, crit2 =  adv_weak_Logic(v,w,{"fisico","corte",},false )
            local ecc=(w.con + mod(w,"con") + flr(rnd(6)) + 1 )*bono*13*mult +
                      (w.pod + mod(w,"pod") + flr(rnd(6)) + 1 )*bono*13*mult2
            DamageProccess(v,w,-flr(ecc)  ,crit..crit2,"hibrido")

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end
Efectos["Sw_ice"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="ataque_arma"
        w.anim_col={0,0,1,1}
        
        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        if acertar(v,w) then
            v.jump=true
            v.jump_time=0
            v.rest=false
            local mult, crit =  adv_weak_Logic(v,w,{"hielo","magia"},false )
            local mult2, crit2 =  adv_weak_Logic(v,w,{"fisico","corte",},false )
            local ecc=(w.con + mod(w,"con") + flr(rnd(6)) + 1 )*3*bono*mult +
                      (w.pod + mod(w,"pod") + flr(rnd(6)) + 1 )*3*bono*mult2
            DamageProccess(v,w,-flr(ecc)  ,crit..crit2,"hibrido")

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end
Efectos["Sw_ice+"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="ataque_arma"
        w.anim_col={0,0,1,1}
        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            v.jump=true
            v.jump_time=0
            v.rest=false
            local mult, crit =  adv_weak_Logic(v,w,{"hielo","magia"},false )
            local mult2, crit2 =  adv_weak_Logic(v,w,{"fisico","corte",},false )
            local ecc=(w.con + mod(w,"con") + flr(rnd(6)) + 1 )*6*bono*mult +
                      (w.pod + mod(w,"pod") + flr(rnd(6)) + 1 )*6*bono*mult2
            DamageProccess(v,w,-flr(ecc)  ,crit..crit2,"hibrido")

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end
Efectos["Sw_ice++"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="ataque_arma"
        w.anim_col={0,0,1,1}
        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            v.jump=true
            v.jump_time=0
            v.rest=false
            local mult, crit =  adv_weak_Logic(v,w,{"hielo","magia"},false )
            local mult2, crit2 =  adv_weak_Logic(v,w,{"fisico","corte",},false )
            local ecc=(w.con + mod(w,"con") + flr(rnd(6)) + 1 )*13*bono*mult +
                      (w.pod + mod(w,"pod") + flr(rnd(6)) + 1 )*13*bono*mult2
            DamageProccess(v,w,-flr(ecc)  ,crit..crit2,"hibrido")

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end


Efectos["Sw_electro"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="ataque_arma"
        w.anim_col={1,1,0,1}
        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            v.jump=true
            v.jump_time=0
            v.rest=false
            local mult, crit =  adv_weak_Logic(v,w,{"electricidad","magia"},false )
            local mult2, crit2 =  adv_weak_Logic(v,w,{"fisico","corte",},false )
            local ecc=(w.con + mod(w,"con") + flr(rnd(6)) + 1 )*3*bono*mult +
                      (w.pod + mod(w,"pod") + flr(rnd(6)) + 1 )*3*bono*mult2
            DamageProccess(v,w,-flr(ecc)  ,crit..crit2,"hibrido")

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["Sw_electro+"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="ataque_arma"
        w.anim_col={1,1,0,1}
        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            v.jump=true
            v.jump_time=0
            v.rest=false
            local mult, crit =  adv_weak_Logic(v,w,{"electricidad","magia"},false )
            local mult2, crit2 =  adv_weak_Logic(v,w,{"fisico","corte",},false )
            local ecc=(w.con + mod(w,"con") + flr(rnd(6)) + 1 )*6*bono*mult +
                      (w.pod + mod(w,"pod") + flr(rnd(6)) + 1 )*6*bono*mult2
            DamageProccess(v,w,-flr(ecc)  ,crit..crit2,"hibrido")

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["Sw_electro++"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="ataque_arma"
        w.anim_col={1,1,0,1}
        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        if acertar(v,w) then
            v.jump=true
            v.jump_time=0
            v.rest=false
            local mult, crit =  adv_weak_Logic(v,w,{"electricidad","magia"},false )
            local mult2, crit2 =  adv_weak_Logic(v,w,{"fisico","corte",},false )
            local ecc=(w.con + mod(w,"con") + flr(rnd(6)) + 1 )*12*bono*mult +
                      (w.pod + mod(w,"pod") + flr(rnd(6)) + 1 )*12*bono*mult2
            DamageProccess(v,w,-flr(ecc)  ,crit..crit2,"hibrido")

             Animacion.add_action_animation(v,"corte",{1,1,1,1})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["rapido"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    
            Animacion.add_action_animation(w,"magia",{0,1,0,1})
            v.state["rapido"]={name="rapido",id="rapido",spr=10,value=w.pod,cont=5,ini=5}
            v.ini=v.agi+mod(v,"agi")+flr(rnd(20))
            qsort(Order, function(a,b) return abs(a.ini) > abs(b.ini) end)
            
    end


Efectos["fuerte"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

            Animacion.add_action_animation(w,"magia",{0,1,0,1})    
            v.state["fuerte"]={name="fuerte",id="fuerte",spr=7,value=w.pod,cont=5,ini=5}
            v.ini=v.agi+mod(v,"agi")+flr(rnd(20))
            qsort(Order, function(a,b) return abs(a.ini) > abs(b.ini) end)
            
    end


    Efectos["preciso"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

            Animacion.add_action_animation(w,"magia",{0,1,0,1})      
            v.state["preciso"]={name="preciso",id="preciso",spr=18,value=w.pod,cont=5,ini=5}
            v.ini=v.agi+mod(v,"agi")+flr(rnd(20))
            qsort(Order, function(a,b) return abs(a.ini) > abs(b.ini) end)
            
    end


        Efectos["debil"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

            Animacion.add_action_animation(w,"magia",{0,1,0,1})      
            v.state["debil"]={name="debil",id="debil",spr=33,value=w.pod,cont=5,ini=5}
            v.ini=v.agi+mod(v,"agi")+flr(rnd(20))
            qsort(Order, function(a,b) return abs(a.ini) > abs(b.ini) end)
            
    end


            Efectos["fortificado"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

            Animacion.add_action_animation(w,"magia",{0,1,0,1})      
            v.state["fortificado"]={name="fortificado",id="fortificado",spr=31,value=w.pod,cont=5,ini=5}
            v.ini=v.agi+mod(v,"agi")+flr(rnd(20))
            qsort(Order, function(a,b) return abs(a.ini) > abs(b.ini) end)
            
    end

    Efectos["vulnerable"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

            Animacion.add_action_animation(w,"magia",{0,1,0,1})      
            v.state["vulnerable"]={name="vulnerable",id="vulnerable",spr=30,value=w.pod,cont=5,ini=5}
            v.ini=v.agi+mod(v,"agi")+flr(rnd(20))
            qsort(Order, function(a,b) return abs(a.ini) > abs(b.ini) end)
            
    end


Efectos["lento"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"magia",{1,1,1,1})  
        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        if acertar(v,w)  then
            v.state["lento"]={name="lento",id="lento",spr=3,value=w.pod,val=v.pod,cont=5,ini=5}
            v.ini=v.agi+mod(v,"agi")+flr(rnd(20))
            qsort(Order, function(a,b) return abs(a.ini) > abs(b.ini) end) 
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["paralisis"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

            Animacion.add_action_animation(w,"magia",{1,1,0,1})  
        if acertar(v,w)  then
            --local paralisis={name="paralisis",id="paralisis",spr=5,value=0,cont=5,ini=5}
            --table.insert(v.state,"paralisis",{name="paralisis",id="paralisis",spr=5,value=0,cont=5,ini=5})
            v.state["paralisis"]={name="paralisis",id="paralisis",spr=5,value=0,cont=3,ini=5}
            --add(v.state,{paralisis=})
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["suerte"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

            Animacion.add_action_animation(w,"magia",{1,1,1,1})  
    Actual.avanzar=true
    Actual.rest=false
    local mult=1
    wait_start()
    b_dmg_txt=true
    local spell_list={"fuego", "hielo","electro"}
    local sl=flr(rnd(#spell_list-1)+1)
    Mg_sel=spell_list[sl]
    for k,i in pairs(Total_enemy)do
        if i.live then
            i.lastDmg=0
            i.slDmg=true
            i.lastDmgC="R"
            ejecutarMagia(Mg_sel, i, Order)
        end
    end

end

    


Efectos["congelar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="magia"
        w.anim_col={0,0,1,1}
            Animacion.add_action_animation(w,"magia",{1,1,1,1})  
        if acertar(v,w)  then
            v.state["congelado"]={name="congelado",id="congelado",spr=6,value=0,cont=2,ini=5}
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end


Efectos["inmovilizar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    --hielo
        w.anim_acc="magia"
        w.anim_col={0,0,1,1}
            Animacion.add_action_animation(w,"magia",{1,1,1,1})  
        if acertar(v,w)  then
            v.state["congelado"]={name="congelado",id="congelado",spr=6,value=0,cont=2,ini=5}
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end    

Efectos["veneno"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})

        if acertar(v,w)  then
            v.state["veneno"]={name="veneno",id="veneno",spr=11,value=w.pod/2,cont=5,ini=5}
            ---add(v.state,veneno)
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["veneno_rapido"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})

        if acertar(v,w)  then
            v.state["veneno"]={name="veneno",id="veneno",spr=11,value=w.pod/2,cont=5,ini=5}
            ---add(v.state,veneno)
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["veneno_toxico"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})

        if acertar(v,w)  then
            v.state["veneno"]={name="veneno",id="veneno",spr=11,value=w.pod/2,cont=5,ini=5}
            ---add(v.state,veneno)
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end


Efectos["enfermedad"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})

        if acertar(v,w)  then
            v.state["veneno"]={name="veneno",id="veneno",spr=11,value=w.pod/2,cont=5,ini=5}
            ---add(v.state,veneno)
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

    --sanar

Efectos["recuperacion"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)




        DamageProccess(w,w,((w.con + flr(rnd(6)) + 1)) ,"")
        w.anim_acc="ataque_arma"
        w.anim_col={1,1,1,1}
        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        --w.anim_acc="magia"
        --w.anim_col={1,1,1,1}

        --jump_start(v)
        --checks(v)
        --v.anim_acc="corte"
        --v.anim_col={1,1,1,1}
    end




Efectos["robar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        if #v.items~=nil then

            Animacion.add_action_animation(w,"magia",{0,1,0,1})  

            local sl=flr(rnd(#v.items-1)+1)
            local name=v.items[sl]
            for n,m in pairs(items) do
                if name==m.name then
                    m.cont=m.cont+1
                end    
            end
            v.lastDmgC="W"
            v.slDmg=true    
            v.lastDmgM=name.." robado"
            v.typeMsg=true
            jump_start(v)
            --v.anim_acc="corte"
            --v.anim_col={1,1,1,1}
        end
    end


Efectos["quitar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    if #v.items~=nil then
        Actual.anim_acc="ataque_arma"
        Actual.anim_col={1,1,1,1}
        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})  

        local sl=flr(rnd(#v.items-1)+1)
        local name=v.items[sl]
        for n,m in pairs(items) do --crear metodo
            if name==m.name then
                m.cont=m.cont+1
            end    
        end

        if acertar(v,Actual) then
            local crit=""
            local mult=1
            mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
            DamageProccess(v,Actual,-flr((Actual.fue + flr(rnd(Actual.weapon.left.w)) + Actual.weapon.left.bw)*0.8*mult),crit)
            checks(v)
            for n,m in pairs(items) do
                if name==m.name then
                    m.cont=m.cont+1
                end    
            end
            v.slDmg=true    
            v.lastDmgM=v.lastDmgM.." "..name.." robado"
            v.typeMsg=true
        else
            eludido(v)    
        end
    end
end





Efectos["Furia"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    
    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})  
    Actual.avanzar=true
    Actual.rest=false
    if acertarMod(v,Actual,-3) then
        local crit=""
        local mult=1
        mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
        DamageProccess(v,w,-flr(2*(Actual.fue+Actual.con)*mult*1.5),crit)
        checks(v)
        jump_start(v)
    else
        eludido(v)
    end  

end
Efectos["Geo"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

    Animacion.add_action_animation(w,"magia",{1,1,1,1})  
    Actual.avanzar=true
    Actual.rest=false
    local mult=1
    wait_start()
    b_dmg_txt=true
    
    local terreno= enemyGroups[Nvg].terrain
    Mg_sel=lista_elemto_terreno[terreno]
    for k,i in pairs(Total_enemy)do
        if i.hp_>0 then
            i.lastDmg=0
            i.slDmg=true
            i.lastDmgC="R"
            ejecutarMagia(Mg_sel, i, Order)
            checks(i)
        end
    end

end

Efectos["Slash"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})  
    Actual.avanzar=true
    Actual.rest=false
    local mult=1
    wait_start()
    b_dmg_txt=true
    FiltrarEnemigoVivos()
    for k,r in pairs(EnemigosVivos)do
        r.lastDmg=0
        r.slDmg=true
        r.lastDmgC="R"
        if acertar(r,Actual) then
            local crit=""
            local mult=1
            mult, crit =  adv_weak_Logic(r,Actual,{"volar"},true )
            DamageProccess(r,Actual,-flr((Actual.agi + flr(rnd(Actual.weapon.left.w)) + Actual.weapon.left.bw)*3*mult),crit)
            jump_start(r)
            checks(r)
        else
            eludido(r)    
        end  
    end

end

Efectos["Lanzar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})  
    Actual.avanzar=true
    Actual.rest=false
    local weapon = getChars(f,weapon_inventary)
    wait_start()
    b_dmg_txt=true
    v.lastDmg=0
    v.slDmg=true
    v.lastDmgC="R"
    if acertar(v,Actual) then
        local crit=""
        local mult=1
        mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
        DamageProccess(v,Actual,-flr((Actual.agi + flr(rnd(weapon.w)*2.5) + Actual.weapon.left.bw)*3*mult),crit)
        checks(v)
        jump_start(v)
    else
        eludido(v)    
    end  

end

Efectos["Capturar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    if listaCaptura[v.id_mons]~=nil then
        if v.hp_ <= v.hp*0.3 then
            Animacion.add_action_animation(w,"magia",{1,1,1,1})  
            v.hp_=0
            checks(v)
            if  not existList(listaCaptura[v.id_mons].id, Actual.beast) then
                add(Actual.beast,listaCaptura[v.id_mons])
                Msg_enemigo(v,"Capturado")
            else
                Msg_enemigo(v,"Derrotado")
            end
            checks(v)
        else
            Msg_enemigo(v,"Escapa")
        end
    else
        Msg_enemigo(v,"Imposible")
    end    
end


Efectos["Suerte"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})  
    Actual.avanzar=true
    Actual.rest=false
    local mult=1
    wait_start()
    b_dmg_txt=true
    local spell_list={"fuego", "hielo","electro"}
    local sl=flr(rnd(#spell_list-1)+1)
    local mg=spell_list[sl]
    for k,i in pairs(Total_enemy)do
        if i.live then
            i.lastDmg=0
            i.slDmg=true
            i.lastDmgC="R"
            ejecutarMagia(mg, i, Order)
        end
    end
end

--TODO
Efectos["morph"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

    Animacion.add_action_animation(w,"magia",{1,1,1,1})  

end

---metamagia
Efectos["dual_M."]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    
    Animacion.add_action_animation(w,"magia",{1,1,1,1}) 
    Actual.avanzar=true
    Actual.rest=false


end

Efectos["extra_M."]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

    Animacion.add_action_animation(w,"magia",{1,1,1,1}) 
    Actual.avanzar=true
    Actual.rest=false
    Actual.flee_magic=1
    continuar_turno=true
    
end

Efectos["potenciar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

    Animacion.add_action_animation(w,"magia",{1,1,1,1}) 
    Actual.avanzar=true
    Actual.rest=false

    Actual.potenciar_spell=true
    Actual.aumentar_spell = 1


end

Efectos["expandir_M."]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

    Animacion.add_action_animation(w,"magia",{1,1,1,1}) 
    Actual.avanzar=true
    Actual.rest=false

    Actual.potenciar_spell=true
    Actual.aumentar_spell = Number_sel

end

Efectos["cargar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1}) 
    Actual.carga=1
    wait_start()
    --b_dmg_txt=true

    ejecutarArma(v)
    checks(v)
end



Efectos["curar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
        local mult, crit =  adv_weak_Logic(v,w,{"curar"},false )
        if v.weak["curar"] ~= nil then
            mult=-1
        end
        DamageProccess(v,Actual,((Actual.pod + flr(rnd(6)) + 1)*mult) ,crit)
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
    end

Efectos["curar+"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        Animacion.add_action_animation(w,"magia",{0,1,0,1})
        local mult, crit =  adv_weak_Logic(v,w,{"curar"},false )
        if v.weak["curar"] ~= nil then
            mult=-1
        end
        DamageProccess(v,Actual,((Actual.pod + flr(rnd(6)) + 1)*6*mult) ,crit)
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
    end

Efectos["curar++"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        Animacion.add_action_animation(w,"magia",{0,1,0,1})
        local mult, crit =  adv_weak_Logic(v,w,{"curar"},false )
        if v.weak["curar"] ~= nil then
            mult=-1
        end
        DamageProccess(v,Actual,((Actual.pod + flr(rnd(6)) + 1)*12*mult) ,crit)
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
    end

Efectos["revivir"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        Animacion.add_action_animation(w,"magia",{0,1,0,1})
        v.hp_=10
        v.live=true
        v.state={}
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
    end
Efectos["sanar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        Animacion.add_action_animation(w,"magia",{0,1,0,1})
        v.state={}
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
    end
Efectos["disipar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        Animacion.add_action_animation(w,"magia",{0,1,0,1})
        v.state={}
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
    end
    --MP hp
Efectos["drenar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        Animacion.add_action_animation(w,"magia",{0,1,0,1})

        if acertarMod(v,Actual,0) then
            local crit=""
            local mult=1
            mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
            local dmg=(3+(Actual.con*3))*mult
            DamageProccess(v,Actual,-flr(dmg*mult),crit)
            w.hp_=w.hp_+(dmg*0.25)
            checks(v)
            jump_start(v)
        else
            eludido(v)    
        end 

        v.state={}
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
    end
Efectos["absorber"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        Animacion.add_action_animation(w,"magia",{0,1,0,1})

        v.state={}
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
    end
Efectos["vampiro"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        Animacion.add_action_animation(w,"magia",{0,1,0,1})

        v.state={}
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
    end
    -- espacio
Efectos["teleport"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        Animacion.add_action_animation(w,"magia",{0,1,0,1})

        v.state={}
        
    end

    Efectos["exiliar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        Animacion.add_action_animation(w,"magia",{0,1,0,1})

        v.state={}
    end



    Efectos["lanzar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        Animacion.add_action_animation(w,"magia",{0,1,0,1})

        v.state={}
    end

    Efectos["portal"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        Animacion.add_action_animation(w,"magia",{0,1,0,1})

        v.state={}
    end

    Efectos["expulsar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        Animacion.add_action_animation(w,"magia",{0,1,0,1})

        v.state={}
    end

Efectos["volar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        Animacion.add_action_animation(w,"magia",{0,1,0,1})

        v.state={}
    end


Efectos["analizar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side) --libra
    --- llenar
end

---objetos
--V objetivo f objetos
Efectos["pocion_item"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    local mult, crit
    ALQUIMISTA=true
    Animacion.add_action_animation(w,"magia",{1,1,1,1}) 
        if f.cont> 0 then 
            if v.hp_>0 then
                f.cont=f.cont-1
                local mult, crit =  adv_weak_Logic(v,w,{"curar"},false )
                if ALQUIMISTA then DamageProccess(v,w,(f.curar*1.5*mult),crit)
                else DamageProccess(v,w,(f.curar*mult),crit) end
            end
        else
            Cancel_ejecutar=true    
        end
end

Efectos["revivir_item"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    local mult, crit
    ALQUIMISTA=true
    Animacion.add_action_animation(w,"magia",{1,1,1,1}) 
        if f.cont> 0 then 
            if v.hp_<0 then
                f.cont=f.cont-1
                local mult, crit =  adv_weak_Logic(v,w,{"curar"},false )
                v.hp_=0
                if ALQUIMISTA then DamageProccess(v,w,(f.curar*1.5*mult),crit)
                else DamageProccess(v,w,(f.curar*1*mult),crit) end
            end
        else
            Cancel_ejecutar=true    
        end
end

Efectos["sanar_item"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    local mult, crit
    ALQUIMISTA=true
    Animacion.add_action_animation(w,"magia",{1,1,1,1}) 
        if f.cont> 0 then 
            if v.hp_<0 then
                f.cont=f.cont-1
                local mult, crit =  adv_weak_Logic(v,w,{"curar"},false )
                if ALQUIMISTA then DamageProccess(v,w,(f.curar*1.5*mult),crit)
                else DamageProccess(v,w,(f.curar*mult),crit) end
            end
        else
            Cancel_ejecutar=true    
        end
end

Efectos["ether_item"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    local mult, crit
    ALQUIMISTA=true
    Animacion.add_action_animation(w,"magia",{1,1,1,1}) 
        if f.cont> 0 then 
            if v.hp_>0 then
                f.cont=f.cont-1
                if v.mp_ < 0 then v.mp_=0 end
                if ALQUIMISTA then v.mp_= v.mp_ + (f.curar*1.5)
                else v.mp_= v.mp_ + f.curar end
                v.lastDmg=f.curar
                v.lastDmgM=f.curar
                v.lastDmgC="Y" 
            end
        else
            Cancel_ejecutar=true    
        end
end

Efectos["bomba_item"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    ALQUIMISTA=true
    Animacion.add_action_animation(w,"magia",{1,1,1,1}) 
        if f.cont > 0 then
            f.cont=f.cont-1
            if acertar(v, w) then
                v.jump=true
                v.jump_time=0
                v.rest=false
                local str=f.id
                local mult, crit =  adv_weak_Logic(v,w,{"fuego"},false )
                if ALQUIMISTA then DamageProccess(v,w,-(f.attack*mult),crit)
                else DamageProccess(v,w,-(f.attack*1.5*mult),crit) end
                checks(v)
                jump_start(v)
            else
                eludido(v)    
            end    
        else
            Cancel_ejecutar=true    
        end
end


Efectos["roca_item"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    ALQUIMISTA=true
    Animacion.add_action_animation(w,"magia",{1,1,1,1}) 
        if f.cont > 0 then
            f.cont=f.cont-1
            if acertar(v, w) then
                v.jump=true
                v.jump_time=0
                v.rest=false
                local str=f.id
                mult, crit =  adv_weak_Logic(v,w,{"fuego"},false )
                if ALQUIMISTA then DamageProccess(v,w,-(rndp(f.attack)*1.5*mult),crit)
                else DamageProccess(v,w,-(rndp(f.attack)*mult),crit) end
                checks(v)
                jump_start(v)
            else
                eludido(v)    
            end    
        else
            Cancel_ejecutar=true    
        end
end  


Efectos["libro"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"magia",{1,1,1,1}) 
        if f.cont > 0 then
            f.cont=f.cont-1
            for k,h in pairs(f.add) do
                --Debug_temp="n "..h.name
                add(v.mg,h)
            end
        else
            Cancel_ejecutar=true    
        end
end  

---Agregar mas libros o mejorar

Efectos["libro_fuego"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

    Efectos["libro"](v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

end  

--efectos enemigos



Efectos["atacar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

            w.avanzar=true
            w.rest=false
            w.anim_acc="ataque_arma"
            w.anim_col={1,1,1,1}
            Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1}) 
            if acertar(v, w) then
                v.lastDmg=0
                v.slDmg=true
                v.lastDmgC="V"
                local crit =""
                local mult=1
                mult, crit =  adv_weak_Logic(v,w,{"cosmic"},false )
                DamageProccess(v,w,-(((w.con + flr(rnd(2)))*mult)),crit)
                jump_start(v)
                checks(v)
                v.anim_acc="corte"
                v.anim_col={1,0,0,1}
            else
                eludido(v)    
            end

end  


Efectos["flojera"] = function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        w.avanzar=true
        w.rest=false

        Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
end


Efectos["drenar_vida"] = function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            w.avanzar=true
            w.rest=false
            Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1}) 
            if acertar(v, w) then
                v.lastDmg=0
                v.slDmg=true
                v.lastDmgC="V"
                local crit =""
                local mult=1
                local dmg=0
                mult, crit =  adv_weak_Logic(v,w,{"cosmic"},false )
                dmg = DamageProccess(v,w,-(((w.con + flr(rnd(2)))*mult)),crit)
                if dmg~=nil and dmg<0 then
                    w.hp_=w.hp_+flr(dmg*-0.25)
                end
                jump_start(v)
                checks(v)
                Animacion.add_action_animation(v,"corte",{1,0,0,1}) 
            else
                eludido(v)    
            end
end

Efectos["ataque_psi"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
            w.avanzar=true
            w.rest=false
            w.anim_acc="ataque_arma"
            w.anim_col={1,1,1,1}
            Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1}) 
            if acertar(v, w) then
                v.lastDmg=0
                v.slDmg=true
                v.lastDmgC="V"
                local crit =""
                local mult=1
                mult, crit =  adv_weak_Logic(v,w,{"psi"},false )
                DamageProccess(v,w,-(((w.con + flr(rnd(2)))*mult)),crit)
                jump_start(v)
                checks(v)
                v.anim_acc="corte"
                v.anim_col={1,0,0,1}
            else
                eludido(v)    
            end
end  


	 
--contextualizar
Efectos["corte_aplastante"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"corte","fisico"},false )
        DamageProccess(v,w,-((w.con*1.5 + mod(w,"con") + flr(rnd(6)))*mult),crit)
        Animacion.add_action_animation(w,"corte",{1,1,1,1})
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end

Efectos["paso_veloz"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"magia",{0.5,0.5,1,1})
    w.state["rapido"]={name="rapido",id="rapido",spr=10,value=w.agi*0.3,cont=3,ini=5}
    w.ini=w.agi+mod(w,"agi")+flr(rnd(20))
    qsort(Order, function(a,b) return abs(a.ini) > abs(b.ini) end)
    jump_start(w)
    checks(w)
end


--corte

Efectos["doble_corte"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)

        agregarAccion({"ejecutar_secuencia","doble_corte_shot",v,w})
        agregarAccion({"ejecutar_secuencia_final","doble_corte_shot",v,w})

end

Efectos["doble_corte_shot"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
    if acertarMod(v,w,3) then
        local mult, crit =  adv_weak_Logic(v,w,{"corte","fisico"},false )
        DamageProccess(v,w,-((w.con*0.8 + mod(w,"con")*0.8 + flr(rnd(4)))*mult*2),crit)
        Animacion.add_action_animation(w,"corte",{1,1,1,1})
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end

Efectos["perforacion_repetida"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
    for i=1,3 do
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"perforante","fisico"},false )
            DamageProccess(v,w,-((w.con*0.5 + flr(rnd(4)))*mult),crit)
        end
    end
    Animacion.add_action_animation(w,"corte",{1,1,1,1})
    jump_start(v)
    checks(v)
end

Efectos["colmillo_perforador"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"perforante","fisico"},false )
        DamageProccess(v,w,-((w.con*2 + mod(w,"con") + flr(rnd(6)))*mult*1.2),crit)
        v.state["veneno"]={name="veneno",id="veneno",spr=11,value=w.pod/3,cont=3,ini=5}
        v.anim_acc="corte"
        v.anim_col={1,0,0,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end


Efectos["corte_giratorio"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
        agregarAccion({"ejecutar_secuencia","corte_giratorio_shot",v,w})
        agregarAccion({"ejecutar_secuencia_final","corte_giratorio_shot",v,w})

end

Efectos["corte_giratorio_shot"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
    for k,i in pairs(EnemigosVivos)do
        if acertar(i,w) then
            local mult, crit =  adv_weak_Logic(i,w,{"corte","fisico"},false )
            DamageProccess(i,w,-((w.con+ WeaponPower(w) + 6)*mult),crit)
            i.anim_acc="corte"
            i.anim_col={1,1,1,1}
            jump_start(i)
            checks(i)
        end
    end
end

Efectos["tornado_cortante"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"magia",{1,1,1,1})
    side = side or "enemy"
    local list= GrupoLinea(side) 
    for k,i in pairs(list)do
        if acertar(i,w) then
            local mult, crit =  adv_weak_Logic(i,w,{"corte","viento","contundente"},false )
            DamageProccess(i,w,-((w.pod + mod(w,"pod") + 24)*mult),crit)
            i.anim_acc="corte"
            i.anim_col={1,1,1,1}
            jump_start(i)
            checks(i)
        end
    end
end


--Agregar fortaleza volador
Efectos["viento_cortante"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"magia",{1,1,1,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"corte","viento","magia","volador"},false )
        DamageProccess(v,w,-((w.pod + mod(w,"pod") + WeaponPower(w) + flr(rnd(6)))*mult),crit)
        Animacion.add_action_animation(w,"corte",{1,1,1,1})
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end

---Deprecado
Efectos["vacio_cortante"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"magia",{0.2,0.2,0.3,1})
    if acertarMod(v,w,0) then
        local mult, crit =  adv_weak_Logic(v,w,{"corte","vacio","magia"},false )
        DamageProccess(v,w,-((w.pod*2 + mod(w,"pod") + flr(rnd(8)))*mult),crit)
        v.anim_acc="corte"
        v.anim_col={0.2,0.2,0.3,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end
---Deprecado
Efectos["arma_giratoria"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
    for i=1,2 do
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"corte","fisico"},false )
            DamageProccess(v,w,-((w.con*0.7 + flr(rnd(4)))*mult),crit)
        end
    end
    v.anim_acc="corte"
    v.anim_col={1,1,1,1}
    jump_start(v)
    checks(v)
end

Efectos["corte_de_fuego"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,0.5,0,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"corte","fuego"},false )
        DamageProccess(v,w,-((w.con+ flr(rnd(12)))*mult),crit)
        v.anim_acc="fuego"
        v.anim_col={1,0.5,0,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end

Efectos["corte_relampago"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,1,0.5,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"corte","electricidad"},false )
        DamageProccess(v,w,-((w.con + flr(rnd(12)))*mult),crit)
        v.anim_acc="rayo"
        v.anim_col={1,1,0.5,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end

Efectos["corte_congelante"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{0.5,0.8,1,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"corte","hielo"},false )
        DamageProccess(v,w,-((w.con + flr(rnd(12)))*mult),crit)
        v.anim_acc="hielo"
        v.anim_col={0.5,0.8,1,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end

--Modificar y contextualizar
Efectos["viento_sagrado"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"magia",{1,1,0.8,1})
    --[[
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"sagrado","viento","magia"},false )
        DamageProccess(v,w,-((w.pod*1.8 + mod(w,"pod") + flr(rnd(6)))*mult),crit)
        v.anim_acc="magia"
        v.anim_col={1,1,0.8,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
    ]]
end


--Pide HP
Efectos["viento_sangrante"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"magia",{1,0.3,0.3,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"corte","viento","sangre"},false )
        DamageProccess(v,w,-((w.con*2 + mod(w,"con") + flr(rnd(12)))*mult),crit)
        v.state["sangrado"]={name="sangrado",id="sangrado",spr=11,value=w.pod/3,cont=3,ini=5}
        v.anim_acc="corte"
        v.anim_col={1,0.3,0.3,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end
--deprecado
Efectos["corte_lanzador"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"corte","fisico"},false )
        DamageProccess(v,w,-((w.con*1.2 + w.dex + flr(rnd(6)))*mult),crit)
        Animacion.add_action_animation(w,"corte",{1,1,1,1})
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end

Efectos["cazador_de_gigante"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
    if acertar(v,w) then
        local sizeMult = 1 + flr(v.hp/v.hp_) * 0.5
        local mult, crit =  adv_weak_Logic(v,w,{"corte","fisico","gigante"},false )
        DamageProccess(v,w,-((w.con*1.2 + mod(w,"con") + flr(rnd(6)))*mult*sizeMult),crit)
        v.anim_acc="corte"
        v.anim_col={1,0,0,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end

Efectos["corte_amplio"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
    for k,i in pairs(EnemigosVivos)do
        if acertar(i,w) then
            local mult, crit =  adv_weak_Logic(i,w,{"corte","fisico"},false )
            DamageProccess(i,w,-((w.con*0.7 + flr(rnd(4)))*mult),crit)
            i.anim_acc="corte"
            i.anim_col={1,1,1,1}
            jump_start(i)
            checks(i)
        end
    end
end
--coxterualizar
Efectos["ataque_fantasma"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"magia",{0.5,0.5,0.8,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"fantasma","magia"},false )
        DamageProccess(v,w,-((w.pod*1.5 + mod(w,"pod") + flr(rnd(6)))*mult),crit)
        v.anim_acc="magia"
        v.anim_col={0.5,0.5,0.8,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end
--deprecado
Efectos["salto_tormenta"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"magia",{1,1,0.5,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"electricidad","magia"},false )
        DamageProccess(v,w,-((w.pod*1.8 + mod(w,"pod") + flr(rnd(8)))*mult),crit)
        v.anim_acc="rayo"
        v.anim_col={1,1,0.5,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end

Efectos["danza_aerea"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"magia",{0.8,0.9,1,1})
    for k,i in pairs(EnemigosVivos)do
        if acertar(i,w) then
            local mult, crit =  adv_weak_Logic(i,w,{"viento","magia"},false )
            DamageProccess(i,w,-((w.pod*0.8 + flr(rnd(3)))*mult),crit)
            i.anim_acc="corte"
            i.anim_col={0.8,0.9,1,1}
            jump_start(i)
            checks(i)
        end
    end
end

Efectos["giro_helicoptero"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
    for k,i in pairs(EnemigosVivos)do
        if acertar(i,w) then
            local mult, crit =  adv_weak_Logic(i,w,{"corte","fisico"},false )
            DamageProccess(i,w,-((w.con + flr(rnd(3)))*mult*0.7),crit)
            i.anim_acc="corte"
            i.anim_col={1,1,1,1}
            jump_start(i)
            checks(i)
        end
    end
end

Efectos["estampar"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"contundente","fisico"},false )
        DamageProccess(v,w,-((w.con + mod(w,"con") + 12 )*mult),crit)
        v.state["stun"]={name="stun",id="stun",spr=48,value=0,cont=2,ini=5}
        v.anim_acc="corte"
        v.anim_col={1,0,0,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end

Efectos["impacto_terremoto"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
    for k,i in pairs(EnemigosVivos)do
        if acertar(i,w) then
            local mult, crit =  adv_weak_Logic(i,w,{"contundente","tierra","fisico"},false )
            DamageProccess(i,w,-((w.con+ mod(w,"pod") + 12)*mult),crit)
            i.anim_acc="corte"
            i.anim_col={1,1,1,1}
            jump_start(i)
            checks(i)
        end
    end
end

Efectos["puas_de_roca"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"magia",{0.6,0.6,0.5,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"perforante","piedra","magia"},false )
        DamageProccess(v,w,-((w.pod*1.3 + mod(w,"pod") + flr(rnd(4)))*mult),crit)
        --v.state["veneno"]={name="veneno",id="veneno",spr=11,value=w.pod/4,cont=3,ini=5}
        v.anim_acc="corte"
        v.anim_col={0.6,0.6,0.5,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end
--TODO
Efectos["punnetazo_de_piedra"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{0.6,0.6,0.5,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"contundente","piedra","fisico"},false )
        DamageProccess(v,w,-((w.con*1.8 + mod(w,"con") + flr(rnd(8)))*mult),crit)
        v.anim_acc="corte"
        v.anim_col={0.6,0.6,0.5,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end

Efectos["impacto_sonnador"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"sonido","fisico"},false )
        DamageProccess(v,w,-((w.con + mod(w,"con") + flr(rnd(4)))*mult),crit)
        v.state["dormir"]={name="dormir",id="dormir",spr=29,value=0,cont=3,ini=5}
        Animacion.add_action_animation(w,"corte",{1,1,1,1})
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end

Efectos["impacto_aturdidor"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"sonido","fisico"},false )
        DamageProccess(v,w,-((w.con + mod(w,"con") + flr(rnd(4)))*mult),crit)
        v.state["stun"]={name="stun",id="stun",spr=48,value=0,cont=2,ini=5}
        Animacion.add_action_animation(w,"corte",{1,1,1,1})
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end

Efectos["impacto_lanzador"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"contundente","fisico"},false )
        DamageProccess(v,w,-((w.con*0.5  + flr(rnd(6)))*mult),crit)
        if DCMOD(w,v,w.con+6,"dex",3) then
            Exiliar(v,w)
        end
        Animacion.add_action_animation(w,"corte",{1,1,1,1})
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end

Efectos["impacto_silenciador"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"contundente","fisico"},false )
        DamageProccess(v,w,-((w.con + mod(w,"con") + flr(rnd(4)))*mult),crit)
        v.state["silencio"]={name="silencio",id="silencio",spr=3,value=0,cont=3,ini=5}
        Animacion.add_action_animation(w,"corte",{1,1,1,1})
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end

Efectos["impacto_segador"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,0.3,0.3,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"contundente","fisico"},false )
        DamageProccess(v,w,-((w.con*1.5 + mod(w,"con") + flr(rnd(6)))*mult*1.5),crit)
        v.state["ceguera"]={name="ceguera",id="ceguera",spr=3,value=0,cont=3,ini=5}
        Animacion.add_action_animation(w,"corte",{1,1,1,1})
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end


Efectos["impacto_electrico"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,0.3,0.3,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"contundente","fisico","electricidad"},false )
        DamageProccess(v,w,-((w.con+ mod(w,"con") + 12)*mult),crit)
        Animacion.add_action_animation(w,"corte",{1,1,1,1})
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end


---agregar mecanica distancia vuelo
Efectos["lanza_espectral"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"magia",{0.5,0.5,0.8,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"fantasma","perforante","magia","volador"},false )
        ANTI_VUELO=true
        DamageProccess(v,w,-((w.pod*1.5 + mod(w,"pod") + flr(rnd(6)))*mult),crit)
        ANTI_VUELO=false
        Animacion.add_action_animation(w,"magia",{1,1,1,1})
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end

Efectos["lanzas_de_hielo"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"magia",{0.5,0.8,1,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"perforante","hielo","magia"},false )
        DamageProccess(v,w,-((w.con + mod(w,"con") + 12)*mult),crit)
        v.anim_acc="hielo"
        v.anim_col={0.5,0.8,1,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end

Efectos["anti_armadura"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,1,1,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"perforante","fisico"},false )
        TRUE_DAMAGE=true
        DamageProccess(v,w,-((w.con*0.8 + mod(w,"con") + flr(rnd(3)))*mult*1.5),crit)
        TRUE_DAMAGE=false
        v.state["vulnerable"]={name="vulnerable",id="vulnerable",spr=30,value=w.con*0.3,cont=3,ini=5}
        Animacion.add_action_animation(w,"corte",{1,1,1,1})
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end


Efectos["danno_interno"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"magia",{1,0.3,0.3,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"interno","magia"},false )
        DamageProccess(v,w,-((w.con + mod(w,"con") + 12)*mult),crit)
        v.state["grave"]={name="grave",id="grave",spr=48,value=0,cont=1,ini=5}
        Animacion.add_action_animation(w,"corte",{1,1,1,1})

        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end

--deprecado

Efectos["danno_interno_ligero"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"magia",{1,0.3,0.3,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"interno","magia"},false )
        DamageProccess(v,w,-((w.pod*0.8 + flr(rnd(3)))*mult),crit)
        v.anim_acc="magia"
        v.anim_col={1,0.3,0.3,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end
--deprecado
Efectos["danno_interno_medio"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"magia",{1,0.3,0.3,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"interno","magia"},false )
        DamageProccess(v,w,-((w.pod*1.5 + mod(w,"pod") + flr(rnd(6)))*mult),crit)
        v.anim_acc="magia"
        v.anim_col={1,0.3,0.3,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end
--deprecado
Efectos["danno_interno_alto"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"magia",{1,0.3,0.3,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"interno","magia"},false )
        DamageProccess(v,w,-((w.pod*2.5 + mod(w,"pod") + flr(rnd(8)))*mult),crit)
        v.anim_acc="magia"
        v.anim_col={1,0.3,0.3,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end
--deprecado
Efectos["danno_interno_maximo"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"magia",{1,0.2,0.2,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"interno","magia"},false )
        DamageProccess(v,w,-((w.pod*4 + mod(w,"pod") + flr(rnd(12)))*mult),crit)
        v.anim_acc="magia"
        v.anim_col={1,0.2,0.2,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end
--deprecado
Efectos["danno_calculado"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"magia",{0.8,0.8,1,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"magia","calculo"},false )
        local dmg = flr((w.pod + w.con + w.dex + w.con + w.agi + w.def) / 3)
        DamageProccess(v,w,-(dmg*mult),crit)
        v.anim_acc="magia"
        v.anim_col={0.8,0.8,1,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end
--deprecado
Efectos["perforacion_critica"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{1,0.8,0.2,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"perforante","fisico"},false )
        DamageProccess(v,w,-((w.con+ mod(w,"con") + 12)*mult*2),crit.."!")
        v.anim_acc="corte"
        v.anim_col={1,0.8,0.2,1}
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end





Efectos["golpe_escudo"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{0.5,0.7,1,1})
    if acertar(v,w) then
        local mult, crit =  adv_weak_Logic(v,w,{"contundente","fisico"},false )
        DamageProccess(v,w,-(( w.con*2 + 6)*mult),crit)
        v.state["stun"]={name="stun",id="stun",spr=48,value=0,cont=1,ini=5}
        v.anim_col={0.5,0.7,1,1}
        Animacion.add_action_animation(w,"corte",{0.5,0.7,1,1})
        jump_start(v)
        checks(v)
    else
        eludido(v)
    end
end


--Deprecado
Efectos["carga_escudo"]= function (v,w,f,arm,punteria,bono,bcrit,tipo,extra,side)
    Animacion.add_action_animation(w,"ataque_arma",{0.5,0.7,1,1})
    w.state["fortificado"]={name="fortificado",id="fortificado",spr=31,value=w.def*0.5,cont=3,ini=5}
    w.anim_acc="magia"
    w.anim_col={0.5,0.7,1,1}
    jump_start(w)
    checks(w)
end

   
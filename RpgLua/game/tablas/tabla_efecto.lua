Efectos={}


--(v objetivo ,w lanzador ,f Objeto , bol --boolean de potenciado, bono multiplicador)


Efectos["extraer"] = function (v,w,str)

    if str == "fuego" then
        --add()
    elseif str == "hielo"  then
        --save()
    else
    --
    end
    
end


Efectos["extraer_all"] = function (v,w,str)

    --Extrae todos los elementos
    
end


Efectos["rezar"] = function (v,w,str)

    --Extrae todos los elementos
    
end

Efectos["centrarse"] = function (v,w,str)

    --Extrae todos los elementos
    
end

Efectos["premonicion"] = function (v,w,str)

    --Extrae todos los elementos
    
end

Efectos["asesinar"]= function (v,w,f,bol,bono)

        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            local escon=1
            if w.hide then
                escon=2
            end
            local ultra=1
            ultra = multiplicador_estado(v)
            local mult, crit =  adv_weak_Logic(v,w,{"fisico"},false )
            DamageProccess(v,w,-((w.dex*2 + mod(w,"dex") + flr(rnd(6)))*bono*escon*ultra*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
        
end


Efectos["saltar"]= function (v,w,f,bol,bono)

        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        Actual.avanzar=true
        Actual.rest=false
        if acertarMod(v,w,6) then
            v.lastDmg=0
            v.slDmg=true
            v.lastDmgC="R"
            local mult, crit =  adv_weak_Logic(v,w,{"fisico"},false )
            DamageProccess(v,w,-flr((Actual.con + flr(rnd(Actual.weapon.left.w)) + Actual.weapon.left.bw)*3*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
end

    --tools

Efectos["metralleta"]= function(v,w,f,bol,bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"oscuridad","magia"},false )
            DamageProccess(v,w,-((w.dex*2 + mod(w,"dex") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
        
    end

Efectos["generador_electrico"]= function(v,w,f,bol,bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"oscuridad","magia"},false )
            DamageProccess(v,w,-((w.dex*2 + mod(w,"dex") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
        
    end

Efectos["disparador_sonico"]= function(v,w,f,bol)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}

        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"sonido","fisico"},false )
            DamageProccess(v,w,-((w.dex*3 + mod(w,"dex") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["misiles"]= function(v,w,f,bol)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}

        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"explosion","fisico"},false )
            DamageProccess(v,w,-((w.dex*3 + mod(w,"dex") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

    
Efectos["generador_de_gravedad"]= function(v,w,f,bol)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}

        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"gravedad","fisico"},false )
            DamageProccess(v,w,-((w.dex*3 + mod(w,"dex") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end


Efectos["tecnologia_prohibida"]= function(v,w,f,bol)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}

        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"oscuridad","fisico"},false )
            DamageProccess(v,w,-((w.dex*3 + mod(w,"dex") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Local_debug=""
Efectos["lanza_llamas"]= function(v,w,f,bol)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertar(v,w) then
            Local_debug=v.name
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","fisico"},false )
            DamageProccess(v,w,-((w.dex*3 + mod(w,"dex") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="fuego"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

    --- TRANSFORMACIONES

Efectos["destransformar"]= function(v,w,f,bol)
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
        v.forma=false
        v.acc=v.accResp
    end

Efectos["forma_murcielago"]= function(v,w,f,bol)
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
        v.forma=true
        v.sec_anim={ti=0,ac=1,frm={{t=32,spr=3},{t=32,spr=32},}}
        v.acc={"atacar","destransformar","defensa","objetos"}
    end

Efectos["forma_serpiente"]= function(v,w,f,bol)
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
        v.forma=true
        v.sec_anim={ti=0,ac=1,frm={{t=32,spr=66},{t=32,spr=67},}}
        v.acc={"atacar","destransformar","defensa","objetos"}
    end

Efectos["forma_slime"]= function(v,w,f,bol)
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
        v.forma=true
        v.sec_anim={ti=0,ac=1,frm={{t=32,spr=70},{t=32,spr=71},}}
        v.acc={"atacar","destransformar","defensa","objetos"}
    end

    ---OSCURIDAD
    
Efectos["darkness"]= function(v,w,f,bol)
        w.anim_acc="ataque_arma"
        w.anim_col={1,1,1,1}
        
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"oscuridad","magia"},false )
            DamageProccess(v,w,-((w.pod*3 + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

    ---invocaciones
    
Efectos["anomalia"]= function(v,w,f,bol)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        w.summon=true
        w.ani_summon="anomalia"
        w.avanzar_x=400
        w.summon_x=-60
        w.summon_x_=-60
        w.summon_y=150
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fisico"},false )
            DamageProccess(v,w,-(((w.pod*3) + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end




Efectos["Demonio_protector"]= function(v,w,f,bol)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        w.summon=true
        w.ani_summon="Demonio_protector"
        w.avanzar_x=400
        w.summon_x=-300
        w.summon_x_=-300
        w.summon_y=150
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            DamageProccess(v,w,-(((w.pod*5) + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end
    
Efectos["dragon_de_fuego "]= function(v,w,f,bol)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["Tiphon_de_agua"]= function(v,w,f,bol)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fisico","magia"},false )
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["relampago_divino"]= function(v,w,f,bol)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"electricidad","magia"},false )
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["petalos_cortantes"]= function(v,w,f,bol)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"corte","magia"},false )
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end
Efectos["danza_helada"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"frio","magia"},false )
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["fuerza_del_bosque"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"golpe","magia"},false )
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["voluntad_de_la_tierra"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"golpe","magia"},false )
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["corte_infernal"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"corte","fuego","magia"},false )
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["giga_mecha"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","fisico"},false )
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
end

Efectos["voluntad_divina"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"sagrado","magia"},false )
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
end



Efectos["Elemental_de_fuego"]= function (v, w, f, bol, bono)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
            local char=copiar_tabla(invocaciones_fisicas["murcielago_aliado"])
            add(aliados,char)
            char.x=aliadosPosicion[#aliados].x
            char.y=aliadosPosicion[#aliados].y
            char.ini=char.agi+flr(rnd(20))
            add(Order,char)
        end
end


Efectos["Elemental_de_agua"]= function (v, w, f, bol, bono)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
            local char=copiar_tabla(invocaciones_fisicas["murcielago_aliado"])
            add(aliados,char)
            char.x=aliadosPosicion[#aliados].x
            char.y=aliadosPosicion[#aliados].y
            char.ini=char.agi+flr(rnd(20))
            add(Order,char)
        end
end

Efectos["Elemental_de_relampago"]= function (v, w, f, bol, bono)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
            local char=copiar_tabla(invocaciones_fisicas["murcielago_aliado"])
            add(aliados,char)
            char.x=aliadosPosicion[#aliados].x
            char.y=aliadosPosicion[#aliados].y
            char.ini=char.agi+flr(rnd(20))
            add(Order,char)
        end
end

Efectos["Elemental_de_aire"]= function (v, w, f, bol, bono)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
            local char=copiar_tabla(invocaciones_fisicas["murcielago_aliado"])
            add(aliados,char)
            char.x=aliadosPosicion[#aliados].x
            char.y=aliadosPosicion[#aliados].y
            char.ini=char.agi+flr(rnd(20))
            add(Order,char)
        end
end

Efectos["Elemental_del_bosque"]= function (v, w, f, bol, bono)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
            local char=copiar_tabla(invocaciones_fisicas["murcielago_aliado"])
            add(aliados,char)
            char.x=aliadosPosicion[#aliados].x
            char.y=aliadosPosicion[#aliados].y
            char.ini=char.agi+flr(rnd(20))
            add(Order,char)
        end
end

Efectos["Elemental_de_tierra"]= function (v, w, f, bol, bono)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
            local char=copiar_tabla(invocaciones_fisicas["murcielago_aliado"])
            add(aliados,char)
            char.x=aliadosPosicion[#aliados].x
            char.y=aliadosPosicion[#aliados].y
            char.ini=char.agi+flr(rnd(20))
            add(Order,char)
        end
    end

Efectos["regalo"]= function (v, w, f, bol, bono)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
            local char=copiar_tabla(invocaciones_fisicas["murcielago_aliado"])
            add(aliados,char)
            char.x=aliadosPosicion[#aliados].x
            char.y=aliadosPosicion[#aliados].y
            char.ini=char.agi+flr(rnd(20))
            add(Order,char)
        end
    end

Efectos["roca!!"]= function (v, w, f, bol, bono)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
            local char=copiar_tabla(invocaciones_fisicas["murcielago_aliado"])
            add(aliados,char)
            char.x=aliadosPosicion[#aliados].x
            char.y=aliadosPosicion[#aliados].y
            char.ini=char.agi+flr(rnd(20))
            add(Order,char)
        end
    end

Efectos["fantasma"]= function (v, w, f, bol, bono)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
            local char=copiar_tabla(invocaciones_fisicas["murcielago_aliado"])
            add(aliados,char)
            char.x=aliadosPosicion[#aliados].x
            char.y=aliadosPosicion[#aliados].y
            char.ini=char.agi+flr(rnd(20))
            add(Order,char)
        end
end


Efectos["murcielago"]= function (v, w, f, bol, bono)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
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

Efectos["zombie"]= function (v, w, f, bol, bono)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
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

Efectos["esqueleto"]= function (v, w, f, bol, bono)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
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
Efectos["demonio"]= function (v, w, f, bol, bono)
        if #aliados<3 then
            w.anim_acc="magia"
            w.anim_col={1,1,1,1}
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
Efectos["dia_lluvioso"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
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
Efectos["dia_caluroso"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
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
Efectos["dia_nevado"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
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
Efectos["dia_con_viento"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
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


Efectos["dia_harucanado"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
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
    
Efectos["aliento_de_hielo"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
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
    
Efectos["aliento_de_fuego"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
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


Efectos["auto_destruccion"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
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


Efectos["mega_destruccion"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
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

    



Efectos["condena"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end


Efectos["viento_milagroso"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
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

    
Efectos["ruleta"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
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


        
Efectos["anular"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            v.state={}
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

            
Efectos["1000"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            v.hp_=v.hp_-1000
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["10000"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            v.hp_=v.hp_-10000
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end


Efectos["77777"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            v.hp_=v.hp_-77777
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end


    
Efectos["aliento_toxico"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then


            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["ataque_mental"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"mental"},false )
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["esencia_de_oscuridad"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"oscuridad","magia"},false )
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["explosion"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end


    


Efectos["desintegrar"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["Disminuir_nivel"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["the_end"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
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

    
Efectos["ultima_duplicado"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            DamageProccess(v,w,-((w.pod*27 + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["regeneracion"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        w.state["regeneracion"]={name="regeneracion",id="regeneracion",spr=11,value=w.pod/2,cont=5,ini=5}
    end

Efectos["berserk"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
    end

Efectos["coraza"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
    end
Efectos["barrera"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
    end



Efectos["runa_absorcion"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
    end
-- ninja

Efectos["humo"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
    end

Efectos["imagen"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
    end

Efectos["doble"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
    end


    --elemental dmg


Efectos["elemental_fuego"]= function (v, w, f, bol, bono)
        if acertar(v,w) then
            local left=0
            local right=0
            if w.weapon.left~={} and w.weapon.left~=nil and w.weapon.left.w~=nil --then
                and  w.weapon.left.isCast == true and w.weapon.left.cast=="elemental_fuego" then
                left = w.weapon.left.bw
            end
            if w.weapon.right~={} and w.weapon.right~=nil and w.weapon.right.w~=nil  --then
                and  w.weapon.left.isCast == true and w.weapon.right.cast=="elemental_fuego" then
                right = w.weapon.right.bw
            end
            local mult, crit =  adv_weak_Logic(v,w,{"fuego"},false )
            DamageProccess(v,w,-((flr(w.pod)*0.5 +  flr(mod(w,"pod")*0.5) + left + right)*mult),crit) 
            v.anim_acc="fuego"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)   
        end
end

Efectos["elemental_luz"]= function (v, w, f, bol, bono)
        if acertar(v,w) then
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
        else
            eludido(v)   
        end
end

Efectos["elemental_electrico"]= function (v, w, f, bol, bono)
        if acertar(v,w) then
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
            v.anim_acc="rayo"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)   
        end
end

Efectos["elemental_hielo"]= function (v, w, f, bol, bono)
        if acertar(v,w) then
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
            jump_start(v)
            checks(v)
        else
            eludido(v)   
        end
end

Efectos["elemental_oscuridad"]= function (v, w, f, bol, bono)
        if acertar(v,w) then
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
            jump_start(v)
            checks(v)
        else
            eludido(v)   
        end
end

    -- comandos 

Efectos["Balas_Rapidas"]= function (v, w, f, bol, bono)
        w.anim_acc="ataque_arma"
        w.anim_col={1,1,1,1}
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
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)   
        end
    end

    ---tipos de balas

Efectos["Balas_Potentes"]= function (v, w, f, bol, bono)
        w.anim_acc="ataque_arma"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            --local it2 = getChars("plus",items)
            --it2.cont=it2.cont-1
            local mult, crit =  adv_weak_Logic(v,w,{"fuego",},false )
            DamageProccess(v,w,-((w.dex + (5)+ mod(w,"dex"))*mult),crit) 
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

    ---MIX

Efectos["Ultra_pocion"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end

    Efectos["Ultra_ether"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
    Efectos["Ultra_veneno"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
    Efectos["Ultra_Dormir"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Ultra_paralisis"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Ultra_bomba"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
    Efectos["ultra_elixir"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Ultra_revivir"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Ultra_potencia"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Ultra_evacion"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Ultra_rapidez"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Ultra_defenza"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["panacea_spray"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Pocion_spray"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Ether_spray"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["elixir_spray"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Gas_de_resureccion"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Gas_Venenoso"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Gas_dormir"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Gas_paralisante"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Gas_de_potencia"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Gas_de_evacion"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Gas_de_rapidez"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Gas_de_defenza"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["bomba_fuego"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
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
    Efectos["bomba_electrico"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
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
    Efectos["bomba_Frio"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
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
    Efectos["Bomba_veneno"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
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
    Efectos["Bomba_dormir"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
    Efectos["Mix_Pocion_ether"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
    Efectos["Mix_Panacea_pocion"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end
Efectos["Mix_Panacea_ether"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
        local it1 = getChars("pocion",items)
        local it2 = getChars("plus",items)
        --it1.cont=it1.cont-1
        --it2.cont=it2.cont-1
        local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
        DamageProccess(v,w,((w.pod + (it1.curar*1.1)+ mod(w,"pod"))*mult),crit) 
        jump_start(v)
        checks(v)
    end

Efectos["cancion_de_la_vida"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
    end

Efectos["cancion_de_alegria"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
    end

Efectos["Cancion_de_burla"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
    end

Efectos["cancion_encantadora"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
    end
Efectos["cancion_del_viento"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
    end

Efectos["cuatro_pasos"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
    end
Efectos["baile_de_miradas"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
    end
Efectos["vuelta"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
    end

Efectos["controlar"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
    end

    
Efectos["encantar"]= function (v, w, f, bol, bono)
        w.anim_acc="lanzar"
        w.anim_col={1,1,1,1}
    end

    ---tecnicas de ataques a distancia

Efectos["disparo_preciso"]= function (v, w, f, bol, bono)
        w.anim_acc="ataque_arma"
        w.anim_col={1,1,1,1}
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
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end


Efectos["lluvia_de_flechas"]= function (v, w, f, bol, bono)
        w.anim_acc="ataque_arma"
        w.anim_col={1,1,1,1}
        --w.carga=0
        local left=0
        local right=0
            if w.weapon.left~={} and w.weapon.left.w~=nil  then
                left=flr(rnd(w.weapon.left.w)) + w.weapon.left.bw
            end
            if w.weapon.right~={} and w.weapon.right.w~=nil  then
                right=flr(rnd(w.weapon.right.w)) + w.weapon.right.bw
            end
        for k,i in pairs(Total_enemy)do
            if i.live then
                if acertar(i,w) then  
                        local mult, crit =  adv_weak_Logic(i,w,{"fuego","magia"},false )
                        DamageProccess(i,w,-((w.dex + mod(w,"dex") +left+right)*mult),crit)
                        i.anim_acc="corte"
                        i.anim_col={1,1,1,1}
                        jump_start(v)
                        checks(i)
                else
                    eludido(i)    
                end
            end
        end 
    end


Efectos["patada_rapida"]= function (v, w, f, bol, bono)

end


Efectos["puñetazo_rapido"]= function (v, w, f, bol, bono)

end


Efectos["rodilazo_rapido"]= function (v, w, f, bol, bono)

end

Efectos["Berserk_Attack"]= function (v, w, f, bol, bono)

end

Efectos["Berserk_move"]= function (v, w, f, bol, bono)

end

Efectos["disparo_rapido_shot"]= function (v, w, f, bol, bono)
        w.anim_acc="ataque_arma"
        w.anim_col={1,1,1,1}
            --next_atack="disparo_rapido"
            --count_auto=count_auto+1
            --auto=true
            --auto_obj=v.id
        if acertar(v,w) then
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
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
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


Efectos["disparo_rapido"]= function (v, w, f, bol, bono)
        agregarAccion({"ejecutar_disparo_rapido","disparo_rapido_shot",v,w})
        agregarAccion({"ejecutar_disparo_rapido","disparo_rapido_shot",v,w})
        agregarAccion({"ejecutar_disparo_rapido_final","disparo_rapido_shot",v,w})

end
--- tecnicas berserk
Efectos["desenbocado"]= function (v, w, f, bol, bono)
            w.anim_acc="puñetazos"
            w.anim_col={1,1,1,1}
            FiltrarEnemigoVivos()
            local enemy=flr(rnd(#EnemigosVivos-1)+1)
            local enemy_target=EnemigosVivos[enemy]
            local left=0
            local right=0
            if w.weapon.left~={} and w.weapon.left.w~=nil  then
                left=flr(rnd(w.weapon.left.w)) + w.weapon.left.bw
            end
            if w.weapon.right~={} and w.weapon.right.w~=nil  then
                right=flr(rnd(w.weapon.right.w)) + w.weapon.right.bw
            end
            if acertar(enemy_target,w) then
                local mult, crit =  adv_weak_Logic(enemy_target,w,{"fuego","magia"},false )
                DamageProccess(enemy_target,w,-((w.fue + mod(w,"fue") +left+right)*mult),crit)
                enemy_target.anim_acc="corte"
                enemy_target.anim_col={1,1,1,1}
                jump_start(enemy_target)
                checks(enemy_target)
            else
                eludido(enemy_target)    
            end
    end    

Efectos["incontrolable"]= function (v, w, f, bol, bono)
    agregarAccion({"ejecutar_comando","desenbocado",v,w})
    agregarAccion({"ejecutar_comando","desenbocado",v,w})
    agregarAccion({"ejecutar_comando_final","desenbocado",v,w})
end

    ---bailes
    ---
Efectos["Tres_pasos"]= function (v, w, f, bol, bono)
            w.anim_acc="puñetazos"
            w.anim_col={1,1,1,1}
            local enemy_target=v
            local left=0
            local right=0
            if w.weapon.left~={} and w.weapon.left.w~=nil  then
                left=flr(rnd(w.weapon.left.w)) + w.weapon.left.bw
            end
            if w.weapon.right~={} and w.weapon.right.w~=nil  then
                right=flr(rnd(w.weapon.right.w)) + w.weapon.right.bw
            end
            Msg_debug= "TRES pasos ..... "..enemy_target.id_mons
        
            if acertar(enemy_target,w) then
                local mult, crit =  adv_weak_Logic(enemy_target,w,{"fuego","magia"},false )
                DamageProccess(enemy_target,w,-((w.fue + mod(w,"fue") +left+right)*mult),crit)
                enemy_target.anim_acc="corte"
                enemy_target.anim_col={1,1,1,1}
                jump_start(enemy_target)
                checks(enemy_target)
            else
                eludido(enemy_target)    
            end
    end 


Efectos["alegria"]= function (v, w, f, bol, bono)
            --Que hacia alegria// era un buff
            w.anim_acc="puñetazos"
            w.anim_col={1,1,1,1}
            FiltrarEnemigoVivos()
            local enemy=flr(rnd(#EnemigosVivos-1)+1)
            local enemy_target=EnemigosVivos[enemy]
            local left=0
            local right=0
            if w.weapon.left~={} and w.weapon.left.w~=nil  then
                left=flr(rnd(w.weapon.left.w)) + w.weapon.left.bw
            end
            if w.weapon.right~={} and w.weapon.right.w~=nil  then
                right=flr(rnd(w.weapon.right.w)) + w.weapon.right.bw
            end
            --Msg_debug= " "..enemy_target.id
            if acertar(enemy_target,w) then
            --if false then
                local mult, crit =  adv_weak_Logic(enemy_target,w,{"fuego","magia"},false )
                DamageProccess(enemy_target,w,-((w.fue + mod(w,"fue") +left+right)*mult),crit)
                enemy_target.anim_acc="corte"
                enemy_target.anim_col={1,1,1,1}
                jump_start(enemy_target)
                checks(enemy_target)
            else
                eludido(enemy_target)    
            end
    end 

    --- tecnicas fighter

Efectos["golpe_fuerte"]= function (v, w, f, bol, bono)
        w.anim_acc="ataque_arma"
        w.anim_col={1,1,1,1}
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            local left=0
            local right=0
            if w.weapon.left~={} and w.weapon.left.w~=nil  then
                left=flr(rnd(w.weapon.left.w)) + w.weapon.left.bw
            end
            if w.weapon.right~={} and w.weapon.right.w~=nil  then
                right=flr(rnd(w.weapon.right.w)) + w.weapon.right.bw
            end
            DamageProccess(v,w,-((w.fue + mod(w,"fue") +left+right)*0.8*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end      
    end

Efectos["golpe_cargado"]= function (v, w, f, bol, bono)
        w.anim_acc="ataque_arma"
        w.anim_col={1,1,1,1}
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            local left=0
            local right=0
            if w.weapon.left~={} and w.weapon.left.w~=nil  then
                left = flr(rnd(w.weapon.left.w)) + w.weapon.left.bw
            end
            if w.weapon.right~={} and w.weapon.right.w~=nil  then
                right = flr(rnd(w.weapon.right.w)) + w.weapon.right.bw
            end
            DamageProccess(v,w,-((w.fue + mod(w,"fue") +left+right)*1.5*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end      
    end

    --- Magia General
    --- 
Efectos["marca"]= function (v, w, f, bol, bono) ---completar estado
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        if acertar(v,w)  then
            v.state["marca"]={name="marca",id="marca",spr=18,value=w.pod,val=v.pod,cont=3,ini=5}
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end

Efectos["sangrado"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
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

Efectos["petrificacion"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
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


Efectos["stun"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
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

Efectos["ceguera"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
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
    
Efectos["confundir"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
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
    
Efectos["silencio"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
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
    

Efectos["dormir"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
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

Efectos["confundir_duplicado"]= function (v, w, f, bol, bono)
        name_action="confundir"
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
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
Efectos["aturdir"]= function (v, w, f, bol, bono)
        name_action="aturdir"
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
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

Efectos["muerte"]= function (v, w, f, bol, bono)
        name_action="muerte"
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
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

Efectos["lianas"]= function (v, w, f, bol, bono)
        name_action="lianas"
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"planta","magia"},false )            
            DamageProccess(v,w,-((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["lianas+"]= function (v, w, f, bol, bono)
        name_action="hechizo "..Mg_sel
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertarMod(v,w,6) then
            local mult, crit =  adv_weak_Logic(v,w,{"planta","magia"},false )            
            DamageProccess(v,w,-(((w.pod*5) + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end
    end

Efectos["enredadera"]= function (v, w, f, bol, bono)
        name_action="hechizo "..Mg_sel
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
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

Efectos["fuego"]= function (v, w, f, bol, bono)
        name_action="hechizo "..Mg_sel
        w.anim_acc="magia"
        w.anim_col={1,0,0,1}
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            DamageProccess(v,w,-flr((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="fuego"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["fuego+"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,0,0,1}
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"fuego","magia"},false )
            DamageProccess(v,w,-flr(((w.pod*5) + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="fuego"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end



Efectos["hielo"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,0,1,1}
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"hielo","magia"},false )
            DamageProccess(v,w,-flr((w.pod + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="hielo"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["hielo+"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,0,1,1}
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"hielo","magia"},false )
            DamageProccess(v,w,-flr(((w.pod*5) + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="hielo"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["electro"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,0,1}
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"electricidad","magia"},false )
            DamageProccess(v,w,-flr((w.pod + mod(w,"pod") + flr(rnd(4)))*bono*mult),crit)
            v.anim_acc="rayo"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["electro+"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,0,1}
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"electricidad","magia"},false )
            DamageProccess(v,w,-flr(((w.pod*5)+ mod(w,"pod") + flr(rnd(4)))*bono*mult),crit)
            v.anim_acc="rayo"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["aire"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"corte","fisico","aire","magia"},false )
            DamageProccess(v,w,-flr((w.pod + mod(w,"pod") + flr(rnd(2)) )*bono*mult) ,crit)
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["aire+"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"corte","fisico","aire","magia"},false )
            DamageProccess(v,w,-flr(((w.pod*5) + mod(w,"pod") + flr(rnd(2)) )*bono*mult) ,crit)
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["agua"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,1,1}
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"agua","fisico","contundente","magia"},false )
            DamageProccess(v,w,-flr((w.pod + mod(w,"pod") + flr(rnd(2)) )*bono*mult)  ,crit)
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)            
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["agua+"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,1,1}
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"agua","fisico","contundente","magia"},false )
            DamageProccess(v,w,-flr(((w.pod*5) + mod(w,"pod") + flr(rnd(2)) )*bono*mult)  ,crit)
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)            
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["choque"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"fisico","contundente","aire","magia"},false )
            DamageProccess(v,w,-flr((w.fue + mod(w,"fue") + flr(rnd(2)) + 1)*bono*mult)  ,crit)
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["choque+"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"fisico","contundente","aire","magia"},false )
            DamageProccess(v,w,-flr(((w.fue*5) + mod(w,"fue") + flr(rnd(2)) + 1)*bono*mult)  ,crit)
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["sagrado"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"sagrado","magia"},false )
            DamageProccess(v,w,-flr((w.pod + mod(w,"pod") + flr(rnd(2)) + 1)*bono*mult)  ,crit)
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end
Efectos["sagrado+"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"sagrado","magia"},false )
            DamageProccess(v,w,-flr(((w.pod * 5 )+ mod(w,"pod") + flr(rnd(2)) + 1)*bono*mult)  ,crit)
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end

Efectos["oscuridad"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"oscuridad","aire","magia"},false )
            DamageProccess(v,w,-flr((w.pod + mod(w,"pod") + flr(rnd(2)) + 1)*bono*mult)  ,crit)
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end

Efectos["oscuridad+"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"oscuridad","aire","magia"},false )
            DamageProccess(v,w,-flr(((w.pod*5) + mod(w,"pod") + flr(rnd(2)) + 1)*bono*mult)  ,crit)
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end

Efectos["bio"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"biologico","aire","magia"},false )
            DamageProccess(v,w,-flr((w.pod + mod(w,"pod") + flr(rnd(2)) + 1)*bono*mult)  ,crit)
            v.state["veneno"]={name="veneno",id="veneno",spr=11,value=w.pod/2,cont=5,ini=5}
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end

Efectos["bio+"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,1,1}
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"biologico","aire","magia"},false )
            DamageProccess(v,w,-flr(((w.pod*5) + mod(w,"pod") + flr(rnd(2)) + 1)*bono*mult)  ,crit)
            v.state["veneno"]={name="veneno",id="veneno",spr=11,value=w.pod/2,cont=5,ini=5}
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end 
    end

Efectos["terremoto"]= function (v, w, f, bol, bono)
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



Efectos["gravedad"]= function (v, w, f, bol, bono)
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"gravedad","magia"},false )
            DamageProccess(v,w,-flr(((w.pod*5)  + mod(w,"pod") + flr(rnd(6)))*bono*mult),crit)
            v.anim_acc="magia"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["tornado"]= function (v, w, f, bol, bono)
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



Efectos["meteoro"]= function (v, w, f, bol, bono)
        for k,i in pairs(Total_enemy)do
            if i.live then
                if acertar(i,w) then
                    local mult, crit =  adv_weak_Logic(i,w,{"fuego","magia"},false )
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

    
Efectos["ultima"]= function (v, w, f, bol, bono)
        for k,i in pairs(Total_enemy)do
            if i.live then
                if acertar(i,w) then
                    local mult, crit =  adv_weak_Logic(i,w,{"ultima"},false )
                    DamageProccess(i,w,-flr((w.pod*27 + mod(w,"fue") + flr(rnd(2)) + 1)*bono*mult)  ,crit)
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
    
Efectos["Sw.Fire"]= function (v, w, f, bol, bono)
        w.anim_acc="ataque_arma"
        w.anim_col={1,0,0,1}
        if acertar(v,w) then
            local mult, crit =  adv_weak_Logic(v,w,{"fisico","corte","fuego","magia"},false )
            DamageProccess(v,w,-flr((w.fue + mod(w,"fue") + w.pod + mod(w,"pod") + flr(rnd(6)) + 1 )*bono*mult)  ,crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end
Efectos["Sw.ice"]= function (v, w, f, bol, bono)
        w.anim_acc="ataque_arma"
        w.anim_col={0,0,1,1}
        if acertar(v,w) then
            v.jump=true
            v.jump_time=0
            v.rest=false
            local mult, crit =  adv_weak_Logic(v,w,{"fisico","corte","hielo","magia"},false )
            DamageProccess(v,w,-flr((w.fue + mod(w,"fue") + w.pod + mod(w,"pod") + flr(rnd(6)) + 1 )*bono*mult)  ,crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end
Efectos["Sw.electro"]= function (v, w, f, bol, bono)
        w.anim_acc="ataque_arma"
        w.anim_col={1,1,0,1}
        if acertar(v,w) then
            v.jump=true
            v.jump_time=0
            v.rest=false
            local mult, crit =  adv_weak_Logic(v,w,{"fisico","corte","electricidad","magia"},false )
            DamageProccess(v,w,-flr((w.fue + mod(w,"fue") + w.pod + mod(w,"pod") + flr(rnd(6)) + 1 )*bono*mult)  ,crit)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end   
    end

Efectos["rapido"]= function (v, w, f, bol, bono)
            w.anim_acc="magia"
            w.anim_col={0,1,0,1}    
            v.state["rapido"]={name="rapido",id="rapido",spr=10,value=w.pod,cont=5,ini=5}
            v.ini=v.agi+mod(v,"agi")+flr(rnd(20))
            qsort(Order, function(a,b) return abs(a.ini) > abs(b.ini) end)
            
    end


Efectos["fuerte"]= function (v, w, f, bol, bono)
            w.anim_acc="magia"
            w.anim_col={0,1,0,1}    
            v.state["fuerte"]={name="fuerte",id="fuerte",spr=7,value=w.pod,cont=5,ini=5}
            v.ini=v.agi+mod(v,"agi")+flr(rnd(20))
            qsort(Order, function(a,b) return abs(a.ini) > abs(b.ini) end)
            
    end


    Efectos["preciso"]= function (v, w, f, bol, bono)
            w.anim_acc="magia"
            w.anim_col={0,1,0,1}    
            v.state["preciso"]={name="preciso",id="preciso",spr=18,value=w.pod,cont=5,ini=5}
            v.ini=v.agi+mod(v,"agi")+flr(rnd(20))
            qsort(Order, function(a,b) return abs(a.ini) > abs(b.ini) end)
            
    end


        Efectos["debil"]= function (v, w, f, bol, bono)
            w.anim_acc="magia"
            w.anim_col={0,1,0,1}    
            v.state["debil"]={name="debil",id="debil",spr=33,value=w.pod,cont=5,ini=5}
            v.ini=v.agi+mod(v,"agi")+flr(rnd(20))
            qsort(Order, function(a,b) return abs(a.ini) > abs(b.ini) end)
            
    end


            Efectos["fortificado"]= function (v, w, f, bol, bono)
            w.anim_acc="magia"
            w.anim_col={0,1,0,1}    
            v.state["fortificado"]={name="fortificado",id="fortificado",spr=31,value=w.pod,cont=5,ini=5}
            v.ini=v.agi+mod(v,"agi")+flr(rnd(20))
            qsort(Order, function(a,b) return abs(a.ini) > abs(b.ini) end)
            
    end

    Efectos["vulnerable"]= function (v, w, f, bol, bono)
            w.anim_acc="magia"
            w.anim_col={0,1,0,1}    
            v.state["vulnerable"]={name="vulnerable",id="vulnerable",spr=30,value=w.pod,cont=5,ini=5}
            v.ini=v.agi+mod(v,"agi")+flr(rnd(20))
            qsort(Order, function(a,b) return abs(a.ini) > abs(b.ini) end)
            
    end


Efectos["lento"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
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

Efectos["paralisis"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={1,1,0,1}
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

Efectos["suerte"]= function (v, w, f, bol, bono)
    Actual.anim_acc="magia"
    Actual.anim_col={1,1,1,1}
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

    


Efectos["congelar"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,0,1,1}
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

Efectos["veneno"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}

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

Efectos["recuperacion"]= function (v, w, f, bol, bono)




        DamageProccess(w,w,((w.con + flr(rnd(6)) + 1)) ,"")
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        --w.anim_acc="magia"
        --w.anim_col={1,1,1,1}

        --jump_start(v)
        --checks(v)
        --v.anim_acc="corte"
        --v.anim_col={1,1,1,1}
    end




Efectos["robar"]= function (v, w, f, bol, bono)
        if #v.items~=nil then
            w.anim_acc="magia"
            w.anim_col={0,1,0,1}

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


Efectos["quitar"]= function (v, w, f, bol, bono)
    if #v.items~=nil then
        Actual.anim_acc="ataque_arma"
        Actual.anim_col={1,1,1,1}

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





Efectos["Furia"]= function (v, w, f, bol, bono)
        Actual.anim_acc="ataque_arma"
    Actual.anim_col={1,1,1,1}
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
Efectos["Geo"]= function (v, w, f, bol, bono)
    Actual.anim_acc="magia"
    Actual.anim_col={1,1,1,1}
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

Efectos["Slash"]= function (v, w, f, bol, bono)
    Actual.anim_acc="ataque_arma"
    Actual.anim_col={1,1,1,1}
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

Efectos["Lanzar"]= function (v, w, f, bol, bono)
    Actual.anim_acc="ataque_arma"
    Actual.anim_col={1,1,1,1}
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

Efectos["Capturar"]= function (v, w, f, bol, bono)
    if listaCaptura[v.id_mons]~=nil then
        if v.hp_ <= v.hp*0.3 then
            Actual.anim_acc="magia"
            Actual.anim_col={1,1,1,1}
            v.hp_=0
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


Efectos["Suerte"]= function (v, w, f, bol, bono)
    Actual.anim_acc="magia"
    Actual.anim_col={1,1,1,1}
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

Efectos["morph"]= function (v, w, f, bol, bono)


end


Efectos["dual_M."]= function (v, w, f, bol, bono)
        Actual.anim_acc="magia"
    Actual.anim_col={1,1,1,1}
    Actual.avanzar=true
    Actual.rest=false


end

Efectos["extra_M."]= function (v, w, f, bol, bono)
    Actual.anim_acc="magia"
    Actual.anim_col={1,1,1,1}
    Actual.avanzar=true
    Actual.rest=false
    Actual.flee_magic=1
    continuar_turno=true
    
end

Efectos["potenciar_M."]= function (v, w, f, bol, bono)
    Actual.anim_acc="magia"
    Actual.anim_col={1,1,1,1}
    Actual.avanzar=true
    Actual.rest=false

    Actual.potenciar_spell=true
    Actual.aumentar_spell = 1


end

Efectos["expandir_M."]= function (v, w, f, bol, bono)
    Actual.anim_acc="magia"
    Actual.anim_col={1,1,1,1}
    Actual.avanzar=true
    Actual.rest=false

    Actual.potenciar_spell=true
    Actual.aumentar_spell = Number_sel

end

Efectos["cargar"]= function (v, w, f, bol, bono)
    Actual.anim_acc="ataque_arma"
    Actual.anim_col={1,1,1,1}

    Actual.carga=1
    wait_start()
    b_dmg_txt=true
    Actual.lastDmgC="W"
    Actual.slDmg=true    
    Actual.lastDmgM="carga"
    Actual.typeMsg=true

    ejecutarArma(v)
    checks(v)
end



Efectos["curar"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        local mult, crit =  adv_weak_Logic(v,w,{"curar"},false )
        if v.weak["curar"] ~= nil then
            mult=-1
        end
        DamageProccess(v,Actual,((Actual.pod + flr(rnd(6)) + 1)*mult) ,crit)
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
    end
Efectos["revivir"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        v.hp_=10
        v.live=true
        v.state={}
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
    end
Efectos["sanar"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        v.state={}
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
    end
Efectos["disipar"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}
        v.state={}
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
    end
    --MP hp
Efectos["drenar"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}

        v.state={}
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
    end
Efectos["absorber"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}

        v.state={}
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
    end
Efectos["vampiro"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}

        v.state={}
        v.anim_acc="magia"
        v.anim_col={1,1,1,1}
    end
    -- espacio
Efectos["teleport"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}

        v.state={}
        
    end

    Efectos["exiliar"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}

        v.state={}
    end

    Efectos["portal"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}

        v.state={}
    end

    Efectos["expulsar"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}

        v.state={}
    end

Efectos["volar"]= function (v, w, f, bol, bono)
        w.anim_acc="magia"
        w.anim_col={0,1,0,1}

        v.state={}
    end


Efectos["analizar"]= function (v, w, f, bol, bono) --libra
    --- llenar
end

---objetos
--V objetivo f objetos
Efectos["pocion_item"]= function (v, w, f, bol, bono)
    local mult, crit
        if f.cont> 0 then 
            if v.hp_>0 then
                f.cont=f.cont-1
                local mult, crit =  adv_weak_Logic(v,w,{"curar"},false )
                if bol then DamageProccess(v,w,(f.curar*1.5*mult),crit)
                else DamageProccess(v,w,(f.curar*mult),crit) end
            end
        else
            Cancel_ejecutar=true    
        end
end

Efectos["revivir_item"]= function (v, w, f, bol, bono)
    local mult, crit
        if f.cont> 0 then 
            if v.hp_<0 then
                f.cont=f.cont-1
                local mult, crit =  adv_weak_Logic(v,w,{"curar"},false )
                v.hp_=0
                if bol then DamageProccess(v,w,(f.curar*1.5*mult),crit)
                else DamageProccess(v,w,(f.curar*1*mult),crit) end
            end
        else
            Cancel_ejecutar=true    
        end
end

Efectos["sanar_item"]= function (v, w, f, bol, bono)
    local mult, crit
        if f.cont> 0 then 
            if v.hp_<0 then
                f.cont=f.cont-1
                local mult, crit =  adv_weak_Logic(v,w,{"curar"},false )
                if bol then DamageProccess(v,w,(f.curar*1.5*mult),crit)
                else DamageProccess(v,w,(f.curar*mult),crit) end
            end
        else
            Cancel_ejecutar=true    
        end
end

Efectos["ether_item"]= function (v, w, f, bol, bono)
    local mult, crit
        if f.cont> 0 then 
            if v.hp_>0 then
                f.cont=f.cont-1
                if v.mp_ < 0 then v.mp_=0 end
                if bol then v.mp_= v.mp_ + (f.curar*1.5)
                else v.mp_= v.mp_ + f.curar end
                v.lastDmg=f.curar
                v.lastDmgM=f.curar
                v.lastDmgC="Y" 
            end
        else
            Cancel_ejecutar=true    
        end
end

Efectos["bomba_item"]= function (v, w, f, bol, bono)
        if f.cont > 0 then
            f.cont=f.cont-1
            if acertar(v, w) then
                v.jump=true
                v.jump_time=0
                v.rest=false
                local str=f.id
                local mult, crit =  adv_weak_Logic(v,w,{"fuego"},false )
                if bol then DamageProccess(v,w,-(f.attack*mult),crit)
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


Efectos["roca_item"]= function (v, w, f, bol, bono)
        if f.cont > 0 then
            f.cont=f.cont-1
            if acertar(v, w) then
                v.jump=true
                v.jump_time=0
                v.rest=false
                local str=f.id
                --mult, crit =  adv_weak_Logic(v,w,{"fuego"},false )
                if bol then DamageProccess(v,w,-(rndp(f.attack)*1.5*mult),crit)
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


Efectos["libro"]= function (v, w, f, bol, bono)
        if f.cont > 0 then
            f.cont=f.cont-1
            for k,h in pairs(f.add) do
                Debug_temp="n "..h.name
                add(v.mg,h)
            end
        else
            Cancel_ejecutar=true    
        end
end  

Efectos["libro_fuego"]= function (v, w, f, bol, bono)

    Efectos["libro"](v, w,f,bol,bono)

end  








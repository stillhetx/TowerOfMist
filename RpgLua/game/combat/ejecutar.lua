

-- Ejecutar Magia

function magic_list()
    for k,v in pairs(Order) do
        if Dirr=="e" then
            if v.id == Sel_e then
                ejecutarMagia(Mg_sel,v, Order)
                checks(v) 
            end
        end 
        if Dirr=="a" then
            v={}
            ejecutarMagia(Mg_sel,v, Order)
            --checks(v) 
        end
        if Dirr=="c" then
            if v.id == Sel_c then
                ejecutarMagia(Mg_sel,v, Order)
                checks(v)   
            end
        end     
    end   
end

function items_list(bol)
    for k,v in pairs(Order) do
        if Dirr=="e" then
            if v.id == Sel_e then
                for d,f in pairs(items) do
                    if f.id==Sel_i then
                        ejecutarObjeto(v,f,bol)
                    end    
                end
                checks(v)    
            end    
        end
        if Dirr=="c" then
            if v.id == Sel_c then
                for d,f in pairs(items) do
                    if f.id==Sel_i then
                        ejecutarObjeto(v,f,bol)
                    end    
                end
                checks(v)    
            end 
        end
        if Dirr=="d" then
            if v.id == Sel_c then
                for d,f in pairs(items) do
                    if f.id==Sel_i then
                        ejecutarObjeto(v,f,bol)
                    end    
                end
                checks(v)
                restablecer(v)    
            end 
        end
    end
end

function ejecutar_ataque_basico(v,str)
    --Debug_temp=Debug_temp.." "..str.." "
    Actual.carga=1
    if v~= nil and v~={} then
        if isDesarmado()  then
            ejecutar_ataque_desarmado(v)
            checks(v)
            --Msg_debug="Desarmado"
        else
            if str =="left" then
                if isLeft() then
                    --Msg_debug="Left hand"
                    --Debug_temp=Debug_temp.."L"
                    ejecutar_ataque_a(v)
                    checks(v)  
                end
            else
                if isRight() then
                    --Debug_temp=Debug_temp.."R"
                    ejecutar_ataque_b(v)
                    checks(v)  
                end
                
            end
        end 
    end
end    


function ejecutar_ataque_basico_ejecutor(v,e, str)
    if v~= nil and v~={} then
        if isDesarmadoEquipo(e)  then
            ejecutar_ataque_desarmado_ejecutor(v,e)
            checks(v)
        else
            if str =="left" then
                if isLeftEquip(e) then
                    ejecutar_ataque_a_ejecutor(v,e)
                    checks(v)  
                end
            else
                if isRightEquip(e) then
                    ejecutar_ataque_b_ejecutor(v,e)
                    checks(v)  
                end
            end
        end 
    end
end   





function ejecutar_ataque_desarmado(v)
        Actual.avanzar=true
        Actual.rest=false
        Actual.anim_acc="puñetazos"
        Actual.anim_col={1,1,1,1}
        if acertar(v,Actual) then
            local crit=""
            local mult=1
            mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
            DamageProccess(v,Actual,-flr((Actual.fue+Actual.con)*mult*1.5),crit)
            jump_start(v)
            v.anim_acc="golpe"
            v.anim_col={1,1,1,1}
        else
            eludido(v)    
        end   
end

function ejecutar_ataque_desarmado_ejecutor(v,e)
        e.avanzar=true
        e.rest=false
        e.anim_acc="puñetazos"
        e.anim_col={1,1,1,1}
        if acertar(v,e) then
            local crit=""
            local mult=1
            mult, crit =  adv_weak_Logic(v,e,{"volar"},true )
            DamageProccess(v,e,-flr((e.fue+e.con)*mult*1.5),crit)
            jump_start(v)
            v.anim_acc="golpe"
            v.anim_col={1,1,1,1}
        else
            eludido(v)    
        end   
end

function ejecutar_ataque_a_ejecutor(v,e)
    if v~=nil and v~={} then
            if e.weapon.left.smodo~=nil and e.weapon.left.smodo== "white" then
                e.avanzar=true
                e.rest=false
                e.anim_acc="ataque_arma"
                e.anim_col={1,1,1,1}    
                if acertar(v,e) then
                    local crit=""
                    local mult=1
                    local attt=0
                    attt=attt+flr((e.fue + flr(rnd(e.weapon.left.w)) + e.weapon.left.bw)*mult) 
                    mult, crit =  adv_weak_Logic(v,e,{"volar"},true )
                    DamageProccess(v,e,-attt,crit)
                    jump_start(v)
                    v.anim_acc="corte"
                    v.anim_col={1,1,1,1}
                else
                    eludido(v)    
                end               
            elseif e.weapon.left.smodo~=nil and e.weapon.left.smodo== "fire" then
                e.avanzar=true
                e.rest=false
                e.anim_acc="ataque_arma"
                e.anim_col={1,1,1,1}    
                if acertar(v,e) then
                    local crit=""
                    local mult=1
                    local attt=0
                    attt=attt+flr((e.dex + flr(rnd(e.weapon.left.w)) + e.weapon.left.bw)*mult)
                    mult, crit =  adv_weak_Logic(v,e,{"volar"},true )
                    DamageProccess(v,e,-attt,crit)
                    jump_start(v)
                    v.anim_acc="corte"
                    v.anim_col={1,1,1,1}
                else
                    eludido(v)    
                end   
            elseif e.weapon.left.smodo~=nil and e.weapon.left.smodo== "hand" then
                e.avanzar=true
                e.rest=false
                e.anim_acc="puñetazos"
                e.anim_col={1,1,1,1}
                if acertar(v,e) then
                    v.jump=true
                    v.jump_time=0
                    v.rest=false
                    local crit=""
                    local mult=1 
                    mult, crit =  adv_weak_Logic(v,e,{"volar"},true )
                    DamageProccess(v,e,-flr(((e.fue*2) + flr(rnd(e.weapon.left.w)) + e.weapon.left.bw)*mult),crit)
                    jump_start(v)
                    v.anim_acc="puñetazos"
                    v.anim_col={1,1,1,1}
                else
                    eludido(v)    
                end 
            else
                if not isHasWeapon then
                    ejecutar_ataque_desarmado(v)  
                end
            end  
    end
end

function ejecutar_ataque_b_ejecutor(v,e)
            if e.weapon.right.smodo== "white" then
                e.avanzar=true
                e.rest=false
                e.anim_acc="ataque_arma"
                e.anim_col={1,1,1,1}    
                if acertar(v,e) then
                    local crit=""
                    local mult=1
                    local attt=0
                    attt=attt+flr((e.fue + flr(rnd(e.weapon.right.w)) + e.weapon.right.bw)*mult)
                    mult, crit =  adv_weak_Logic(v,e,{"volar"},true )
                    DamageProccess(v,e,-attt,crit)
                    jump_start(v)
                    v.anim_acc="corte"
                    v.anim_col={1,1,1,1}
                else
                    eludido(v)    
                end   
            elseif e.weapon.right.smodo== "fire" then
                e.avanzar=true
                e.rest=false
                e.anim_acc="ataque_arma"
                e.anim_col={1,1,1,1}    
                if acertar(v,e) then
                    local crit=""
                    local mult=1
                    local attt=0
                    attt=attt+flr((e.dex + flr(rnd(e.weapon.right.w)) + e.weapon.right.bw)*mult)  
                    mult, crit =  adv_weak_Logic(v,e,{"volar"},true )
                    DamageProccess(v,e,-attt,crit)
                    jump_start(v)
                    v.anim_acc="corte"
                    v.anim_col={1,1,1,1}
                else
                    eludido(v)    
                end   
            elseif e.weapon.right.smodo== "fist" then
                e.avanzar=true
                e.rest=false
                e.anim_acc="puñetazos"
                e.anim_col={1,1,1,1}
                if acertar(v,e) then
                    v.jump=true
                    v.jump_time=0
                    v.rest=false
                    local crit=""
                    local mult=1 
                    mult, crit =  adv_weak_Logic(v,e,{"volar"},true )
                    DamageProccess(v,e,-flr(((e.fue*2) + flr(rnd(e.weapon.right.w)) + e.weapon.right.bw)*mult),crit)
                    jump_start(v)
                    v.anim_acc="puñetazos"
                    v.anim_col={1,1,1,1}
                else
                    eludido(v)    
                end 
            else
                if not isHasWeapon then
                    ejecutar_ataque_desarmado(v)  
                end
            end          

end   




function ejecutar_ataque_a(v)
    if v~=nil and v~={} then
            if Actual.weapon.left.smodo== "white" then
                Actual.avanzar=true
                Actual.rest=false
                Actual.anim_acc="ataque_arma"
                Actual.anim_col={1,1,1,1}    
                if acertar(v,Actual) then
                    local crit=""
                    local mult=1
                    local calidad=bono_calidad(Actual.weapon.left,Actual)
                    local attt=0
                    attt=attt+flr((Actual.fue + flr(rnd(Actual.weapon.left.w)) + Actual.weapon.left.bw+calidad)*mult)
                    mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
                    DamageProccess(v,Actual,-attt,crit)
                    jump_start(v)
                    v.anim_acc="corte"
                    v.anim_col={1,1,1,1}
                else
                    eludido(v)    
                end               
            elseif Actual.weapon.left.smodo== "fire" then
                Actual.avanzar=true
                Actual.rest=false
                Actual.anim_acc="ataque_arma"
                Actual.anim_col={1,1,1,1}    
                if acertar(v,Actual) then
                    local crit=""
                    local mult=1
                    local calidad=bono_calidad(Actual.weapon.left,Actual)
                    local attt=0
                    attt=attt+flr((Actual.dex + flr(rnd(Actual.weapon.left.w)) + Actual.weapon.left.bw+calidad)*mult)
                    mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
                    DamageProccess(v,Actual,-attt,crit)
                    jump_start(v)
                    v.anim_acc="corte"
                    v.anim_col={1,1,1,1}
                else
                    eludido(v)    
                end   
            elseif Actual.weapon.left.smodo== "fist" then
                --Debug_temp=Debug_temp.." Fist"
                Actual.avanzar=true
                Actual.rest=false
                Actual.anim_acc="puñetazos"
                Actual.anim_col={1,1,1,1}
                if acertar(v,Actual) then
                    local crit=""
                    local mult=1 
                    local calidad=bono_calidad(Actual.weapon.left,Actual)
                    mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
                    DamageProccess(v,Actual,-flr(((Actual.fue*2) + flr(rnd(Actual.weapon.left.w)) + Actual.weapon.left.bw+calidad)*mult),crit)
                    jump_start(v)
                    v.anim_acc="puñetazos"
                    v.anim_col={1,1,1,1}
                else
                    eludido(v)    
                end 
            else
                if Actual.weapon.right.smodo== "fist" then
                    Actual.avanzar=true
                    Actual.rest=false
                    Actual.anim_acc="puñetazos"
                    Actual.anim_col={1,1,1,1}
                    if acertar(v,Actual) then
                        local crit=""
                        local mult=1 
                        local calidad=bono_calidad(Actual.weapon.left,Actual)
                        mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
                        DamageProccess(v,Actual,-flr(((Actual.fue*2) + flr(rnd(Actual.weapon.left.w)) + Actual.weapon.left.bw+calidad)*mult),crit)
                        jump_start(v)
                        v.anim_acc="puñetazos"
                        v.anim_col={1,1,1,1}
                    else
                        eludido(v)    
                    end                    
                end
                --if not isHasWeapon then
                    --ejecutar_ataque_desarmado(v)  
                --end
            end
            --Msg_debug=Msg_debug.." "..Actual.weapon.left.smodo
    end
end    

function ejecutar_ataque_c(v)
    if Actual.weapon_3.smodo== "white" then
        Actual.avanzar=true
        Actual.rest=false
        Actual.anim_acc="ataque_arma"
        Actual.anim_col={1,1,1,1}    
        if acertar(v,Actual) then
            local crit=""
            local mult=1
            local calidad=bono_calidad(Actual.weapon_3,Actual)
            local attt=0
            attt=attt+flr((Actual.fue + flr(rnd(Actual.weapon_3.w)) + Actual.weapon_3.bw+calidad)*mult)
            mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
            DamageProccess(v,Actual,-attt,crit)
            jump_start(v)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
            else
                eludido(v)    
            end   
    elseif Actual.weapon_3.smodo== "fire" then
        Actual.avanzar=true
        Actual.rest=false
        Actual.anim_acc="ataque_arma"
        Actual.anim_col={1,1,1,1}    
        if acertar(v,Actual) then
            local crit=""
            local mult=1
            local calidad=bono_calidad(Actual.weapon_3,Actual)
            local attt=0
            attt=attt+flr((Actual.dex + flr(rnd(Actual.weapon_3.w)) + Actual.weapon_3.bw+calidad)*mult)  
            mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
            DamageProccess(v,Actual,-attt,crit)
            jump_start(v)
            v.anim_acc="corte"
            v.anim_col={1,1,1,1}
        else
            eludido(v)    
        end   
    elseif Actual.weapon_3.smodo== "fist" then
        Actual.avanzar=true
        Actual.rest=false
        Actual.anim_acc="puñetazos"
        Actual.anim_col={1,1,1,1}
        if acertar(v,Actual) then
            --v.jump=true
            --v.jump_time=0
            --v.rest=false
            local crit=""
            local mult=1 
            local calidad=bono_calidad(Actual.weapon_3,Actual)
            mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
            DamageProccess(v,Actual,-flr(((Actual.fue*2) + flr(rnd(Actual.weapon_3.w)) + Actual.weapon_3.bw+calidad)*mult),crit)
            jump_start(v)
            v.anim_acc="puñetazos"
            v.anim_col={1,1,1,1}
        else
            eludido(v)    
        end 
    else
        --if not isHasWeapon then
            --ejecutar_ataque_desarmado(v)  
        --end
    end          

end

function ejecutar_ataque_b(v)
            --Debug_temp=Debug_temp.." "..Actual.weapon.right.smodo
            if Actual.weapon.right.smodo== "white" then
                Actual.avanzar=true
                Actual.rest=false
                Actual.anim_acc="ataque_arma"
                Actual.anim_col={1,1,1,1}    
                if acertar(v,Actual) then
                    local crit=""
                    local mult=1
                    local calidad=bono_calidad(Actual.weapon.right,Actual)
                    local attt=0
                    attt=attt+flr((Actual.fue + flr(rnd(Actual.weapon.right.w)) + Actual.weapon.right.bw+calidad)*mult)
                    mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
                    DamageProccess(v,Actual,-attt,crit)
                    jump_start(v)
                    v.anim_acc="corte"
                    v.anim_col={1,1,1,1}
                else
                    eludido(v)    
                end   
            elseif Actual.weapon.right.smodo== "fire" then
                Actual.avanzar=true
                Actual.rest=false
                Actual.anim_acc="ataque_arma"
                Actual.anim_col={1,1,1,1}    
                if acertar(v,Actual) then
                    local crit=""
                    local mult=1
                    local calidad=bono_calidad(Actual.weapon.right,Actual)
                    local attt=0
                    attt=attt+flr((Actual.dex + flr(rnd(Actual.weapon.right.w)) + Actual.weapon.right.bw+calidad)*mult)  
                    mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
                    DamageProccess(v,Actual,-attt,crit)
                    jump_start(v)
                    v.anim_acc="corte"
                    v.anim_col={1,1,1,1}
                else
                    eludido(v)    
                end   
            elseif Actual.weapon.right.smodo== "fist" then
                Actual.avanzar=true
                Actual.rest=false
                Actual.anim_acc="puñetazos"
                Actual.anim_col={1,1,1,1}
                if acertar(v,Actual) then
                    local crit=""
                    local mult=1 
                    local calidad=bono_calidad(Actual.weapon.right,Actual)
                    mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
                    DamageProccess(v,Actual,-flr(((Actual.fue*2) + flr(rnd(Actual.weapon.right.w)) + Actual.weapon.right.bw+calidad)*mult),crit)
                    jump_start(v)
                    v.anim_acc="puñetazos"
                    v.anim_col={1,1,1,1}
                else
                    eludido(v)    
                end 
            else
                if Actual.weapon.left.smodo== "fist" then
                    Actual.avanzar=true
                    Actual.rest=false
                    Actual.anim_acc="puñetazos"
                    Actual.anim_col={1,1,1,1}
                    if acertar(v,Actual) then
                        local crit=""
                        local mult=1 
                        local calidad=bono_calidad(Actual.weapon.left,Actual)
                        mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
                        DamageProccess(v,Actual,-flr(((Actual.fue*2) + flr(rnd(Actual.weapon.left.w)) + Actual.weapon.left.bw+calidad)*mult),crit)
                        jump_start(v)
                        v.anim_acc="puñetazos"
                        v.anim_col={1,1,1,1}
                    else
                        eludido(v)    
                    end                    
                end
                --if not isHasWeapon  then                    
                    --ejecutar_ataque_desarmado(v)  
                --end
            end     
            --Msg_debug=Msg_debug.." "..Actual.weapon.left.smodo
end   

function ejecutarArma(v)
    Actual.anim_acc="ataque_arma"
    Actual.anim_col={1,1,1,1}
    Actual.avanzar=true
    Actual.rest=false
    if Actual.weapon.left == nil then
        Actual.anim_acc="puñetazos"
        Actual.anim_col={1,1,1,1}
        if acertar(v,Actual) then
            local crit=""
            local mult=1
            mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
            DamageProccess(v,Actual,-flr((Actual.fue+Actual.con)*mult*1.5),crit)
            jump_start(v)
            v.anim_acc="golpe"
            v.anim_col={1,1,1,1}
        else
            eludido(v)    
        end    
    else
        if Actual.weapon.left.modo == "2h" then
            if Actual.weapon.left.smodo == "fist" then
                Actual.anim_acc="puñetazos"
                Actual.anim_col={1,1,1,1}
                if acertar(v,Actual) then
                    local crit=""
                    local mult=1
                    mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
                    DamageProccess(v,Actual,-flr((Actual.con + flr(rnd(Actual.weapon.left.w)) + Actual.weapon.left.bw)*2*mult),crit)
                    jump_start(v)
                    v.anim_acc="corte"
                    v.anim_col={1,1,1,1}
                else
                    eludido(v)    
                end   
            else
                Actual.anim_acc="ataque_arma"
                Actual.anim_col={1,1,1,1}    
                if acertar(v,Actual) then
                    local crit=""
                    local mult=1
                    mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
                    DamageProccess(v,Actual,-flr((Actual.fue + flr(rnd(Actual.weapon.left.w)) + Actual.weapon.left.bw)*1.8*mult),crit)
                    jump_start(v)
                    v.anim_acc="corte"
                    v.anim_col={1,1,1,1}
                else
                    eludido(v)    
                end   
            end        
        end
        if Actual.weapon.left.modo == "1h" then
            if Actual.weapon.left.smodo== "white" then
                Actual.anim_acc="ataque_arma"
                Actual.anim_col={1,1,1,1}    
                if acertar(v,Actual) then
                    local crit=""
                    local mult=1
                    local attt=0
                    attt=attt+flr((Actual.fue + flr(rnd(Actual.weapon.left.w)) + Actual.weapon.left.bw)*mult)
                    if Actual.weapon.right ~= nil and Actual.weapon.right.sh==false then
                        attt=attt+flr((flr(rnd(Actual.weapon.right.w)) + Actual.weapon.right.bw)*mult)
                    end    
                    mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
                    DamageProccess(v,Actual,-attt,crit)
                    jump_start(v)
                    v.anim_acc="corte"
                    v.anim_col={1,1,1,1}
                else
                    eludido(v)    
                end   
            end
            if Actual.weapon.left.smodo== "fire" then
                Actual.anim_acc="ataque_arma"
                Actual.anim_col={1,1,1,1}    
                if acertar(v,Actual) then
                    local crit=""
                    local mult=1
                    local attt=0
                    attt=attt+flr((Actual.dex + flr(rnd(Actual.weapon.left.w)) + Actual.weapon.left.bw)*mult)
                    if Actual.weapon.right ~= nil and Actual.weapon.right.sh==false then
                        attt=attt+flr((flr(rnd(Actual.weapon.right.w)) + Actual.weapon.right.bw)*mult)
                    end    
                    mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
                    DamageProccess(v,Actual,-attt,crit)
                    jump_start(v)
                    v.anim_acc="corte"
                    v.anim_col={1,1,1,1}
                else
                    eludido(v)    
                end   
            end
            if Actual.weapon.left.smodo== "hand" then
                Actual.anim_acc="puñetazos"
                Actual.anim_col={1,1,1,1}
                if acertar(v,Actual) then
                    v.jump=true
                    v.jump_time=0
                    v.rest=false
                    local crit=""
                    local mult=1 
                    mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
                    DamageProccess(v,Actual,-flr(((Actual.fue*2) + flr(rnd(Actual.weapon.left.w)) + Actual.weapon.left.bw)*mult),crit)
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



function ejecutar_asesinar(v) --deprecar
    Mg_sel="asesinar"
    ejecutarMagia("asesinar",v, Order)
end    

function ejecutar_capturar(v) --deprecar
    --msg_debug=v.id_mons
    --Mejorar las probabilidades
    if listaCaptura[v.id_mons]~=nil then
        if v.hp_ <= v.hp*0.8 then
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


function ejecutarComando(sel,v)


   -- Comandos[sel](v, Actual,{},false,bono)

end

function ejecutarMagia(sel, v, Order)
    local sel = sel or ""
    local v = v or {}

    if(v~={} and sel~="")then

        Actual.avanzar=true
        Actual.attack=true
        Actual.rest=false
        
        local mult=1 --Deprecado
        local c="V" --Deprecado
        local crit="" --Deprecado

        if  v ~= {}   then
            if v.lastDmg~=nil then
                v.lastDmg=0
            end
            v.slDmg=true
        end

        local bono=1
        
        local bonoMagCharge= Actual.seeMagicCharge
        if bonoMagCharge then bono = bono+(Actual.magicCharge*0.25)+(Buton_bonus*0.25) end


        b_dmg_txt=true
        --Msg_debug=" "..v.name
        
        Name_action=sel

        local foo=Efectos[sel](v, Actual,{},false,bono)

        if pcall(foo) then
            --exitoso
        else
            ERROR_MSG="ERROR AL EJECUTAR EFECTO"
        end
    else
        Name_action="No ejecutado"    
    end
    --Actual.hide=false
end    


function ejecutarMagiaExtra(sel, v, Order,str)
    Actual.avanzar=true
    Actual.attack=true
    Actual.rest=false
    
    local mult=1 --Deprecado
    local c="V" --Deprecado
    local crit="" --Deprecado

    if  v ~= {}   then
        v.lastDmg=0    
        v.slDmg=true
    end

    local bono=1
    
    local bonoMagCharge= Actual.seeMagicCharge
    if bonoMagCharge then bono=bono+(Actual.magicCharge*0.25)+(Buton_bonus*0.25) end


    b_dmg_txt=true
    --Msg_debug=" "..v.name
    
    Name_action=sel

    Efectos[sel](v, Actual,str)

    Actual.hide=false
end


function ejecutarMagiaExtra(sel, v, Order,extra)
    Actual.avanzar=true
    Actual.attack=true
    Actual.rest=false
    

    if  v ~= {}  then
        v.lastDmg=0    
        v.slDmg=true
    end

    local bono=1
    
    local bonoMagCharge= Actual.seeMagicCharge
    if bonoMagCharge then bono=bono+(Actual.magicCharge*0.25)+(Buton_bonus*0.25) end


    b_dmg_txt=true
    
    Name_action="hechizo "..sel

    Efectos[sel](v, Actual,extra,false,bono)

    Actual.hide=false
end    

function EjecutarItem(objetivo, lanzador, objeto)
        --Debug_temp=objetivo.name
        --Debug_temp=lanzador.name
        --Debug_temp=objeto.id
        Efectos[objeto.id](objetivo, lanzador,objeto,false,1)
end

function ejecutarObjeto(v,f,bol)
    Actual.anim_acc="lanzar"
    Actual.anim_col={1,1,1,1}
    Actual.avanzar=true
    Actual.rest=false
    local potenciado=bol
    local mult=1
    local c="V"
    local crit="" 
    v.lastDmg=0   
    v.slDmg=true

    Efectos[Sel_i](v, Actual,f,bol,1)

end    





function ejecutar_quitar() --deprecar
        Actual.anim_acc="ataque_arma"
        Actual.anim_col={1,1,1,1}
        for k,w in pairs(Order) do
            if w.id == Sel_e then
                    local sl=flr(rnd(#w.items-1)+1)
                    local name=w.items[sl]
                    for n,m in pairs(items) do
                        if name==m.name then
                            m.cont=m.cont+1
                        end    
                    end

                    if acertar(w,Actual) then
                        local crit=""
                        local mult=1
                        mult, crit =  adv_weak_Logic(w,Actual,{"volar"},true )
                        DamageProccess(w,Actual,-flr((Actual.fue + flr(rnd(Actual.weapon.left.w)) + Actual.weapon.left.bw)*0.8*mult),crit)
                        checks(w)
                        for n,m in pairs(items) do
                            if name==m.name then
                                m.cont=m.cont+1
                            end    
                        end
                        w.slDmg=true    
                        w.lastDmgM=w.lastDmgM.." "..name.." robado"
                        w.typeMsg=true
                    else
                        eludido(w)    
                    end
            end                
    end
end  

function ejecutar_cargar() --deprecar
    Actual.anim_acc="ataque_arma"
    Actual.anim_col={1,1,1,1}

    Actual.carga=1
    wait_start()
    b_dmg_txt=true
    Actual.lastDmgC="W"
    Actual.slDmg=true    
    Actual.lastDmgM="carga"
    Actual.typeMsg=true

    local t = getChars(Sel_e,Total_enemy)
    ejecutarArma(t)
    checks(t)
end

function ejecutar_tecnica()
        for k,v in pairs(Order) do
        if Dirr=="e" then
            if v.id == Sel_e then
                ejecutarMagia(Mg_sel,v, Order)
                checks(v) 
            end
        end 
        if Dirr=="c" then
            if v.id == Sel_c then
                ejecutarMagia(Mg_sel,v, Order)
                checks(v)   
            end
        end     
    end 
end    

function ejecutar_slash() --deprecar
    Actual.anim_acc="ataque_arma"
    Actual.anim_col={1,1,1,1}
    Actual.avanzar=true
    Actual.rest=false
    mult=1
    wait_start()
    b_dmg_txt=true
    for k,v in pairs(Total_enemy)do
        v.lastDmg=0
        v.slDmg=true
        v.lastDmgC="R"
        if acertar(v,Actual) then
            local crit=""
            local mult=1
            mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
            DamageProccess(v,Actual,-flr((Actual.agi + flr(rnd(Actual.weapon.left.w)) + Actual.weapon.left.bw)*3*mult),crit)
            jump_start(v)
            checks(v)
        else
            eludido(v)    
        end  
    end

end

function ejecutar_suerte() --deprecar
    Actual.anim_acc="magia"
    Actual.anim_col={1,1,1,1}
    Actual.avanzar=true
    Actual.rest=false
    mult=1
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

function ejecutar_geo() --drepecar
    Actual.anim_acc="magia"
    Actual.anim_col={1,1,1,1}
    Actual.avanzar=true
    Actual.rest=false
    mult=1
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

function ejecutar_lanzar() --deprecado
    Actual.anim_acc="ataque_arma"
    Actual.anim_col={1,1,1,1}
    Actual.avanzar=true
    Actual.rest=false
    local v= getChars(Sel_e, Order)
    local weapon = getChars(sel_w,weapon_inventary)
    mult=1
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

function ejecutar_saltar(v) --deprecado
    --Actual.anim_acc="ataque_arma"
    Actual.anim_col={1,1,1,1}
    Actual.avanzar=true
    Actual.rest=false
    mult=1
    wait_start()
    b_dmg_txt=true
    v.lastDmg=0
    v.slDmg=true
    v.lastDmgC="R"
    if acertar(v,Actual) then
        local crit=""
        local mult=1
        mult, crit =  adv_weak_Logic(v,Actual,{"volar"},true )
        DamageProccess(v,w,-flr((Actual.con + flr(rnd(Actual.weapon.left.w)) + Actual.weapon.left.bw)*3*mult),crit)
        checks(v)
        jump_start(v)
    else
        eludido(v)    
    end  
end    


function ejecutarFuria(v) --deprecar
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






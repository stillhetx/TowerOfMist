function ejecutar_reaccion()
   -- ejecutar_contra_ataque(v_contra_ataque)
        local v=ObtenerPrimeraReaccion()
        local tipo_reaccion=v[1]
        local objetivo_reaccion=v[3]
        local ejecutador_reaccion=v[4]
        EliminarPrimeraReaccion()

        if ejecutador_reaccion and objetivo_reaccion then
            if tipo_reaccion =="parry" then
                tipo_reaccion ="contra_ataque"
            end    

            if tipo_reaccion =="contra_ataque" then
                wait_start()
                --b_dmg_txt=true
                if ejecutador_reaccion.tipo and ejecutador_reaccion.tipo=="player" then
                    Efectos ["ejecutar_ataque_basico_INIT"](objetivo_reaccion,ejecutador_reaccion,"left",0,1)
                    tipo_reaccion ="contra_ataque_B"
                else
                    Efectos ["atacar"](objetivo_reaccion,ejecutador_reaccion,"right",0,1)
                end
                checks(objetivo_reaccion)
                clean()
            end

            if tipo_reaccion =="contra_ataque_B" then
                wait_start()
                --b_dmg_txt=true
                Efectos ["ejecutar_ataque_basico_INIT"](objetivo_reaccion,ejecutador_reaccion,"right",0,1)
                checks(objetivo_reaccion)
                clean()
            end
        end






end



function ejecutar_comando()
    local arreglo={}
    local str_comando

    local mult=1

    local ejecutor={}

    if #Acciones>0 then
        arreglo = obtenerPrimeraAccion()
        str_comando=arreglo[1]
        if str_comando=="ejecutar_atacar_A" then
            Debug_temp=Debug_temp.."A"
        end
        if str_comando=="ejecutar_atacar_B" then
            Debug_temp=Debug_temp.."B"
        end
        eliminarPrimeraAccion()
        local tet=arreglo[3]
        ejecutor=arreglo[4]
        
    end


    if str_comando=="ejecutar_atacar_A" then
        --Debug_temp=" "..str_comando
        local obj=arreglo[3]
        if obj~=nil and obj~={} then
            --Debug_temp=Debug_temp.."!"
            --mult=1
            wait_start()
            b_dmg_txt=true
            obj.lastDmg=0
            obj.slDmg=true
            obj.lastDmgC="V"
            --Actual.avanzar=true
            --Actual.rest=false
            --ejecutar_ataque_basico(obj,"left")
            Efectos ["ejecutar_ataque_basico_INIT"](obj,ejecutor,"left",0,1)
            checks(obj)
            clean()
        else
            --Debug_temp=Debug_temp.."null"
            local enemy_target=GetPrimerEnemigoVivo()
            if enemy_target then
                --ejecutar_ataque_basico(enemy_target,"left")
                Efectos ["ejecutar_ataque_basico_INIT"](enemy_target,ejecutor,"left",0,1)

            end
        end
    end

    if str_comando=="ejecutar_atacar_B" then
        --Debug_temp=Debug_temp.." "..str_comando
        Debug_temp=Debug_temp.."!"

        local obj=arreglo[3]
        if obj~=nil and obj~={} then
            if obj.hp_>0 then
                --Debug_temp=Debug_temp.." !"
                --mult=1
                wait_start()
                b_dmg_txt=true
                obj.lastDmg=0
                obj.slDmg=true
                obj.lastDmgC="V"
                --Actual.avanzar=true
                --Actual.rest=false
                --ejecutar_ataque_basico(obj,"right")
                Efectos ["ejecutar_ataque_basico_INIT"](obj,ejecutor,"right",0,1)
                checks(obj)
                clean()
            end 
        else
            Debug_temp=Debug_temp.."null"
            local enemy_target=GetPrimerEnemigoVivo()
            if enemy_target then
                --ejecutar_ataque_basico(enemy_target,"left")
                Efectos ["ejecutar_ataque_basico_INIT"](enemy_target,ejecutor,"right",0,1)
            end
        end     
        next()
    end  

    if str_comando=="ejecutar_atacar_secundario" then
        local obj=arreglo[3]
        if obj~=nil and obj~={} then
            mult=1
            wait_start()
            b_dmg_txt=true
            obj.lastDmg=0
            obj.slDmg=true
            obj.lastDmgC="V"
            ejecutar_ataque_c(obj)
            checks(obj)
            clean()
            next()
        end
    end
    --msg_debug="ejecutar comando "..arreglo[3].name
    if str_comando=="ejecutar_elemental_damage" then
        --Msg_debug="ejecutar comando "..arreglo[3].name
        if arreglo[2]~=nil 
            and arreglo[2]~={}
            and arreglo[3]~=nil
            and arreglo[3]~={} then
                if arreglo[4] then
                    Efectos[arreglo[2]](arreglo[3], arreglo[4],{},"",0,bono,0,{},{})
                else
                    if Actual then
                        --Efectos[arreglo[2]](arreglo[3], Actual,{},"",0,bono,0,{},{})
                    end
                end
                clean()
                next()
                wait_start()
        end
    end 


    if str_comando=="ejecutar_Magia" then
       --Msg_debug="ejecutar ejecutar_Magia ".." "
       
        ejecutarMagia(arreglo[2],arreglo[3], ejecutor)
        clean()
        if Actual.ext_elem==false then
            next()
        else
            Actual.see_extra_turno=true
            Actual.ext_elem=false
        end
        wait_start()
    end 

    if str_comando=="ejecutar_W.art" then
        ejecutarMagia(arreglo[2],arreglo[3], ejecutor)
        clean()
        next()
        wait_start()
    end

    if str_comando=="ejecutar_comando" then
        ejecutarMagia(arreglo[2],arreglo[3], ejecutor)
        clean()
        wait_start()
    end

    if str_comando=="ejecutar_comando_final" then
        ejecutarMagia(arreglo[2],arreglo[3], ejecutor)
        clean()
        next()
        wait_start()
    end


    if str_comando=="ejecutar_robar" then   ---buscar repetidos, como Cargar y quitar
        ejecutarMagia("robar",arreglo[3], ejecutor)
        clean()
        next()
        wait_start()
    end

    if str_comando=="ejecutar_Cargar" then
        --Msg_debug="dentro carga "..arreglo[3].name
        ejecutarMagia("cargar",arreglo[3], ejecutor)
        clean()
        next()
        wait_start()
    end

    if str_comando=="ejecutar_Quitar" then
        ejecutarMagia("quitar",arreglo[3], ejecutor)
        clean()
        next()
        wait_start()
    end

    if str_comando=="Ejecutar_Extraer" then

         ejecutarMagiaExtra("Extraer",arreglo[3], ejecutor,Mg_sel)
        
    end
    
    if str_comando=="ejecutar_Combo" then
        local obj=arreglo[3]
        if obj.hp_>0 then

            ejecutarMagia("Furia",obj, Order)
            --ejecutarFuria(obj)
            checks(obj)        
            clean()
            --next()
            wait_start()
        else
            local nuevoObjetivo=NextObjetivo(obj, "enemy")
            if nuevoObjetivo~= nil then
                agregarAccion({"ejecutar_Combo","",nuevoObjetivo,ejecutor})
            else
                next()    
            end            
        end
    end

    if str_comando=="ejecutar_Combo_last" then
        local obj=arreglo[3]
        if obj.hp_>0 then
            ejecutarMagia("Furia",obj, Order)
            --ejecutarFuria(obj)
            checks(obj)
            clean()
            next()
            wait_start()
        else
            local nuevoObjetivo=NextObjetivo(obj, "enemy")
            if nuevoObjetivo~= nil then
                agregarAccion({"ejecutar_Combo_last","",nuevoObjetivo,ejecutor})
            else
                next()    
            end            
        end
    end


    if str_comando=="ejecutar_secuencia" then
        local obj=arreglo[3]
        if obj.hp_>0 then
            ejecutarMagia(arreglo[2],arreglo[3], ejecutor)
            clean()
            wait_start()
        end
    end 
    
    if str_comando=="ejecutar_secuencia_final" then
        local obj=arreglo[3]
        if obj.hp_>0 then
            ejecutarMagia(arreglo[2],arreglo[3], ejecutor)
            clean()
            wait_start()
        end
    end



    if str_comando=="ejecutar_disparos_multiples_shot" then
        local obj=arreglo[3]
        if obj.hp_>0 then
            ejecutarMagia("disparos_multiples_shot",arreglo[3], ejecutor)
            clean()
            wait_start()
        end
    end    

    if str_comando=="ejecutar_disparos_multiples_shot_final" then
        local obj=arreglo[3]
        if obj.hp_>0 then
            ejecutarMagia("disparos_multiples_shot",arreglo[3], ejecutor)
            clean()
            next()
            wait_start()
        end
    end    

    if str_comando=="ejecutar_Jump" then
        agregarPendientes({"ejecutar_Jump_caer","saltar",arreglo[3],ejecutor})
        ejecutor.see=false
        ejecutor.next_atack="saltar"
        cleanEjecutarComando()
        next()
    end

    if str_comando=="ejecutar_Suerte" then
        local obj=arreglo[3]
        ejecutarMagia("Suerte",obj, ejecutor)
        --ejecutar_suerte()
        cleanEjecutarComando()
        next()
    end    

    if str_comando=="ejecutar_Geo" then
        local obj=arreglo[3]
        ejecutarMagia("geo",obj, ejecutor)
        --ejecutar_geo()
        clean()
        next()
        wait_start()
    end

    if str_comando=="ejecutar_Darkness" then
        ejecutarMagia("darkness",arreglo[3],ejecutor)
        --checks(arreglo[3])
        cleanEjecutarComando()
        next()
    end
    
    if str_comando=="ejecutar_Slash" then
        local obj=arreglo[3]
        ejecutarMagia("Slash",obj, ejecutor)
        --ejecutar_slash()
        cleanEjecutarComando()
        next()
    end

    if str_comando=="ejecutar_Lanzar" then
        --Sel_e=arreglo[3]
        local obj=arreglo[3]
        ejecutarMagiaExtra("Lanzar",obj, ejecutor,arreglo[2])
        --ejecutar_lanzar()
        cleanEjecutarComando()
        next()
    end

    if str_comando=="ejecutar_Bullets" then
        ejecutarMagia(arreglo[2],arreglo[3], ejecutor)
        cleanEjecutarComando()
        next()
    end

    if str_comando=="ejecutar_blue_magic" then
        ejecutarMagia(arreglo[2],arreglo[3], ejecutor)
        cleanEjecutarComando()
        next()
    end

    if str_comando=="ejecutar_tools" then
        ejecutarMagia(arreglo[2],arreglo[3], ejecutor)
        cleanEjecutarComando()
        next()
    end

    if str_comando=="ejecutar_mix" then
        ejecutarMagia(arreglo[2],arreglo[3], ejecutor)
        cleanEjecutarComando()
        next()
    end



    if str_comando=="ejecutar_Magic.Dual" then
        --Debug_temp=arreglo[2].." "..arreglo[3].name
        ejecutarMagia(arreglo[2],arreglo[3],ejecutor)
        cleanEjecutarComando()
    end    

    if str_comando=="ejecutar_Magic_Dual_segundo" then
        --Debug_temp=Debug_temp.." "..arreglo[2].." "..arreglo[3].name
        local obj=arreglo[3]
        if arreglo[3].hp_> 0  then
            ejecutarMagia(arreglo[2],arreglo[3],ejecutor)
             cleanEjecutarComando()
             next()
        else
            local nuevoObjetivo=NextObjetivo(obj, "enemy")
            if nuevoObjetivo~= nil then
                agregarAccion({"ejecutar_Magic_Dual_segundo",arreglo[2],nuevoObjetivo,arreglo[4]})
            else
                next()    
            end            
        end


    end  

    if str_comando=="ejecutar_capturar" then
        local objetivo= arreglo[3]
        --ejecutar_capturar(objetivo)
        ejecutarMagia("Capturar",objetivo,ejecutor)
        cleanEjecutarComando()
        next()
    end    

    if str_comando=="ejecutar_asesinar" then
        local objetivo= arreglo[3]
        ejecutarMagia("asesinar",objetivo,ejecutor)
        cleanEjecutarComando()
        next()
    end



    if str_comando=="Ejecutar_Extraer" then
        ejecutarMagia("extraer",arreglo[3],ejecutor)
        cleanEjecutarComando()
        next()
    end
end    

function automatico(v)
    --if next_atack=="fury" then
    if false then
        if count_auto < 4 then
            for k,w in pairs(Order) do
                if auto_obj == w.id then
                    if w.live then
                        mult=1
                        wait_start()
                        b_dmg_txt=true
                        flag="23"
                        w.lastDmg=0
                        w.slDmg=true
                        w.lastDmgC="R"
                        ejecutarFuria(w)

                        --Msg_debug="ejecutar comando "..arreglo[3].name.." "..arreglo[2]
                        --ejecutarMagia(arreglo[2],arreglo[3], Order)
                        checks(w)
                    else
                        B_wait=false
                        b_dmg_txt=false
                        auto=false
                        count_auto=0
                        next()
                    end    
                end
            end   
            clean() 
            count_auto=count_auto+1
        else
            count_auto=0
            auto=false
            next()
        end    
    end
    --incontrolable
    if Actual.next_atack=="disparo_rapido" then
        if count_auto < 4 then
            local w = getChars(auto_obj, Order)
            if auto_obj == w.id then
                if w.live then
                    --Dirr="e"
                    --Mg_sel="disparo_rapido"
                    --Sel_e=w.id
                    ejecutarMagia("disparo_rapido",w, Order)
                    --magic_list()
                else
                    B_wait=false
                    b_dmg_txt=false
                    auto=false
                    count_auto=0
                    next()
                end    
            end 
            clean() 
            count_auto=count_auto+1
        else
            count_auto=0
            auto=false
            next()
        end    
    end   
    
    if Actual.next_atack=="incontrolable" then
        if count_auto < 4 then
            --Dirr="a"
           -- Mg_sel="incontrolable"
            --magic_list()
            ejecutarMagia("incontrolable",{}, Order)
            clean() 
            --count_auto=count_auto+1
        else
            count_auto=0
            auto=false
            next()
        end    
    end

    if Actual.next_atack=="Berserk_Attack" then
        ejecutarMagia("Berserk_Attack",{}, Order)
        clean()
        next()
    end

    if Actual.next_atack=="Berserk_move" then
        ejecutarMagia("Berserk_move","", "")
        clean()
        next()
    end
    
end   






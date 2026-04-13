

function comando_defensa()
    Actual.def=true
    Actual.ext=Actual.ext+1
end  


function comando_guardia()
    Actual.sh_=Actual.sh_+1
end    

function comando_proteger()
    add(Protectores,Actual.id)
    Actual.def=true
    Actual.prot=true
    Actual.ext=Actual.ext+1
end    

function comando_saltar()
    config_comando()
    local next_comando="ejecutar_Jump"
    local objetivo_global=selecionar_objetivo()
    agregarAccion({next_comando,"saltar",objetivo_global})
end    

function comando_suerte()
    config_comando()
    local next_comando="ejecutar_Suerte"
    agregarAccion({next_comando,"suerte",{}})
end  

function config_comando()
    count_auto=0
    wait_start()
	animated_bonus_boton=true
    Buton_bonus=0
    Cancel_ejecutar=true
end


--{"COMANDO","OBJETICO_A","DIR_A","OBJETIVO_B","DIR_B"}

function comando_geo()
    config_comando()
    local next_comando="ejecutar_Geo"
    agregarAccion({next_comando,"geo",{}})
end  

arma_seleccionada_global={}

--{"COMANDO","OBJETICO_A","WEAPON"}
function comando_lanzar() 
    config_comando()
    local objetivo_global=selecionar_objetivo()
    local arma_seleccionada_global=sel_w
    local next_comando="ejecutar_Lanzar" 
    agregarAccion({next_comando,arma_seleccionada_global,objetivo_global})

end  

function comando_slash()
    config_comando()
    local next_comando="ejecutar_Slash" 
    agregarAccion({next_comando,"slash",{}})

end


function comando_quitar()
    config_comando()
    local objetivo_global=selecionar_objetivo()
    --ejecutar_quitar()
    local next_comando="ejecutar_Quitar" 
    agregarAccion({next_comando,"quitar",objetivo_global})
end

function comando_cargar()
    --ejecutar_cargar()
    config_comando()
    local objetivo_global=selecionar_objetivo()
    local next_comando="ejecutar_Cargar" 
    --Actual
    agregarAccion({next_comando,"cargar",objetivo_global})
    --Debug_temp=Debug_temp.." Cargar: "..Actual.weapon.left.name
    if Actual.weapon.left.isCast==true then
        --Debug_temp=Debug_temp.." true: "
        for k,i in pairs(Actual.weapon.left.cast) do
            agregarAccion({"ejecutar_elemental_damage",i,objetivo_global})
            --Debug_temp=Debug_temp.." EL: "..i
        end
    end
    if Actual.weapon.right.isCast==true then
        --Debug_temp=Debug_temp.." true: "
        for k,i in pairs(Actual.weapon.right.cast) do
            agregarAccion({"ejecutar_elemental_damage",i,objetivo_global})
            --Debug_temp=Debug_temp.." EL: "..i
        end    
    end
end

function Comando_extraer()
    config_comando()
    local objetivo_global=selecionar_objetivo()
    agregarAccion({"Ejecutar_Extraer",Mg_sel,SelectEnemigo})

end


function  Comando_Evocar()
    
end

objetivo_global={}
mg_sel_global=""
--stop_frame=false
function Comando_magic()
    if Actual.mp_>Ccost then 
        if Mg_sel ~= Actual.lastSpellId then
            if Actual.magicCharge < 4 then
                Actual.magicCharge=Actual.magicCharge+1
            end
        else
            if Actual.magicCharge > 0 then
                Actual.magicCharge=Actual.magicCharge-1
            end
        end
        Actual.lastSpellId =Mg_sel
        if Ttipo=="soporte" then
            if Actual.flee_support==1 then
                still_turn=false
                Actual.flee_support=0
            end
        end
        if Ttipo=="sanacion" then
            if Actual.flee_heal==1 then
                still_turn=false
                --Actual.ext=Actual.ext+1
                Actual.flee_heal = 0
            end
        end

        if Acc == "magic" then
            Actual.mp_=Actual.mp_-Ccost
            if Actual.flee_magic==1 then
                still_turn=false
                --Actual.ext=Actual.ext+1
                Actual.flee_magic = 0
            end
        end
        --Msg_debug="hechizo: "..Mg_sel.." objetivo:"..Sel_c..Sel_e
        all_logic_magic()  
    else
        Debug_temp="NO MANAD"
        Cancel_ejecutar=false
    end    
end

function Ejecutar_Comando()
    wait_start()
    local objetivo=selecionar_objetivo()
    agregarAccion({"ejecutar_comando",Mg_sel,objetivo})
    Cancel_ejecutar=true    

end


function all_logic_magic()     
        wait_start()
        
        local objetivo=selecionar_objetivo()
        --Msg_debug="hechizo: "..Mg_sel.." objetivo:"..Sel_c..Sel_e
        --if Dirr=="e"  or Dirr=="a"  then
            animated_bonus_boton=true
            Buton_bonus=0
            local next_comando="ejecutar_Magia"
            --Msg_debug="//"..Mg_sel
            agregarAccion({next_comando,Mg_sel,objetivo})
            Cancel_ejecutar=true            
        --else
            --ejecutarMagia(Mg_sel,objetivo, Order)
            --if objetivo~={} then checks(objetivo) end
        --end

end    

function Comando_invocar()
    if Actual.mp_>0 then 
        Actual.mp_=Actual.mp_-1
        all_logic_magic()
    end
end

function Comando_Power_Stone()
    all_logic_magic()
end


objetivo_global_B={}
mg_sel_global_B=""
dirr_global_A=""
dirr_global_B=""

function Comando_dual()
    local objetivo_global
    local objetivo_global_B

    if Dirr2== "e" then
        objetivo_global=getChars(Sel_ee,Order)
    end
    if Dirr2== "c" then
        objetivo_global=getChars(Sel_cc,Order)
    end    
    if Dirr== "e" then
        objetivo_global_B=getChars(Sel_e, Order)
    end
    if Dirr== "c" then
        objetivo_global_B=getChars(Sel_c,Order)
    end

    config_comando()

    --next_comando="ejecutar_Magic.Dual"
    agregarAccion({"ejecutar_Magic.Dual",Mg_2sel,objetivo_global,Dirr2,Actual})
    agregarAccion({"ejecutar_Magic_Dual_segundo",Mg_sel,objetivo_global_B,Dirr,Actual})
    

end


function Comando_mix()
    local objetivo_global=selecionar_objetivo()
    config_comando()
    local next_comando="ejecutar_mix"
    agregarAccion({next_comando,Mg_sel,objetivo_global})
end

function Comando_bullet()
    local objetivo_global=selecionar_objetivo()
    config_comando()
    local next_comando="ejecutar_Bullets" 
    agregarAccion({next_comando,Mg_sel,objetivo_global})
end

function Comando_Rapido()
    Mg_sel = "Balas_Rapidas"
    local objetivo=selecionar_objetivo()
    if Actual.gl_ > 0 then
        Actual.gl_=Actual.gl_ - 1
        if Actual.gl_==0 then
            Cancel_ejecutar=false
        else
            Cancel_ejecutar=true
        end 
        ejecutarMagia("Balas_Rapidas",objetivo, Order)
        if objetivo~={} then checks(objetivo) end
    else
        Cancel_ejecutar=false
    end
    
end

function Comando_Darkness()
    if Actual.hp_> 3 then
        Actual.hp_=Actual.hp_-3
        config_comando()
        local objetivo_global=selecionar_objetivo()
        local next_comando="ejecutar_Darkness"
        agregarAccion({next_comando,"",objetivo_global})

    else
        Cancel_ejecutar=false
    end    
end    

function Comando_certero()

end    

function Comando_Esconder()
    Actual.hide=true
end    

function Comando_Atrapar()

end

function Comando_LLamar()
    all_logic_magic()
end

function Comando_Encantar()

end

function Comando_Pintar()

end

function Comando_Skill()

end


function Comando_asesinar()
    config_comando()
    local objetivo_global=selecionar_objetivo()
    local mg_sel_global=Mg_sel
    local next_comando="ejecutar_asesinar"
    agregarAccion({next_comando,Mg_sel,objetivo_global})
end    





function Comando_Mimic()
    --log("Comando_Mimic INICIO")
    Acc_cost="free"
    if Last_acc~= "" then
        Acc    = Last_acc
        Sel_e  = Last_sel_e
        Sel_c  = Last_sel_c
        Sel_ee = Last_sel_ee
        Sel_cc = Last_sel_cc
        Mg_sel = Last_mg_sel
        Dirr   = Last_dirr

        objetivo_global=selecionar_objetivo()
        
        if Dirr=="e" then
            if objetivo_global.hp_<=0 then
                for k,i in pairs(Order) do
                    if i.hp_>0 and i.tipo=="enemy" then
                        Sel_e=i.id
                        break
                    end
                end
            end
        end

        if Dirr=="a" then
            if objetivo_global.hp_<=0 then
                for k,i in pairs(Order) do
                    if i.hp_>0 and i.tipo=="player" then
                        Sel_e=i.id
                        break
                    end
                end
            end
        end

        if Acc=="atacar" then
            
            Comando_atacar()             
        end
        if Acc=="mix" then
            Comando_mix()
        end
        if Acc=="invocar" then
            Comando_invocar()
        end
        if Acc=="darkness" then
            Comando_Darkness()
        end
        if Acc=="tools" then
            Comando_tool()    
        end
        if Acc=="asesinar" then
            Comando_asesinar()    
        end
        if Acc=="esconderse" then
            Comando_Esconder()    
        end
        if Acc=="destransformar" then
            Comando_destransformar()
        end
        if Acc=="transformacion" then
            Comando_morph()
        end
        if Acc=="Blu.magic" then
            Comando_skill_enemigo()
        end
        if Acc=="bullet" then
            Comando_bullet()
        end
        if Acc=="rapido" then
            Comando_Rapido()
        end
        if Acc=="dual M." then
            Comando_dual()            
        end
        if Acc=="slash" then 
            comando_slash()
        end  
        if Acc=="robar" then 
            Comando_robar()
        end    
        if Acc=="magic" then
            Comando_magic()
        end  
        if Acc=="objeto" then
            items_list(false)
        end
        if Acc=="usar" then
            items_list(true)
        end
        if Acc=="combo" then
            Comando_furia()  
            --Cancel_ejecutar=true
        end   
        if Acc=="saltar" then
            comando_saltar()
        end
        if Acc=="defensa" then
            comando_defensa()
            jump_def=true
        end  
        if Acc=="proteger" then
            comando_proteger()
            jump_def=true
        end   
        if Acc=="guardia" then
            comando_guardia()
        end   
        if Acc=="suerte" then
            comando_suerte()
        end   
        if Acc=="geo" then
            comando_geo()
        end   
        if Acc=="lanzar" then
            comando_lanzar()
        end
        if Acc=="quitar" then
            comando_quitar()
        end
        if Acc=="cargar" then
            comando_cargar()
        end
        if Acc=="tecnica" then
            Comando_tecnica()
            clean()    
        end
        if Acc=="atrapar" then
            Comando_capturar()
            clean()    
        end
        if Acc=="llamar" then
            Comando_invocar()
            clean()    
        end
    end
end    





function Comando_tool()   
    config_comando()
    local objetivo_global=selecionar_objetivo()
    local mg_sel_global=Mg_sel
    local next_comando="ejecutar_tools"
    agregarAccion({next_comando,Mg_sel,objetivo_global})

end	

function Comando_generico()   --Derprecado
    local objetivo=selecionar_objetivo()
    ejecutarMagia(Mg_sel,objetivo, Order)
    if objetivo~={} then checks(objetivo) end
end    
--borrar

function Comando_destransformar()
    local objetivo=selecionar_objetivo()
    --ejecutarMagia("destransformar",objetivo, Order)
    local mg_sel_global="destransformar"
    local next_comando="ejecutar_Magia"
    agregarAccion({next_comando,mg_sel_global,objetivo})

end    

function Comando_morph()
    local objetivo=selecionar_objetivo()
    --local mg_sel_global="morph"
    local next_comando="ejecutar_Magia"
    agregarAccion({next_comando,Mg_sel,objetivo})
    Msg_debug="//"..next_comando.." // "..Mg_sel.." // "..objetivo.id
end
function Comando_skill_enemigo()
    config_comando()
    local objetivo_global=selecionar_objetivo()
    local mg_sel_global=Mg_sel
    local next_comando="ejecutar_blue_magic"
    agregarAccion({next_comando,mg_sel_global,objetivo_global})
end



function Comando_capturar()
    local objetivo_global=getChars(Sel_e,Order);
    count_auto=0
	wait_start()
	animated_bonus_boton=true
    Buton_bonus=0
    local next_comando="ejecutar_capturar"
        agregarAccion({next_comando,"",objetivo_global})

    Cancel_ejecutar=true
end    

function Comando_tecnica()
    if Sel_t_cost=="charge" then
        if Actual.carga==1  then
            if Sel_command then
                Ejecutar_Comando()
            else   
                all_logic_magic()   
            end            
            Actual.carga=0
        else
            Cancel_ejecutar=true
        end
    end
    if Sel_t_cost=="rc" then
        if Actual.rc_>0  then
            if Sel_command then
                Ejecutar_Comando()
            else   
                all_logic_magic()   
            end
            Actual.rc_=Actual.rc_-1
        else
            Cancel_ejecutar=true
        end
    end
    if Sel_t_cost=="" then     
            if Sel_command then
                Ejecutar_Comando()
            else   
                all_logic_magic()   
            end
    end   
end    


function Comando_especiales()
    if Sel_t_cost=="charge" then
        if Actual.carga==1  then
            if Sel_command then
                Ejecutar_Comando()
            else   
                all_logic_magic()   
            end            
            Actual.carga=0
        else
            Cancel_ejecutar=true
        end
    end
    if Sel_t_cost=="rc" then
        if Actual.rc_>0  then
            if Sel_command then
                Ejecutar_Comando()
            else   
                all_logic_magic()   
            end
            Actual.rc_=Actual.rc_-1
        else
            Cancel_ejecutar=true
        end
    end
    if Sel_t_cost=="" then     
            if Sel_command then
                Ejecutar_Comando()
            else   
                all_logic_magic()   
            end
    end   

end


function Comando_furia()
    local objetivo=selecionar_objetivo()
    count_auto=0
	wait_start()
	animated_bonus_boton=true
    Buton_bonus=0
    local next_comando="ejecutar_Combo"
    agregarAccion({next_comando,"",objetivo})
    agregarAccion({next_comando,"",objetivo})
    agregarAccion({"ejecutar_Combo_last","",objetivo})


    Cancel_ejecutar=true                     
end

function Comando_robar()
    config_comando()
    local objetivo_global=selecionar_objetivo()
    local next_comando="ejecutar_robar"
    agregarAccion({next_comando,"robar",objetivo_global})
end

function Comando_weapon_art()

        config_comando()
    local objetivo_global=selecionar_objetivo()
    local next_comando="ejecutar_W.art"
    agregarAccion({next_comando,Mg_sel,objetivo_global})

end


--Ejecutar ataque
function Comando_atacar()
    local objetivo_global=selecionar_objetivo()
    Dirr="e"
	wait_start()
    local next_comando="ejecutar_atacar_A"
    agregarAccion({next_comando,"",objetivo_global})

    if Actual.weapon.right.isCast==true then
        for k,i in pairs(Actual.weapon.right.cast) do
            agregarAccion({"ejecutar_elemental_damage",i,objetivo_global})
        end
    end

    next_comando="ejecutar_atacar_B"
    agregarAccion({next_comando,"",objetivo_global})

    if Actual.weapon.left.isCast==true then
        for k,i in pairs(Actual.weapon.left.cast) do
            agregarAccion({"ejecutar_elemental_damage",i,objetivo_global})
        end
    end
    Cancel_ejecutar=true 
    if Actual.flee_attack==1 then
        still_turn=false
        Actual.flee_attack=0
    end

end   


function Comando_atacar_secundario()
    local objetivo_global=selecionar_objetivo()
    Dirr="e"
	wait_start()
    local next_comando="ejecutar_atacar_secundario"
    agregarAccion({next_comando,"",objetivo_global})
    Cancel_ejecutar=true    
end
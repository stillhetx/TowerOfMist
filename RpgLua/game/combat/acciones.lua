
--[[

Menu.Acc=""
Menu.Replace_Acc=false
Menu.obj=""
Menu.Last_sel_e=""
Menu.Sel_e=""
Menu.Sel_ee=""
Menu.Last_sel_ee=""
Menu.Sel_i=""



Menu.Ttipo=""
Menu.Ccolor=""
Menu.Llv=0
Menu.Ccost=0
Menu.Mg_sel=""
Menu.Last_mg_sel=""
Menu.Mg_2sel=""
Menu.Last_mg_2sel=""
Menu.Last_sel_c=""
Menu.Sel_c=""
Menu.Last_sel_cc=""
Menu.Sel_cc=""
Menu.Dirr="e"
Menu.Dirr2=""

Menu.Ttipo2=""
Menu.Ccolor2=""
Menu.Llv2=0
Menu.Ccost2=0

Menu.Last_dirr=""
Menu.Last_acc=""
Menu.Number_sel=0

IsInterruccion=false
INTERRUCCION_MSG=""

Menu.continuar_turno=false

Menu.IsCharge=false
Menu.Sel_t_cost=""
Menu.Sel_command=false

]]


Eleg=""

function acciones()
    --local eleg=(ini_view-1)+Op
    Replace_Acc=false
    Actual.carga=1


    State_Operacion[State](Actual,(ini_view-1)+Op)
    

    --Verificar()
    if Execute == true then
        --Msg_debug=Msg_debug.."verificarr"
        Verificar()
    end
    if Execute==true then
        --Msg_debug=Msg_debug.."true ejecutar"
        guardar_ultima_accion()
        ejecutar()
        --start_caracter=true
        Acc=""
        Sel_e={}
        Sel_i=""
        Execute=false
        wait_start()
        b_dmg_txt=true
    end    
    inside()
end   

ERROR_MENU=""

function Verificar()
    --
    if Acc=="" or Acc==nil then
        ERROR_MENU="Error Accion"..Acc
        CleanMenu()
        return 
    end
    if State~="Execute" then
        if Dirr=="" or Dirr== nil then
            ERROR_MENU="Error DIRR"
            CleanMenu()
            return 
        end
        if Dirr=="e" or Dirr=="c" or  Dirr=="d" then
            if Sel_e=="" or Sel_e==nil then
                ERROR_MENU="Error Sel_e"
                CleanMenu()
                Sel_e={}
                return 
            end
            if Sel_c=="" or Sel_c==nil then
                ERROR_MENU="Error Sel_c"
                CleanMenu()
                Sel_c={}
                return 
            end
        end
        if Dirr=="d" then
            if Sel_c=="" or Sel_c==nil then
                ERROR_MENU="Error Sel_c"
                CleanMenu()
                Sel_c={}
                return 
            end
        end
        if Dirr=="w" then
            if Sel_w=="" or Sel_w==nil then
                ERROR_MENU="Error Sel_w"
                CleanMenu()
                Sel_w=""
                return 
            end
        end
        if Dirr=="i" then
            if Sel_i=="" or Sel_i==nil then
                CleanMenu()
                Sel_i=""
                return 
            end
        end
    end
end

function CleanMenu()
    Acc=""
    Dirr=""
    Execute=false
end

function ConfigAccion(mg_sel,name_action,dirr,ccost,ttipo,ccolor,llv)
    mg_sel = mg_sel or ""
    name_action = name_action or ""
    dirr = dirr or ""
    ccost = ccost or ""
    llv = llv or ""

    Mg_sel=mg_sel
    Name_action=name_action
    Dirr=dirr
    Ccost=ccost
    Ttipo=ttipo
    Ccolor=ccolor
    Llv=llv
end

function CostoSkill()

    --[[             Mg_sel=Actual.mg[(ini_view-1)+Op].id
                    Name_action=Actual.mg[(ini_view-1)+Op].name
                    Dirr=Actual.mg[(ini_view-1)+Op].dir
                    Ccost=Actual.mg[(ini_view-1)+Op].cost
                    Ttipo=Actual.mg[(ini_view-1)+Op].tipo
                    Ccolor=Actual.mg[(ini_view-1)+Op].color 
    --]]
        if Acc == "magic" then
            if Actual.mp_>Ccost then 
                Actual.mp_=Actual.mp_-Ccost
                Actual.SpellPosition=Actual.SpellPosition+1
                if Actual.SpellPosition>3 then 
                    Actual.ArraySpell[Actual.SpellPosition+1]=Ccolor; 
                else
                    Actual.SpellPosition=0
                    Actual.ArraySpell[Actual.SpellPosition+1]=Ccolor;
                end
            end
        end
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
            if Actual.flee_magic==1 then
                still_turn=false
                --Actual.ext=Actual.ext+1
                Actual.flee_magic = 0
            end
        end

end


function Lista_comando()
    if Acc=="atacar" then
        Comando_atacar()            
        clean()
    end
    if Acc=="W.Arts" then
        Comando_weapon_art()
        clean()
    end
    if Acc=="support.w" then
        Comando_atacar_secundario()
        clean()
    end
    if Acc=="mix" then
        Comando_mix()
        clean()
    end
    if Acc=="invocar" then
        Comando_invocar()
        clean()
    end
    if Acc=="Power.Stone" then
        Comando_Power_Stone()
        clean()
    end
    if Acc=="darkness" then
        Comando_Darkness()
        clean()
    end
    if Acc=="tools" then
        Comando_tool()    
        clean()
    end

    if Acc=="asesinar" then
        Comando_asesinar()    
        clean()
    end
    if Acc=="esconderse" then
        Comando_Esconder()    
        clean()
    end
    if Acc=="destransformar" then
        Comando_destransformar()
        clean()
    end
    if Acc=="transformacion" then
        Comando_morph()
        clean()
    end
    if Acc=="Blu.magic" then
        Comando_skill_enemigo()
        clean()
    end
    if Acc=="bullet" then
        Comando_bullet()
        clean()
    end
    if Acc=="rapido" then
        Comando_Rapido()
        clean()
    end
    if Acc=="dual M." then
        Comando_dual()            
        clean()
    end
    if Acc=="slash" then 
        comando_slash()
        clean()
    end  
    if Acc=="robar" then 
        Comando_robar()
        clean()
    end    
    if Acc=="magic" or Acc=="spirit" or Acc == "w.magic" or Acc == "espada" then
        Comando_magic()
        clean()
    end  
    if Acc=="canciones" then
        Comando_magic()
        clean()
    end
    if Acc=="especiales" then
        Comando_especiales()
        clean()
    end
    if Acc=="objeto" then
        items_list(false)
        clean()
    end
    if Acc=="usar" then
        items_list(true)
        clean()
    end
    if Acc=="combo" then
        Comando_furia()  
        --Cancel_ejecutar=true
        clean()    
    end   
    if Acc=="saltar" then
        comando_saltar()
        clean()    
    end
    if Acc=="defensa" then
        comando_defensa()
        jump_def=true
        clean()    
    end  
    if Acc=="proteger" then
        comando_proteger()
        jump_def=true
        clean()    
    end   
    if Acc=="guardia" then
        comando_guardia()
        clean()    
    end   
    if Acc=="suerte" then
        comando_suerte()
        clean()    
    end   
    if Acc=="geo" then
        comando_geo()
        clean()    
    end   
    if Acc=="lanzar" then
        comando_lanzar()
        clean()    
    end
    if Acc=="quitar" then
        comando_quitar()
        clean()    
    end
    --Comando Obsoleto
    if Acc=="cargar" then
        comando_cargar()
        clean()    
    end
    if Acc=="tecnica" then
        Comando_tecnica()
        clean()    
    end
    if Acc=="bailes" then
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
    if Acc=="mimic" then
        Comando_Mimic()
        clean()    
    end
    if Acc=="spell.list" then
       -- Comando_magic()
        clean()
    end
    if Acc=="extraer" then
        Comando_extraer()
        clean()    
    end
end

function ejecutar()
    local jump_def=false
    Lista_comando()
    
    --[[
    if Acc=="evocar" then
        Comando_Evocar()
    end]]
    --MUY DELICADO---NO CUESTIONAR
    if Cancel_ejecutar then   
        Cancel_ejecutar=false 
    else
        if jump_def then
            next()
            jump_def=false
        else
            if Actual.ext_elem then           
                Actual.ext_elem = false
            else   
                if Actual.ext >0 then
                    Actual.ext=Actual.ext-1
                else
                    Actual.ext=0
                    next()
                end 
            end    

        end 
    end
 
end 
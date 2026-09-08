
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
    local eleg=(ini_view-1)+Op
    Replace_Acc=false
    Actual.carga=1

    if State=="select" then
        sel1=Op 
        Op=1
        Acc=Actual.acc[eleg]
        Eleg=Actual.acc[eleg]
        State=Tabla_acciones[Acc]

        if State=="select e" then
            FiltrarEnemigoVivos()
        end
        if State=="Execute" then
            
            Execute=true
        end

        if Tabla_acciones_funcion and Tabla_acciones_funcion[Acc] and  type(Tabla_acciones_funcion[Acc])=="function" then
            Tabla_acciones_funcion[Acc]()
        end

        ini_view=1
        fin_view=18
    elseif State=="select y" then
        if Acc=="memory" then
            if Actual.memory[(ini_view-1)+Op].isReplace == true then
                Acc=Actual.memory[(ini_view-1)+Op].sub
                State=Actual.memory[(ini_view-1)+Op].sel
            else
                Acc=Actual.memory[(ini_view-1)+Op].sub
                State=Actual.memory[(ini_view-1)+Op].sel
                Mg_sel=Actual.memory[(ini_view-1)+Op].id
                Name_action=Actual.memory[(ini_view-1)+Op].name
                Dirr=Actual.memory[(ini_view-1)+Op].dir
                Ccost=Actual.memory[(ini_view-1)+Op].cost
                Ttipo=Actual.memory[(ini_view-1)+Op].tipo
                Ccolor=Actual.memory[(ini_view-1)+Op].color
                Llv=Actual.memory[(ini_view-1)+Op].lv
            end    

            
        end
    elseif State=="select l" then
        if Acc == "magics" then
            Acc=Actual.mag[(ini_view-1)+Op]
            if Tabla_acciones_funcion and Tabla_acciones_funcion[Acc] and  type(Tabla_acciones_funcion[Acc])=="function" then
                Tabla_acciones_funcion[Acc]()
            end
            if Vacio==false then
                if Acc=="dual M."  then
                    State="select oo"
                else
                    State="select o"  
                end
            else
                Vacio=false
            end
            
        end   
        if Acc == "colecciones" then
            Acc=Actual.col[(ini_view-1)+Op]
            if Tabla_acciones_funcion and Tabla_acciones_funcion[Acc] and  type(Tabla_acciones_funcion[Acc])=="function" then
                Tabla_acciones_funcion[Acc]()
            end
            State="select o"
        end

    elseif State=="select ii" then

        --no utilizado
        if Acc == "mix" then
            Sel_ii=items[(ini_view-1)+Op].id
            Dirr2=items[(ini_view-1)+Op].dir
            if "e"== Dirr2 then
                State="select e"
                FiltrarEnemigoVivos()
            end
            if "c"== Dirr2 then
                State="select c"
                FiltrarAliadosVivos()
            end
            if "d"== Dirr2 and #Death_party>0 then
                State="select d"
                --filtrarDerrotados()
                FiltrarAliadosMuertos()
            end    
        end    
    elseif State=="select i" then
        IsInterruccion=false
        INTERRUCCION_MSG="" 
        if Acc == "objeto" or Acc == "usar" then
            Sel_i=items[(ini_view-1)+Op].id
            Dirr=items[(ini_view-1)+Op].dir
            if "e"== Dirr then
                State="select e"
                FiltrarEnemigoVivos()
            end
            if "c"== Dirr then
                State="select c"
                FiltrarAliadosVivos()
            end
            if "d"== Dirr and #Death_party>0 then
                State="select d"
                --filtrarDerrotados()
                FiltrarAliadosMuertos()
            end    
        end
    elseif State=="select oo" then

        if  Acc=="dual M." then
            Mg_2sel=Actual.mg[(ini_view-1)+Op].id
            Dirr2=Actual.mg[(ini_view-1)+Op].dir
            Name_action="Dual Cast"
            Ttipo2=Actual.mg[(ini_view-1)+Op].tipo
            Ccolor2=Actual.mg[(ini_view-1)+Op].color
            Llv2=Actual.mg[(ini_view-1)+Op].lv
            Ccost2=Actual.mg[(ini_view-1)+Op].cost


            if "a"== Dirr2  then
                State="select aa"
            end
            if "e"== Dirr2 then
                State="select ee"
                FiltrarEnemigoVivos()
            end
            if "c"== Dirr2 then
                State="select cc"
                FiltrarAliadosVivos()
            end    
            --

            if not (Actual.slots_[Llv2]>0) and not (Actual.mp_>Ccost2) then
                State ="select"
                Acc=""
            end


            --
        end     
    elseif State=="select o" then
        --IsInterruccion=false
        --INTERRUCCION_MSG="" 
        --Sacar Replace_Acc y reemplazar por else and else if
            
            if Acc == "magic"   then            
                if Actual.mp_< Actual.mg[(ini_view-1)+Op].cost then
                    State ="select"
                    Acc=""
                else
                    ConfigAccion(Actual.mg[(ini_view-1)+Op].id,
                    Actual.mg[(ini_view-1)+Op].name,
                    Actual.mg[(ini_view-1)+Op].dir,
                    Actual.mg[(ini_view-1)+Op].cost,
                    Actual.mg[(ini_view-1)+Op].tipo,
                    Actual.mg[(ini_view-1)+Op].color,
                    Actual.mg[(ini_view-1)+Op].lv)

                    Mg_sel=Actual.mg[(ini_view-1)+Op].id
                    Name_action=Actual.mg[(ini_view-1)+Op].name
                    Dirr=Actual.mg[(ini_view-1)+Op].dir
                    Ccost=Actual.mg[(ini_view-1)+Op].cost
                    Ttipo=Actual.mg[(ini_view-1)+Op].tipo
                    Ccolor=Actual.mg[(ini_view-1)+Op].color
                    Llv=Actual.mg[(ini_view-1)+Op].lv

                    --CostoSkill()
                    --Msg_debug=" #"..(ini_view-1)+Op
                    -- Msg_debug=" "..Mg_sel.." "..Name_action.." "..Dirr.." "..Ccost.." "..Ttipo
                end
            elseif Acc == "w.magic" then  
                if Actual.mp_< Actual.milagros[(ini_view-1)+Op].cost then
                    State ="select"
                    Acc=""
                else
                    Mg_sel=Actual.milagros[(ini_view-1)+Op].id
                    Name_action=Actual.milagros[(ini_view-1)+Op].name
                    Dirr=Actual.milagros[(ini_view-1)+Op].dir
                    Ccost=Actual.milagros[(ini_view-1)+Op].cost
                    Ttipo=Actual.milagros[(ini_view-1)+Op].tipo
                    Ccolor=Actual.milagros[(ini_view-1)+Op].color
                    Llv=Actual.milagros[(ini_view-1)+Op].lv
                end
            elseif Acc == "espada" then  
                if Actual.mp_< Actual.swm[(ini_view-1)+Op].cost then
                    State ="select"
                    Acc=""
                else
                    Mg_sel=Actual.swm[(ini_view-1)+Op].id
                    Name_action=Actual.swm[(ini_view-1)+Op].name
                    Dirr=Actual.swm[(ini_view-1)+Op].dir
                    Ccost=Actual.swm[(ini_view-1)+Op].cost
                    Ttipo=Actual.swm[(ini_view-1)+Op].tipo
                    Ccolor=Actual.swm[(ini_view-1)+Op].color
                    Llv=Actual.swm[(ini_view-1)+Op].lv
                end    

            elseif Acc == "spirit" then            
                if Actual.mp_< Actual.spirit[(ini_view-1)+Op].cost then
                    State ="select"
                    Acc=""
                else
                    Mg_sel=Actual.spirit[(ini_view-1)+Op].id
                    Name_action=Actual.spirit[(ini_view-1)+Op].name
                    Dirr=Actual.spirit[(ini_view-1)+Op].dir
                    Ccost=Actual.spirit[(ini_view-1)+Op].cost
                    Ttipo=Actual.spirit[(ini_view-1)+Op].tipo
                end
            elseif Acc=="especiales"  then
               -- Mg_sel=Actual.sp[(ini_view-1)+Op].id
                -- Dirr=Actual.sp[(ini_view-1)+Op].dir
                --Msg_debug=Msg_debug.." #especiales"
                if Actual.mp_< Actual.spe[(ini_view-1)+Op].cost then
                    State ="select"
                    Acc=""
                else
                    Mg_sel=Actual.spe[(ini_view-1)+Op].id
                    Name_action=Actual.spe[(ini_view-1)+Op].name
                    Dirr=Actual.spe[(ini_view-1)+Op].dir
                    Ccost=Actual.spe[(ini_view-1)+Op].cost
                    SubState=Actual.spe[(ini_view-1)+Op].mtipo

                    if  Actual.spe[(ini_view-1)+Op].isCommand == true then
                        Sel_command=Actual.spe[(ini_view-1)+Op].isCommand                        
                        --Msg_debug=Msg_debug.." #C"
                    end
                    if Actual.spe[(ini_view-1)+Op].isReplace == true then
                        Acc=Actual.spe[(ini_view-1)+Op].sub
                        State=Actual.spe[(ini_view-1)+Op].sel
                        Replace_Acc=true
                        if State=="Execute" then
                            Execute=true
                        end
                        --Msg_debug=Msg_debug.." #U"
                    end
                    --Msg_debug=" #"..(ini_view-1)+Op
                    --Msg_debug="S "..Mg_sel.." "..Name_action.." "..Dirr.." "..Acc.." "..State
                end
            elseif Acc =="spell.list"  then

                    Mg_sel=Actual.mg[(ini_view-1)+Op].id
                    Name_action=Actual.mg[(ini_view-1)+Op].name
                    Dirr=Actual.mg[(ini_view-1)+Op].dir     
                    Ttipo=Actual.mg[(ini_view-1)+Op].tipo
            elseif Acc == "Power.Stone"  then
                Mg_sel=Actual.powerStone[(ini_view-1)+Op].id
                Name_action=Actual.powerStone[(ini_view-1)+Op].name
                Dirr=Actual.powerStone[(ini_view-1)+Op].dir     
                Ttipo=Actual.powerStone[(ini_view-1)+Op].tipo
            elseif Acc == "dual M."  then            

                    Mg_sel=Actual.mg[(ini_view-1)+Op].id
                    Name_action=Actual.mg[(ini_view-1)+Op].name
                    Dirr=Actual.mg[(ini_view-1)+Op].dir
                    Ccost=Actual.mg[(ini_view-1)+Op].cost
                    Ttipo=Actual.mg[(ini_view-1)+Op].tipo
                    Ccolor=Actual.mg[(ini_view-1)+Op].color
                    Llv=Actual.mg[(ini_view-1)+Op].lv
                  
                if not (Actual.slots_[Llv]>1) and not (Actual.mp_>(Ccost*1.5)) then
                    State ="select"
                    Acc=""
                end
            elseif Acc == "tecnica"  then
                Mg_sel=Actual.sk[(ini_view-1)+Op].id
                Name_action=Actual.sk[(ini_view-1)+Op].name
                Dirr=Actual.sk[(ini_view-1)+Op].dir
                Sel_t_cost=Actual.sk[(ini_view-1)+Op].tCost
                IsCharge=Actual.sk[(ini_view-1)+Op].isCharge
                Sel_command=Actual.sk[(ini_view-1)+Op].isCommand
                if Actual.sk[(ini_view-1)+Op].tCost=="charge" and not (Actual.carga==1) then
                        State = "select"
                        Acc=""
                elseif Actual.sk[(ini_view-1)+Op].tCost=="rc" and not (Actual.rc_>0) then
                        State = "select"
                        Acc=""                          
                end
                if Actual.sk[(ini_view-1)+Op].isReplace then
                    Acc=Actual.sk[(ini_view-1)+Op].sub
                    State=Actual.sk[(ini_view-1)+Op].sel
                    Replace_Acc=true
                end
            elseif Acc == "invocar"  then            
                Mg_sel=Actual.invo[(ini_view-1)+Op].id
                Name_action=Actual.invo[(ini_view-1)+Op].name
                Dirr=Actual.invo[(ini_view-1)+Op].dir
            elseif Acc == "canciones"  then            




                if Actual.mp_< Actual.cancion[(ini_view-1)+Op].cost then
                    State ="select"
                    Acc=""
                else
                    Mg_sel=Actual.cancion[(ini_view-1)+Op].id
                    Name_action=Actual.cancion[(ini_view-1)+Op].name
                    Dirr=Actual.cancion[(ini_view-1)+Op].dir
                    Ccost=Actual.cancion[(ini_view-1)+Op].cost
                    Ttipo=Actual.cancion[(ini_view-1)+Op].tipo
                    Ccolor=Actual.cancion[(ini_view-1)+Op].color
                    Llv=Actual.cancion[(ini_view-1)+Op].lv

                    --CostoSkill()
                    --Msg_debug=" #"..(ini_view-1)+Op
                    -- Msg_debug=" "..Mg_sel.." "..Name_action.." "..Dirr.." "..Ccost.." "..Ttipo
                end
            elseif Acc == "bailes"  then            
                Mg_sel=Actual.bailes[(ini_view-1)+Op].id
                Name_action=Actual.bailes[(ini_view-1)+Op].name
                Dirr=Actual.bailes[(ini_view-1)+Op].dir

                Sel_t_cost=Actual.bailes[(ini_view-1)+Op].tCost
                IsCharge=Actual.bailes[(ini_view-1)+Op].isCharge
                Sel_command=Actual.bailes[(ini_view-1)+Op].isCommand

                if Actual.bailes[(ini_view-1)+Op].tCost=="charge" and not Actual.carga==1 then
                        State = "select"
                        Acc=""
                elseif Actual.bailes[(ini_view-1)+Op].tCost=="rc" and not Actual.rc_>0 then
                        State = "select"
                        Acc=""                          
                end
            elseif Acc == "W.Arts"  then
                Mg_sel=Actual.art[(ini_view-1)+Op].id
                Name_action=Actual.art[(ini_view-1)+Op].name
                Dirr=Actual.art[(ini_view-1)+Op].dir
            elseif Acc == "llamar"  then         
                if #Actual.beast>0 then 
                    Mg_sel=Actual.beast[(ini_view-1)+Op].id
                    Name_action=Actual.beast[(ini_view-1)+Op].name
                    Dirr=Actual.beast[(ini_view-1)+Op].dir
                else
                    State="select"
                    Acc=""---
                end   
            elseif Acc == "tools"  then            
                Mg_sel=Actual.tools[(ini_view-1)+Op].id
                Name_action=Actual.tools[(ini_view-1)+Op].name
                Dirr=Actual.tools[(ini_view-1)+Op].dir
            elseif  Acc == "bullet"  then            
                Mg_sel=Actual.bullet[(ini_view-1)+Op].id
                Name_action=Actual.bullet[(ini_view-1)+Op].name
                Dirr=Actual.bullet[(ini_view-1)+Op].dir
            elseif Acc == "Blu.magic"  then            
                Mg_sel=Actual.blue[(ini_view-1)+Op].id
                Name_action=Actual.blue[(ini_view-1)+Op].name
                Dirr=Actual.blue[(ini_view-1)+Op].dir
            elseif Acc == "invocar"  then            
                Mg_sel=Actual.invo[(ini_view-1)+Op].id
                Name_action=Actual.invo[(ini_view-1)+Op].name
                Dirr=Actual.invo[(ini_view-1)+Op].dir
            elseif Acc == "transformacion"  then   
                Mg_sel=Actual.morph[(ini_view-1)+Op].id       
                Name_action=Actual.morph[(ini_view-1)+Op].name
                Dirr=Actual.morph[(ini_view-1)+Op].dir
                --Mg_sel=Actual.morph[(ini_view-1)+Op].id
                --Name_action=Actual.morph[(ini_view-1)+Op].name
                --Dirr=Actual.morph[Op].dir
            elseif Acc == "mix"  then            
                Mg_sel=Actual.mix[(ini_view-1)+Op].id
                Name_action=Actual.mix[(ini_view-1)+Op].name
                Dirr=Actual.mix[(ini_view-1)+Op].dir
            end

            if "m"== Dirr  and State == "select o" then
                State="select m"
            elseif "x"== Dirr  and State == "select o" then
                State="select"
                Execute=true
            elseif "a"== Dirr  and State == "select o" then
                State="select a"
            elseif "o"== Dirr  and State == "select o" then
                State="select o"
            elseif "e"== Dirr and State == "select o" then
                State="select e"
                FiltrarEnemigoVivos()
            elseif "c"== Dirr and State == "select o" then
                State="select c"
                FiltrarAliadosVivos()
            elseif "d"== Dirr and State == "select o" then
                FiltrarAliadosMuertos()
                --filtrarDerrotados()
                State="select d"
                if #AliadosVivos<1 then
                    State="select o"
                end
            end  

            if Acc=="tools" and Replace_Acc  then
                filtrarTools()
                --Msg_debug=Msg_debug.."2Tools "
            end
            if Acc=="bullet" and Replace_Acc  then
                filtrarBalas()
            end
            if Acc=="llamar" and Replace_Acc then
                if not (#Actual.beast>0) then
                    State="select"
                    Acc=""
                end--
            end
            ini_view=1
    elseif State=="select meta" then 
            if "m"== Dirr  and State == "select o" then
                State="select m"
            elseif "x"== Dirr  and State == "select o" then
                State="select"
                Execute=true
            elseif "a"== Dirr  and State == "select o" then
                State="select a"
            elseif "o"== Dirr  and State == "select o" then
                State="select o"
            elseif "e"== Dirr and State == "select o" then
                State="select e"
                FiltrarEnemigoVivos()
            elseif "c"== Dirr and State == "select o" then
                State="select c"
                FiltrarAliadosVivos()
            elseif "d"== Dirr and State == "select o" then
                FiltrarAliadosMuertos()
                --filtrarDerrotados()
                State="select d"
                if #AliadosVivos<1 then
                    State="select o"
                end
            end  
    elseif State=="select a" then --all enemy, not tarjet
            Execute=true
    elseif State=="select aa" then
            State="select o"      
    elseif State=="select ee" then
        if  Acc=="dual M." then
            State="select o"
            Sel_ee=EnemigosVivos[Op]
            SelectEnemigo=EnemigosVivos[Op]
            Sel_cc=Sel_e
        end    
    elseif State=="select e" then --choose enemy
        if  Acc=="atacar"  or Acc=="W.Arts" or Acc=="support.w" or Acc=="atrapar"  or Acc=="Power.Stone" or Acc=="asesinar" or Acc=="invocar" or  Acc == "usar" or Acc == "darkness" or Acc == "dual M." or Acc == "tools" or Acc == "rapido" or Acc=="magic" or Acc=="dual M." or Acc=="bullet" or Acc=="mix" or Acc=="Blu.magic" or Acc=="cargar" or Acc=="tecnica" or Acc=="objeto" or Acc=="robar" or Acc=="quitar" or Acc=="carga" or Acc=="combo" or Acc=="saltar" or Acc=="spirit" or Acc=="lanzar" or Acc=="spell.list" or Acc=="extraer" or Acc=="especiales"  or Acc=="canciones"  or Acc=="bailes" or Acc=="w.magic" or Acc=="espada" then
            Execute=true
            State="select"
            if EnemigosVivos[Op] then
                Sel_e=EnemigosVivos[Op]
                SelectEnemigo=EnemigosVivos[Op]
                Sel_c=Sel_e
            else
                --State="select"
                State="select o"
            end
        end
        if Acc == "extraer" then
            State="select v" --variable
            Sel_e=EnemigosVivos[Op]
            Sel_c=Sel_e
        end
    elseif State=="select cc" then
        if  Acc=="dual M." then
            State="select o"
            Sel_cc=ActiveParty[Op]
            Sel_ee=Sel_cc
        end    
    elseif State=="select c" then --choose character
        if  Acc=="magic" or Acc=="dual M." or Acc == "usar" or Acc=="tecnica" or Acc=="objeto" or Acc == "tools" or Acc=="atacar" or Acc=="combo" or Acc=="saltar" or Acc=="mix" or Acc=="Blu.magic" or Acc=="spell.list" or Acc=="especiales" then
            Execute=true
            State="select"
            Sel_c=ActiveParty[Op]
            Sel_e=Sel_c
        end
    elseif State=="select d" then --death character
        if  Acc=="magic" or Acc == "usar" or Acc=="objeto" or Acc=="especiales" then
            Execute=true
            State="select"
            Sel_c=Death_party[Op]
            Sel_e=Sel_c
        end
    elseif State=="select a" then --all enemy, not tarjet
        if  Acc=="tecnica"  or Acc=="magic"then
            Execute=true
            State="select"
        end    
    elseif State=="select w" then --choose weapon
        if  Acc=="lanzar"  then
            Sel_w=weapon_inventary[Op].id
            State="select e"
            FiltrarEnemigoVivos()
        end
    elseif State=="select v" then
        if Acc == "extraer" then
            Execute=true
           Mg_sel=SelectEnemigo.magicForce[Op]
           State="select"
        end
    elseif State=="select m" then
        Number_sel=Op
        Execute=true
        State="select"
    end
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

function acciones()
    local eleg=(ini_view-1)+Op
    Replace_Acc=false

    if State=="select" then
        sel1=Op 
        if Actual.acc[eleg]=="atacar" and Actual.state["paralisis"] == nil then
            State="select e"
            Acc="atacar"
            FiltrarEnemigoVivos()
        end
        if Actual.acc[eleg]=="W.Arts"then
            State="select o"
            Acc="W.Arts"
            filtrarWeaponArts()
        end
        if Actual.acc[eleg]=="support.w" then
            State="select e"
            Acc="support.w"
            FiltrarEnemigoVivos()
        end
        --
        if Actual.acc[eleg]=="mix" then
            filtrarHechizos()
            State="select o"
            Acc="mix"
        end
        if Actual.acc[eleg]=="slash" then
            Execute=true
            Acc="slash"
        end
        if Actual.acc[eleg]=="tecnica"  then
            State="select o"
            Acc="tecnica"
        end
        if Actual.acc[eleg]=="especiales" then
            State="select o"
            Acc="especiales"
        end
        if Actual.acc[eleg]=="invocar"  then
            State="select o"
            Acc="invocar"
        end
        if Actual.acc[eleg]=="atrapar"  then
            State="select e"
            Acc="atrapar"
            FiltrarEnemigoVivos()
        end
        if Actual.acc[eleg]=="asesinar"  then
            State="select e"
            Acc="asesinar"
            FiltrarEnemigoVivos()
        end
        if Actual.acc[eleg]=="esconderse"  then
            State="select"
            Acc="esconderse"
            Execute=true
        end
        if Actual.acc[eleg]=="llamar" then
            if #Actual.beast >0 then
                State="select o"
                Acc="llamar"
            else
                State="select"
                Acc=""
            end
        end
        if Actual.acc[eleg]=="tools" then
            filtrarTools()
            --Msg_debug="1Tools "
            if #Actual.tools > 0 then
                State="select o"
                Acc="tools"
            else
                Acc=""
                State="select"
            end
        end
        if Actual.acc[eleg]=="transformacion" then
            State="select o"
            Acc="transformacion"
        end
        if Actual.acc[eleg]=="destransformar" then
            Acc="destransformar"
            Execute=true
        end
        if Actual.acc[eleg]=="Blu.magic" then
            filtrarHechizosAzules()
            if #Actual.blue > 0 then
                State="select o"
                Acc="Blu.magic"
            else
                Acc=""
                State="select"
            end
        end
        if Actual.acc[eleg]=="bullet" then
            filtrarBalas()
            if #Actual.bullet > 0 then
                State="select o"
                Acc="bullet"
            else
                Acc=""
                State="select"
            end
        end
        if Actual.acc[eleg]=="rapido" then
            State="select e"
            Acc="rapido"
            FiltrarEnemigoVivos()
        end
        --
        if Actual.acc[eleg]=="runes" then
            State="select o"
            Acc="spell.list"
            FiltrarSpellList()
        end
        if Actual.acc[eleg]=="spell.list" then
            State="select o"
            Acc="spell.list"
            FiltrarSpellList()
        end
        if Actual.acc[eleg]=="Power.Stone" then
            State="select o"
            Acc="Power.Stone"
            FiltrarPowerStone()
        end
        if Actual.acc[eleg]=="extraer" then
            State="select e"
            Acc="extraer"
        end
        if Actual.acc[eleg]=="cargar" then
            State="select e"
            Acc="cargar"
            FiltrarEnemigoVivos()
        end
        if Actual.acc[eleg]=="guardia" then
            Acc="guardia"
            Execute=true
        end
        if Actual.acc[eleg]=="darkness" then
            Acc="darkness"
            State="select e"
            FiltrarEnemigoVivos()
        end
        if Actual.acc[eleg]=="quitar" then
            State="select e"
            Acc="quitar"
            FiltrarEnemigoVivos()
        end
        if Actual.acc[eleg]=="mimic" then
            Acc="mimic"
            Execute=true
        end
        if Actual.acc[eleg]=="dual M." then
            State="select oo"
            Acc="dual M."
        end
        if Actual.acc[eleg]=="spirit" then
            State="select o"
            Acc="spirit"
        end
        if Actual.acc[eleg]=="magic" or Actual.acc[eleg]=="ninja" or Actual.acc[eleg]=="espada"  then
            State="select o"
            Acc="magic"
        end 
        if Actual.acc[eleg]=="magics" then
            State="select l"
            Acc="magics"
        end
        if Actual.acc[eleg]=="coleccion" then
            State="select l"
            Acc="coleccion"
        end
        if Actual.acc[eleg]=="colecciones" then
            State="select l"
            Acc="colecciones"
        end
        if Actual.acc[eleg]=="canciones" then
            State="select o"
            Acc="canciones"
        end
        if Actual.acc[eleg]=="espada" then
            State="select o"
            Acc="espada"
        end
        if Actual.acc[eleg]=="ninja" then
            State="select o"
            Acc="ninja"
        end
        if Actual.acc[eleg]=="bailes" then
            State="select o"
            Acc="bailes"
        end
        if Actual.acc[eleg]=="evocar" then
            State="select o"
            Acc="evocar"
            FiltrarFuerzas()
        end
        if Actual.acc[eleg]=="robar" then
            State="select e"
            Acc="robar"
            FiltrarEnemigoVivos()
        end 
        if Actual.acc[eleg]=="objeto" then
            State="select i"
            Acc="objeto"
        end
        if Actual.acc[eleg]=="usar" then
            State="select i"
            Acc="usar"
        end
        if Actual.acc[eleg]=="combo" then
            State="select e"
            Acc="combo"
            FiltrarEnemigoVivos()
        end
        if Actual.acc[eleg]=="defensa" then
            Acc="defensa"
            Execute=true
        end
        if Actual.acc[eleg]=="proteger" then
            Acc="proteger"
            Execute=true
        end
        if Actual.acc[eleg]=="saltar" then
            State="select e"
            Acc="saltar"
            FiltrarEnemigoVivos()
        end
        if Actual.acc[eleg]=="lanzar" then
            State="select w"
            Acc="lanzar"
        end 
        if Actual.acc[eleg]=="suerte" then
            Execute=true
            Acc="suerte"
        end 
        if Actual.acc[eleg]=="geo" then
            Execute=true
            Acc="geo"
        end 
        ini_view=1
        fin_view=6
    elseif State=="select l" then
        if Acc == "magics" then
            Acc=Actual.mag[Op]
            if Acc=="dual M."  then
                State="select oo"
            else
                State="select o"  
            end
            
        end   
        if Acc == "colecciones" then
            Acc=Actual.col[Op]
            State="select o"
        end

    elseif State=="select ii" then

        --no utilizado
        if Acc == "mix" then
            Sel_ii=items[Op].id
            Dirr2=items[Op].dir
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
            Sel_i=items[Op].id
            Dirr=items[Op].dir
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
            Mg_2sel=Actual.mg[Op].id
            Dirr2=Actual.mg[Op].dir
            Name_action="Dual Cast"
            Ttipo2=Actual.mg[Op].tipo
            Ccolor2=Actual.mg[Op].color
            Llv2=Actual.mg[Op].lv
            Ccost2=Actual.mg[Op].cost


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
        IsInterruccion=false
        INTERRUCCION_MSG="" 
        --Sacar Replace_Acc y reemplazar por else and else if
            if Acc == "magic" then            
                if Actual.mp_< Actual.mg[(ini_view-1)+Op].cost then
                    State ="select"
                    Acc=""
                else
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

            elseif Acc == "spirit" then            
                if Actual.mp_< Actual.spirit[Op].cost then
                    State ="select"
                    Acc=""
                else
                    Mg_sel=Actual.spirit[Op].id
                    Name_action=Actual.spirit[Op].name
                    Dirr=Actual.spirit[Op].dir
                    Ccost=Actual.spirit[Op].cost
                    Ttipo=Actual.spirit[Op].tipo
                end
            elseif Acc=="especiales"  then
               -- Mg_sel=Actual.sp[Op].id
                -- Dirr=Actual.sp[Op].dir
                Msg_debug=Msg_debug.." #especiales"
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
                        Sel_command=Actual.spe[Op].isCommand                        
                        Msg_debug=Msg_debug.." #C"
                    end
                    if Actual.spe[(ini_view-1)+Op].isReplace == true then
                        Acc=Actual.spe[(ini_view-1)+Op].sub
                        State=Actual.spe[(ini_view-1)+Op].sel
                        Replace_Acc=true
                        Msg_debug=Msg_debug.." #U"
                    end
                    --Msg_debug=" #"..(ini_view-1)+Op
                    --Msg_debug="S "..Mg_sel.." "..Name_action.." "..Dirr.." "..Acc.." "..State
                end
            elseif Acc =="spell.list"  then

                    Mg_sel=Actual.mg[Op].id
                    Name_action=Actual.mg[Op].name
                    Dirr=Actual.mg[Op].dir     
                    Ttipo=Actual.mg[Op].tipo
            elseif Acc == "Power.Stone"  then
                Mg_sel=Actual.powerStone[Op].id
                Name_action=Actual.powerStone[Op].name
                Dirr=Actual.powerStone[Op].dir     
                Ttipo=Actual.powerStone[Op].tipo
            elseif Acc == "dual M."  then            

                    Mg_sel=Actual.mg[Op].id
                    Name_action=Actual.mg[Op].name
                    Dirr=Actual.mg[Op].dir
                    Ccost=Actual.mg[Op].cost
                    Ttipo=Actual.mg[Op].tipo
                    Ccolor=Actual.mg[Op].color
                    Llv=Actual.mg[Op].lv
                  
                if not (Actual.slots_[Llv]>1) and not (Actual.mp_>(Ccost*1.5)) then
                    State ="select"
                    Acc=""
                end
            elseif Acc == "tecnica"  then
                Mg_sel=Actual.sk[Op].id
                Name_action=Actual.sk[Op].name
                Dirr=Actual.sk[Op].dir
                Sel_t_cost=Actual.sk[Op].tCost
                IsCharge=Actual.sk[Op].isCharge
                Sel_command=Actual.sk[Op].isCommand
                if Actual.sk[Op].tCost=="charge" and not Actual.carga==1 then
                        State = "select"
                        Acc=""
                elseif Actual.sk[Op].tCost=="rc" and not Actual.rc_>0 then
                        State = "select"
                        Acc=""                          
                end
                if Actual.sk[(ini_view-1)+Op].isReplace then
                    Acc=Actual.sk[(ini_view-1)+Op].sub
                    State=Actual.sk[(ini_view-1)+Op].sel
                    Replace_Acc=true
                end
            elseif Acc == "invocar"  then            
                Mg_sel=Actual.invo[Op].id
                Name_action=Actual.invo[Op].name
                Dirr=Actual.invo[Op].dir
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
                Mg_sel=Actual.bailes[Op].id
                Name_action=Actual.bailes[Op].name
                Dirr=Actual.bailes[Op].dir

                Sel_t_cost=Actual.bailes[Op].tCost
                IsCharge=Actual.bailes[Op].isCharge
                Sel_command=Actual.bailes[Op].isCommand

                if Actual.bailes[Op].tCost=="charge" and not Actual.carga==1 then
                        State = "select"
                        Acc=""
                elseif Actual.bailes[Op].tCost=="rc" and not Actual.rc_>0 then
                        State = "select"
                        Acc=""                          
                end
            elseif Acc == "W.Arts"  then
                Mg_sel=Actual.art[Op].id
                Name_action=Actual.art[Op].name
                Dirr=Actual.art[Op].dir
            elseif Acc == "llamar"  then         
                if #Actual.beast>0 then 
                    Mg_sel=Actual.beast[Op].id
                    Name_action=Actual.beast[Op].name
                    Dirr=Actual.beast[Op].dir
                else
                    State="select"
                    Acc=""---
                end   
            elseif Acc == "tools"  then            
                Mg_sel=Actual.tools[Op].id
                Name_action=Actual.tools[Op].name
                Dirr=Actual.tools[Op].dir
            elseif  Acc == "bullet"  then            
                Mg_sel=Actual.bullet[Op].id
                Name_action=Actual.bullet[Op].name
                Dirr=Actual.bullet[Op].dir
            elseif Acc == "Blu.magic"  then            
                Mg_sel=Actual.blue[Op].id
                Name_action=Actual.blue[Op].name
                Dirr=Actual.blue[Op].dir
            elseif Acc == "invocar"  then            
                Mg_sel=Actual.invo[Op].id
                Name_action=Actual.invo[Op].name
                Dirr=Actual.invo[Op].dir
            elseif Acc == "transformacion"  then   
                Mg_sel=Actual.morph[(ini_view-1)+Op].id       
                Name_action=Actual.morph[(ini_view-1)+Op].name
                Dirr=Actual.morph[(ini_view-1)+Op].dir
                --Mg_sel=Actual.morph[Op].id
                --Name_action=Actual.morph[Op].name
                --Dirr=Actual.morph[Op].dir
            elseif Acc == "mix"  then            
                Mg_sel=Actual.mix[Op].id
                Name_action=Actual.mix[Op].name
                Dirr=Actual.mix[Op].dir
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
            if Acc=="usar" and Replace_Acc  then
                --filtrarTools()
                --Msg_debug=Msg_debug.."2Tools "
            end
            if Acc=="bullet" and Replace_Acc  then
                filtrarBalas()
                --Msg_debug=Msg_debug.."2Tools "
            end
            if Acc=="llamar" and Replace_Acc then
                if not (#Actual.beast>0) then
                    State="select"
                    Acc=""
                end--
            end
    elseif State=="select a" then --all enemy, not tarjet
            Execute=true
    elseif State=="select aa" then
            State="select o"      
    elseif State=="select ee" then
        if  Acc=="dual M." then
            State="select o"
            Sel_ee=EnemigosVivos[Op].id
            SelectEnemigo=EnemigosVivos[Op]
            Sel_cc=Sel_e
        end    
    elseif State=="select e" then --choose enemy
        if  Acc=="atacar"  or Acc=="W.Arts" or Acc=="support.w" or Acc=="atrapar"  or Acc=="Power.Stone" or Acc=="asesinar" or Acc=="invocar" or  Acc == "usar" or Acc == "darkness" or Acc == "dual M." or Acc == "tools" or Acc == "rapido" or Acc=="magic" or Acc=="dual M." or Acc=="bullet" or Acc=="mix" or Acc=="Blu.magic" or Acc=="cargar" or Acc=="tecnica" or Acc=="objeto" or Acc=="robar" or Acc=="quitar" or Acc=="carga" or Acc=="combo" or Acc=="saltar" or Acc=="spirit" or Acc=="lanzar" or Acc=="spell.list" or Acc=="extraer" or Acc=="especiales"  or Acc=="canciones"  or Acc=="bailes" then
            Execute=true
            State="select"
            Sel_e=EnemigosVivos[Op].id
            SelectEnemigo=EnemigosVivos[Op]
            Sel_c=Sel_e
        end
        if Acc == "extraer" then
            State="select v" --variable
            Sel_e=EnemigosVivos[Op].id
            Sel_c=Sel_e
        end
    elseif State=="select cc" then
        if  Acc=="dual M." then
            State="select o"
            Sel_cc=ActiveParty[Op].id
            Sel_ee=Sel_cc
        end    
    elseif State=="select c" then --choose character
        if  Acc=="magic" or Acc=="dual M." or Acc == "usar" or Acc=="tecnica" or Acc=="objeto" or Acc == "tools" or Acc=="atacar" or Acc=="combo" or Acc=="saltar" or Acc=="mix" or Acc=="Blu.magic" or Acc=="spell.list" or Acc=="especiales" then
            Execute=true
            State="select"
            Sel_c=ActiveParty[Op].id
            Sel_e=Sel_c
        end
    elseif State=="select d" then --death character
        if  Acc=="magic" or Acc == "usar" or Acc=="objeto" or Acc=="especiales" then
            Execute=true
            State="select"
            Sel_c=Death_party[Op].id
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
    if Execute==true then
        guardar_ultima_accion()
        ejecutar()
        --start_caracter=true
        Acc=""
        Sel_e=""
        Sel_i=""
        Execute=false
        wait_start()
        b_dmg_txt=true
    end    
    inside()
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

function ejecutar()
    local jump_def=false
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
    if Acc=="magic" or Acc=="spirit" then
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
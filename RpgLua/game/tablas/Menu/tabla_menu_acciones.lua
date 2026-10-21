 
Operacion={}

Operacion["magic"] = function (v,o)   
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
    end
end
          
 Operacion["w.magic"] = function (v,o)   
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
    
 end




  Operacion["espada"] = function (v,o)   
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
  end
                
Operacion["spirit"] = function (v,o)   

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

end


Operacion["especiales"] = function (v,o)   

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
        end
    end

end


Operacion["spell.list"] = function (v,o)   
    Mg_sel=Actual.mg[(ini_view-1)+Op].id
    Name_action=Actual.mg[(ini_view-1)+Op].name
    Dirr=Actual.mg[(ini_view-1)+Op].dir     
    Ttipo=Actual.mg[(ini_view-1)+Op].tipo
end


Operacion["Power.Stone"] = function (v,o)   
    Mg_sel=Actual.powerStone[(ini_view-1)+Op].id
    Name_action=Actual.powerStone[(ini_view-1)+Op].name
    Dirr=Actual.powerStone[(ini_view-1)+Op].dir     
    Ttipo=Actual.powerStone[(ini_view-1)+Op].tipo
end


Operacion["dual M."] = function (v,o)   
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
end
                
       
Operacion["tecnica"] = function (v,o)   
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

end
               

Operacion["invocar"] = function (v,o)     
    Mg_sel=Actual.invo[(ini_view-1)+Op].id
    Name_action=Actual.invo[(ini_view-1)+Op].name
    Dirr=Actual.invo[(ini_view-1)+Op].dir 
end

Operacion["canciones"] = function (v,o)      
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
end

Operacion["bailes"] = function (v,o)     
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

end


Operacion["W.Arts"] = function (v,o)      
    Mg_sel=Actual.art[(ini_view-1)+Op].id
    Name_action=Actual.art[(ini_view-1)+Op].name
    Dirr=Actual.art[(ini_view-1)+Op].dir
end


Operacion["llamar"] = function (v,o)     
    if #Actual.beast>0 then 
        Mg_sel=Actual.beast[(ini_view-1)+Op].id
        Name_action=Actual.beast[(ini_view-1)+Op].name
        Dirr=Actual.beast[(ini_view-1)+Op].dir
    else
        State="select"
        Acc=""---
    end   
end


Operacion["tools"] = function (v,o)      
    Mg_sel=Actual.tools[(ini_view-1)+Op].id
    Name_action=Actual.tools[(ini_view-1)+Op].name
    Dirr=Actual.tools[(ini_view-1)+Op].dir
end


Operacion["bullet"] = function (v,o)   
    Mg_sel=Actual.bullet[(ini_view-1)+Op].id
    Name_action=Actual.bullet[(ini_view-1)+Op].name
    Dirr=Actual.bullet[(ini_view-1)+Op].dir
end

Operacion["Blu.magic"] = function (v,o)     
    Mg_sel=Actual.blue[(ini_view-1)+Op].id
    Name_action=Actual.blue[(ini_view-1)+Op].name
    Dirr=Actual.blue[(ini_view-1)+Op].dir
end

Operacion["transformacion"] = function (v,o)    
    Mg_sel=Actual.morph[(ini_view-1)+Op].id       
    Name_action=Actual.morph[(ini_view-1)+Op].name
    Dirr=Actual.morph[(ini_view-1)+Op].dir
end

Operacion["mix"] = function (v,o)   
    Mg_sel=Actual.mix[(ini_view-1)+Op].id
    Name_action=Actual.mix[(ini_view-1)+Op].name
    Dirr=Actual.mix[(ini_view-1)+Op].dir
end
    

Operacion["POS-CONFIG"]= function (v,o)   
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

end
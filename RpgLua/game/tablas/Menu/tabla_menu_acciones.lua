 
Operacion={}

Operacion["magic"] = function (v,o)   
    o = o or 1
    if v.mp_< v.mg[o].cost then
        State ="select"
        Acc=""
    else
        ConfigAccion(v.mg[o].id,
                    v.mg[o].name,
                    v.mg[o].dir,
                    v.mg[o].cost,
                    v.mg[o].tipo,
                    v.mg[o].color,
                    v.mg[o].lv)

        Mg_sel=v.mg[o].id
        Name_action=v.mg[o].name
        Dirr=v.mg[o].dir
        Ccost=v.mg[o].cost
        Ttipo=v.mg[o].tipo
        Ccolor=v.mg[o].color
        Llv=v.mg[o].lv
    end
end
          
 Operacion["w.magic"] = function (v,o)   
    o = o or 1
    if v.mp_< v.milagros[o].cost then
        State ="select"
        Acc=""
    else
        Mg_sel=v.milagros[o].id
        Name_action=v.milagros[o].name
        Dirr=v.milagros[o].dir
        Ccost=v.milagros[o].cost
        Ttipo=v.milagros[o].tipo
        Ccolor=v.milagros[o].color
        Llv=v.milagros[o].lv
    end
    
 end




  Operacion["espada"] = function (v,o)   
    o = o or 1
        if v.mp_< v.swm[o].cost then
            State ="select"
            Acc=""
        else
            Mg_sel=v.swm[o].id
            Name_action=v.swm[o].name
            Dirr=v.swm[o].dir
            Ccost=v.swm[o].cost
            Ttipo=v.swm[o].tipo
            Ccolor=v.swm[o].color
            Llv=v.swm[o].lv
        end    
  end
                
Operacion["spirit"] = function (v,o)   
    o = o or 1

    if v.mp_< v.spirit[o].cost then
        State ="select"
        Acc=""
    else
        Mg_sel=v.spirit[o].id
        Name_action=v.spirit[o].name
        Dirr=v.spirit[o].dir
        Ccost=v.spirit[o].cost
        Ttipo=v.spirit[o].tipo
    end

end


Operacion["especiales"] = function (v,o)   
    o = o or 1

     if v.mp_< v.spe[o].cost then
        State ="select"
        Acc=""
    else
        Mg_sel=v.spe[o].id
        Name_action=v.spe[o].name
        Dirr=v.spe[o].dir
        Ccost=v.spe[o].cost
        SubState=v.spe[o].mtipo
        if  v.spe[o].isCommand == true then
                            Sel_command=v.spe[o].isCommand                        
                            --Msg_debug=Msg_debug.." #C"
        end
        if v.spe[o].isReplace == true then
            Acc=v.spe[o].sub
            State=v.spe[o].sel
            Replace_Acc=true
            if State=="Execute" then
                Execute=true
            end
        end
    end

end


Operacion["spell.list"] = function (v,o)   
    o = o or 1
    Mg_sel=v.mg[o].id
    Name_action=v.mg[o].name
    Dirr=v.mg[o].dir     
    Ttipo=v.mg[o].tipo
end


Operacion["Power.Stone"] = function (v,o)   
    o = o or 1
    Mg_sel=v.powerStone[o].id
    Name_action=v.powerStone[o].name
    Dirr=v.powerStone[o].dir     
    Ttipo=v.powerStone[o].tipo
end


Operacion["dual M."] = function (v,o)   
    o = o or 1
    Mg_sel=v.mg[o].id
    Name_action=v.mg[o].name
    Dirr=v.mg[o].dir
    Ccost=v.mg[o].cost
    Ttipo=v.mg[o].tipo
    Ccolor=v.mg[o].color
    Llv=v.mg[o].lv
                  
    if not (v.slots_[Llv]>1) and not (v.mp_>(Ccost*1.5)) then
        State ="select"
        Acc=""
    end
end
                
       
Operacion["tecnica"] = function (v,o)  
    o = o or 1 
    Mg_sel=v.sk[o].id
    Name_action=v.sk[o].name
    Dirr=v.sk[o].dir
    Sel_t_cost=v.sk[o].tCost
    IsCharge=v.sk[o].isCharge
    Sel_command=v.sk[o].isCommand
    if v.sk[o].tCost=="charge" and not (v.carga==1) then
        State = "select"
        Acc=""
    elseif v.sk[o].tCost=="rc" and not (v.rc_>0) then
        State = "select"
        Acc=""                          
    end
    if v.sk[o].isReplace then
        Acc=v.sk[o].sub
        State=v.sk[o].sel
        Replace_Acc=true
    end

end
               

Operacion["invocar"] = function (v,o)    
    o = o or 1 
    Mg_sel=v.invo[o].id
    Name_action=v.invo[o].name
    Dirr=v.invo[o].dir 
end

Operacion["canciones"] = function (v,o)    
    o = o or 1  
    if v.mp_< v.cancion[o].cost then
                    State ="select"
                    Acc=""
    else
                    Mg_sel=v.cancion[o].id
                    Name_action=v.cancion[o].name
                    Dirr=v.cancion[o].dir
                    Ccost=v.cancion[o].cost
                    Ttipo=v.cancion[o].tipo
                    Ccolor=v.cancion[o].color
                    Llv=v.cancion[o].lv

                    --CostoSkill()
                    --Msg_debug=" #"..o
                    -- Msg_debug=" "..Mg_sel.." "..Name_action.." "..Dirr.." "..Ccost.." "..Ttipo
    end
end

Operacion["bailes"] = function (v,o)    
    o = o or 1 
    Mg_sel=v.bailes[o].id
    Name_action=v.bailes[o].name
    Dirr=v.bailes[o].dir

    Sel_t_cost=v.bailes[o].tCost
    IsCharge=v.bailes[o].isCharge
    Sel_command=v.bailes[o].isCommand
    if v.bailes[o].tCost=="charge" and not v.carga==1 then
        State = "select"
        Acc=""
    elseif v.bailes[o].tCost=="rc" and not v.rc_>0 then
        State = "select"
        Acc=""                          
    end

end


Operacion["W.Arts"] = function (v,o)      
    o = o or 1
    Mg_sel=v.art[o].id
    Name_action=v.art[o].name
    Dirr=v.art[o].dir
end


Operacion["llamar"] = function (v,o)  
    o = o or 1   
    if #v.beast>0 then 
        Mg_sel=v.beast[o].id
        Name_action=v.beast[o].name
        Dirr=v.beast[o].dir
    else
        State="select"
        Acc=""---
    end   
end


Operacion["tools"] = function (v,o)  
    o = o or 1    
    Mg_sel=v.tools[o].id
    Name_action=v.tools[o].name
    Dirr=v.tools[o].dir
end


Operacion["bullet"] = function (v,o)   
    o = o or 1
    Mg_sel=v.bullet[o].id
    Name_action=v.bullet[o].name
    Dirr=v.bullet[o].dir
end

Operacion["Blu.magic"] = function (v,o)   
    o = o or 1  
    Mg_sel=v.blue[o].id
    Name_action=v.blue[o].name
    Dirr=v.blue[o].dir
end

Operacion["transformacion"] = function (v,o)   
    o = o or 1 
    Mg_sel=v.morph[o].id       
    Name_action=v.morph[o].name
    Dirr=v.morph[o].dir
end

Operacion["mix"] = function (v,o)   
    o = o or 1
    Mg_sel=v.mix[o].id
    Name_action=v.mix[o].name
    Dirr=v.mix[o].dir
end
    

Operacion["POS-CONFIG"]= function (v,o)   
    if "m"== Dirr  and State == "select_o" then
        State="select_m"
    elseif "x"== Dirr  and State == "select_o" then
        State="select"
        Execute=true
    elseif "a"== Dirr  and State == "select_o" then
        State="select_a"
    elseif "o"== Dirr  and State == "select_o" then
        State="select_o"
    elseif "e"== Dirr and State == "select_o" then
        State="select_e"
        FiltrarEnemigoVivos()
    elseif "c"== Dirr and State == "select_o" then
        State="select_c"
        FiltrarAliadosVivos()
    elseif "d"== Dirr and State == "select_o" then
        FiltrarAliadosMuertos()
                --filtrarDerrotados()
        State="select_d"
        if #AliadosVivos<1 then
            State="select_o"
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
        if not (#v.beast>0) then
            State="select"
            Acc=""
        end--
    end

end
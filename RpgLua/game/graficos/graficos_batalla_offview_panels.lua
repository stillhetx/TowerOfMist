function Graficos_Batalla.off_panel()
    local offV_x=-140
    local offV_y= 10
    local t=0
    if Actual.tipo=="player" then

        love.graphics.print( "Estadisticas",offV_x,offV_y+(24*t))
        t = t + 1
        love.graphics.print( ""..Actual.name,offV_x,offV_y+(24*t))
        t = t + 1
        love.graphics.print( "lv: "..Actual.lv,offV_x,offV_y+(24*t))
        t = t + 1
        love.graphics.print( "Ataque "..(Actual.fue+mod(Actual,"fue")+promWeaponDmg(Actual)),offV_x,offV_y+(24*t))
        t = t + 1
        love.graphics.print( "Magic "..(Actual.fue+mod(Actual,"pod")+5),offV_x,offV_y+(24*t))
        t = t + 1
        love.graphics.print( "Defensa "..(flr((Actual.con+mod(Actual,"con"))/2) + ModArmadura(Actual)),offV_x,offV_y+(24*t))
        t = t + 1
        love.graphics.print( "M.Def",offV_x,offV_y+(24*t))
        t = t + 1
        love.graphics.print( "",offV_x,offV_y+(24*t))
        t = t + 1

        if (Actual.hp+mod(Actual,"hp"))<1000 then
            love.graphics.print("HP: "..Actual.hp_.."/"..(Actual.hp+mod(Actual,"hp")),offV_x,offV_y+(24*t))
            t = t + 1
        else
            love.graphics.print("HP: "..Actual.hp_.."",offV_x,offV_y+(24*t))
            t = t + 1
            love.graphics.print("    /"..(Actual.hp+mod(Actual,"hp")),offV_x,offV_y+(24*t))
            t = t + 1
        end
        if (Actual.mp+mod(Actual,"mp"))<1000 then
            love.graphics.print("MP: "..Actual.mp_.."/"..(Actual.mp+mod(Actual,"mp")),offV_x,offV_y+(24*t))
            t = t + 1
        else
            love.graphics.print("MP: "..Actual.mp_.."",offV_x,offV_y+(24*t))
            t = t + 1
            love.graphics.print("    /"..(Actual.mp+mod(Actual,"mp")).."",offV_x,offV_y+(24*t))
            t = t + 1
        end
        if (Actual.con+mod(Actual,"con"))>9 and (Actual.pod+mod(Actual,"pod"))>9 then
            love.graphics.print("CON: "..(Actual.con+mod(Actual,"con")),offV_x,offV_y+(24*t))
            t = t + 1
            love.graphics.print("POD: "..(Actual.pod+mod(Actual,"pod")),offV_x,offV_y+(24*t))
            t = t + 1
        else
            love.graphics.print("CON: "..(Actual.con+mod(Actual,"con")).." POD: "..(Actual.pod+mod(Actual,"pod")),offV_x,offV_y+(24*t))
            t = t + 1
        end

        if (Actual.agi+mod(Actual,"agi"))>9 and (Actual.dex+mod(Actual,"dex"))>9 then
            love.graphics.print("AGI: "..(Actual.agi+mod(Actual,"agi")),offV_x,offV_y+(24*t))
             t = t + 1
            love.graphics.print("DES: "..(Actual.dex+mod(Actual,"dex")),offV_x,offV_y+(24*t))
             t = t + 1
        else
            love.graphics.print("AGI: "..(Actual.agi+mod(Actual,"agi")).." DES: "..(Actual.dex+mod(Actual,"dex")),offV_x,offV_y+(24*t))
             t = t + 1
        end

        love.graphics.print("FUE: "..(Actual.fue+mod(Actual,"fue")),offV_x,offV_y+(24*t))
        t = t + 1

        

    end
end
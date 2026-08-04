function Graficos_Batalla.debug_log()

    love.graphics.setColor(0,255,0)
                

     if ERROR_MENU~= "" then
        --love.graphics.print( " "..  ERROR_MENU.." ",30,114+(24*-5))
    end
    if Actual.tipo=="player" then
        local value= 3-Actual.sheet[4]
        love.graphics.print( "Debug: >"..Debug_temp.."  "..Acc..State,30,114+(24*-4))

        --love.graphics.print( "Debug: >"..State.." ".. Acc,30,114+(24*-4))

        --love.graphics.print( "Debug: >"..Op.." ".. ini_view.."-"..fin_view.."  ",30,114+(24*-4))
    end
     if Cancel_ejecutar then
       -- love.graphics.print( "Cancel: true",30,120+(24*-2))
     else   
        --love.graphics.print( "Cancel: false",30,120+(24*-2))
     end

    if Execute then
        --love.graphics.print( "timer: ".." true "..timer_wait.." ",30,120+(24*-3))
    else
        --love.graphics.print( "timer: ".." false "..timer_wait.." ",30,120+(24*-3))
    end


    if Replace_Acc then
        --love.graphics.print( "T debug: "..Acc.." "..State.." "..Msg_debug,30,120+(24*-3))
     else   
        -- love.graphics.print( "F debug: "..Acc.." "..State.." "..Msg_debug,30,120+(24*-3))
     end


     if true and not ERROR_MSG=="" then
        love.graphics.print( "ERROR: "..ERROR_MSG,30,120+(24*-3))
     end

    if true and not INTERRUCCION_MSG=="" then
        love.graphics.print( "ERROR: "..ERROR_MSG,30,120+(24*-4))
     end

     love.graphics.setColor(255,255,255) -- reset colours
end
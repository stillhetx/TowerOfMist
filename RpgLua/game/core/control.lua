function main_control(key,scancode,isrepeat)

    if key == "f11" then
		fullscreen = not fullscreen
		love.window.setFullscreen(fullscreen, "exclusive")
	end

    if B_wait==false then        
            if Show_view=="graph" then
                if Modo=="combat" then
                    if Actual.tipo=="player" and Actual.live==true and auto==false then
                        if key=="x" then
                            comeback()
                        end
                        if key=="z" then
                            acciones()
                        end
                        if key=="a" then
                            boton_a()
                        end
                        if key=="s" then
                            boton_s()
                        end
                        if key=="up" then
                            up()
                        end
                        if key=="down" then
                            down()
                        end
                        if key=="left" then
                            left()
                        end
                        if key=="right" then
                            right()
                        end
                        if key=="p" then
                            perfil()
                        end
                        if key=="o" then
                            perfil()
                        end
                        if key=="r" then
                            reset()
                        end
                        inside()
                    end
                elseif Modo=="WIN" then
                    if key=="z" then
                        nextLevel() 
                    end
                end
            end


    end    

end    




function main_standBy(key,scancode,isrepeat)
                if key=="p" then
                    perfil()
                end
                if key=="z" then
                    Show_view="graph" 
                    Modo="combat"
                    nextLevel()
                end
end

function main_control_travel(key,scancode,isrepeat)
    if key=="z" then
        Eventos.evento_Z()
    end
    if key=="up" then
        Eventos.evento_up()
    end
    if key=="down" then
        Eventos.evento_down()
    end
    if key=="left" then
        Eventos.evento_left()
    end
    if key=="right" then
        Eventos.evento_right()
    end
    if key=="p" then
        ComeBackView="travel"
        perfil()
    end
end

Acciones_secundarias={"huir","extra","arma","compl."}


function boton_a()
    if State=="select" then
        State="secundario"
    end
    if State=="secundario" then
        State="select"
    end
end    

function boton_s()
    if State=="secundario" then
        State="select"
    end
    if State=="select" then
        State="secundario"
    end
end  

function up()
    Op=Op-1  
end    

function down()
    Op=Op+1
end    

function comprobar_arrow()
    if State=="select" then
        if Op<1 then
            Op=#Actual.acc
        end
    end
    if State=="select o" and Acc=="magic" then
        if Op<1 then
            Op=#Actual.mg
        end
        if Op>18 then
            ini_view=ini_view+6
        end

    end
    if State=="select o" and Acc=="spirit" then
        if Op<1 then
            Op=#Actual.spirit
        end
    end
    if State=="select o" and Acc=="tecnica" then
        if Op<1 then
            Op=#Actual.sk
        end
    end
    if State=="select e" then
        if Op<1 then
            Op=#Show_enemy
        end
    end
    if State=="select c" then
        if Op<1 then
            Op=#ActiveParty
        end
    end
    if State=="select i" then
        if Op<1 then
            Op=#items
        end
    end  
    if State=="select a" then
        if Op<1 then
            Op=#lista_todos
        end
    end  

    if State=="select" then
        if Op>#Actual.acc then
            Op=1
        end
    end
    if State=="select o" and Acc=="magic" then
        if Op>#Actual.mg then
            Op=1
        end
    end
    if State=="select o" and Acc=="spirit" then
        if Op>#Actual.mg then
            Op=1
        end
    end
    if State=="select o" and Acc=="tecnica"   then
        if Op>#Actual.sk then
            Op=1            
        end
    end
    if State=="select e" then
        if Op>#Show_enemy then
            Op=1
        end
    end  
    if State=="select c" then
        if Op>#ActiveParty then
            Op=1
        end
    end
    if State=="select i" then
        if Op>#items then
            Op=1
        end
    end     
    if State=="select a" then
        if Op>#lista_todos then
            Op=1
        end
    end   

end    


function right()
    if State=="select" then
        --down()
        Op=Op+6
        ini_view=ini_view+6
        --State="secundario"
    end 
    if State=="select o" and Acc=="magic" then
         Op=Op+6

    end 
    if State=="select e" then
        State="select c"  
    elseif State=="select c" then
        State="select e"
        FiltrarEnemigoVivos()
    end     
end   

function left()
    if State=="select" then
                Op=Op-6
        ini_view=ini_view-6
        --up()
    end 
    if State=="select o" and Acc=="magic" then
         Op=Op-6
    end 
    if State=="secundario" then
        State="select"
    end 
    if State=="select e" then
        State="select c"
    elseif State=="select c" then
        State="select e"
        FiltrarEnemigoVivos()
    end     
end   




Objeto_selec={}





 


function comeback()
    if State=="select" then
        --next()
    elseif State=="select o" then
        if Acc == "tecnica" or Acc == "magic" or Acc == "W.Arts"  or Acc == "especiales"
        or Acc == "tecnica" or Acc == "objeto" or Acc =="mix" or Acc=="bailes" 
        or Acc=="invocar" or Acc=="llamar" or Acc=="tools"  
        or Acc=="transformacion" or Acc=="Blu.magic" or Acc=="bullet"
        or Acc=="Power.Stone"  or Acc=="spell.list" or Acc=="runes" 
        or Acc=="dual M." or Acc=="spirit" or Acc=="ninja" or Acc=="espada" or Acc=="canciones" 
        or  Acc=="evocar"  then
            State ="select"
            Acc=""
        end 

        --acc={"atacar","W.Arts","tecnica","objeto","defensa"},
    elseif State=="select l" then
        if Acc=="colecciones" or Acc=="magics" then
            State ="select"
            Acc=""            
        end
    elseif State=="select e" then
        if  Acc=="atacar" or Acc=="robar" or Acc=="furia" or Acc=="saltar"  or Acc=="darkness" or Acc=="extraer" 
        or Acc=="atrapar" or Acc=="asesinar" or Acc=="rapido"
        or Acc=="extraer" or Acc=="cargar" or Acc=="quitar" 
        or Acc=="combo"then
            State ="select"
            Acc=""
        end

        if  Acc == "tecnica" or Acc == "magic" or Acc == "W.Arts"  or Acc == "especiales"
        or Acc == "tecnica" or Acc == "objeto" or Acc =="mix" or Acc=="bailes" 
        or Acc=="invocar" or Acc=="llamar" or Acc=="tools"  
        or Acc=="transformacion" or Acc=="Blu.magic" or Acc=="bullet"
        or Acc=="Power.Stone"  or Acc=="spell.list" or Acc=="runes" 
        or Acc=="dual M." or Acc=="spirit" or Acc=="ninja" or Acc=="espada" or Acc=="canciones" 
        or  Acc=="evocar" then
            State="select o"
            Mg_sel=""
            Dirr=""
        end
        ini_view=1
        fin_view=1
    elseif State=="select c" then
        if   Acc == "tecnica" or Acc == "magic" or Acc == "W.Arts"  or Acc == "especiales"
        or Acc == "tecnica" or Acc == "objeto" or Acc =="mix" or Acc=="bailes" 
        or Acc=="invocar" or Acc=="llamar" or Acc=="tools"  
        or Acc=="transformacion" or Acc=="Blu.magic" or Acc=="bullet"
        or Acc=="Power.Stone"  or Acc=="spell.list" or Acc=="runes" 
        or Acc=="dual M." or Acc=="spirit" or Acc=="ninja" or Acc=="espada" or Acc=="canciones" 
        or  Acc=="evocar" then
            State="select o"
            Mg_sel=""
            Dirr=""
        end
        if  Acc=="objeto" or Acc=="usar"  then
            State="select i"
            Mg_sel=""
            Dirr=""
        end
    elseif State=="select i" then
        if  Acc=="objeto" or Acc=="usar" then
            State="select"
            Acc=""
            Mg_sel=""
            Dirr=""
        end        
    end

    inside()
end

spell_data={}


function perfil()
    Show_view="perfil"
    Perfil.showPerfil="perfil"
    if Opm<1 then
        Opm=#ActiveParty[Perfil.seePerfil].opciones
    end    
    if Opm>#ActiveParty[Perfil.seePerfil].opciones then
        Opm=1
    end  
end 




Eventos={}
Eventos.top_cards={intro_card={id="guia_1"},}
--Definir mapa
Eventos.level_card=lugares["escape_Bosque"]
--Definir nivel
Eventos.carta_actual=Eventos.level_card[1]
Eventos.travel=1
Eventos.op_menu=1
Eventos.op_character=1
Eventos.resulto=false

--variables sobrantes
ccc=0
Debug_temp=""

msg_resolucion=""
---------------------


function Eventos.updateCard()
    if not Eventos.resulto then
        Eventos.concecuencias()
    end    
end




function Eventos.evento_up()
    Eventos.op_menu=Eventos.op_menu-1
    Eventos.evento_verify()
end


function Eventos.evento_down()
    Eventos.op_menu=Eventos.op_menu+1
    Eventos.evento_verify()
end


function Eventos.evento_left()
    Eventos.op_character=Eventos.op_character-1
    Eventos.character_verify()
end

function Eventos.evento_right()
    Eventos.op_character=Eventos.op_character+1
    Eventos.character_verify()
end


function Eventos.evento_verify()

    if Eventos.op_menu <1 then
        Eventos.op_menu=#Eventos.carta_actual.opciones
    end
    if Eventos.op_menu> #Eventos.carta_actual.opciones then
        Eventos.op_menu=1   
    end    

end

function Eventos.character_verify()

    if Eventos.op_character <1 then
        Eventos.op_character=#ActiveParty
    end
    if Eventos.op_character> #ActiveParty then
        Eventos.op_character=1   
    end    

end



--[[
        [1]={["label"]="Constitucion",["req"]="(12 DC)", cost=0, type="stat",name=""},
        [2]={["label"]="Magia",["req"]="(4 MP)", cost=4, type="MP",name=""},
        [3]={["label"]="Bomba",["req"]="(1 items)", cost=1, type="items",name="bomba"},
        [4]={["label"]="",["req"]="", cost=4, type="items",name="bomba"},

]]

function Eventos.evento_Z()
    local temp={}
    local number=0
    local desk={}

    local eleccion = Eventos.carta_actual.opciones[Eventos.op_menu].type
    ccc=ccc+1



    if eleccion == "next" then
        Eventos.resulto=false
        Eventos.travel = Eventos.travel+1
        temp = Eventos.level_card[Eventos.travel]
        if temp.tipo == "mazo" then
            --desk=temp.deck
            number = rnd(#cards)
            Eventos.carta_actual = cards[number]
        end
        if temp.tipo == "mensaje" then
            --desk=temp.deck
            Eventos.carta_actual = Eventos.level_card[Eventos.travel]
        end
        if temp.tipo == "get" then
            --desk=temp.deck
            Eventos.carta_actual = Eventos.level_card[Eventos.travel]
            posible_new_character()
        end

    end

   -- Debug_temp=eleccion

    if eleccion == "node" then
        Eventos.level_card = lugares[Eventos.carta_actual.opciones[Eventos.op_menu].nodoName]
        Eventos.carta_actual = Eventos.level_card[1]
        Eventos.travel = 1
        Eventos.op_menu = 1
    end

    if eleccion == "reinciar" then
        Eventos.carta_actual = Eventos.level_card[1]
        Eventos.travel = 1
        Eventos.op_menu = 1
    end

    if eleccion == "battle" then
        Show_view="graph"
        Config.Pos_monster(Eventos.carta_actual.opciones[Eventos.op_menu].nodoName)
        enemyGroups=horda[Eventos.carta_actual.opciones[Eventos.op_menu].nodoName]
    end


    if eleccion == "aceptar"  then
        if Eventos.carta_actual.opciones[Eventos.op_menu].gain=="addPNJ" then
            posible_new_character()
            add_rnd_character()
            Eventos.travel = Eventos.travel+1
            Eventos.carta_actual = Eventos.level_card[Eventos.travel]
        end
    end    

    if eleccion =="tienda" then 
        Tienda.etapa="begin"
        Tienda.Name_store=Tiendas[Eventos.carta_actual.opciones[Eventos.op_menu].nodoName].name
        Tienda.ListaStore=Tiendas[Eventos.carta_actual.opciones[Eventos.op_menu].nodoName].itemsList
        Tienda.tipo=Tiendas[Eventos.carta_actual.opciones[Eventos.op_menu].nodoName].tipo
        Tienda.inn_cost=Tiendas[Eventos.carta_actual.opciones[Eventos.op_menu].nodoName].inn_cost
        Show_view="tienda"
    end


    if Eventos.resulto then
        Eventos.resulto=false
        Eventos.travel = Eventos.travel+1
        temp = Eventos.level_card[Eventos.travel]
        Eventos.op_menu=1
        if temp.tipo == "mazo" then
            --desk=temp.deck
            number = rnd(#cards)
            Eventos.carta_actual = cards[number]
        end
        if temp.tipo == "mensaje" then
            --desk=temp.deck
            Eventos.carta_actual = Eventos.level_card[Eventos.travel]
        end
    else
        if eleccion == "stat" and Eventos.resulto==false then
            local result=0
            if Eventos.carta_actual.opciones[Eventos.op_menu].stat=="con" then
                result=ActiveParty[Eventos.op_character].con+mod(ActiveParty[Eventos.op_character],"con")+rnd(20)
            end
            if Eventos.carta_actual.opciones[Eventos.op_menu].stat=="dex" then
                result=ActiveParty[Eventos.op_character].dex+mod(ActiveParty[Eventos.op_character],"dex")+rnd(20)
            end
            if Eventos.carta_actual.opciones[Eventos.op_menu].stat=="int" then
                result=ActiveParty[Eventos.op_character].int+mod(ActiveParty[Eventos.op_character],"int")+rnd(20)
            end

            if result>= Eventos.carta_actual.opciones[Eventos.op_menu].dc then
                msg_resolucion="exitoso DC="..result
            else
                msg_resolucion="Falla DC="..result    
            end

            Eventos.resulto=true
            Eventos.op_menu=1
        end

        if eleccion == "MP" and Eventos.resulto==false then
            ActiveParty[Eventos.op_character].mp_=ActiveParty[Eventos.op_character].mp_-Eventos.carta_actual.opciones[Eventos.op_menu].cost
            msg_resolucion="exitoso"
            Eventos.resulto=true
            Eventos.op_menu=1
        end
        if eleccion == "items" and Eventos.resulto==false then

        end
        if eleccion == "SP_items" and Eventos.resulto==false then

        end
    end
end

function Eventos.concecuencias()

end

function Eventos.evento_X()
    
end


function Eventos.accion_opcion()

end



--legado
function Un_boton()
    love.graphics.setColor(0,0,0)
    if Eventos.op_menu==1 then
        love.graphics.rectangle("line", 16,336, 302, 58)
    end
    love.graphics.rectangle("line", 20,340, 294, 50)
    love.graphics.print( Eventos.carta_actual.opciones[1].label, 25,345)
    love.graphics.print( Eventos.carta_actual.opciones[1].req, 25,365)

end
--legado
function Dos_botones()
    love.graphics.setColor(0,0,0)
    if Eventos.op_menu==1 then
        love.graphics.rectangle("line", 16,336, 302, 58)
    elseif Eventos.op_menu==2 then
        love.graphics.rectangle("line", 326-4,340-4, 294+8, 50+8)
    end
    love.graphics.rectangle("line", 20,340, 294, 50)
    love.graphics.rectangle("line", 326,340, 294, 50)
    love.graphics.print( Eventos.carta_actual.opciones[1].label, 25,345)
    love.graphics.print( Eventos.carta_actual.opciones[1].req, 25,365)
    love.graphics.print( Eventos.carta_actual.opciones[2].label, 331,345)
    love.graphics.print( Eventos.carta_actual.opciones[2].req, 331,365)

end
--legado
function Tres_botones()
    love.graphics.setColor(0,0,0)

    if Eventos.op_menu==1 then
        love.graphics.rectangle("line", 16,336, 302, 58)
    elseif Eventos.op_menu==2 then
        love.graphics.rectangle("line", 326-4,340-4, 294+8, 50+8)
    elseif Eventos.op_menu==3 then
        love.graphics.rectangle("line", 20-4,400-4, 294+8, 50+8)
    end
    love.graphics.rectangle("line", 20,340, 294, 50)
    love.graphics.rectangle("line", 326,340, 294, 50)
    love.graphics.rectangle("line", 20,400, 294, 50)
    love.graphics.print( Eventos.carta_actual.opciones[1].label, 25,345)
    love.graphics.print( Eventos.carta_actual.opciones[1].req, 25,365)
    love.graphics.print( Eventos.carta_actual.opciones[2].label, 331,345)
    love.graphics.print( Eventos.carta_actual.opciones[2].req, 331,365)
    love.graphics.print( Eventos.carta_actual.opciones[3].label, 25,405)
    love.graphics.print( Eventos.carta_actual.opciones[3].req, 25,425)
end

--legado
function Cuatro_botones()
    love.graphics.setColor(0,0,0)

    if Eventos.op_menu==1 then
        love.graphics.rectangle("line", 16,336, 302, 58)
    elseif Eventos.op_menu==2 then
        love.graphics.rectangle("line", 326-4,340-4, 294+8, 50+8)
    elseif Eventos.op_menu==3 then
        love.graphics.rectangle("line", 20-4,400-4, 294+8, 50+8)
    elseif Eventos.op_menu==4 then
        love.graphics.rectangle("line", 326-4,400-4, 294+8, 50+8)
    end

    love.graphics.rectangle("line", 20,340, 294, 50)
    love.graphics.rectangle("line", 326,340, 294, 50)
    love.graphics.rectangle("line", 20,400, 294, 50)
    love.graphics.rectangle("line", 326,400, 294, 50)
    love.graphics.print( Eventos.carta_actual.opciones[1].label, 25,345)
    love.graphics.print( Eventos.carta_actual.opciones[1].req, 25,365)
    love.graphics.print( Eventos.carta_actual.opciones[2].label, 331,345)
    love.graphics.print( Eventos.carta_actual.opciones[2].req, 331,365)
    love.graphics.print( Eventos.carta_actual.opciones[3].label, 25,405)
    love.graphics.print( Eventos.carta_actual.opciones[3].req, 25,425)
    love.graphics.print( Eventos.carta_actual.opciones[4].label, 331,405)
    love.graphics.print( Eventos.carta_actual.opciones[4].req, 331,425)
end
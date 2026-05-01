require("game/global")

require("game/tablas/tablas")
require("game/tablas/tabla_efecto")
require("game/tablas/tabla_jobs")
require("game/tablas/tabla_acciones_enemy")
require("game/tablas/tabla_IA_enemy")
require("game/tablas/tabla_gambit")

require("game/flag_events")

require("game/tablas/tabla_tarjetas")
require("game/tablas/lista_enemigo")
require("game/tablas/tabla_enemy")


require("game/element/questEntity")
require("game.element.TiendaNPC")



require("game/gamelogic")
require("game/core/config_table")
require("game/graficos/graficos")
require("game/core/util")
require("game/core/control")
require("game/combat/acciones")
require("game/combat/info")
require("game/mapa/map")
require("game/mapa/eventosCards")

require("game/combat/chraracter")
require("game/combat/comandos")
require("game/combat/ejecutar")
require("game/combat/skill")


require("game/combat/enemy")



require("game/graficos/graficos_perfil")
require("game/graficos/graficos_batalla")
require("game/graficos/graficos_tienda")

require("game/graficos/graficos_travel")

--function nextLevel() 

table.unpack = table.unpack or unpack

love.graphics.setDefaultFilter("nearest", "nearest")

dmg_timer=0
react_time_max_var=22

sprites={}

function love.load()
    love.filesystem.write("logfile.txt", "Inicio del log\n")
    
    min_dt = 1/30 --fps
    next_time = love.timer.getTime()
    fondo = love.graphics.newImage("fondo.png")
    spr_animacion= loadSpritesheet("animacion.png", 16)
    sprites = loadSpritesheet("pico-rpg.png", 16)
    caja_texto= loadSpritesheet("MsgSprite.png", 8)
    fondo_pasto=love.graphics.newImage("Fondo_pasto.png")
    fondo_sprites= loadbackGround("Fondos_sheet.png", 152, 15)
    img_intro=love.graphics.newImage("intro.png")
    Finish_fight=love.graphics.newImage("Finish_fight.png")
    --newSprites = loadSpritesheet("pico-rpg.png", 16)
    backgroundTile = loadSpritesheet("backgroundTile.png", 16)
    spritesEstados = loadSpritesheet("estados_alterados.png", 10)
    spritesIcon= loadSpritesheet("icon.png", 4)
    love.window.setTitle( "Tower of mist" )
    --love.window.setMode(game_width, game_height, {resizable = true, minwidth = 128, minheight = 128})
    love.window.setMode(640, 480, {
        resizable = true,
        minwidth = VIRTUAL_WIDTH,
        minheight = VIRTUAL_HEIGHT,
        highdpi = false
    })
    local fontSize = 16
    local font = love.graphics.newFont("PixeloidSans-Bold.ttf",fontSize)    
    love.graphics.setFont(font)
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.scale(scale)
    _init()
end



function love.draw()
    local cur_time = love.timer.getTime()
    if next_time <= cur_time then
        next_time = cur_time
        return
    end

    local sw, sh = love.graphics.getDimensions()
    local scale = math.min(sw / game_width, sh / game_height)
    local xoff = (sw - game_width * scale) / 2
    local yoff = (sh - game_height * scale) / 2

    love.graphics.push()
    love.graphics.translate(xoff, yoff)
    love.graphics.scale(scale, scale)
    _draw()
    love.graphics.pop()

    love.timer.sleep(next_time - cur_time) 
end


function love.update()
    next_time = next_time + min_dt
    if Op==nil then
        Op=1
    end
    if Show_view == "graph" or Show_view == "perfil" or Show_view == "standBy" or Show_view == "store" then
        _update()
    end
    if Show_view == "travel" or Show_view == "tienda" then
        _update_travel()
    end
end    

function max_level()
    if Nvg > #enemyGroups then
        Nvg=0
    end    
end    


test=false
posible_char={}



---cambiar RND
---
---
---
function _init()
    Config.Config_table()
    local o = enemyGroups
    if true then
        if true then
            --30 cristales, extraer // nunca lo termine
            --9 es la clase mas complicada
            local a =2
            local b =2
            local c =2
            --primero 
            local r=copiar_tabla(Nuevas_clases[a])
            r.ini=Nuevas_clases[a].agi+flr(rnd(20))
            r.p=1
            r.id=Nuevas_clases[a].id..1
            r.name=Nuevas_clases[a].name
            r.x=posiciones_jugadores[1].x   
            r.y=posiciones_jugadores[1].y   
            r.x_=posiciones_jugadores[1].x   
            r.y_=posiciones_jugadores[1].y   
            r.hp_=r.hp+mod(r,"hp")
            r.hp=r.hp_
            r.mp_=r.mp+mod(r,"mp")
            r.mp=r.mp_
            r.mag=General_magics(Nuevas_clases[a])
            r.col=General_coleccion(Nuevas_clases[a])
            r.acc=General_lista(Nuevas_clases[a])
            add(ActiveParty,r)
            add(Show_party,r)
            add(Order, r)
            --segundo
            r=copiar_tabla(Nuevas_clases[b])
            r.ini=Nuevas_clases[b].agi+flr(rnd(20))
            r.p=2
            r.id=Nuevas_clases[b].id..2
            r.name=Nuevas_clases[b].name
            r.x=posiciones_jugadores[2].x   
            r.y=posiciones_jugadores[2].y   
            r.x_=posiciones_jugadores[2].x   
            r.y_=posiciones_jugadores[2].y  
            r.hp_=r.hp+mod(r,"hp")
            r.hp=r.hp_
            r.mp_=r.mp+mod(r,"mp")
            r.mp=r.mp_
            r.mag=General_magics(Nuevas_clases[b])
            r.col=General_coleccion(Nuevas_clases[b])
            r.acc=General_lista(Nuevas_clases[b])
            add(ActiveParty,r)
            add(Show_party,r)
            add(Order, r)
            --tercera
            r=copiar_tabla(Nuevas_clases[c])
            r.ini=Nuevas_clases[c].agi+flr(rnd(20))
            r.p=3
            r.id=Nuevas_clases[c].id..3
            r.name=Nuevas_clases[c].name  
            r.x=posiciones_jugadores[3].x   
            r.y=posiciones_jugadores[3].y 
            r.x_=posiciones_jugadores[3].x   
            r.y_=posiciones_jugadores[3].y   
            r.hp_=r.hp+mod(r,"hp")
            r.hp=r.hp_
            r.mp_=r.mp+mod(r,"mp")
            r.mp=r.mp_
            r.mag=General_magics(Nuevas_clases[c])
            r.col=General_coleccion(Nuevas_clases[c])
            r.acc=General_lista(Nuevas_clases[c])
            add(ActiveParty,r)
            add(Show_party,r)
            add(Order, r)
        else    
            for i=1,3 do
                local t=flr(rnd(#Nuevas_clases-1)+1)
                local r=copiar_tabla(Nuevas_clases[t])
                r.ini=Nuevas_clases[t].agi+flr(rnd(20))
                r.p=i
                r.id=Nuevas_clases[t].id..i
                r.name=Nuevas_clases[t].name
                r.x=posiciones_jugadores[i].x   
                r.y=posiciones_jugadores[i].y    
                r.x_=posiciones_jugadores[i].x   
                r.y_=posiciones_jugadores[i].y  
                r.hp_=r.hp+mod(r,"hp")
                r.mp_=r.mp+mod(r,"mp")
                r.acc=General_lista(Nuevas_clases[i])
                add(ActiveParty,r)
                add(Show_party,r)
                add(Order, r)
            end
        end
    else
        for i=1,1 do
                local t=flr(rnd(#Nuevas_clases-1)+1)
                local r=copiar_tabla(Nuevas_clases[t])
                r.ini=Nuevas_clases[t].agi+flr(rnd(20))
                r.p=i
                r.id=Nuevas_clases[t].id..i
                r.name=Nuevas_clases[t].name
                r.x=posiciones_jugadores[i].x   
                r.y=posiciones_jugadores[i].y    
                r.x_=posiciones_jugadores[i].x   
                r.y_=posiciones_jugadores[i].y  
                r.hp_=r.hp+mod(r,"hp")
                r.mp_=r.mp+mod(r,"mp")
                add(ActiveParty,r)
                add(Show_party,r)
                add(Order, r)
        end   
    end
    --enemyGroups=horda["00001"]
    Config.Pos_monster_Nvg()
    o = enemyGroups
    for k,v in pairs(o[Nvg].enemyTeams) do
        local r = copiar_tabla(v)
        r.ini=r.agi+flr(rnd(20))
        r.id=v.id
        add(Order, r)
        add(Total_enemy,r)
        add(EnemigosVivos,r)
        add(Show_enemy,r)
    end
    All=Order
    Atributos_por_nivel()
    Order=Turnos(All)
    --ListaTurnos=Turnos(Order)
    --qsort(Order, function(a,b) return abs(a.ini) > abs(b.ini) end)
    State="select"
    wait_start()
end

function wait_start()
    B_wait=true
    timer_wait=0
    Actual=Order[Turno]
end

function init_player(v)
    if Init_b then
        Actual=Order[Turno]
        Init_b=false
        Op=1
    end  
end

function love.keypressed(key, scancode, isrepeat)
    if Show_view == "graph"   then
        main_control(key,scancode,isrepeat)
    end
    if Show_view == "perfil" then 
        main_perfil(key,scancode,isrepeat)
    end
    if Show_view == "standBy"  then
        main_standBy(key,scancode,isrepeat)
    end
    if Show_view == "travel" then
        main_control_travel(key,scancode,isrepeat)
    end    

    if Show_view=="tienda" then
        Tienda.control_tienda(key,scancode,isrepeat)
    end
end

function _draw()
    if Show_view == "graph" then
        graph_mode()
    end 
    if Show_view == "perfil" then
        perfil_mode()
    end  

    if Show_view == "standBy" then
        standBy_mode()
    end  

    if Show_view == "travel" then
        EventosCards()
    end   

    if Show_view == "tienda" then
        Tienda_mode()
    end   
    
    if Show_view == "overWorld" then
        overWorld()
    end   
end







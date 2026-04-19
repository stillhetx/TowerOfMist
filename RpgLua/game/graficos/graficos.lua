local msg_exito_max_time=30
local msg_exito_cont_time=0
local msg_exito_bol=false

Icon_element={fuego=13,agua=17,hielo=15,electricidad=12,bio=16,aire=14,
paralisis=5,congelar=6,congelado=6,veneno=11,confundir=0,dormir=29,marca=18,super=7,stun=48,
fuerte=7,preciso=18,lento=32,rapido=10,debil=33, fortificado=31,vulnerable=30,regeneracion=29,
bonus_ataque=68,bonus_soporte=67,bonus_heal=69,
lesion=92, sangrado=91, toxico=90, zombi=89, trasmutado=84, mojado=17, quemado=13,miedo=8,
ceguera=96,silencio=97, atrapado=101, herido=95, antimagia=102,bonus_magia=104,bonus_turno=105,
}

Icon_extra={
    fullCharge=35,emptyCharge=36,shield=34,magic_0=24,magic_1=25,magic_2=26,magic_3=27,magic_4=28,gault_1=64,gault_2=65,gault_3=66,
    boton_A=40,boton_A_down=50,super=7,potenciado=7,RC=44,punto=45,bonus_ataque=65,bonus_soporte=64,bonus_heal=66,modo_defensa=93,
    modo_vuelo=4, delay_1=98, delay_2=99, delay_3=100, Base_charge=106,
    Color_red=74,Color_blue=75,Color_green=73,Color_orange=79,Color_white=76,Color_grey=79,Color_light_blue=107,
    Color_yellow=77,Color_purple=78,Color_brown=79,Color_pink=81
    
}

--grey,   nocolor, 

poss_magic_charge={
    [1]={x=6,y=-22},
    [2]={x=18,y= -10},
    [3]={x=6,y=2},
    [4]={x=-6,y=-10},
}

local texto_help=""

local total=0

local barWidth = 20
local barHeight = 4


local itemsPerColumn = 6
local columnSpacing = 180  -- Espacio horizontal entre columnas
local rowSpacing = 16      -- Espacio vertical entre filas




function bonus_boton()

    if msg_exito_bol then
        love.graphics.setColor(0, 1, 0)
        love.graphics.print( "Exito",330,120+(msg_exito_cont_time*-2))
        love.graphics.setColor(1, 1, 1)
    end
    if animated_bonus_boton then
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill",320,120,2,120)
        love.graphics.setColor(0, 1, 0)
        love.graphics.rectangle("fill",320,120,2,40)
        love.graphics.setColor(1, 1, 1)

        local steps=lerp(0,120,bonus_boton_time_max)

        if Buton_bonus==0 then
            spr_sheet(Icon_extra["boton_A_down"],306,220+(bonus_boton_time_cont*-steps),1,1,1,1,spritesEstados)
        else
            spr_sheet(Icon_extra["boton_A"],306,220+(bonus_boton_time_cont*-steps),1,1,1,1,spritesEstados)
            msg_exito_bol=true
        end

    end

end    

TILE_SIZE_MSG_hight=1
TILE_SIZE_MSG_wide=1
function cuadroTexto(x,y,h,w)


    spr_full(0,x,y,TILE_SIZE_MSG_hight,2,caja_texto)
    spr_full(2,x+(w*4),y,TILE_SIZE_MSG_hight,TILE_SIZE_MSG_wide,caja_texto)
    spr_full(32,x,y+(h*4),TILE_SIZE_MSG_hight,TILE_SIZE_MSG_wide,caja_texto)
    spr_full(33,x+(w*4),y+(h*4),TILE_SIZE_MSG_hight,TILE_SIZE_MSG_wide,caja_texto)

    for i=1, w-1 do
        spr_full(1,x+(i*4),y,TILE_SIZE_MSG_hight,TILE_SIZE_MSG_wide,caja_texto)
        spr_full(1,x+(i*4),y+(h*4),TILE_SIZE_MSG_hight,TILE_SIZE_MSG_wide,caja_texto)
    end
    for i=1, h-1 do
        spr_full(16,x,y+(i*4),TILE_SIZE_MSG_hight,TILE_SIZE_MSG_wide,caja_texto)
        spr_full(16,x+(w*4),y+(i*4),TILE_SIZE_MSG_hight,TILE_SIZE_MSG_wide,caja_texto)
    end

    for i=1, w-1 do
        
    end

    --spr_sheet(v.spr,v.x,v.y,1,1,1,1,backgroundTile)
    
end

function spr_full(n,x,y,t_h,t_w,sheet)

    t_w = t_w or 1
    t_h = t_h or 1
    --flip_x = flip_x or false
    --flip_y = flip_y or false
    local quad = sheet.quads[n + 1]
    
    if quad then
        love.graphics.draw(
            sheet.image, quad, x, y,0, t_w,t_h
        )
    end

end

function fondo_background()
    spr(lista_fondo[enemyGroups[Nvg].fondo],16,16+20,2,2,false,false, fondo_sprites)

    --spr(3,16,16+20,2,2,false,false,fondo_sprites)
end

function mostrar_background()
    for i,v in pairs(lista_terreno[enemyGroups[Nvg].terrain]) do
        spr_sheet(v.spr,v.x,v.y,1,1,1,1,backgroundTile)
    end
end    

function Mostrar_animacion_ataque(v,x,y,bol)
    if v.hp_>0 then
        if v.attack then
            if v.anim_acc ~= nil and v.anim_acc ~="" then
                anim_general(v.anim_acc,x,y,2,2,true,v.anim_col,bol)  
            end  
        end
    end
end


function Mostrar_animacion_dmg(v,x,y,bol)
    if  v.react then
        if v.anim_acc ~= nil and v.anim_acc ~="" then
            dmg_timer=dmg_timer+1
            anim_general(v.anim_acc,x,y,2,2,true,v.anim_col,bol)  
        else
            dmg_timer=0
        end
    end    
end    

function Mostrar_animacion_summon(v,x,y,bol)
    if  v.summon then
        if v.ani_summon ~= nil and v.ani_summon ~="" then
            anim_summon(v.ani_summon,x,y,2,2,true,{1,1,1,1},bol)  
        end
    end        
end   


function Mostrar_rc(v,x,y,bol)
    if v.seeRC then
        if v.rc_>0 then
            for i=1, v.rc_ do
                    spr_sheet(Icon_extra["RC"],(x),y+(i*20)-10,1,1,1,1,spritesEstados)
            end
            
        end
    end
end    

function Mostrar_barra(v,x,y,bol)
    if v.seeAP then
        if v.gl_>0 then
            for i=1, v.gl_ do
                if i==1 then
                    spr_sheet(Icon_extra["gault_1"],(x),y-(i*13)-10,1,1,1,1,spritesEstados)
                elseif i==5 then 
                    spr_sheet(Icon_extra["gault_3"],(x),y+11-(i*13),1,1,1,1,spritesEstados)
                else
                    spr_sheet(Icon_extra["gault_2"],(x),y-(i*13),1,1,1,1,spritesEstados)
                end
            end
            
        end
    end
end

function Mostrar_icon_mode(v,x,y,bol)
    if v.modo=="defense" then
        spr_sheet(Icon_extra["modo_defensa"],x+56,y+34,1,1,1,1,spritesEstados)
    end

    if v.modo=="vuelo" then
        spr_sheet(Icon_extra["modo_vuelo"],x-46,y+34,1,1,1,1,spritesEstados)
    end
end

function Mostrar_shield(v,x,y,bol)
        if v.sh_>0 then
            for i=1, v.sh_ do
                spr_sheet(Icon_extra["shield"],(x)+(i*26),y,1,1,1,1,spritesEstados)
            end
        end
end

function Mostrar_extra(v,x,y,bol)
    if v.seeCharge then
        if v.carga==1 then
            spr_sheet(Icon_extra["fullCharge"],x,y,1,1,1,1,spritesEstados)
        else
            spr_sheet(Icon_extra["emptyCharge"],x,y,1,1,1,1,spritesEstados)
        end    
    end
    if v.seeMagicCharge then
            local str="magic_"..v.magicCharge
            spr_sheet(Icon_extra[str],x,y,1,1,1,1,spritesEstados)
            spr_sheet(Icon_extra["Base_charge"],x,y+28,1,1,1,1,spritesEstados)
            for i=1, #v.ArraySpell do
                    local strTemp= "Color_"..v.ArraySpell[i]
                    --love.graphics.print( " ["..strTemp.."]",x+16,y+(i*16))
                    spr_sheet(Icon_extra[strTemp],x+poss_magic_charge[i].x,y+poss_magic_charge[i].y+16+28,1,1,1,1,spritesEstados)
    end
    

            
    end

      --  if v.sh_>0 then
        --    for i=1, v.sh_ do
          --      spr_sheet(Icon_extra["shield"],(x-26)+(i*26),y+26,1,1,1,1,spritesEstados)
            --end
        --end
end


function barra_turnos(x,y)
    local d=0
    local max=0
    
    if 8< #Order-Turno then
        max=Turno+8
    else    
        max=#Order-Turno
    end
    if false then
        max=#Order
    end
    for i=Turno, max do 
        for ii=1, Order[i].ext+1 do
            d=d+1
            love.graphics.setColor(1, 1, 1)
            love.graphics.rectangle("line", x,y+(16*d), 16, 16)
            love.graphics.setColor(1, 1, 1)
            spr_sheet(Order[i].ico,x+2,y+2+(16*d),1,1,1,1,spritesIcon) 
        end
    end    
end    

function Mostrar_debilidades(v,x,y)
    if monster_weakness[v.id_mons] and  v.live  then
        local co=0
        for k,t in pairs(v.weak) do 
                spr_sheet(Icon_element[k],x+(16*-1)-(26*co*-1),y+4,1,1,1,1,spritesEstados)
                co=co+1
        end
    end  
end

function Mostrar_extra_acciones(v, x, y, inverso)
    if v.live then
        local co=0
        local signo=1
        if inverso then
            signo=-1
        end   
        if v.flee_attack>0 then
            spr_sheet(Icon_element["bonus_ataque"],x+(16*signo)-(26*co*signo)-40,y+4+16,1,1,1,1,spritesEstados)
            co=co+1
        end
        if v.flee_heal>0 then
            spr_sheet(Icon_element["bonus_heal"],x+(16*signo)-(26*co*signo)-40,y+4+16,1,1,1,1,spritesEstados)
            co=co+1
        end
        if v.flee_support>0 then
            spr_sheet(Icon_element["bonus_soporte"],x+(16*signo)-(26*co*signo)-40,y+4+16,1,1,1,1,spritesEstados)
            co=co+1
        end
        if v.flee_magic~=nil  and v.flee_magic > 0 then
        --if true then
            spr_sheet(Icon_element["bonus_magia"],x+(16*signo)-(26*co*signo)-40,y+4+16,1,1,1,1,spritesEstados)
            co=co+1
        end
        if  v.see_extra_turno  then
            spr_sheet(Icon_element["bonus_turno"],x+(16*signo)-(26*co*signo)-40,y+4+16,1,1,1,1,spritesEstados)
            co=co+1
        end
    end        
end

function isnotEmpty(t)
    if type(t) ~= "table" then return false end
    for _ in pairs(t) do
        return true  -- Si entra aquí, la tabla tiene al menos una entrada
    end
    return false  -- Si no entró al for, está vacía
end

function isEmpty(t)
    return not isnotEmpty(t)
end

function Mostrar_enlaze(v,x,y,inverso)
    if  isnotEmpty(v.enlaze_summon)  then
        anim_char_v2(v.enlaze_summon,x,y)
    end
end

function Mostrar_estados(v, x, y, inverso)
    if v.live then
        local co=0
        local signo=1
        if inverso then
            signo=-1
        end     
        for k,t in pairs(v.state) do
                --for kk,tt in pairs(t) do
                --love.graphics.print("key "..kk,x+(16*signo)-(26*signo),y+4)
                spr_sheet(Icon_element[t.id],x+(16*signo)-(26*co*signo),y+4,1,1,1,1,spritesEstados)
                co=co+1
                --end
        end
    end
end



function standBy_mode()

        love.graphics.draw(fondo,0,0)


    for i=1,#ActiveParty do
        if ActiveParty[i].live then
            love.graphics.print(ActiveParty[i].name.." HP: "..ActiveParty[i].hp_.."/"..ActiveParty[i].hp+mod(ActiveParty[i],"hp").." MP: "..ActiveParty[i].mp_.."/"..ActiveParty[i].mp+mod(ActiveParty[i],"mp"),20,2+(24*i))
        else
            love.graphics.print(ActiveParty[i].name.." HP: "..ActiveParty[i].hp_.."/"..ActiveParty[i].hp+mod(ActiveParty[i],"hp").." MP: "..ActiveParty[i].mp_.."/"..ActiveParty[i].mp+mod(ActiveParty[i],"mp"),20,2+(24*i))
        end        
    end

        mostrar_background()

        love.graphics.print( "modo:  "..Modo.." perfil: "..Show_view,30,120+(24*-1))


        love.graphics.print( "Bienvenido al descanzo",320,120+(24*0))
        love.graphics.print( "* Perfil [p]",320,120+(24*1))
        love.graphics.print( "* Continuar [z]",320,120+(24*2))


        for k,v in pairs(ActiveParty) do
            if v.see then  
                
                show_spr(v, (v.x),(v.y), v.x,v.y+20-timer_dmg_txt,(v.x),(v.y+20),Temp_c==v.id and State=="select c",false)  
                show_msg_dmg(v,v.x,v.y+20-timer_dmg_txt,false)
                Barra_vida(v, (v.x-14),(v.y)) --- -10 0     0   +20
                Mostrar_estados(v,(v.x-60),(v.y),false) --50 0
                Mostrar_animacion_ataque(v, (v.x+40),(v.y),false)
                Mostrar_animacion_dmg(v, (v.x),(v.y),false)
                Mostrar_extra(v, (v.x+56),(v.y),false)
                Mostrar_shield(v,(v.x-26),v.y+26,false)
                Mostrar_barra(v, (v.x-16),(v.y+62),false)
                Mostrar_rc(v, (v.x-16),(v.y),false)
            end 

        end

        spr_sheet_avanzado(108,300,200,2,2,1,1,sprites)

end    

function ModArmadura(player)
    if  player.armadura.def ~= nil and player.armadura.def ~= {} then
        return player.con + player.armadura.def
    else
        return 0
    end 

end    

function promWeaponDmg(player)
    local dmg=0

    if player.weapon.left~=nil and player.weapon.left~={} and player.weapon.left.w~=nil and player.weapon.left.bw ~= nil then
        dmg=dmg + flr(player.weapon.left.w/2)
        dmg=dmg + player.weapon.left.bw
    end

    if player.weapon.right~=nil and player.weapon.right~={} and player.weapon.right.w~=nil and player.weapon.right.bw ~= nil then
        dmg=dmg + flr(player.weapon.right.w/2)
        dmg=dmg + player.weapon.right.bw
    end

    return dmg

end    







function menu(list,mx)

    if #list>mx then
        local i=list
        local r=1
        for k=ini_view, fin_view do
            if i[k].name ~= nil then 
                love.graphics.print( ""..i[k].cont .."x "..i[k].name ,100,220+(24*r))
            end    
            r=r+1
        end
    else
        for k,i in pairs(list) do
            if i.name ~= nil then 
                love.graphics.print( ""..i.cont .."x "..i.name ,100,220+(24*k))
            end    
        end   
    end

end





function show_msg_dmg(v, x,y,bol)
    if v~= nil then
        if b_dmg_txt then  
            --if v.lastDmg~=0 or v.slDmg==true then
                if v.lastDmgC=="R" then
                    print(v.lastDmgM,(x)-16,(y)+24,8)
                elseif v.lastDmgC=="V" then
                    print(v.lastDmgM,(x)-16,(y)+24,11)
                elseif v.lastDmgC=="Y" then
                    print(v.lastDmgM,(x)-16,(y)+24,10)
                else 
                    --See this, it's a error.
                    print(v.lastDmgM,(x)-16,(y)+24,7)   
                end
                if v.typeMsg==false then

                end       
            --end      
        end 
    end

end    

function show_spr(v, x,y,x2, y2,x3,y3,bol,bol2)
    if bol  then
        print("> ",x3-16,y3+20,7)
    end
    if v~= nil then
        if v.tipo=="player" then
            if v.forma then
                --anim_char_forma(v,x,y,bol2) 
            else
                if v.hide then
                    anim_char_hide(v,x,y,bol2)
                else
                    anim_char_avanzado(v,x,y,bol2) 
                end                
            end
        else
            if v.live then
                anim_char_avanzado(v,x,y,bol2)
            end  
        end       
    
    end
end

function anim_char(v,x,y)
    v.anim.ti=v.anim.ti+1
    local te=v.anim.frm[1].t
    local tee=v.anim.frm[2].t
    local teee=v.anim.ac
    if v.anim.frm[v.anim.ac].t ~= nil then
        if v.anim.ti==v.anim.frm[v.anim.ac].t then
            v.anim.ti=0
            v.anim.ac=v.anim.ac+1
            if v.anim.ac > #v.anim.frm then
                v.anim.ac=1
            end    
        end  
    end  
    if v.live then
        spr(v.anim.frm[v.anim.ac].spr,x,y,2,2)
    else
        spr(v.d_spr,x,y,2,1)
    end
end


function anim_char_v2(v,x,y)
    v.anim.ti=v.anim.ti+1
    local te=v.anim.frm[1].t
    local tee=v.anim.frm[2].t
    local teee=v.anim.ac
    if v.anim.frm[v.anim.ac].t ~= nil then
        if v.anim.ti==v.anim.frm[v.anim.ac].t then
            v.anim.ti=0
            v.anim.ac=v.anim.ac+1
            if v.anim.ac > #v.anim.frm then
                v.anim.ac=1
            end    
        end  
    end  

    spr_sheet_avanzado(v.anim.frm[v.anim.ac].spr,x,y,-2,2,1,1,sprites)
end


function anim_char_forma(v,x,y,bol)
    v.sec_anim.ti=v.sec_anim.ti+1
    local te=v.sec_anim.frm[1].t
    local tee=v.sec_anim.frm[2].t
    local teee=v.sec_anim.ac
        if v.sec_anim.frm[v.sec_anim.ac].t ~= nil then
        if v.sec_anim.ti==v.sec_anim.frm[v.sec_anim.ac].t then
            v.sec_anim.ti=0
            v.sec_anim.ac=v.sec_anim.ac+1
            if v.sec_anim.ac > #v.sec_anim.frm then
                v.sec_anim.ac=1
            end    
        end  
    end  
    if v.live then
            if bol then 
                spr_sheet_avanzado(v.sec_anim.frm[v.anim.ac].spr,x,y,-2,2,1,1,sprites)
            else
                spr_sheet_avanzado(v.sec_anim.frm[v.anim.ac].spr,x,y,2,2,1,1,sprites)
            end
    else
        spr(v.d_spr,x,y,2,1)
    end
end    


function anim_char_hide(v,x,y,bol)
    anim_hide.ti=anim_hide.ti+1
    local te=anim_hide.frm[1].t
    local tee=anim_hide.frm[2].t
    local teee=anim_hide.ac
    if anim_hide.frm[anim_hide.ac].t ~= nil then
        if anim_hide.ti==anim_hide.frm[anim_hide.ac].t then
            anim_hide.ti=0
            anim_hide.ac=anim_hide.ac+1
            if anim_hide.ac > #anim_hide.frm then
                anim_hide.ac=1
            end    
        end  
    end  
    if v.live then
            if bol then 
                spr_sheet_avanzado(anim_hide.frm[anim_hide.ac].spr,x,y,-2,2,1,1,sprites)
            else
                spr_sheet_avanzado(anim_hide.frm[anim_hide.ac].spr,x,y,2,2,1,1,sprites)
            end
    else
        spr(v.d_spr,x,y,2,1)
    end
end

function anim_char_avanzado(v,x,y,bol)
    v.anim.ti=v.anim.ti+1
    local te=v.anim.frm[1].t
    local tee=v.anim.frm[2].t
    local teee=v.anim.ac
    if v.anim.frm[v.anim.ac].t ~= nil then
        if v.anim.ti==v.anim.frm[v.anim.ac].t then
            v.anim.ti=0
            v.anim.ac=v.anim.ac+1
            if v.anim.ac > #v.anim.frm then
                v.anim.ac=1
            end    
        end  
    end  
    if v.live then
            if bol then 
                spr_sheet_avanzado(v.anim.frm[v.anim.ac].spr,x,y,-2,2,1,1,sprites)
            else
                spr_sheet_avanzado(v.anim.frm[v.anim.ac].spr,x,y,2,2,1,1,sprites)
            end
    else
        spr(v.d_spr,x,y,2,1)
    end
end


function anim_general(str,x,y,h,w,t, color,bol)
    local v=anim_list[str]
    v.ti=v.ti+1
    if v.frm[v.ac].t ~= nil then
        if v.ti==v.frm[v.ac].t then
            v.ti=0
            v.ac=v.ac+1
            if v.ac > #v.frm then
                v.ac=1
            end    
        end  
    end  
    
    if t then love.graphics.setColor(color) end

    if bol then 
        spr_sheet_avanzado(v.frm[v.ac].spr,x,y,-h,w,1,1,spr_animacion)
    else
        spr_sheet_avanzado(v.frm[v.ac].spr,x,y,h,w,1,1,spr_animacion)
    end
    

    if t then love.graphics.setColor(1, 1, 1) end
end



function anim_summon(str,x,y,h,w,t, color,bol)
    local v=anim_summon_list[str]
    v.ti=v.ti+1
    if v.frm[v.ac].t ~= nil then
        if v.ti==v.frm[v.ac].t then
            v.ti=0
            v.ac=v.ac+1
            if v.ac > #v.frm then
                v.ac=1
            end    
        end  
    end  
    
    if t then love.graphics.setColor(color) end


    local th=v.h
    local tw=v.w

    if bol then 
        for i=0, tw-1 do
            for h=0, th-1 do
                spr_sheet_avanzado(v.frm[v.ac].spr+i+(h*8),-1*x+(i*64),y+(h*64),2,2,1,1,sprites)
            end
        end
    else
        for i=0, tw-1 do
            for h=0, th-1 do
                spr_sheet_avanzado(v.frm[v.ac].spr+i+(h*8),x+(i*64),y+(h*64),2,2,1,1,sprites)
            end
        end
    end
    

    if t then love.graphics.setColor(1, 1, 1) end
end




function Barra_vida(v, x, y)
    if v.hp_>0 then
        love.graphics.setColor(0.5, 0.5, 0.5)
        love.graphics.rectangle("fill", x, y, barWidth, barHeight)

        local healthWidth = (v.hp_ / v.hp) * barWidth

        love.graphics.setColor(0, 1, 0)
        love.graphics.rectangle("fill", x, y, healthWidth, barHeight)

        love.graphics.setColor(1, 1, 1)
    end

end    




--menus

function arrow_menu(Op,x,y)
    if ini_view>0 then
        local xi = x 
        local yi = y + ((Op-1)-(ini_view-1)) * 16
        print("> ", xi +6+12 , yi+40,7) 
    else   
        local xi = x
        local yi = y + (Op-1) * 16
        print("> ", xi +6+12 , yi+40,7) 
    end
end    


function arrow_menu_OLD(Op,x,y)

    local column = math.floor((Op - 1) / itemsPerColumn)
    local row = (Op - 1) % itemsPerColumn
    local xi = x + column * columnSpacing
    local yi = y + row * rowSpacing

    print("> ", xi +6+12 , yi+40,7)

end  

function show_menus(v,x,y)
    for i=1,#v  do

        local column = math.floor((i - 1) / itemsPerColumn)
        local row = (i - 1) % itemsPerColumn
        local xi = x + column * columnSpacing
        local yi = y + row * rowSpacing

        print("  "..v[i], xi+6, yi+40,7)
    end
end   


function show_menus_name_bol(v,x,y)
    local d = 0
    for i=1,#v  do
        if v[i].see then
            d = d + 1
            print("  "..v[i].name, x+6, y+24+(18*d),7) 
        end                   
    end
end 


function show_menus_name(v,x,y)
    for i=1,#v  do
        local column = math.floor((i - 1) / itemsPerColumn)
        local row = (i - 1) % itemsPerColumn
        local xi = x + column * columnSpacing
        local yi = y + row * rowSpacing
        print("  "..v[i].name, xi+6, yi+40,7)
    end
end

function show_number_dial(x,y)
    print("  "..Op, x+6, y+40,7)
end


function show_menus_id(v,x,y)
    for i=1,#v  do
        local column = math.floor((i - 1) / itemsPerColumn)
        local row = (i - 1) % itemsPerColumn
        local xi = x + column * columnSpacing
        local yi = y + row * rowSpacing
        print("  "..v[i].id.." "..v[i].name, xi+6, yi+40,7)
    end
end


function show_menus_name_wide(v,x,y)
    local max=0
    if #v-(ini_view-1) < itemsPerColumn then
        max=#v-(ini_view-1)
    else
        max=itemsPerColumn
    end
    for i=1,max  do
        local column = math.floor((i - 1) / itemsPerColumn)
        local row = (i - 1) % itemsPerColumn
        local xi = x + column * columnSpacing
        local yi = y + row * rowSpacing
       -- if i<#v then
                print("  "..v[(ini_view-1)+i], xi+6, yi+40,7)
        --end
    end
end


function show_menus_cont(v,x,y)
    for i=1,#v  do
        local column = math.floor((i - 1) / itemsPerColumn)
        local row = (i - 1) % itemsPerColumn
        local xi = x + column * columnSpacing
        local yi = y + row * rowSpacing
        --print("  "..v[i].name.." "..v[i].cont.."/"..v[i].max, xi+6, yi+40,7)
    end
end


function show_menus_name_cantidad(v,x,y)
    for i=1,#v-(ini_view-1)  do
        local column = math.floor((i - 1) / itemsPerColumn)
        local row = (i - 1) % itemsPerColumn
        local xi = x + column * columnSpacing
        local yi = y + row * rowSpacing
       -- if i<#v then
            if Actual.mp_>= v[i].cost then
                print("  "..v[(ini_view-1)+i].name.." "..v[(ini_view-1)+i].cant, xi+6, yi+40,7)
            else
                print("  "..v[(ini_view-1)+i].name.." "..v[(ini_view-1)+i].cant, xi+6, yi+40,6)
            end    
        --end
    end
end

function show_menus_name_cost(v,x,y)
    for i=1,#v-(ini_view-1)  do
        local column = math.floor((i - 1) / itemsPerColumn)
        local row = (i - 1) % itemsPerColumn
        local xi = x + column * columnSpacing
        local yi = y + row * rowSpacing
       -- if i<#v then
            if Actual.mp_>= v[i].cost then
                print("  "..v[(ini_view-1)+i].name.." "..v[(ini_view-1)+i].cost, xi+6, yi+40,7)
            else
                print("  "..v[(ini_view-1)+i].name.." "..v[(ini_view-1)+i].cost, xi+6, yi+40,6)
            end    
        --end
    end
end



function Show_menus_name_cost_magic(v,x,y)
    for i=1,#v-(ini_view-1)  do
        local column = math.floor((i - 1) / itemsPerColumn)
        local row = (i - 1) % itemsPerColumn
        local xi = x + column * columnSpacing
        local yi = y + row * rowSpacing
       -- if i<#v then
        local mult=1
        local add=0
        local rest=1
        local tax={0,0,0,0,0}
        local restSlot=0



        

            if Acc=="dual M." and State=="select oo" then
                mult=1
            end

            if Acc=="dual M." and State=="select o" then
                mult=1.5
                add=Ccost2
                tax[Llv2]=1
            end
      
            if Actual.slots_[1]>0+tax[1] and v[(ini_view-1)+i].lv==1 then
                if Llv2 == v[(ini_view-1)+i].lv then
                    restSlot=1
                end
                print("  "..v[(ini_view-1)+i].name.." x"..Actual.slots_[1]-restSlot, xi+6, yi+40,7)
            elseif Actual.slots_[2]>0+tax[2] and v[i].lv==2 then 
                if Llv2 == v[(ini_view-1)+i].lv then
                    restSlot=1
                end
                print("  "..v[(ini_view-1)+i].name.." x"..Actual.slots_[2]-restSlot, xi+6, yi+40,7)
            elseif Actual.slots_[3]>0+tax[3] and v[i].lv==3 then 
                if Llv2 == v[(ini_view-1)+i].lv then
                    restSlot=1
                end
                print("  "..v[(ini_view-1)+i].name.." x"..Actual.slots_[3]-restSlot, xi+6, yi+40,7)
            elseif Actual.slots_[4]>0+tax[4] and v[i].lv==4 then    
                if Llv2 == v[(ini_view-1)+i].lv then
                    restSlot=1
                end
                print("  "..v[(ini_view-1)+i].name.." x"..Actual.slots_[4]-restSlot, xi+6, yi+40,7)
            elseif Actual.slots_[5]>0+tax[5]  and v[i].lv==5 then
                if Llv2 == v[(ini_view-1)+i].lv then
                    restSlot=1
                end
                print("  "..v[(ini_view-1)+i].name.." x"..Actual.slots_[5]-restSlot, xi+6, yi+40,7)
            else
                if Actual.mp_>= v[(ini_view-1)+i].cost+add then
                    print("  "..v[(ini_view-1)+i].name.." "..(flr(v[(ini_view-1)+i].cost*mult)+add).."MP", xi+6, yi+40,7)
                else
                    print("  "..v[(ini_view-1)+i].name.." "..(flr(v[(ini_view-1)+i].cost*mult)+add).."MP", xi+6, yi+40,6)
                end 
            end
        
   
        --end
    end
end

function show_menus_tecnica(v,x,y)
    for i=1,#v  do
        local column = math.floor((i - 1) / itemsPerColumn)
        local row = (i - 1) % itemsPerColumn
        local xi = x + column * columnSpacing
        local yi = y + row * rowSpacing
        if v[i].isCharge then
            if Actual.carga==1  then  
                print("  "..v[i].name.."[C]", xi+6, yi+40,7)
            else 
                print("  "..v[i].name.."[C]", xi+6, yi+40,5)   
            end
        else
            print("  "..v[i].name, xi+6, yi+40,7)
        end    
    end
end  

function show_menus_name_count(v,x,y)
    for i=1,#v  do
        local column = math.floor((i - 1) / itemsPerColumn)
        local row = (i - 1) % itemsPerColumn
        local xi = x + column * columnSpacing
        local yi = y + row * rowSpacing


        print("["..v[i].cont.."] "..v[i].name, xi+6, yi+40,7)

    end
end  


local cols, rows = 3, 6
local    offset = 0  -- cuántas filas desplazadas

local cellW, cellH = 100, 30
local startX, startY = 50, 50


function show_menus_name_count_V2(v,x,y)
    for r = 1, rows do
        for c = 1, cols do
            local index = (offset + (r - 1)) * cols + c
            --local text = v[index] or ""
            local xi = x + (c - 1) * columnSpacing
            local yi = y + (r - 1) * rowSpacing
            --love.graphics.rectangle("line", x, y, cellW - 5, cellH - 5)
            --love.graphics.print(text, x + 5, y + 5)
            print("["..v[ini_view+index].cont.."] "..v[ini_view+index].name, xi+6, yi+40,7)
        end
    end

end  


function menu_cost_name(list,mx,x,y)

    if #list>mx then
        local i=list
        local r=1
        for k=ini_view, fin_view do
            log("indice "..k)
            if i[k].name ~= nil then 
                love.graphics.print( ""..i[k].cost .."-"..i[k].name ,x,y+(16*r))
            end    
            r=r+1
        end
    else
        for k,i in pairs(list) do
            if i.name ~= nil then 
                love.graphics.print( ""..i.cost .."-"..i.name ,x,y+(16*k))
            end    
        end   
    end

end

function menu_cont_name(list,mx,x,y)

    if #list>mx then
        local i=list
        local r=1
        for k=ini_view, fin_view do
                love.graphics.print( i[k].name.." x"..i[k].cont ,x,y+(16*r)) 
            r=r+1
        end
    else
        for k,i in pairs(list) do
            if i.name ~= nil then 
                love.graphics.print( i.name.." x"..i.cont ,x,y+(16*k))
            end    
        end   
    end

end
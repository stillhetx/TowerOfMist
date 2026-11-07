function InfiltracionData.draw()
--InfiltracionData.Nivel_busqueda
    love.graphics.draw(Finish_fight, 0, 0,0,1,1)

        love.graphics.print("# infiltracion  ",16,16)

        if InfiltracionData.Action_label~="" then
            love.graphics.print("["..InfiltracionData.Action_label.."]",16,16+(24*1))
        end
        --nivel de vigilancia
        sprSheetV2(1408, 300, 16+(24*0), 1,1,false,false,_G["new_sprites_jobs"],1,1,64)
        local enemigos=""
        if InfiltracionData.seeEnemys == true then
            love.graphics.print("N.E frente: "..InfiltracionData.NmOutside,16,16+(24*2))
            love.graphics.print("N.E dentro: "..InfiltracionData.NmInside,16,16+(24*3))
        else
            love.graphics.print("N.E frente: ? ",16,16+(24*2))
            love.graphics.print("N.E dentro: ? ",16,16+(24*3))
        end

        

        local characters_inside={}
        local characters_outside={}
        for index, character in ipairs(ActiveParty) do
            local group = character.stealh_inside and characters_inside or characters_outside
            group[#group + 1] = {character=character, index=index}
        end

        local function draw_characters(group, group_x, is_inside)
            local font=love.graphics.getFont()
            local group_width=0
            local label_left=0
            local label_right=0
            local offset=0
            for _, entry in ipairs(group) do
                local character=entry.character
                local status=is_inside and "[Infiltrado]" or "[Frente]"
                local marker=InfiltracionData.numero_char==entry.index and "> " or "  "
                entry.label=marker..status
                entry.width=(character.sheet[3] or 1) * 32
                entry.height=(character.sheet[4] or 1) * 32
                entry.label_width=font:getWidth(entry.label)
                entry.advance=math.max(entry.width,entry.label_width)
                if is_inside then
                    label_left=math.min(label_left,offset+(entry.advance-entry.label_width)/2)
                    label_right=math.max(label_right,offset+(entry.advance+entry.label_width)/2)
                end
                group_width=group_width + entry.advance
                offset=offset+entry.advance+8
            end
            group_width=group_width + math.max(0, #group - 1) * 8
            local padding=is_inside and 8 or 0
            local x
            if is_inside and #group > 0 then
                local sprite_span_width=group_width-math.max(0,#group-1)*8
                local content_left=math.min(-padding,label_left)
                local content_right=math.max(sprite_span_width+padding,label_right+padding)
                x=math.max(8-content_left,GAME_WIDTH-20-content_right)
            else
                x=group_x+math.max(0,(288-group_width)/2)
            end
            local start_x=x
            local max_height=0
            local sprite_right=x
            for _, entry in ipairs(group) do
                max_height=math.max(max_height,entry.height)
            end

            for _, entry in ipairs(group) do
                local character=entry.character
                local cell_x=x
                local sprite_x=cell_x+(entry.advance-entry.width)/2
                local y=216-entry.height

                anim_char_avanzadoV2(character,sprite_x,y,true,64)
                sprite_right=sprite_x+entry.width

                love.graphics.setColor(0,1,0,1)
                love.graphics.rectangle("line",sprite_x,y,entry.width,entry.height)
                love.graphics.setColor(1,1,1,1)
                local label_x=cell_x+(entry.advance-entry.label_width)/2
                love.graphics.print(entry.label,label_x,232)
                x=cell_x+entry.advance+8
            end
            if is_inside and #group > 0 then
                love.graphics.setColor(1,0,0,1)
                love.graphics.setLineWidth(2)
                love.graphics.rectangle("line",start_x-padding,216-max_height-padding,
                    sprite_right-start_x+padding*2,max_height+padding*2)
                love.graphics.setLineWidth(1)
                love.graphics.setColor(1,1,1,1)
            end
        end

        draw_characters(characters_outside,24,false)
        draw_characters(characters_inside,328,true)


        Draw_nivel_busqueda()

        --nivel de alerta
        --sprSheetV2(1347, 600-60, 24+(24*0), 1,1,false,false,_G["new_sprites_jobs"],1,1,64)
        for i=1 , InfiltracionData.Nivel_tension do
            sprSheetV2(1348, 600-16, 24+(32*i), 1,1,false,false,_G["new_sprites_jobs"],1,1,64)
        end

        for k,v in pairs(InfiltracionData.RollList) do
           -- sprSheetV2(1350+v, 100+(24*k), 116, 1,1,false,false,_G["new_sprites_jobs"],1,1,64)
            sprSheetV2(1350+(v-1), 200+(34*k), 48, 1,1,false,false,_G["new_sprites_jobs"],1,1,64)

        end

        --ojos
        sprSheetV2(1284, 100, 116+(24*4), 1,1,false,false,_G["new_sprites_jobs"],1,1,64)


end

function Draw_nivel_busqueda()

    local tiles=0

   


    if InfiltracionData.tiles[InfiltracionData.Nivel_busqueda] then
        tiles = InfiltracionData.tiles[InfiltracionData.Nivel_busqueda]
    end


            --InfiltracionData.Nivel_infiltracion
    if InfiltracionData.Nivel_infiltracion ~= 0 then
                sprSheetV2(tiles+(InfiltracionData.Nivel_infiltracion-1), 80+100, 40, 1,1,false,false,_G["new_sprites_jobs"],1,1,64)
    end    

    local actions=InfiltracionData.Actual_char.stealh_inside
        and InfiltracionData.Acciones_base_inside
        or InfiltracionData.Acciones_base_outside
    MenuPagination.draw(actions, {
        selected=InfiltracionData.Op,
        first=InfiltracionData.ini_view,
        max_visible=InfiltracionData.MaxVisibleActions,
    }, {
        x=30,
        y=244,
        line_height=24,
        marker=">",
        marker_x=24,
    })


    Debug_draw()
    
end


function Debug_draw()
    love.graphics.setColor(0,255,0)
        love.graphics.print(" "..InfiltracionData.State,450,24+(24*0))
      -- love.graphics.print(" "..InfiltracionData.NmOutside.."/"..InfiltracionData.NmInside,450,24+(24*1))
       --love.graphics.print("infil: "..InfiltracionData.Nivel_infiltracion ,450,24+(24*2))
       --love.graphics.print("Busq: "..InfiltracionData.Nivel_busqueda ,450,24+(24*3))
       --love.graphics.print("Char: "..InfiltracionData.numero_char ,450,24+(24*4))
       --love.graphics.print("ROLLL: "..#InfiltracionData.RollList ,450,24+(24*5))


       love.graphics.setColor(255,255,255)

end
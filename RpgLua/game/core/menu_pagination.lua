MenuPagination = {}

local function normalize_state(state, item_count)
    local max_visible=math.max(1,state.max_visible or item_count)
    state.selected=state.selected or 1
    state.first=state.first or 1
    if item_count<=0 then
        state.selected=1
        state.first=1
        return 0
    end

    state.selected=(state.selected-1)%item_count+1
    local max_first=math.max(1,item_count-max_visible+1)
    state.first=math.min(math.max(1,state.first),max_first)
    return max_visible
end

local function update_window(state, item_count, max_visible)
    if item_count<=max_visible then
        state.first=1
    elseif state.selected<state.first then
        state.first=state.selected
    elseif state.selected>=state.first+max_visible then
        state.first=state.selected-max_visible+1
    end
end

function MenuPagination.move(state, item_count, direction)
    local max_visible=normalize_state(state,item_count)
    if item_count<=0 then
        return
    end

    state.selected=((state.selected-1+direction)%item_count)+1
    update_window(state,item_count,max_visible)
end

function MenuPagination.move_grid(state, item_count, direction, columns, rows_per_column)
    local max_visible=normalize_state(state,item_count)
    if item_count<=0 then
        return
    end

    if rows_per_column then
        local index=state.selected-1
        local row=index%rows_per_column
        local column=math.floor(index/rows_per_column)
        local column_count=math.ceil(item_count/rows_per_column)
        local target_column=column+(direction=="right" and 1 or -1)
        target_column=(target_column%column_count)
        local target_column_count=math.min(rows_per_column,item_count-target_column*rows_per_column)
        local target_row=math.min(row,target_column_count-1)

        if direction~="left" and direction~="right" then
            return
        end

        state.selected=target_column*rows_per_column+target_row+1
        local first=math.floor((state.first-1)/rows_per_column)*rows_per_column+1
        while state.selected<first do
            first=math.max(1,first-rows_per_column)
        end
        while state.selected>=first+max_visible do
            first=first+rows_per_column
        end
        state.first=first
        return
    end

    columns=math.max(1,math.floor(columns or state.columns or 1))
    local index=state.selected-1
    local row=math.floor(index/columns)
    local column=index%columns
    local row_count=math.ceil(item_count/columns)
    local target_row=row
    local target_column=column

    if direction=="left" then
        local row_start=row*columns
        local row_length=math.min(columns,item_count-row_start)
        target_column=(column-1)%row_length
    elseif direction=="right" then
        local row_start=row*columns
        local row_length=math.min(columns,item_count-row_start)
        target_column=(column+1)%row_length
    elseif direction=="up" then
        target_row=(row-1)%row_count
    elseif direction=="down" then
        target_row=(row+1)%row_count
    else
        return
    end

    state.selected=math.min(target_row*columns+target_column+1,item_count)
    update_window(state,item_count,max_visible)
end

function MenuPagination.get_range(state, item_count)
    if item_count<=0 then
        return 1,0
    end

    local max_visible=math.max(1,state.max_visible or item_count)
    local first=math.min(math.max(1,state.first or 1),item_count)
    return first,math.min(item_count,first+max_visible-1)
end

function MenuPagination.draw(actions, state, options)
    options=options or {}
    local first,last=MenuPagination.get_range(state,#actions)
    local x=options.x or 0
    local y=options.y or 0
    local line_height=options.line_height or 24
    local marker=options.marker or ">"
    local columns=math.max(1,math.floor(options.columns or state.columns or 1))
    local rows_per_column=options.rows_per_column
    local column_width=options.column_width
    if not column_width and columns>1 then
        local widest=0
        for index=first,last do
            local label=options.label and options.label(actions[index],index) or actions[index].name
            widest=math.max(widest,love.graphics.getFont():getWidth(" "..label))
        end
        column_width=widest+(options.column_gap or 16)
    end
    column_width=column_width or 0
    local marker_offset=options.marker_offset or 6
    local marker_x=options.marker_x or (x-marker_offset)

    for index=first,last do
        local visible_index=index-first+1
        local column
        local row
        if rows_per_column then
            column=math.floor((visible_index-1)/rows_per_column)
            row=(visible_index-1)%rows_per_column
        else
            column=(visible_index-1)%columns
            row=math.floor((visible_index-1)/columns)
        end
        local item_x=x+column*column_width
        local item_y=y+line_height*(row+1)
        local label=options.label and options.label(actions[index],index) or actions[index].name
        if options.draw_item then
            options.draw_item(label,item_x,item_y,index)
        else
            love.graphics.print(" "..label,item_x,item_y)
        end
        if state.selected==index then
            if options.draw_marker then
                options.draw_marker(marker,marker_x+column*column_width,item_y,index)
            else
                love.graphics.print(marker,marker_x+column*column_width,item_y)
            end
        end
    end
end

Utils={}

-- Agrega una acción al final de la cola
function agregarAccion(accion)
    table.insert(Acciones, accion)
end

-- Obtiene (sin eliminar) la primera acción ingresada
function obtenerPrimeraAccion()
    return Acciones[1]
end

-- Elimina la primera acción ingresada
function eliminarPrimeraAccion()
    if #Acciones > 0 then
        table.remove(Acciones, 1)
    end
end

-- Limpia toda la cola
function limpiarAcciones()
    Acciones = {}
end

function agregarPendientes(accion)
    table.insert(Pendientes, accion)
end

function obtenerPrimerPendientes()
    return Pendientes[1]
end


function eliminarPrimerPendientes()
    if #Pendientes > 0 then
        table.remove(Pendientes, 1)
    end
end


function limpiarPendientes()
    Pendientes = {}
end


---

function lerp(a, b, t)
    return  (b - a)/ t
end

function getOBj(id)
    for n,m in pairs(Order) do
        if m.obj==id then
            return m
        end
    end
    return nil        
end     

function log(text)
    -- Agregar una nueva línea de log
    love.filesystem.append("logfile.txt", os.date("%Y-%m-%d %H:%M:%S")..": "..text.."\n")
end

function existList(id, list)
    for n,i in pairs(list) do
        if id==i.id then
            return true
        end    
    end
    return false
end  

function existListName(id, list)
    for n,i in pairs(list) do
        if id==i.name then
            return true
        end    
    end
    return false
end  

function getChars(id, list)
    for n,i in pairs(list) do
        if id==i.id then
            return i
        end    
    end
end    

function loadbackGround(path, width, height)
    local image = loadTransparent(path,0,0,0)
    local spritesheet = {image = image, quads = {}}
    
    local sheetWidth = image:getWidth() / width
    local sheetHeight = image:getHeight() / height

    for y = 0, sheetHeight - 1 do
        for x = 0, sheetWidth - 1 do
            local quad = love.graphics.newQuad(
                x * width, y * height,
                width, height,
                image:getWidth(), image:getHeight()
            )
            table.insert(spritesheet.quads, quad)
        end
    end
    
    return spritesheet

end


function loadSpritesheet(path, spriteSize)
    local image = loadTransparent(path,0,0,0)
    local spritesheet = {image = image, quads = {}}
    
    local sheetWidth = image:getWidth() / spriteSize
    local sheetHeight = image:getHeight() / spriteSize
    
    for y = 0, sheetHeight - 1 do
        for x = 0, sheetWidth - 1 do
            local quad = love.graphics.newQuad(
                x * spriteSize, y * spriteSize,
                spriteSize, spriteSize,
                image:getWidth(), image:getHeight()
            )
            table.insert(spritesheet.quads, quad)
        end
    end
    
    return spritesheet
end


function loadTransparent(imagePath, transR, transG, transB)
	imageData = love.image.newImageData( imagePath )
	function mapFunction(x, y, r, g, b, a)
		if r == transR and g == transG and b == transB then a = 0 end
		return r,g,b,a
	end
	imageData:mapPixel( mapFunction )
	return love.graphics.newImage( imageData )
end

-- Método equivalente a 'spr' de PICO-8
function spr(n, x, y, w, h, flip_x, flip_y,sheet)
    w = w or 4
    h = h or 4
    flip_x = flip_x or false
    flip_y = flip_y or false
    local f_x= flip_x and -1 or 1
    local f_y= flip_x and -1 or 1
    local tile_size=4
    sheet = sheet or sprites

    local quad = sheet.quads[n + 1] -- PICO-8 indexa desde 0, Lua desde 1

    if quad then
        love.graphics.draw(
            sheet.image, quad, x, y, 0, f_x * tile_size, f_x * tile_size
        )
    end
end

function spr_sheet(n, x, y, w, h, flip_x, flip_y, sheet)
    w = w or 1
    h = h or 1
    flip_x = flip_x or false
    flip_y = flip_y or false
    --x=x*4
    --y=y*4

    local quad = sheet.quads[n + 1] -- PICO-8 indexa desde 0, Lua desde 1

    if quad then
        love.graphics.draw(
            sheet.image, quad, x, y,0, 2,2
        )
    end
end


function GetDefense(obj)
    obj = obj or {}
    if obj~={} and obj.def~=nil and obj.def~={} then
        return obj.def
    end
    return 0
end

function GetMDefense(obj)
    obj = obj or {}
    if obj~={} and obj.mdef~=nil and obj.mdef~={} then
        return obj.mdef
    end
    return 0
end

function GetPromDamage(obj)
    obj = obj or {}
    if obj~={} and obj.w~=nil and obj.w~={} and obj.bw~=nil and obj.bw~={}  then
        return (obj.w/2)+obj.bw      
    end
    return 0
end

function spr_sheet_test(n, x, y, w, h, flip_x, flip_y, sheet)
    w = w or 1
    h = h or 1
    flip_x = flip_x or false
    flip_y = flip_y or false
    --x=x*4
    --y=y*4

    local quad = sheet.quads[n + 1] -- PICO-8 indexa desde 0, Lua desde 1

    if quad then
        love.graphics.draw(
            sheet.image, quad, x, y,0, w*2,h*2
        )
    end
end



function spr_sheet_avanzado(n, x, y, w, h, flip_x, flip_y, sheet)
    w = w or 1
    h = h or 1
    flip_x = flip_x or false
    flip_y = flip_y or false
    local f_x= flip_x and -1 or 1
    local f_y= flip_x and -1 or 1
    local tile_size=1.75

    local quad = sheet.quads[n + 1] -- PICO-8 indexa desde 0, Lua desde 1

    if quad then
        love.graphics.draw(
            sheet.image, quad, x, y,0, w*tile_size,h*tile_size
        )
    end
end


function sprSheetV2(n, x, y, w, h, flip_x, flip_y, sheet,hs,ws)

    --TODO Agregar codigo
    n = n or 0
    w = w or 1
    h = h or 1
    flip_x = flip_x or false
    flip_y = flip_y or false

    local mult=1
    for i=0, hs-1 do
        for ii=0, ws-1 do
                local index=0
                index = n + (ii*64 )+i + 1
                local quad = sheet.quads[index] -- PICO-8 indexa desde 0, Lua desde 1

                if quad then
                    --drawPixelAura(sheet.image,quad, x+(i*32*mult), y+(ii*32*mult),0, w*2*mult,h*2*mult)
                    love.graphics.draw(sheet.image, quad, x+(i*32*mult), y+(ii*32*mult),0, w*2*mult,h*2*mult)                   
                    
                end
        end
    end


end


function isNum(num)
    if type(num) == "number" then
        return true
    else
        return false
    end
end    

function copiar_tabla(original)
    local copia = {}
    for k, v in pairs(original) do
        if type(v) == "table" then
            copia[k] = copiar_tabla(v)
        else
            copia[k] = v
        end
    end
    return copia
end

function qsort(a,c,l,r)
	c,l,r=c or function(a,b) return a<b end,l or 1,r or #a
	if l<r then
		if c(a[r],a[l]) then
			a[l],a[r]=a[r],a[l]
		end
		local lp,k,rp,p,q=l+1,l+1,r-1,a[l],a[r]
		while k<=rp do
			local swaplp=c(a[k],p)
			if swaplp or c(a[k],q) then
			else
				while c(q,a[rp]) and k<rp do
					rp=rp-1
				end
				a[k],a[rp],swaplp=a[rp],a[k],c(a[rp],p)
				rp=rp-1
			end
			if swaplp then
				a[k],a[lp]=a[lp],a[k]
                lp=lp+1
			end
            k=k+1
		end
        lp=lp-1
		rp=rp+1
		a[l],a[lp]=a[lp],a[l]
		a[r],a[rp]=a[rp],a[r]
		qsort(a,c,l,lp-1       )
		qsort(a,c,  lp+1,rp-1  )
		qsort(a,c,       rp+1,r)
	end
end






function countTableElements(tbl)
    local count = 0
    for _ in pairs(tbl) do
        count = count + 1
    end
    return count
end

function rnd(x)
    math.randomseed(os.time() + os.clock() * 1000000)
    if x == nil then
        return math.random() -- Aleatorio entre 0 y 1
    elseif type(x) == "number" then  
        return love.math.random(x)
    else
        error("rnd: argumento inválido (esperado número o tabla)")
    end
end


function rndp(x)
    math.randomseed(os.time() + os.clock() * 1000000)
    return love.math.random(x-1)+1
end    

function randon_(x)
    local num = math.random(0, x)
    if last_num == num then
        return randon_(x)
    else
        last_num = num
        return num
    end        
end    

function flr(x)
    return math.floor(x)
end

function insert(tbl, index, val)
    table.insert(tbl,index,val)
end

function add(tbl, val)
    table.insert(tbl, val)
end

function abs(x)
    return math.abs(x)
end


local button_map = {
    [0] = "left",   -- flecha izquierda
    [1] = "right",  -- flecha derecha
    [2] = "up",     -- flecha arriba
    [3] = "down",   -- flecha abajo
    [4] = "z",      -- botón X (puedes cambiarlo a lo que uses en tu juego)
    [5] = "x"       -- botón O
}

local btnp_state = {}


-- btn(): detectar si se mantiene presionado
function btn(i)
    local key = button_map[i]
    return key and love.keyboard.isDown(key) or false
end

function btnp(i)
    return btnp_state[i] == true
end


function stat(code)
    if code == 31 then
        return last_key_pressed
    else
        error("stat(" .. tostring(code) .. ") no implementado.")
    end
end


-- Colores estilo retro opcional
-- Paleta de colores estilo PICO-8
local pico8_palette = {
    [0] = {0, 0, 0},         -- negro
    [1] = {29, 43, 83},      
    [2] = {126, 37, 83},
    [3] = {0, 135, 81},
    [4] = {171, 82, 54},
    [5] = {95, 87, 79},
    [6] = {194, 195, 199},
    [7] = {255, 241, 232},
    [8] = {255, 0, 77},
    [9] = {255, 163, 0},
    [10] = {255, 236, 39},
    [11] = {0, 228, 54},
    [12] = {41, 173, 255},
    [13] = {131, 118, 156},
    [14] = {255, 119, 168},
    [15] = {255, 204, 170}
}

function cls(color)
    local r, g, b = 0, 0, 0 -- color por defecto (negro)
    
    if color and pico8_palette[color] then
        r, g, b = unpack(pico8_palette[color])
    end
    
    love.graphics.clear(r/255, g/255, b/255)
end





-- print estilo PICO-8
function print(text, x, y, color)
    x = x or 0
    y = y or 0
    if color and pico8_palette[color] then
        --table.unpack()
        local r, g, b = table.unpack(pico8_palette[color])
        love.graphics.setColor(r / 255, g / 255, b / 255, 1)
    else
        love.graphics.setColor(1, 1, 1, 1) -- blanco por defecto
    end

    love.graphics.print(tostring(text), x, y)
    love.graphics.setColor(1, 1, 1,1)
end

-- del estilo PICO-8
function del(tbl, val)
    for i = #tbl, 1, -1 do
        if tbl[i] == val then
            table.remove(tbl, i)
            return -- elimina solo la primera ocurrencia (como PICO-8)
        end
    end
end


function removeKey(tabla, clave)
    tabla[clave] = nil
end



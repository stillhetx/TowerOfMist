function Init_social(v)
    v.social={}
    v.social=General_perfil_relacion(v)
end

function General_perfil_relacion(v)
    local perfil = {}
    if Clases_variaccion_perfil[v.id_class] then
        perfil["Ojo"] = rnd(Clases_variaccion_perfil[v.id_class].Ojo)
        perfil["pintura"] = rnd(Clases_variaccion_perfil[v.id_class].pintura)
        perfil["je_ne_sais_pa"] = rnd(Clases_variaccion_perfil[v.id_class].je_ne_sais_pa)
        perfil["sennal"] = rnd(Clases_variaccion_perfil[v.id_class].sennal)
        perfil["lupa"] = rnd(Clases_variaccion_perfil[v.id_class].lupa)
        perfil["energy"] = rnd(Clases_variaccion_perfil[v.id_class].energy)
        perfil["Cabello"] = rnd(Clases_variaccion_perfil[v.id_class].Cabello)
        perfil["Numero"] = rnd(Clases_variaccion_perfil[v.id_class].Numero)
        perfil["escultura"] = rnd(Clases_variaccion_perfil[v.id_class].escultura)
        perfil["linea"] = rnd(Clases_variaccion_perfil[v.id_class].linea)
        perfil["algodon"] = rnd(Clases_variaccion_perfil[v.id_class].algodon)
        perfil["retrovizor"] = rnd(Clases_variaccion_perfil[v.id_class].retrovizor)
        perfil["rueda"] = rnd(Clases_variaccion_perfil[v.id_class].rueda)
        perfil["armadura"] = rnd(Clases_variaccion_perfil[v.id_class].armadura)
        perfil["corazon"] = rnd(Clases_variaccion_perfil[v.id_class].corazon)
    else
        perfil["Ojo"] = rnd(Clases_variaccion_perfil["default"].Ojo)
        perfil["pintura"] = rnd(Clases_variaccion_perfil["default"].pintura)
        perfil["je_ne_sais_pa"] = rnd(Clases_variaccion_perfil["default"].je_ne_sais_pa)
        perfil["sennal"] = rnd(Clases_variaccion_perfil["default"].sennal)
        perfil["lupa"] = rnd(Clases_variaccion_perfil["default"].lupa)
        perfil["energy"] = rnd(Clases_variaccion_perfil["default"].energy)
        perfil["Cabello"] = rnd(Clases_variaccion_perfil["default"].Cabello)
        perfil["Numero"] = rnd(Clases_variaccion_perfil["default"].Numero)
        perfil["escultura"] = rnd(Clases_variaccion_perfil["default"].escultura)
        perfil["linea"] = rnd(Clases_variaccion_perfil["default"].linea)
        perfil["algodon"] = rnd(Clases_variaccion_perfil["default"].algodon)
        perfil["retrovizor"] = rnd(Clases_variaccion_perfil["default"].retrovizor)
        perfil["rueda"] = rnd(Clases_variaccion_perfil["default"].rueda)
        perfil["armadura"] = rnd(Clases_variaccion_perfil["default"].armadura)
        perfil["corazon"] = rnd(Clases_variaccion_perfil["default"].corazon)
    end
    
    Bonus_class_perfil(v, perfil)

    return perfil
end


function Bonus_class_perfil(v, perfil)
    if Clases_perfil_bonus[v.id_class] then
        for k,v in pairs(Clases_perfil_bonus[v.id_class]) do
            perfil[k] = perfil[k] + v
        end
    else
        for k,v in pairs(Clases_perfil_bonus["default"]) do
            perfil[k] = perfil[k] + v
        end
    end
end


function General__objeto_like(likes)
    likes["Ojo"] = false
    likes["pintura"] =  false
    likes["je_ne_sais_pa"] =  false
    likes["sennal"] =  false
    likes["lupa"] =  false
    likes["energy"] =  false
    likes["Cabello"] =  false
    likes["Numero"] =  false
    likes["escultura"] =  false
    likes["linea"] =  false
    likes["algodon"] =  false
    likes["retrovizor"] =  false
    likes["rueda"] = false
    likes["armadura"] =  false
    likes["corazon"] =  false
end

function General_likes(v)
    local likes = {}
    General__objeto_like(likes)
    for i, v in ipairs(likes) do
        if rnd(2)==1 then
            likes[i]=true
        else
            likes[i]=false
        end
    end
    if v.tipo=="player" then
        Likes_defecto(likes)
    end
    return likes
end


function Likes_defecto(likes)

end

Clases_like={}
Clases_perfil_bonus={}
Clases_variaccion_perfil={}


Clases_perfil_bonus["ingeniero"] = { 
    ["Ojo"]=3,
    ["pintura"]=7,
    ["je_ne_sais_pa"]=7,
    ["sennal"]=5,
    ["lupa"]=5,
    ["energy"]=2,
    ["Cabello"]=0,
    ["Numero"]=10,
    ["escultura"]=0,
    ["linea"]=0,
    ["algodon"]=0,
    ["retrovizor"]=0,
    ["rueda"]=0,
    ["armadura"]=2,
    ["corazon"]=5
}

Clases_perfil_bonus["fighter"] = {
    ["Ojo"]=0,
    ["pintura"]=7,
    ["je_ne_sais_pa"]=5,
    ["sennal"]=7,
    ["lupa"]=0,
    ["energy"]=10,
    ["Cabello"]=0,
    ["Numero"]=2,
    ["escultura"]=7,
    ["linea"]=2,
    ["algodon"]=0,
    ["retrovizor"]=2,
    ["rueda"]=2,
    ["armadura"]=7,
    ["corazon"]=5
}

Clases_perfil_bonus["black_mage"] = {
    ["Ojo"]=10,
    ["pintura"]=7,
    ["je_ne_sais_pa"]=5,
    ["sennal"]=6,
    ["lupa"]=8,
    ["energy"]=7,
    ["Cabello"]=0,
    ["Numero"]=0,
    ["escultura"]=0,
    ["linea"]=0,
    ["algodon"]=0,
    ["retrovizor"]=0,
    ["rueda"]=0,
    ["armadura"]=2,
    ["corazon"]=5
}
Clases_perfil_bonus["Cleric"] = {
    ["Ojo"]=5,
    ["pintura"]=7,
    ["je_ne_sais_pa"]=3,
    ["sennal"]=0,
    ["lupa"]=1,
    ["energy"]=2,
    ["Cabello"]=0,
    ["Numero"]=0,
    ["escultura"]=0,
    ["linea"]=0,
    ["algodon"]=7,
    ["retrovizor"]=10,
    ["rueda"]=2,
    ["armadura"]=5,
    ["corazon"]=7
}

Clases_perfil_bonus["rouge"] = {
    ["Ojo"]=0,
    ["pintura"]=5,
    ["je_ne_sais_pa"]=2,
    ["sennal"]=10,
    ["lupa"]=10,
    ["energy"]=3,
    ["Cabello"]=1,
    ["Numero"]=1,
    ["escultura"]=5,
    ["linea"]=1,
    ["algodon"]=1,
    ["retrovizor"]=2,
    ["rueda"]=2,
    ["armadura"]=10,
    ["corazon"]=10
}
Clases_perfil_bonus["beast_master"] = {
    ["Ojo"]=4,
    ["pintura"]=8,
    ["je_ne_sais_pa"]=4,
    ["sennal"]=7,
    ["lupa"]=5,
    ["energy"]=7,
    ["Cabello"]=2,
    ["Numero"]=8,
    ["escultura"]=8,
    ["linea"]=0,
    ["algodon"]=0,
    ["retrovizor"]=7,
    ["rueda"]=7,
    ["armadura"]=2,
    ["corazon"]=10
}
Clases_perfil_bonus["bardo"] = {
    ["Ojo"]=7,
    ["pintura"]=7,
    ["je_ne_sais_pa"]=3,
    ["sennal"]=3,
    ["lupa"]=3,
    ["energy"]=5,
    ["Cabello"]=2,
    ["Numero"]=2,
    ["escultura"]=2,
    ["linea"]=0,
    ["algodon"]=0,
    ["retrovizor"]=2,
    ["rueda"]=2,
    ["armadura"]=7,
    ["corazon"]=10
}
Clases_perfil_bonus["escolar"] = {
    ["Ojo"]=6,
    ["pintura"]=7,
    ["je_ne_sais_pa"]=3,
    ["sennal"]=2,
    ["lupa"]=4,
    ["energy"]=3,
    ["Cabello"]=2,
    ["Numero"]=8,
    ["escultura"]=2,
    ["linea"]=3,
    ["algodon"]=5,
    ["retrovizor"]=3,
    ["rueda"]=2,
    ["armadura"]=5,
    ["corazon"]=10
}
Clases_perfil_bonus["Warrior_mage"] = {
    ["Ojo"]=6,
    ["pintura"]=7,
    ["je_ne_sais_pa"]=6,
    ["sennal"]=7,
    ["lupa"]=7,
    ["energy"]=7,
    ["Cabello"]=2,
    ["Numero"]=7,
    ["escultura"]=3,
    ["linea"]=0,
    ["algodon"]=0,
    ["retrovizor"]=3,
    ["rueda"]=2,
    ["armadura"]=5,
    ["corazon"]=10
}
Clases_perfil_bonus["monk"] = {
    ["Ojo"]=4,
    ["pintura"]=7,
    ["je_ne_sais_pa"]=3,
    ["sennal"]=7,
    ["lupa"]=5,
    ["energy"]=5,
    ["Cabello"]=5,
    ["Numero"]=6,
    ["escultura"]=7,
    ["linea"]=2,
    ["algodon"]=0,
    ["retrovizor"]=3,
    ["rueda"]=3,
    ["armadura"]=5,
    ["corazon"]=10
}
Clases_perfil_bonus["berserk"] = {
    ["Ojo"]=4,
    ["pintura"]=7,
    ["je_ne_sais_pa"]=6,
    ["sennal"]=6,
    ["lupa"]=2,
    ["energy"]=8,
    ["Cabello"]=3,
    ["Numero"]=9,
    ["escultura"]=10,
    ["linea"]=10,
    ["algodon"]=5,
    ["retrovizor"]=5,
    ["rueda"]=5,
    ["armadura"]=10,
    ["corazon"]=10
}
Clases_perfil_bonus["Esper"] = {
    ["Ojo"]=5,
    ["pintura"]=7,
    ["je_ne_sais_pa"]=5,
    ["sennal"]=8,
    ["lupa"]=7,
    ["energy"]=7,
    ["Cabello"]=2,
    ["Numero"]=7,
    ["escultura"]=3,
    ["linea"]=7,
    ["algodon"]=2,
    ["retrovizor"]=2,
    ["rueda"]=2,
    ["armadura"]=5,
    ["corazon"]=10
}

Clases_perfil_bonus["default"] = {
    ["Ojo"]=0,
    ["pintura"]=0,
    ["je_ne_sais_pa"]=0,
    ["sennal"]=0,
    ["lupa"]=0,
    ["energy"]=0,
    ["Cabello"]=0,
    ["Numero"]=0,
    ["escultura"]=0,
    ["linea"]=0,
    ["algodon"]=0,
    ["retrovizor"]=0,
    ["rueda"]=0,
    ["armadura"]=0,
    ["corazon"]=0
}

---
---
---default
---
Clases_variaccion_perfil["ingeniero"] = {
    ["Ojo"]=7,
    ["pintura"]=7,
    ["je_ne_sais_pa"]=20,
    ["sennal"]=20,
    ["lupa"]=20,
    ["energy"]=20,
    ["Cabello"]=1,
    ["Numero"]=20,
    ["escultura"]=2,
    ["linea"]=1,
    ["algodon"]=2,
    ["retrovizor"]=3,
    ["rueda"]=3,
    ["armadura"]=20,
    ["corazon"]=20
}

Clases_variaccion_perfil["fighter"] = {
    ["Ojo"]=5,
    ["pintura"]=20,
    ["je_ne_sais_pa"]=20,
    ["sennal"]=20,
    ["lupa"]=20,
    ["energy"]=20,
    ["Cabello"]=5,
    ["Numero"]=6,
    ["escultura"]=10,
    ["linea"]=15,
    ["algodon"]=2,
    ["retrovizor"]=3,
    ["rueda"]=3,
    ["armadura"]=20,
    ["corazon"]=20
}

Clases_variaccion_perfil["black_mage"] = {
    ["Ojo"]=20,
    ["pintura"]=20,
    ["je_ne_sais_pa"]=20,
    ["sennal"]=20,
    ["lupa"]=20,
    ["energy"]=20,
    ["Cabello"]=1,
    ["Numero"]=4,
    ["escultura"]=1,
    ["linea"]=1,
    ["algodon"]=1,
    ["retrovizor"]=2,
    ["rueda"]=2,
    ["armadura"]=20,
    ["corazon"]=20
}
Clases_variaccion_perfil["Cleric"] = {
    ["Ojo"]=20,
    ["pintura"]=20,
    ["je_ne_sais_pa"]=20,
    ["sennal"]=20,
    ["lupa"]=20,
    ["energy"]=20,
    ["Cabello"]=3,
    ["Numero"]=5,
    ["escultura"]=1,
    ["linea"]=1,
    ["algodon"]=10,
    ["retrovizor"]=20,
    ["rueda"]=2,
    ["armadura"]=20,
    ["corazon"]=20
}
Clases_variaccion_perfil["ingeniero"] = {
    ["Ojo"]=15,
    ["pintura"]=20,
    ["je_ne_sais_pa"]=20,
    ["sennal"]=20,
    ["lupa"]=20,
    ["energy"]=20,
    ["Cabello"]=3,
    ["Numero"]=20,
    ["escultura"]=2,
    ["linea"]=1,
    ["algodon"]=2,
    ["retrovizor"]=2,
    ["rueda"]=2,
    ["armadura"]=20,
    ["corazon"]=20
}

Clases_variaccion_perfil["rouge"] = {
    ["Ojo"]=15,
    ["pintura"]=20,
    ["je_ne_sais_pa"]=20,
    ["sennal"]=20,
    ["lupa"]=20,
    ["energy"]=20,
    ["Cabello"]=3,
    ["Numero"]=5,
    ["escultura"]=8,
    ["linea"]=12,
    ["algodon"]=5,
    ["retrovizor"]=5,
    ["rueda"]=5,
    ["armadura"]=20,
    ["corazon"]=20
}
Clases_variaccion_perfil["beast_master"] = {
    ["Ojo"]=20,
    ["pintura"]=20,
    ["je_ne_sais_pa"]=20,
    ["sennal"]=20,
    ["lupa"]=20,
    ["energy"]=20,
    ["Cabello"]=2,
    ["Numero"]=10,
    ["escultura"]=14,
    ["linea"]=1,
    ["algodon"]=4,
    ["retrovizor"]=12,
    ["rueda"]=16,
    ["armadura"]=20,
    ["corazon"]=20
}
Clases_variaccion_perfil["bardo"] = {
    ["Ojo"]=20,
    ["pintura"]=20,
    ["je_ne_sais_pa"]=20,
    ["sennal"]=20,
    ["lupa"]=20,
    ["energy"]=20,
    ["Cabello"]=5,
    ["Numero"]=5,
    ["escultura"]=3,
    ["linea"]=1,
    ["algodon"]=3,
    ["retrovizor"]=3,
    ["rueda"]=3,
    ["armadura"]=20,
    ["corazon"]=20
}
Clases_variaccion_perfil["escolar"] = {
    ["Ojo"]=15,
    ["pintura"]=20,
    ["je_ne_sais_pa"]=20,
    ["sennal"]=20,
    ["lupa"]=20,
    ["energy"]=20,
    ["Cabello"]=3,
    ["Numero"]=12,
    ["escultura"]=5,
    ["linea"]=10,
    ["algodon"]=4,
    ["retrovizor"]=3,
    ["rueda"]=2,
    ["armadura"]=20,
    ["corazon"]=20
}
Clases_variaccion_perfil["Warrior_mage"] = {
    ["Ojo"]=20,
    ["pintura"]=20,
    ["je_ne_sais_pa"]=20,
    ["sennal"]=20,
    ["lupa"]=20,
    ["energy"]=20,
    ["Cabello"]=3,
    ["Numero"]=8,
    ["escultura"]=7,
    ["linea"]=1,
    ["algodon"]=2,
    ["retrovizor"]=4,
    ["rueda"]=2,
    ["armadura"]=20,
    ["corazon"]=20
}
Clases_variaccion_perfil["monk"] = {
    ["Ojo"]=15,
    ["pintura"]=20,
    ["je_ne_sais_pa"]=20,
    ["sennal"]=20,
    ["lupa"]=20,
    ["energy"]=20,
    ["Cabello"]=4,
    ["Numero"]=7,
    ["escultura"]=10,
    ["linea"]=12,
    ["algodon"]=5,
    ["retrovizor"]=5,
    ["rueda"]=5,
    ["armadura"]=20,
    ["corazon"]=20
}
Clases_variaccion_perfil["berserk"] = {
    ["Ojo"]=15,
    ["pintura"]=20,
    ["je_ne_sais_pa"]=20,
    ["sennal"]=20,
    ["lupa"]=20,
    ["energy"]=20,
    ["Cabello"]=6,
    ["Numero"]=16,
    ["escultura"]=20,
    ["linea"]=20,
    ["algodon"]=2,
    ["retrovizor"]=6,
    ["rueda"]=12,
    ["armadura"]=20,
    ["corazon"]=20
}
Clases_variaccion_perfil["Esper"] = {
    ["Ojo"]=15,
    ["pintura"]=20,
    ["je_ne_sais_pa"]=20,
    ["sennal"]=20,
    ["lupa"]=20,
    ["energy"]=20,
    ["Cabello"]=4,
    ["Numero"]=12,
    ["escultura"]=5,
    ["linea"]=18,
    ["algodon"]=5,
    ["retrovizor"]=5,
    ["rueda"]=3,
    ["armadura"]=20,
    ["corazon"]=20
}

Clases_variaccion_perfil["default"] = {
    ["Ojo"]=15,
    ["pintura"]=15,
    ["je_ne_sais_pa"]=15,
    ["sennal"]=15,
    ["lupa"]=15,
    ["energy"]=15,
    ["Cabello"]=5,
    ["Numero"]=5,
    ["escultura"]=5,
    ["linea"]=5,
    ["algodon"]=5,
    ["retrovizor"]=5,
    ["rueda"]=5,
    ["armadura"]=15,
    ["corazon"]=15
}
IA_enemy={}

IA_enemy["murcielago"] = function(criatura,alineamiento)
    if criatura.hp_<50 then
        Personality_random_action(criatura.id_mons.."#herido")
    else
        Personality_random_action(criatura,alineamiento)    
    end
end

IA_enemy["fuego_fuego"] = function(criatura,alineamiento)
    Personality_random_action(criatura,alineamiento)
end
IA_enemy["fuego_hielo"]= function(criatura,alineamiento)
    Personality_random_action(criatura,alineamiento)
end

IA_enemy["fuego_electrico"]= function(criatura,alineamiento)
    Personality_random_action(criatura,alineamiento)
end

IA_enemy["evil_eye"]= function(criatura,alineamiento)
    Personality_random_action(criatura,alineamiento)
end

IA_enemy["slime_azul"]= function(criatura,alineamiento)
    Personality_random_action(criatura,alineamiento)
end

IA_enemy["slime_amarillo"]= function(criatura,alineamiento)
    Personality_random_action(criatura,alineamiento)
end


IA_enemy["slime_rojo"]= function(criatura,alineamiento)
    Personality_random_action(criatura,alineamiento)
end


IA_enemy["serpiente_verde"]= function(criatura,alineamiento)
    Personality_random_action(criatura,alineamiento)
end


IA_enemy["Murcielago_electrico"]= function(criatura,alineamiento)
    Personality_random_action(criatura,alineamiento)
end


IA_enemy["serpiente_purpura"]= function(criatura,alineamiento)
    Personality_random_action(criatura,alineamiento)
end


IA_enemy["objetos"]= function(criatura,alineamiento)
    Personality_random_action(criatura,alineamiento)
end



IA_enemy["slime_rainbow"]= function(criatura,alineamiento)
    Personality_random_action(criatura,alineamiento)
end
IA_enemy["murcielago_fuego"]= function(criatura,alineamiento)
    Personality_random_action(criatura,alineamiento)
end
IA_enemy["murcielago_hielo"]= function(criatura,alineamiento)
    Personality_random_action(criatura,alineamiento)
end
IA_enemy["dummy"]= function(criatura,alineamiento)
    Personality_random_action(criatura,alineamiento)
end

IA_enemy["ninguno"]= function(criatura,alineamiento)
end

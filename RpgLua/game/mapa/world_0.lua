World_0_nodos={}
Actual_world={}
Actual_nodo={}
Randon_event={}

Enemy_char= 
{
    anim={ti=0,ac=1,frm={{t=32,spr=581},{t=32,spr=582},}},
    animv={ti=0,ac=1,frm={{t=32,spr=581},{t=32,spr=582},}},
    sheet={"new_sprites_jobs",73,1,1,x=0,y=0,size=2},
    live=true
}

Event_char= 
{
    anim={ti=0,ac=1,frm={{t=32,spr=517},{t=32,spr=518},}},
    animv={ti=0,ac=1,frm={{t=32,spr=517},{t=32,spr=518},}},
    sheet={"new_sprites_jobs",73,1,1,x=0,y=0,size=2},
    live=true
}

Randon_event_element={
    tipo="enemigo",
    info={},
}
Randon_event["Place_WOZ2"]={
    pos={x=0,y=0,direction=1},
    char=Enemy_char,
    tipo="enemigo",
    info={},
}

Randon_event["Place_WOZ3"]={
    pos={x=0,y=0,direction=-1},
    char=Event_char,
    tipo="evento",
    info={},
}


World_0_nodos["Tienda_WOZ1"]={
    id="Tienda_WOZ1",
    info=Tiendas["vendedor_tienda_pueblo_inicio"],
    x=3*16,y=2*16,
    up={},
    down={},
    left={},
    right={},    
}
World_0_nodos["home_WOZ1"]={
    id="home_WOZ1",
    info=Places["home"],
    x=5*16,y=2*16,
    up={},
    down={},
    left={},
    right={},   
}
World_0_nodos["Place_WOZ1"]={
    id="Place_WOZ1",
    info=Places["place"],
    x=7*16,y=2*16,
    up={},
    down={},
    left={},
    right={},   
}
World_0_nodos["Place_WOZ2"]={
    id="Place_WOZ2",
    info=Places["place"],
    x=7*16,y=4*16,
    up={},
    down={},
    left={},
    right={},   
}
World_0_nodos["Tienda_WOZ2"]={
    id="Tienda_WOZ2",
    info=Tiendas["vendedor_inn_pueblo_inicio"],
    x=5*16,y=4*16,
    up={},
    down={},
    left={},
    right={},
}

World_0_nodos["Tienda_WOZ3"]={
    id="Tienda_WOZ3",
    info=Tiendas["vendedor_herrero_pueblo_inicio"],
    x=2*16,y=4*16,
    up={},
    down={},
    left={},
    right={},
}
World_0_nodos["Place_WOZ3"]={
    id="Place_WOZ3",
    info=Places["place"],
    x=7*16,y=5*16,
    up={},
    down={},
    left={},
    right={},
}
World_0_nodos["Tienda_WOZ4"]={
    id="Tienda_WOZ4",
    info=Tiendas["vendedor_spell_pueblo_inicio"],
    x=5*16,y=5*16,
    up={},
    down={},
    left={},
    right={},
}


World_0_nodos["castillo_W0Z1"]={
    id="castillo_W0Z1",
    info=Places["castle"],
    x=3*16,y=5*16,
    up={},
    down={},
    left={},
    right={},
}









World_0_nodos["Tienda_WOZ1"].right=World_0_nodos["home_WOZ1"]

World_0_nodos["home_WOZ1"].left=World_0_nodos["Tienda_WOZ1"]
World_0_nodos["home_WOZ1"].right=World_0_nodos["Place_WOZ1"]  

World_0_nodos["Place_WOZ1"].down=World_0_nodos["Place_WOZ2"]
World_0_nodos["Place_WOZ1"].left=World_0_nodos["home_WOZ1"]

World_0_nodos["Place_WOZ2"].up=World_0_nodos["Place_WOZ1"]
World_0_nodos["Place_WOZ2"].down=World_0_nodos["Place_WOZ3"]
World_0_nodos["Place_WOZ2"].left=World_0_nodos["Tienda_WOZ2"]

World_0_nodos["Tienda_WOZ2"].right=World_0_nodos["Place_WOZ2"]
World_0_nodos["Tienda_WOZ2"].left=World_0_nodos["Tienda_WOZ3"]

World_0_nodos["Tienda_WOZ3"].right=World_0_nodos["Tienda_WOZ2"]

World_0_nodos["Place_WOZ3"].up=World_0_nodos["Place_WOZ2"]--
World_0_nodos["Place_WOZ3"].left=World_0_nodos["Tienda_WOZ4"]


World_0_nodos["Tienda_WOZ4"].right=World_0_nodos["Place_WOZ3"]
World_0_nodos["Tienda_WOZ4"].left=World_0_nodos["castillo_W0Z1"]




World_0_nodos["castillo_W0Z1"].right=World_0_nodos["Tienda_WOZ4"]





Actual_nodo=World_0_nodos["Tienda_WOZ1"]
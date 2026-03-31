lugares={
---Menu Inicio del juego
--Ciudades, pueblos y rutas
["pueblo_inicio_01"]={
    {
        id="Inicio_1",
        name="inicio",
        tipo="hub",
        desq="El hermosos pueblo del inicio.",
        opciones={
                [1]={["label"]="tienda",["req"]="", cost=0, type="tienda", nodoName="vendedor_tienda_pueblo_inicio" ,name=""},
                [2]={["label"]="inn",["req"]="", cost=0, type="tienda", nodoName="vendedor_inn_pueblo_inicio" ,name=""},
                [3]={["label"]="Herrero",["req"]="", cost=0, type="tienda",nodoName="vendedor_herrero_pueblo_inicio"},
                [4]={["label"]="libreria magica",["req"]="", cost=0, type="tienda",nodoName="vendedor_spell_pueblo_inicio"},
                [5]={["label"]="bosque magico",["req"]="", cost=0, type="node",name="explorar_bosque", nodoName="explorar_bosque"},
                [6]={["label"]="Ruta a la ciudad",["req"]="", cost=0, type="node",nodoName="ruta_pueblo_del_bosque_a_ciudad_portaria",finalNode="ciudad_portaria"},

        },
    },

},

---Ciudades
--ciudad_portaria
["ciudad_portaria"]={
    {
        id="Inicio_1",
        name="Ciudad portaria",
        tipo="hub",
        desq="una bulliciosa ciudad.",
        opciones={
                {["label"]="tienda",["req"]="", cost=0, type="tienda", nodoName="vendedor_tienda_ciudad_portaria" ,name=""},
                {["label"]="inn",["req"]="", cost=0, type="tienda", nodoName="vendedor_inn_ciudad_portaria" ,name=""},
                {["label"]="Herrero",["req"]="", cost=0, type="tienda",nodoName="vendedor_herrero_ciudad_portaria"},
                {["label"]="bar",["req"]="", cost=0, type="node",name="explorar_bosque", nodoName="ciudad_portaria_bar"},
                {["label"]="puerto",["req"]="", cost=0, type="node",name="explorar_bosque", nodoName="ciudad_portaria_puerto"},
                {["label"]="costa",["req"]="", cost=0, type="node",name="ciudad_portaria_costa", nodoName="ciudad_portaria_costa"},
                {["label"]="Zona sin ley",["req"]="", cost=0, type="node",name="ciudad_portaria_zona_sin_ley", nodoName="ciudad_portaria_zona_sin_ley"},
                {["label"]="bosque costero",["req"]="", cost=0, type="node",name="explorar_bosque_costero", nodoName="explorar_bosque_costero"},
                {["label"]="Rutas",["req"]="", cost=0, type="node",name="ciudad_portaria_rutas", nodoName="ciudad_portaria_rutas"},
        },
    },
},


["ciudad_portaria_costa"]={
    {
        id="Inicio_1",
        name="Ciudad portaria",
        tipo="hub",
        desq="una bulliciosa ciudad.",
        opciones={
                {["label"]="Zona segura",["req"]="", cost=0, type="node", nodoName="ciudad_portaria_costa_zona_segura" ,name=""},
                {["label"]="Zona de las bestias",["req"]="", cost=0, type="node", nodoName="ciudad_portaria_costa_peligrosa" ,name=""},
                {["label"]="Regresar al centro",["req"]="", cost=0, type="node", nodoName="ciudad_portaria" ,name=""},
               
                --[5]={["label"]="Ruta al pueblo",["req"]="", cost=0, type="node",nodoName="ruta_a_ciudad",finalNode="ciudad_principal"},
        },
    },

},

["ciudad_portaria_costa_zona_segura"]={
    {
        id="Inicio_1",
        name="Ciudad portaria",
        tipo="hub",
        desq="una bulliciosa ciudad.",
        opciones={
                {["label"]="Socializar",["req"]="", cost=0, type="node", nodoName="ciudad_portaria_costa_zona_segura_Socializar" ,name=""},
                {["label"]="Descanzar",["req"]="", cost=0, type="node", nodoName="ciudad_portaria_costa_zona_segura_Descanzar" ,name=""},
                {["label"]="Divertirse",["req"]="", cost=0, type="node", nodoName="ciudad_portaria_costa_zona_segura_Descanzar_Divertirse" ,name=""},
                {["label"]="explorar",["req"]="", cost=0, type="node", nodoName="ciudad_portaria_costa_zona_segura_Socializar_explorar" ,name=""},
                {["label"]="regresar",["req"]="", cost=0, type="node", nodoName="ciudad_portaria" ,name=""},
        },
    },

},

["ciudad_portaria_zona_sin_ley_bar"]={
    {
        id="Inicio_1",
        name="Ciudad portaria",
        tipo="hub",
        desq="una bulliciosa ciudad.",
        opciones={
                {["label"]="Socializar",["req"]="", cost=0, type="node", nodoName="ciudad_portaria_zona_sin_ley_bar_socializar" ,name=""},
                {["label"]="Divertirse",["req"]="", cost=0, type="node", nodoName="ciudad_portaria_zona_sin_ley_bar_Divertirse" ,name=""},
                {["label"]="Desafios",["req"]="", cost=0, type="node", nodoName="ciudad_portaria_zona_sin_ley_bar_Desafios" ,name=""},
                {["label"]="Bar",["req"]="", cost=0, type="tienda", nodoName="ciudad_portaria" ,name=""},
                {["label"]="regresar",["req"]="", cost=0, type="node", nodoName="ciudad_portaria" ,name=""},
                --[5]={["label"]="Ruta al pueblo",["req"]="", cost=0, type="node",nodoName="ruta_a_ciudad",finalNode="ciudad_principal"},
        },
    },

},






["ciudad_portaria_zona_sin_ley"]={
    {
        id="Inicio_1",
        name="Ciudad portaria",
        tipo="hub",
        desq="una bulliciosa ciudad.",
        opciones={
                {["label"]="Bar",["req"]="", cost=0, type="nodo", nodoName="ciudad_portaria_zona_sin_ley_bar" ,name=""},
                {["label"]="reducidor",["req"]="", cost=0, type="tienda", nodoName="vendedor_reducidor_ciudad_portaria_zona_sin_ley" ,name=""},
                {["label"]="zona norte",["req"]="", cost=0, type="node",nodoName="vendedor_herrero_pueblo_inicio"},
                {["label"]="zona sur",["req"]="", cost=0, type="node",name="explorar_bosque", nodoName="explorar_bosque"},
                {["label"]="mercado negro",["req"]="", cost=0, type="tienda",name="vendedor_ilegal_ciudad_portaria_zona_sin_ley", nodoName="explorar_bosque_costero"},
                {["label"]="Regresar al centro",["req"]="", cost=0, type="node", nodoName="ciudad_portaria" ,name=""},
            },
    },

},




["ciudad_portaria_rutas"]={
    {
        id="Inicio_1",
        name="Ciudad portaria",
        tipo="hub",
        desq="una bulliciosa ciudad.",
        opciones={
                {["label"]="pueblo del bosque",["req"]="", cost=0, type="node", nodoName="ruta_pueblo_del_bosque_a_ciudad_portaria" ,name=""},
                {["label"]="Ciudad gemela",["req"]="", cost=0, type="node", nodoName="ruta_ciudad_portaria_a_ciudad_gemelas" ,name=""},
                {["label"]="Ciudad de las bestias",["req"]="", cost=0, type="node",nodoName="ruta_ciudad_portaria_a_ciudad_de_las_bestias"},
                {["label"]="Capital",["req"]="", cost=0, type="node",nodoName="ruta_ciudad_portaria_a_ciudad_capital"},
                {["label"]="Regresar",["req"]="", cost=0, type="node", nodoName="ciudad_portaria" ,name=""},

                --[5]={["label"]="Ruta al pueblo",["req"]="", cost=0, type="node",nodoName="ruta_a_ciudad",finalNode="ciudad_principal"},
        },
    },

},
--- Ciudad de las bestias
--- necropolis
--- Capital
-- Ciudad de hechizeros
-- ciudad en ruinas

-- Torre de mago
-- montañas
-- ruinas

-- pais vecino

-- Capital imperial
-- ciudad subyugada_01
-- ciudad subyugada_02
-- ciudad en ruinas


--rutas



["ruta_pueblo_del_bosque_a_ciudad_portaria"]={
    {
        id="Inicio_1",
        name="inicio",
        tipo="mensaje",
        desq="Te encuentras de camino a la ciudad cercana",
        msg={"Te encuentras de camino a la ciudad cercana", "El camino es peligroso"},
        opciones={
        [1]={["label"]="Avanzar",["req"]="", cost=0, type="next",name=""},
        },
    },
    {
        id="Random_1",
        name="Evento_1",
        tipo="mazo",
        desq="Carta",
        deck=cards,
    }
    ,
    {
        id="Random_1",
        name="Evento_1",
        tipo="mazo",
        desq="Carta",
        deck=cards,
    },
    {
        id="zona_peligroza_ruta_01",
        name="Zona peligrosa",
        tipo="mensaje",
        desq="sientes el peligro a tu alrededor.",
        opciones={
                [1]={["label"]="luchar",["req"]="", cost=0, type="battle", nodoName="bosque_base_01",name=""},
        },
    },  
    {
        id="FINAL_ruta_ciudad_01",
        name="llegan a la ciudad",
        tipo="mensaje",
        desq="una enorme ciudad a la vista",
        opciones={
                [1]={["label"]="Entrar",["req"]="", cost=0, type="node", nodoName="pueblo_inicio_01" ,name=""},
                [2]={["label"]="reinciar",["req"]="", cost=0, type="reinciar", nodoName="pueblo_inicio_01" ,name=""},
        },
    },   
},

["explorar_bosque_costero"]={
{
        id="Inicio_1",
        name="inicio",
        tipo="mensaje",
        desq="Te haz perdido y necesitas salir del bosque, pero existen peligrosas bestias en tu camino.",
        opciones={
        [1]={["label"]="Avanzar",["req"]="", cost=0, type="next",name=""},
        },
    },
    {
        id="Random_1",
        name="Evento_1",
        tipo="mazo",
        desq="Carta",
        deck=cards,
    }
    ,
    {
        id="Random_1",
        name="Evento_1",
        tipo="mazo",
        desq="Carta",
        deck=cards,
    },
    {
        id="zona_peligroza_bosque_01",
        name="Zona peligrosa",
        tipo="mensaje",
        desq="sientes el peligro a tu alrededor.",
        opciones={
                [1]={["label"]="luchar",["req"]="", cost=0, type="battle", nodoName="bosque_base_01",name=""},
        },
    },
    {
        id="FINAL_zona_peligrosa_bosque_01",
        name="llegan al pueblo",
        tipo="mensaje",
        desq="Te encuentras un aliado antes de llegar al pueblo",
        opciones={
                [1]={["label"]="Entrar",["req"]="", cost=0, type="node", nodoName="pueblo_inicio_01" ,name=""},
                [2]={["label"]="reinciar",["req"]="", cost=0, type="reinciar", nodoName="explorar_bosque" ,name=""},
        },
    },
},

["ciudad_portaria_costa_peligrosa"]={
{
        id="Inicio_1",
        name="inicio",
        tipo="mensaje",
        desq="Te haz perdido y necesitas salir del bosque, pero existen peligrosas bestias en tu camino.",
        opciones={
        [1]={["label"]="Avanzar",["req"]="", cost=0, type="next",name=""},
        },
    },
    {
        id="Random_1",
        name="Evento_1",
        tipo="mazo",
        desq="Carta",
        deck=cards,
    }
    ,
    {
        id="Random_1",
        name="Evento_1",
        tipo="mazo",
        desq="Carta",
        deck=cards,
    },
    {
        id="zona_peligroza_bosque_01",
        name="Zona peligrosa",
        tipo="mensaje",
        desq="sientes el peligro a tu alrededor.",
        opciones={
                [1]={["label"]="luchar",["req"]="", cost=0, type="battle", nodoName="bosque_base_01",name=""},
        },
    },
    {
        id="FINAL_zona_peligrosa_bosque_01",
        name="llegan al pueblo",
        tipo="mensaje",
        desq="Te encuentras un aliado antes de llegar al pueblo",
        opciones={
                [1]={["label"]="Entrar",["req"]="", cost=0, type="node", nodoName="pueblo_inicio_01" ,name=""},
                [2]={["label"]="reinciar",["req"]="", cost=0, type="reinciar", nodoName="explorar_bosque" ,name=""},
        },
    },
},

["ciudad_portaria_zona_sin_ley_sur"]={
{
        id="Inicio_1",
        name="inicio",
        tipo="mensaje",
        desq="Te haz perdido y necesitas salir del bosque, pero existen peligrosas bestias en tu camino.",
        opciones={
        [1]={["label"]="Avanzar",["req"]="", cost=0, type="next",name=""},
        },
    },
    {
        id="Random_1",
        name="Evento_1",
        tipo="mazo",
        desq="Carta",
        deck=cards,
    }
    ,
    {
        id="Random_1",
        name="Evento_1",
        tipo="mazo",
        desq="Carta",
        deck=cards,
    },
    {
        id="zona_peligroza_bosque_01",
        name="Zona peligrosa",
        tipo="mensaje",
        desq="sientes el peligro a tu alrededor.",
        opciones={
                [1]={["label"]="luchar",["req"]="", cost=0, type="battle", nodoName="bosque_base_01",name=""},
        },
    },
    {
        id="FINAL_zona_peligrosa_bosque_01",
        name="llegan al pueblo",
        tipo="mensaje",
        desq="Te encuentras un aliado antes de llegar al pueblo",
        opciones={
                [1]={["label"]="Entrar",["req"]="", cost=0, type="node", nodoName="pueblo_inicio_01" ,name=""},
                [2]={["label"]="reinciar",["req"]="", cost=0, type="reinciar", nodoName="explorar_bosque" ,name=""},
        },
    },
},

["ciudad_portaria_zona_sin_ley_norte"]={
{
        id="Inicio_1",
        name="inicio",
        tipo="mensaje",
        desq="Te haz perdido y necesitas salir del bosque, pero existen peligrosas bestias en tu camino.",
        opciones={
        [1]={["label"]="Avanzar",["req"]="", cost=0, type="next",name=""},
        },
    },
    {
        id="Random_1",
        name="Evento_1",
        tipo="mazo",
        desq="Carta",
        deck=cards,
    }
    ,
    {
        id="Random_1",
        name="Evento_1",
        tipo="mazo",
        desq="Carta",
        deck=cards,
    },
    {
        id="zona_peligroza_bosque_01",
        name="Zona peligrosa",
        tipo="mensaje",
        desq="sientes el peligro a tu alrededor.",
        opciones={
                [1]={["label"]="luchar",["req"]="", cost=0, type="battle", nodoName="bosque_base_01",name=""},
        },
    },
    {
        id="FINAL_zona_peligrosa_bosque_01",
        name="llegan al pueblo",
        tipo="mensaje",
        desq="Te encuentras un aliado antes de llegar al pueblo",
        opciones={
                [1]={["label"]="Entrar",["req"]="", cost=0, type="node", nodoName="pueblo_inicio_01" ,name=""},
                [2]={["label"]="reinciar",["req"]="", cost=0, type="reinciar", nodoName="explorar_bosque" ,name=""},
        },
    },
},


["explorar_bosque"]={
{
        id="Inicio_1",
        name="inicio",
        tipo="mensaje",
        desq="Te haz perdido y necesitas salir del bosque, pero existen peligrosas bestias en tu camino.",
        opciones={
        [1]={["label"]="Avanzar",["req"]="", cost=0, type="next",name=""},
        },
    },
    {
        id="Random_1",
        name="Evento_1",
        tipo="mazo",
        desq="Carta",
        deck=cards,
    }
    ,
    {
        id="Random_1",
        name="Evento_1",
        tipo="mazo",
        desq="Carta",
        deck=cards,
    },
    {
        id="zona_peligroza_bosque_01",
        name="Zona peligrosa",
        tipo="mensaje",
        desq="sientes el peligro a tu alrededor.",
        opciones={
                [1]={["label"]="luchar",["req"]="", cost=0, type="battle", nodoName="bosque_base_01",name=""},
        },
    },
    {
        id="FINAL_zona_peligrosa_bosque_01",
        name="llegan al pueblo",
        tipo="mensaje",
        desq="Te encuentras un aliado antes de llegar al pueblo",
        opciones={
                [1]={["label"]="Entrar",["req"]="", cost=0, type="node", nodoName="pueblo_inicio_01" ,name=""},
                [2]={["label"]="reinciar",["req"]="", cost=0, type="reinciar", nodoName="explorar_bosque" ,name=""},
        },
    },
},


["escape_Bosque"]={
    {
        id="Inicio_1",
        name="inicio",
        tipo="mensaje",
        desq="Te haz perdido y necesitas salir del bosque, pero existen peligrosas bestias en tu camino.",
        opciones={
        [1]={["label"]="Avanzar",["req"]="", cost=0, type="next",name=""},
        },
    },
    {
        id="Random_1",
        name="Evento_1",
        tipo="mazo",
        desq="Carta",
        deck=cards,
    }
    ,
    {
        id="Random_1",
        name="Evento_1",
        tipo="mazo",
        desq="Carta",
        deck=cards,
    },
    {
        id="zona_peligroza_bosque_01",
        name="Zona peligrosa",
        tipo="mensaje",
        desq="sientes el peligro a tu alrededor.",
        opciones={
                [1]={["label"]="luchar",["req"]="", cost=0, type="battle", nodoName="bosque_base_01",name=""},
        },
    },
    {
        id="zona_peligroza_bosque_02",
        name="Nuevo compañero",
        tipo="get",
        desq="Te encuentras un aliado antes de llegar al pueblo",
        opciones={
                [1]={["label"]="Aceptar",["req"]="", cost=0, type="aceptar", nodoName="",name="",gain="addPNJ"},
                [2]={["label"]="Negar"  ,["req"]="", cost=0, type="next", nodoName="",name=""},
        },
    },   
    {
        id="luchar_por_el_pueblo",
        name="llegas al pueblo, pero es atacado.",
        tipo="mensaje",
        desq="Defiende el pueblo del peligro",
        opciones={
                [1]={["label"]="luchar",["req"]="", cost=0, type="battle", nodoName="bosque_base_01",name=""},
        },
    },
    {
        id="FINAL_zona_peligrosa_bosque_01",
        name="llegan al pueblo",
        tipo="mensaje",
        desq="Te encuentras un aliado antes de llegar al pueblo",
        opciones={
                [1]={["label"]="Entrar",["req"]="", cost=0, type="node", nodoName="pueblo_inicio_01" ,name=""},
                [2]={["label"]="reinciar",["req"]="", cost=0, type="reinciar", nodoName="explorar_bosque" ,name=""},
        },
    },   

},

--Deprecado
["PUEBLO_INICIAL"]={

        {
        id="Inicio_1",
        name="inicio",
        tipo="mensaje",
        msg={"","",""},
        desq="El hermoso prueblo",
        opciones={
        [1]={["label"]="Vendedor",["req"]="", cost=0, type="npc",name=""},
        [2]={["label"]="Herrero",["req"]="", cost=0, type="npc",name=""},
        [3]={["label"]="alcalde",["req"]="", cost=0, type="npc",name=""},
        [4]={["label"]="bosque magico",["req"]="", cost=0, type="node",name="escape_Bosque"},
        [5]={["label"]="Ruta",["req"]="", cost=0, type="node",nodoName="ruta_a_ciudad",finalNode="ciudad_principal"},
        },
    },   
},

--referencias
["ciudad_principal"]={
        {
        id="Inicio_1",
        name="inicio",
        tipo="mensaje",
        msg={"","",""},
        desq="El hermoso prueblo",
        opciones={
        [1]={["label"]="distrito comercial",["req"]="", cost=0, type="node",nodoName=""},
        [2]={["label"]="suburbios!!",["req"]="", cost=0, type="node",nodoName=""},
        [3]={["label"]="castillos!!",["req"]="", cost=0, type="node",nodoName=""},
        [4]={["label"]="calles bajas!!",["req"]="", cost=0, type="node",nodoName="escape_Bosque"},
        [5]={["label"]="Ruta",["req"]="", cost=0, type="node",nodoName="ruta_a_ciudad",finalNode="PUEBLO_INICIAL"},
        },
    },
},


--Deprecado
["TEST_01"]={
    {
        id="Inicio_1",
        name="inicio",
        tipo="mensaje",
        desq="Comenzar el viaje",
        opciones={
        [1]={["label"]="Avanzar",["req"]="", cost=0, type="next",name=""},
        },
    },
    {
        id="Random_1",
        name="Evento_1",
        tipo="mazo",
        desq="Carta",
        deck=cards,
    }
    ,
    {
        id="Random_1",
        name="Evento_1",
        tipo="mazo",
        desq="Carta",
        deck=cards,
    }
    ,
    {
        id="Random_1",
        name="Evento_1",
        tipo="mazo",
        desq="Carta",
        deck=cards,
    }
    ,
    {
        id="Final_1",
        name="FINAL",
        tipo="mensaje",
        --tipo="rush_fight",
        desq="encuentro con grupo de enemigos",
        opciones={
        [1]={["label"]="Volver",["req"]="", cost=0, type="node", nodoName="inicio01",name=""},
        [2]={["label"]="Reiniciar",["req"]="", cost=0, type="reinciar",name=""},
        },
    }
},






["inicio01"]={    
    {
        id="Inicio_1",
        name="inicio",
        tipo="mensaje",
        desq="Comenzar el viaje : )",
        opciones={
        [1]={["label"]="Avanzar",["req"]="", cost=0, type="next",name=""},
        },
    },
    {
        id="Inicio_2",
        name="inicio",
        tipo="mensaje",
        desq="Comenzar el viaje",
        opciones={
        [1]={["label"]="Bosque A",["req"]="", cost=0, type="nodo", nodoName="bosque_A",name=""},
        [2]={["label"]="Bosque B",["req"]="", cost=0, type="nodo", nodoName="bosque_A",name=""},
        [3]={["label"]="monster Fight",["req"]="", cost=0, type="battle", nodoName="00001",name=""},
        [4]={["label"]="mercader",["req"]="", cost=0, type="npc",  nodoName="",name=""},
        },
    }
}

,

["cueva_secreta_bosque"]={
     {
        id="Inicio_1",
        name="inicio",
        tipo="mensaje",
        desq="Comienzan a explorar la cueva",
        opciones={
        [1]={["label"]="Avanzar",["req"]="", cost=0, type="next",name=""},
        },
    }
    ,
    {
        id="Random_1",
        name="Evento_1",
        tipo="mazo",
        desq="Carta",
        deck=cards,
    }
    ,
    {
        id="Random_2",
        name="Evento_1",
        tipo="mazo",
        desq="Carta",
        deck=cards,
    }
    ,
    {
        id="Random_3",
        name="Evento_1",
        tipo="mazo",
        desq="Carta",
        deck=cards,
    }
    ,
    {
        id="Final_1",
        name="FINAL",
        tipo="mensaje",
        desq="encuentran la salida de la cueva",
        opciones={
        [1]={["label"]="Salir cueva",["req"]="", cost=0, type="node", nodoName="explorar_bosque",name=""},
        [2]={["label"]="Reiniciar",["req"]="", cost=0, type="reinciar",name=""},
        },
    }

},

["bosque_A"]={    
    {
        id="Inicio_1",
        name="inicio",
        tipo="mensaje",
        desq="Comenzar el viaje",
        opciones={
        [1]={["label"]="Avanzar",["req"]="", cost=0, type="next",name=""},
        },
    }
    ,
    {
        id="Random_1",
        name="Evento_1",
        tipo="mazo",
        desq="Carta",
        deck=cards,
    }
    ,
    {
        id="Random_2",
        name="Evento_1",
        tipo="mazo",
        desq="Carta",
        deck=cards,
    }
    ,
    {
        id="Random_3",
        name="Evento_1",
        tipo="mazo",
        desq="Carta",
        deck=cards,
    }
    ,
    {
        id="Final_1",
        name="FINAL",
        tipo="mensaje",
        desq="encuentro con grupo de enemigos",
        opciones={
        [1]={["label"]="Volver",["req"]="", cost=0, type="node", nodoName="inicio01",name=""},
        [2]={["label"]="Reiniciar",["req"]="", cost=0, type="reinciar",name=""},
        },
    }
}

,

["cueva_A"]={    
    {
        id="Inicio_cueva_A",
        name="inicio",
        tipo="mensaje",
        desq="Comenzar el viaje",
        opciones={
        [1]={["label"]="Avanzar",["req"]="", cost=0, type="next",name=""},
        },
    }
    ,
    {
        id="en",
        name="Evento_1",
        tipo="rush_fight",
        desq="amenazas encontradas",
        opciones={
        [1]={["label"]="Avanzar",["req"]="", cost=0, type="next",name=""},
        },
    }
    ,
    {
        id="Final_cueva_A",
        name="FINAL",
        tipo="mensaje",
        --tipo="rush_fight",
        desq="encuentro con grupo de enemigos",
        opciones={
        [1]={["label"]="Volver",["req"]="", cost=0, type="node", nodoName="inicio01",name=""},
        [2]={["label"]="Reiniciar",["req"]="", cost=0, type="reinciar",name=""},
        },
    }
}

}

Paranatural_CARD={}
Mistery_mens={}
Magic_Being={}
Monster_best={}
Normal_best={}


rutas_deck={}

masmorra_deck={}

special_card_deck={}


montanna_deck={
    {
        id="evento_1",
        name="roca",
        desq="Una gigantesca roca tapa el camino",
        opciones={
        [1]={["label"]="Constitucion",["req"]="(12 DC)", cost=0, type="stat",name="", stat="con",dc=12},
        [2]={["label"]="Magia",["req"]="(4 MP)", cost=4, type="MP",name="",stat="con",dc=12},
        [3]={["label"]="Bomba",["req"]="(1 items)", cost=1, type="items",name="bomba",stat="con",dc=12},
        [4]={["label"]="Desviarse",["req"]="(8 MP)", cost=8, type="MP",name="",stat="",dc=12},
        },
    },

    {
        id="evento_2",
        name="Avalancha",
        desq="Un Avalancha de rocas cae sobre el grupo",
        opciones={
        [1]={["label"]="Esquivar",["req"]="(10 DC)", cost=0, type="stat",name="",stat="des",dc=10},
        [2]={["label"]="Correr",["req"]="(8 DC)", cost=4, type="stat",name="",stat="agi", dc=8},
        [3]={["label"]="bloquear",["req"]="(12 DC)", cost=1, type="stat",name="", stat="con",dc=12},
        },
    },

        {
        id="evento_7",
        name="Atrapado por Roca",
        desq="Una Roca cae y quedan atrapado bajo ella",
        opciones={
        [1]={["label"]="Levantar (CON)",["req"]="(10 DC)", cost=0, type="stat",name="",stat="des",dc=10},
        [2]={["label"]="Destrozar (FUE)",["req"]="(8 DC)", cost=4, type="stat",name="",stat="agi", dc=8},
        [3]={["label"]="Improvisar polea (INT)",["req"]="(12 DC)", cost=1, type="stat",name="bomba", stat="con",dc=12},
        [4]={["label"]="Magia (MP)",["req"]="(4 MP)", cost=4, type="MP",name="", stat="con",dc=12},
        },
    },
}


extra_deck={}
bosque_deck={

    {
        id="trampa_cazador_1",
        name="Agujero Trampa",
        desq="Caen en una trampa, un profundo agujero dificil de escalar",
        tipo="trampa",
        evaluar={stat="per",dc=10, msg="evitas la trampa"},
        opciones={
        [1]={["label"]="Escalar (AGI)",["req"]="(10 DC)", cost=0, type="stat",name="",stat="des",dc=10},
        [2]={["label"]="Trepar (CON)",["req"]="(8 DC)", cost=4, type="stat",name="",stat="agi", dc=8},
        [3]={["label"]="improvisar (INT)",["req"]="(8 DC)", cost=4, type="stat",name="",stat="agi", dc=8},
        [4]={["label"]="Magia (MP)",["req"]="(4 MP)", cost=1, type="mp",name="bomba", stat="con",dc=12},
        },
    },
    {
        id="trampa_cazador_2",
        name="Agujero estacas",
        desq="Caen en una trampa, un agujero con estacas",
        tipo="trampa",
        evaluar={stat="per",dc=10, msg="evitas la trampa"},
        opciones={
        [1]={["label"]="Escalar (AGI)",["req"]="(10 DC)", cost=0, type="stat",name="",stat="des",dc=10},
        [2]={["label"]="Trepar (CON)",["req"]="(8 DC)", cost=4, type="stat",name="",stat="agi", dc=8},
        [3]={["label"]="improvisar (INT)",["req"]="(8 DC)", cost=4, type="stat",name="",stat="agi", dc=8},
        [4]={["label"]="Magia (MP)",["req"]="(4 MP)", cost=1, type="mp",name="bomba", stat="con",dc=12},
        },
    },
    {
        id="trampa_cazador_3",
        name="Cueva secreta",
        tipo="trampa",
        evaluar={stat="per",dc=10, msg="evitas la trampa"},
        desq="Caen un trampa que los lleva a una cueva secreta",
        opciones={
        [1]={["label"]="Explorar",["req"]="(10 DC)", cost=0, type="stat",name="",nodoName="cueva_secreta_bosque",stat="des",dc=10},
        [2]={["label"]="Escalar (AGI)",["req"]="(8 DC)", cost=4, type="stat",name="",stat="agi", dc=8},
        [3]={["label"]="Trepar (CON)",["req"]="(12 DC)", cost=1, type="stat",name="bomba", stat="con",dc=12},
        [4]={["label"]="improvisar (INT)",["req"]="(8 DC)", cost=4, type="stat",name="",stat="agi", dc=8},
        [5]={["label"]="Magia (MP)",["req"]="(4 MP)", cost=1, type="mp",name="bomba", stat="con",dc=12},
        },
    },


    {
        id="cueva_secreta_00",
        name="Cueva secreta",
        tipo="normal",
        desq="Descubren una cueva secreta",
        opciones={
        [1]={["label"]="Entrar",["req"]="(10 DC)", cost=0, type="stat",name="",nodoName="cueva_secreta_bosque",stat="des",dc=10},
        [2]={["label"]="Analizar (INT)",["req"]="(8 DC)", cost=4, type="stat",name="",stat="agi", dc=8},
        [3]={["label"]="Continuar",["req"]="(12 DC)", cost=1, type="stat",name="bomba", stat="con",dc=12},
        },
    },
    

    {
        id="evento_3",
        name="tormenta",
        tipo="normal",
        desq="Un tormenta se acerca",
        opciones={
        [1]={["label"]="buscar refugio (PER)",["req"]="(10 DC)", cost=0, type="stat",name="",stat="des",dc=10},
        [2]={["label"]="Viajar por la tormenta (CON)",["req"]="(8 DC)", cost=4, type="stat",name="",stat="agi", dc=8},
        [3]={["label"]="Saber natural (INT)",["req"]="(12 DC)", cost=1, type="stat",name="bomba", stat="con",dc=12},
        [4]={["label"]="supervivencia (INT)",["req"]="(12 DC)", cost=1, type="stat",name="bomba", stat="con",dc=12},
        },
    },

    
    {
        id="evento_4",
        name="Hambre",
        tipo="normal",
        desq="el hambre ataca al grupo",
        opciones={
        [1]={["label"]="buscar comida (PER)",["req"]="(10 DC)", cost=0, type="stat",name="",stat="des",dc=10},
        [2]={["label"]="aguantar (CON)",["req"]="(8 DC)", cost=4, type="stat",name="",stat="agi", dc=8},
        [3]={["label"]="Saber natural (INT)",["req"]="(12 DC)", cost=1, type="stat",name="bomba", stat="con",dc=12},
        [4]={["label"]="supervivencia",["req"]="(12 DC)", cost=1, type="stat",name="bomba", stat="con",dc=12},
        },
    },

    {
        id="evento_5",
        name="Perdido",
        tipo="trampa",
        desq="Se han perdido en el bosque",
        opciones={
        [1]={["label"]="Buscar salida (PER)",["req"]="(10 DC)", cost=0, type="stat",name="",stat="des",dc=10},
        [2]={["label"]="Saber natural (INT)",["req"]="(8 DC)", cost=4, type="stat",name="",stat="agi", dc=8},
        [3]={["label"]="orientar (INT)",["req"]="(12 DC)", cost=1, type="stat",name="bomba", stat="con",dc=12},
        },
    },

    {
        id="evento_6",
        name="Cruzar el rio",
        tipo="normal",
        desq="un torrentoso rio en el camino",
        opciones={
        [1]={["label"]="buscar otro camino (PER)",["req"]="(10 DC)", cost=0, type="stat",name="",stat="des",dc=10},
        [2]={["label"]="improvisar un puente (INT)",["req"]="(8 DC)", cost=4, type="stat",name="",stat="agi", dc=8},
        [3]={["label"]="derribar un arbol y cruzar (CON)",["req"]="(12 DC)", cost=1, type="stat",name="bomba", stat="con",dc=12},
        },
    },

    {
        id="evento_9",
        name="Ladrones del camino",
        tipo="trampa",
        evaluar={stat="per",dc=10, msg="evitas ser visto",cons="node",nodoName="murcielago_salvaje_01"},
        desq="Ladrones amenazan al grupo",
        opciones={
        [1]={["label"]="Amenazar (CON)",["req"]="(10 DC)", cost=0, type="stat",name="",stat="des",dc=10},
        [2]={["label"]="Mentir (INT)",["req"]="(8 DC)", cost=4, type="stat",name="",stat="agi", dc=8},
        [3]={["label"]="Engañar (CAR)",["req"]="(12 DC)", cost=1, type="stat",name="", stat="con",dc=12},
        [4]={["label"]="Dialogar (CAR)",["req"]="(12 DC)", cost=1, type="stat",name="", stat="con",dc=12},
        [5]={["label"]="Escapar (AGI)",["req"]="(12 DC)", cost=1, type="stat",name="", stat="con",dc=12},
        [6]={["label"]="Entrar en combate !!",["req"]="(12 DC)", cost=1,type="battle", nodoName="murcielago_salvaje_01",name="bomba", stat="con",dc=12},
        },
    },

    {
        id="evento_10",
        name="Animal Salvaje",
        desq="Animal Salvaje",
        tipo="trampa",
        evaluar={stat="per",dc=10, msg="evitas ser visto",cons="node",nodoName="murcielago_salvaje_01"},
        opciones={
        [1]={["label"]="Espantar (INT)",["req"]="(10 DC)", cost=0, type="stat",name="",stat="des",dc=10},
        [2]={["label"]="Escapar (AGI)",["req"]="(12 DC)", cost=1, type="stat",name="", stat="con",dc=12},
        [3]={["label"]="Saber natural (INT)",["req"]="(12 DC)", cost=1, type="stat",name="", stat="con",dc=12},
        [4]={["label"]="Entrar en combate",["req"]="(12 DC)", cost=1,type="battle", nodoName="murcielago_salvaje_01",name="bomba", stat="con",dc=12},
        },
    },

    {
        id="evento_11",
        name="Paranormal",
        desq="Paranormal",
        tipo="trampa",
        evaluar={stat="per",dc=10, msg="evitas ser visto",cons="node",nodoName="murcielago_salvaje_01"},
        opciones={
        [1]={["label"]="investigar (INT)",["req"]="(10 DC)", cost=0, type="stat",name="",stat="des",dc=10},
        [2]={["label"]="Observar (PER)",["req"]="(12 DC)", cost=1, type="stat",name="", stat="con",dc=12},
        [3]={["label"]="Consecuencias",["req"]="(12 DC)", cost=1, type="pay",name="", stat="con",dc=12},
        [4]={["label"]="Entrar en combate",["req"]="(12 DC)", cost=1,type="battle", nodoName="murcielago_salvaje_01",name="bomba", stat="con",dc=12},
        },
    },

    {
        id="evento_12",
        name="Mistery men",
        desq="Mistery men",
        tipo="trampa",
        evaluar={stat="per",dc=10, msg="evitas ser visto",cons="node",nodoName="murcielago_salvaje_01"},
        opciones={
        [1]={["label"]="Store",["req"]="", cost=0, type="npc",name="",stat="des",dc=10},
        [2]={["label"]="Investigar (INT)",["req"]="(12 DC)", cost=1, type="stat",name="", stat="con",dc=12},
        [3]={["label"]="Observar (PER)",["req"]="(12 DC)", cost=1, type="pay",name="", stat="con",dc=12},
        [4]={["label"]="Entrar en combate",["req"]="(12 DC)", cost=1,type="battle", nodoName="murcielago_salvaje_01",name="bomba", stat="con",dc=12},
        },
    },

    {
        id="evento_13",
        name="Mistery men",
        desq="Mistery men",
        opciones={
        [1]={["label"]="estudiar (INT)",["req"]="", cost=0, type="stat",name="",stat="des",dc=10},
        [2]={["label"]=" Observar (PER)",["req"]="(12 DC)", cost=1, type="stat",name="", stat="con",dc=12},
        [3]={["label"]="Afrontar (CON)",["req"]="(12 DC)", cost=1, type="stat",name="", stat="con",dc=12},
        [4]={["label"]="Eludir (AGI)",["req"]="(12 DC)", cost=1, type="stat",name="bomba", stat="con",dc=12},
        },
    },

    {
        id="evento_14",
        name="humo en el bosque",
        desq="humo en el bosque",
        opciones={
        [1]={["label"]="Investigar (INT) ",["req"]="(12 DC)", cost=0, type="stat",name="", stat="con", dc=12},
        [2]={["label"]="Observar (PER)",["req"]="(4 MP)", cost=4, type="stat",name="",stat="con", dc=12},
        [3]={["label"]="Ignorar",["req"]="", cost=8, type="pat",name="",stat="con", dc=12},
        },
    },
}

cards={}
cards=bosque_deck

Tiendas={}
Tiendas["vendedor_tienda_pueblo_inicio"]={
    name="vendedor",
    tipo="store",
    inn_cost=0,
    itemsList={
        {id=lista_items_juego["pocion"].id,name=lista_items_juego["pocion"].name,cost=lista_items_juego["pocion"].cost+10,objeto=lista_items_juego["pocion"]},
        {id=lista_items_juego["ether"].id,name=lista_items_juego["ether"].name,cost=lista_items_juego["ether"].cost+10,objeto=lista_items_juego["ether"]},
        {id=lista_items_juego["bomba"].id,name=lista_items_juego["bomba"].name,cost=lista_items_juego["bomba"].cost+10,objeto=lista_items_juego["bomba"]},
        {id=lista_items_juego["revivir"].id,name=lista_items_juego["revivir"].name,cost=lista_items_juego["revivir"].cost+10,objeto=lista_items_juego["revivir"]},
        {id=lista_items_juego["antidoto"].id,name=lista_items_juego["antidoto"].name,cost=lista_items_juego["antidoto"].cost+10,objeto=lista_items_juego["antidoto"]},
     }
}

Tiendas["vendedor_inn_pueblo_inicio"]={
    name="vendedor",
    tipo="inn",
    inn_cost=10,
    itemsList={
        {id=lista_items_juego["pocion"].id,name=lista_items_juego["pocion"].name,cost=lista_items_juego["pocion"].cost+10,objeto=lista_items_juego["pocion"]},
        {id=lista_items_juego["ether"].id,name=lista_items_juego["ether"].name,cost=lista_items_juego["ether"].cost+10,objeto=lista_items_juego["ether"]},
     }
}
Tiendas["vendedor_herrero_pueblo_inicio"]={
    name="vendedor",
    tipo="store",
    inn_cost=0,
    itemsList={
        {id=weapon_list["espada_corta"].id,name=weapon_list["espada_corta"].name,cost=weapon_list["espada_corta"].cost,objeto=weapon_list["espada_corta"]},
        {id=weapon_list["espada_larga"].id,name=weapon_list["espada_larga"].name,cost=weapon_list["espada_larga"].cost,objeto=weapon_list["espada_larga"]},
        {id=weapon_list["hacha"].id,name=weapon_list["hacha"].name,cost=weapon_list["hacha"].cost,objeto=weapon_list["hacha"]},
        {id=weapon_list["daga"].id,name=weapon_list["daga"].name,cost=weapon_list["daga"].cost,objeto=weapon_list["daga"]},
        {id=weapon_list["arco_corto"].id,name=weapon_list["arco_corto"].name,cost=weapon_list["arco_corto"].cost,objeto=weapon_list["arco_corto"]},
        {id=weapon_list["escudo_de_madera"].id,name=weapon_list["escudo_de_madera"].name,cost=weapon_list["escudo_de_madera"].cost,objeto=weapon_list["escudo_de_madera"]},
        {id=armadura_list["armadura_bronce"].id,name=armadura_list["armadura_bronce"].name,cost=armadura_list["armadura_bronce"].cost,objeto=armadura_list["armadura_bronce"]},
     }
}


Tiendas["vendedor_spell_pueblo_inicio"]={
    name="vendedor",
    tipo="store",
    inn_cost=0,
    itemsList={
        {id=libros_lista["libro_fuego"].id,name=libros_lista["libro_fuego"].name,cost=libros_lista["libro_fuego"].cost,objeto=libros_lista["libro_fuego"]},
        {id=libros_lista["libro_hielo"].id,name=libros_lista["libro_hielo"].name,cost=libros_lista["libro_hielo"].cost,objeto=libros_lista["libro_hielo"]},
        {id=libros_lista["libro_electro"].id,name=libros_lista["libro_electro"].name,cost=libros_lista["libro_electro"].cost,objeto=libros_lista["libro_electro"]},
     }
}



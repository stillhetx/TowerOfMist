        magics={["milagros"]=true},
        magics={["magia"]=true},
        magics={["invocaciones"]=true},
        magics={["Power.Stone"]=true},
        magics={["spirit"]=true},
        magics={["Power.Stone"]=true,["tools"]=true},
        magics={["canciones"]=true,["bailes"]=true},
        magics={["Blu.magic"]=true},
                magics={["llamar"]=true},
        magics={["magia"]=true,["espadas"]=true},

        
        magics={["bullet"]=true},
        magics={["usar"]=true},

Menus principal
------------------
Atacar
secundario  habilidad preferida de la clase
Magias      lista de habilidades magicas
Colecciones lista de habilidades no magicas
especiales  habilidades especiales
tecnicas    Habilidades no magicas
objetos

menu secundario
------------------
huir
extra       Habilidades situacionales
Arma        cambiar arma
complemento cambiar complemento

ACC_Default={
"atacar","secundario","W.Arts", "magic","coleccion","especiales","tecnica","objeto","defensa"
}

"atacar","secundario","W.Arts", "magic","magics","coleccion","colecciones","especiales","tecnica","objeto","defensa"

opciones={"equipo", "inventario","magia","perks","acciones","runas"},

acc_default={}

Magias      
    magia           magia normal
    milagros        magia divina
    invocaciones    magia de invocacion
    spirit          Habilidades de espiritu
    canciones       canciones magicas
    bailes          bailes especiales
    Blu.magic       magia de monstruos
    transformacion  transformaciones
    espadas         magia de espadas
    modo?           modos de batalla

Colecciones 
    Power.Stone
    tools
    llamar
    compañeros
    ordenes
    bullet
    usar
    

--v.weapon.left.extra.value[1] v.weapon.left.extra.name

"Power.Stone"

        powerStone={{name="fuego", id="fuego",dir="e",cost=1,cant=100,tipo="ofensivo",}, 
                    {name="hielo",  id="hielo",dir="e",cost=1,cant=100,tipo="ofensivo",}},

    usar es alquimia potencia las poteciones

            isLlamar=false,
        isUsar=false,


especiales  habilidades especiales
tecnicas    Habilidades no magicas


        magics={"w.magic", "invocar"},



        mg={},
        beast={},
        art={},
        sk={},
        blue={},
        morph={},
        swm={},
        tools={},
        bullet={},
        spe={},        
        spirit={},
        powerStone={},
        comandos={},
        invo={ },
        mix={},
        cancion={},
        bailes={},
        ninja={},
        milagros={},
        oracion={},
        variable={},



fantasmas: aparecen de monstruos derrotados
desconocido: algunos monstruos esconden su naturaleza, para mostrar otro tipo de monstruo.
babosas: crean clones mas debiles.
secuaces: llaman refuerzos.
buffeador: potencia a sus aliados.
sanadores: sanan los monstruos.
shaman: reviven enemigos derrotados.
invocador: llaman criaturas fuertes.

lobos: llaman por ayuda.

armaduras: poseen una enorme defensa.
metal: solo es afectado por criticos.
golem: resistentes y mucha vida.

Anti-magia: inmune a la magia.
inti-fisico/espectros: inmunes a los ataques fisicos.

elementales: debilidad elemental y absorven elemento.

espiritus: debilidad elemental y repelen elemento.

magicos: debilidad elemental y resistentes a elemento.

brujas: maldicen-debuff 
poderoso: poderosos critico.
tirador: poderosos critico.

estratega: prioriza sanador y magos.
luchador: prioriza luchador.

malvados: atacan al mas debil.


#bosque
---------
spider -- arachnophobia mode
lobos
murcielago
serpientes
lagarto

#Agua
------
serpiente marina
tiburon
pulpo
medusa


#bosque_magico
-------------
Arbol maligno
slime
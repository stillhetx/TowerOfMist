
equipo_slot={
{name="mano izq", id="weapon_izq"},
{name="mano der", id="weapon_der"},
{name="complemento", id="complemento"},
{name="cabeza", id="cabeza"},
{name="armadura", id="armadura"},
{name="accesorio 1", id="accesorio_1"},
{name="accesorio 2", id="accesorio_2"},
{name="artefacto", id="artefacto"},


}


experienceTable = {
        0, 8, 24, 52, 96, 160, 248, 364, 512, 696,
        920, 1188, 1504, 1872, 2296, 2780, 3332, 3956, 4656, 5436,
        6300, 7252, 8296, 9436, 10676, 12020, 13472, 15036, 16716, 18516,
        20440, 22500, 24692, 27020, 29488, 32100, 34860, 37772, 40840, 44068,
        47460, 51020, 54752, 58660, 62748, 67020, 71480, 76132, 80980, 86028,
        91280, 96740, 102412, 108300, 114408, 120740, 127300, 134092, 141120, 148388,
        155900, 163660, 171672, 179940, 188468, 197260, 206320, 215652, 225260, 235148,
        245320, 255780, 266532, 277580, 288928, 300580, 312540, 324812, 337400, 350308,
        363540, 377100, 390992, 405220, 419788, 434700, 449960, 465572, 481540, 497868,
        514560, 531620, 549052, 566860, 585048, 603620, 622580, 641932, 661680
}

desarmado={name="puños",id="puños",wtipo="equipo",familia="puños",def=0, w=1,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1, color={1,1,1,1}, extra={},}

weapon_mod={}

weapon_inventary_see={}
weapon_inventary={


 {tipo_item="arma",name="espada larga",   cost=10,wtipo="equipo",id="espada_larga",familia="espada_larga",subFamilia="default",nv=1,def=0, w=8,bw=1,tipo="cortante",subTipo="cortante", modo="2h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
 {tipo_item="arma",name="espada larga de piromante",   cost=10, wtipo="equipo",id="espada_larga_de_piromante",familia="espada_larga",subFamilia="default",nv=1,def=0,w=8,bw=6,tipo="cortante",subTipo="fuego", modo="2h",smodo="white",dex="C",fue="B", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"elemental_fuego"},extra={},},
 {tipo_item="arma",name="Espada de la luz",   cost=10,wtipo="equipo",id="espada_de_la_luz",familia="espada_larga",subFamilia="default",nv=1,def=0, w=8,bw=6,tipo="cortante",subTipo="luz", modo="2h",smodo="white",dex="",fue="C", int="C",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"elemental_luz"},extra={},},
{tipo_item="arma",name="Espada de fuego",   cost=10, wtipo="equipo",id="espada_de_fuego",familia="espada_larga",subFamilia="default",nv=1,def=0, w=8,bw=6,tipo="cortante",subTipo="luz", modo="2h",smodo="white",dex="",fue="C", int="C",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"elemental_fuego"},extra={},},
 {tipo_item="arma",name="Espada electrica",   cost=10,wtipo="equipo",id="espada_electrica",familia="espada_larga",subFamilia="default",nv=1,def=0, w=8,bw=6,tipo="cortante",subTipo="luz", modo="2h",smodo="white",dex="",fue="C", int="C",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"elemental_electrico"},extra={},},
 {tipo_item="arma",name="Espada de hielo",   cost=10, wtipo="equipo",id="espada_de_hielo",familia="espada_larga",subFamilia="default",nv=1,def=0, w=8,bw=6,tipo="cortante",subTipo="luz", modo="2h",smodo="white",dex="",fue="C", int="C",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"elemental_hielo"},extra={},},

 {tipo_item="arma",name="Espada de la oscuridad",   cost=10,wtipo="equipo",id="espada_de_la_oscuridad",subFamilia="default",nv=1,def=0, familia="espada_larga", w=8,bw=6,tipo="cortante",subTipo="luz", modo="2h",smodo="white",dex="B",fue="B", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"elemental_oscuridad"},extra={},},
 {tipo_item="arma",name="Espada mitica",   cost=10, wtipo="equipo",id="espada_mitica",subFamilia="default",nv=1,def=0, familia="espada_larga", w=8,bw=6,tipo="cortante",subTipo="luz", modo="2h",smodo="white",dex="B",fue="B", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={{name="config",value={"crit"}}},},


 
{tipo_item="arma",name="daga de serpiente",id="daga_venenosa",  cost=10,wtipo="equipo",familia="dagas",subFamilia="default",nv=1,def=0, w=4,bw=1,tipo="cortante",modo="1h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"veneno"},extra={},},
 {tipo_item="arma",name="daga del sueño",id="daga_del_suenno",  cost=10,wtipo="equipo",familia="dagas",subFamilia="default",nv=1,def=0, w=4,bw=1,tipo="cortante",modo="1h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"sueño"},extra={},},
 {tipo_item="arma",name="daga de asesino",id="daga_de_asesino",  cost=10,wtipo="equipo",familia="dagas",subFamilia="default",nv=1,def=0, w=4,bw=1,tipo="cortante",modo="1h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"muerte"},extra={},},
 {tipo_item="arma",name="daga de mago",id="daga_de_mago",  cost=10,wtipo="equipo",familia="dagas",subFamilia="default",nv=1,def=0, w=4,bw=1,tipo="cortante",modo="1h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={},extra={{name="comando",value={"magic"}}},},

 {tipo_item="arma",name="grimorio basico",id="grimorio_basico",  cost=10,wtipo="equipo", familia="grimorio",subFamilia="default",w=4,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="", int="",pod="",sh=false,cont=1,color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={name="spells",value={{id="fuego",cont=5,max=5},{id="electro",cont=5,max=5},{id="agua",cont=5,max=5}}}},
{tipo_item="arma",name="grimorio de fuego",id="grimorio_de_fuego",  cost=10,wtipo="equipo",familia="grimorio",subFamilia="default",nv=1,def=0, w=4,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={{name="spells",value={{id="fuego",cont=5,max=5},{id="fuego+",cont=5,max=5}}}},},


 {tipo_item="arma",name="escudo de hielo",id="escudo_de_hielo",  cost=10,wtipo="equipo",familia="escudo",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1},ataque="", damage="",  isCast=false,cast={},extra={{name="perks",value={id="ABS_HIE",name="ABS.HIE", from="equip", value=0, str=""}}},},
 {tipo_item="arma",name="escudo de fuego",id="escudo_de_fuego",  cost=10,wtipo="equipo",familia="escudo",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1},ataque="", damage="",  isCast=false,cast={},extra={{name="perks",value={id="ABS_FUE",name="ABS.FUE", from="equip", value=0, str=""}}},},
 {tipo_item="arma",name="escudo del rayo",id="escudo_del_rayo",  cost=10,wtipo="equipo",familia="escudo",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={{name="perks",value={id="ABS_ELE",name="ABS.ELE", from="equip", value=0, str=""}}},},
 {tipo_item="arma",name="escudo espejo",id="escudo_espejo",  cost=10,wtipo="equipo",familia="escudo",subFamilia="default",nv=1,def=1, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={{name="perks",value={id="REFLEJO",name="REFLEJO", from="equip", value=0, str=""}}},},

}

weapon_list={
--KATANAS
katana = {tipo_item="arma",name="katana",id="katana",  cost=10,wtipo="equipo",familia="katana",subFamilia="default",nv=1,def=0, w=6,bw=1,tipo="cortante",modo="1h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={}, extra={}, efectos={}},
katana_sangrienta = {tipo_item="arma",name="katana sangrienta",id="katana_sangrienta",  cost=10,wtipo="equipo",familia="katana",subFamilia="default",nv=1,def=0, w=6,bw=1,tipo="cortante",modo="1h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1},ataque="", damage="", isCast=false,cast={}, extra={}, efectos={["sangrado"]=10,}},
masamune = {tipo_item="arma",name="katana sangrienta",id="katana_sangrienta",  cost=10,wtipo="equipo",familia="katana",subFamilia="default",nv=1,def=0, w=6,bw=1,tipo="cortante",modo="1h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={}, extra={}, efectos={["muerte"]=10,}},
katana_maldita = {tipo_item="arma",name="katana maldita",id="katana_maldita",  cost=10,wtipo="equipo",familia="katana",subFamilia="default",nv=1,def=0, w=6,bw=1,tipo="cortante",modo="1h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={}, extra={{name="auto",value="berserk"}}, efectos={["muerte"]=10,}},

--ESPADAS
espada_corta = {tipo_item="arma",name="espada corta", id="espada_corta",cost=10,wtipo="equipo", familia="espada_corta",subFamilia="default",nv=1,def=0, w=6,bw=1,tipo="cortante",subTipo="cortante",modo="1h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
--espada corta demo 
espada_corta_de_fuego = {tipo_item="arma",name="Espada corta de fuego",   cost=10, wtipo="equipo",id="espada_corta_de_fuego",familia="espada_corta",subFamilia="default",nv=1,def=0, w=8,bw=6,tipo="cortante",subTipo="luz", modo="1h",smodo="white",dex="",fue="C", int="C",pod="C",sh=false, cont=1, color={1,1,1,1},ataque="", damage="",  isCast=true,cast={"elemental_fuego"},extra={},},
espada_lunar = {tipo_item="arma",name="Espada lunar",   cost=10, wtipo="equipo",id="espada_lunar",familia="espada_larga",subFamilia="default",nv=1,def=0, w=8,bw=6,tipo="cortante",subTipo="luz", modo="1h",smodo="white",dex="",fue="C", int="C",pod="C",sh=false, cont=1, color={1,1,1,1},ataque="", damage="",  isCast=true,cast={"elemental_fuego"},extra={{name="arte",value={"corte_lunar"}}},},

 


espada_larga = {tipo_item="arma",name="espada larga",   cost=10,wtipo="equipo",id="espada_larga",familia="espada_larga",subFamilia="default",nv=1,def=0, w=8,bw=1,tipo="cortante",subTipo="cortante", modo="2h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
espada_larga_de_piromante = {tipo_item="arma",name="espada larga de piromante",   cost=10, wtipo="equipo",id="espada_larga_de_piromante",familia="espada_larga",subFamilia="default",nv=1,def=0,w=8,bw=6,tipo="cortante",subTipo="fuego", modo="2h",smodo="white",dex="C",fue="B", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"elemental_fuego"},extra={},},
espada_de_la_luz = {tipo_item="arma",name="Espada de la luz",   cost=10,wtipo="equipo",id="espada_de_la_luz",familia="espada_larga",subFamilia="default",nv=1,def=0, w=8,bw=6,tipo="cortante",subTipo="luz", modo="2h",smodo="white",dex="",fue="C", int="C",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"elemental_luz"},extra={},},
espada_de_fuego = {tipo_item="arma",name="Espada de fuego",   cost=10, wtipo="equipo",id="espada_de_fuego",familia="espada_larga",subFamilia="default",nv=1,def=0, w=8,bw=6,tipo="cortante",subTipo="luz", modo="2h",smodo="white",dex="",fue="C", int="C",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"elemental_fuego"},extra={},},
espada_electrica = {tipo_item="arma",name="Espada electrica",   cost=10,wtipo="equipo",id="espada_electrica",familia="espada_larga",subFamilia="default",nv=1,def=0, w=8,bw=6,tipo="cortante",subTipo="luz", modo="2h",smodo="white",dex="",fue="C", int="C",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"elemental_electrico"},extra={},},
espada_de_hielo = {tipo_item="arma",name="Espada de hielo",   cost=10, wtipo="equipo",id="espada_de_hielo",familia="espada_larga",subFamilia="default",nv=1,def=0, w=8,bw=6,tipo="cortante",subTipo="luz", modo="2h",smodo="white",dex="",fue="C", int="C",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"elemental_hielo"},extra={},},


--mejorar
espada_de_la_oscuridad = {tipo_item="arma",name="Espada de la oscuridad",   cost=10,wtipo="equipo",id="espada_de_la_oscuridad",subFamilia="default",nv=1,def=0, familia="espada_larga", w=8,bw=6,tipo="cortante",subTipo="luz", modo="2h",smodo="white",dex="B",fue="B", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"elemental_oscuridad"},extra={},},
espada_mitica = {tipo_item="arma",name="Espada mitica",   cost=10, wtipo="equipo",id="espada_mitica",subFamilia="default",nv=1,def=0, familia="espada_larga", w=8,bw=6,tipo="cortante",subTipo="luz", modo="2h",smodo="white",dex="B",fue="B", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={{name="config",value={"crit"}}},},
ultra_espadon = {tipo_item="arma",name="ultra espadon",id="ultra_espadon",   cost=10,wtipo="equipo",familia="espada_larga", subFamilia="gran",nv=1,def=2, w=12,bw=1,tipo="golpe",modo="2h",smodo="white",dex="D",fue="S", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
shotel = {tipo_item="arma",name="shotel",id="shotel",  cost=10,wtipo="equipo",familia="espada_corta",subFamilia="default",nv=1,def=0, w=6,bw=1,tipo="cortante",modo="1h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
espada_elemental=  {tipo_item="arma",name="Espada de hielo",   cost=10, wtipo="equipo",id="espada_de_hielo",familia="espada_larga",subFamilia="default",nv=1,def=0, w=8,bw=6,tipo="cortante",subTipo="luz", modo="2h",smodo="white",dex="",fue="C", int="C",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"elemental_fuerza"},extra={{name="arte","corte_fuego"},{name="arte","corte_hielo"},{name="arte","corte_electrico"}},},

--lanzas
lanza_glacial = {tipo_item="arma",name="lanza glacial",wtipo="equipo",id="lanza_glacial",  cost=10, familia="lanza",subFamilia="default",nv=1,def=0, w=10,bw=6,tipo="perforante",subTipo="hielo", modo="2h",smodo="white",dex="B",fue="B", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"elemental_hielo"},extra={},},
lanza_electrica = {tipo_item="arma",name="lanza de zeus",wtipo="equipo",id="lanza_de_zeus",  cost=10, familia="lanza",subFamilia="default",nv=1,def=0, w=10,bw=6,tipo="perforante",subTipo="hielo", modo="2h",smodo="white",dex="B",fue="B", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"elemental_electrico"},extra={},},
lanza_de_fuego = {tipo_item="arma",name="lanza de fuego",wtipo="equipo",id="lanza_de_fuego",  cost=10, familia="lanza",subFamilia="default",nv=1,def=0, w=10,bw=6,tipo="perforante",subTipo="hielo", modo="2h",smodo="white",dex="B",fue="B", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"elemental_fuego"},extra={},},

--alabarda
alabarda = {tipo_item="arma",name="alabarda",id="alabarda",  cost=10,wtipo="equipo",familia="alabarda",subFamilia="default",nv=1,def=2, w=10,bw=1,tipo="golpe",modo="2h",smodo="white",dex="C",fue="C", int="",pod="",sh=false, cont=1, color={1,1,1,1},ataque="", damage="",  isCast=false,cast={},extra={},},
tridente = {tipo_item="arma",name="tridente",id="tridente",  cost=10,wtipo="equipo",familia="alabarda",subFamilia="default",nv=1,def=2, w=10,bw=1,tipo="golpe",modo="2h",smodo="white",dex="C",fue="C", int="",pod="",sh=false, cont=1, color={1,1,1,1},ataque="", damage="",  isCast=false,cast={},extra={},},
tridente_de_poseidon = {tipo_item="arma",name="tridente de poseidon",id="tridente_de_poseidon",  cost=10,wtipo="equipo",familia="alabarda",subFamilia="default",nv=1,def=2, w=10,bw=1,tipo="golpe",modo="2h",smodo="white",dex="C",fue="C", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"elemental_agua"},extra={},},


--baculo
baculo = {tipo_item="arma",name="baculo",id="baculo",  cost=10,wtipo="equipo",familia="baculo",subFamilia="default",nv=1,def=2, w=4,bw=1,tipo="golpe",modo="2h",smodo="white",dex="",fue="C", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
varita_magica = {tipo_item="arma",name="varita_magica",id="varita_magica",  cost=10,wtipo="equipo",subFamilia="default",nv=1,def=0, familia="maza", w=8,bw=6,tipo="golpe",subTipo="hielo", modo="2h",smodo="white",dex="",fue="A", int="",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="proyectil magico", damage="POD", isCast=false,cast={},extra={{name="pod",value=10}},},
varita_de_novato = {tipo_item="arma",name="varita de novato",id="varita_de_novato",  cost=10,wtipo="equipo",subFamilia="default",nv=1,def=0, familia="maza", w=8,bw=6,tipo="golpe",subTipo="hielo", modo="2h",smodo="white",dex="",fue="A", int="",pod="C",sh=false, cont=1, color={1,1,1,1},ataque="", damage="POD", isCast=false,cast={},extra={{name="pod",value=20}},},
bara_de_salud={tipo_item="arma",name="varita de novato",id="varita_de_novato",  cost=10,wtipo="equipo",subFamilia="default",nv=1,def=0, familia="maza", w=8,bw=6,tipo="golpe",subTipo="hielo", modo="2h",smodo="white",dex="",fue="A", int="",pod="C",sh=false, cont=1, color={1,1,1,1},ataque="healing", damage="POD", isCast=false,cast={},extra={{name="pod",value=20}},},

--Baston
baston = {tipo_item="arma",name="baston",id="baston",  cost=10,wtipo="equipo",familia="baston",subFamilia="default",nv=1,def=0, w=5,bw=1,tipo="golpe",modo="1h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1},  ataque="", damage="", isCast=false,cast={},extra={},},
bara_simple = {tipo_item="arma",name="baston simple",id="bara_simple",  cost=10,wtipo="equipo",familia="baston",subFamilia="default",nv=1,def=0, w=4,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="C", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="",  isCast=false,cast={},extra={},},
bara_de_piromante = {tipo_item="arma",name="baston de piromante",id="bara_de_piromante",  cost=10,wtipo="equipo",familia="baston",subFamilia="default",nv=1,def=0, w=4,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="C", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"fuego"},extra={},},



--MARTILLOS y mazos

maza = {tipo_item="arma",name="maza",  cost=10,wtipo="equipo",id="maza",subFamilia="default",nv=1,def=0, familia="maza", w=8,bw=6,tipo="golpe",subTipo="hielo", modo="2h",smodo="white",dex="",fue="A", int="",pod="C",sh=false, cont=1, color={1,1,1,1},ataque="", damage="POD",  isCast=false,cast={},extra={},},
maza_azul = {tipo_item="arma",name="maza azul",  cost=10,wtipo="equipo",id="maza",subFamilia="default",nv=1,def=0, familia="maza", w=8,bw=6,tipo="golpe",subTipo="hielo", modo="2h",smodo="white",dex="",fue="A", int="",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="",  damage="POD", isCast=false,cast={},extra={},},
maza_de_mago = {tipo_item="arma",name="maza de mago",id="maza_de_mago",  cost=10,wtipo="equipo",subFamilia="default",nv=1,def=0, familia="maza", w=8,bw=6,tipo="golpe",subTipo="hielo", modo="2h",smodo="white",dex="",fue="A", int="",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="",  damage="POD", isCast=false,cast={},extra={},},

---Cetros

cetro_de_mago = {tipo_item="arma",name="cetro de mago",id="cetro_de_mago",  cost=10,wtipo="equipo",familia="cetro",subFamilia="default",nv=1,def=0, w=6,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="C", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},

cetro_de_apoyo = {tipo_item="arma",name="Cetro de apoyo",id="cetro_de_apoyo",  cost=10,wtipo="equipo",subFamilia="default",nv=1,def=0, familia="maza", w=8,bw=6,tipo="golpe",subTipo="hielo", modo="2h",smodo="white",dex="",fue="A", int="",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="POD", isCast=false,cast={},extra={{name="arte","coraza", tipo="carga",cant=2,max=2}},},
cetro_elemental = {tipo_item="arma",name="Cetro elemental   ",id="cetro_elemental",  cost=10,wtipo="equipo",subFamilia="default",nv=1,def=0, familia="maza", w=8,bw=6,tipo="golpe",subTipo="hielo", modo="2h",smodo="white",dex="",fue="A", int="",pod="C",sh=false, cont=1, color={1,1,1,1},ataque="",  damage="POD", isCast=false,cast={},extra={{name="arte","fuego", tipo="carga",cant=2,max=2},
                                                                                                                                                                                                                                                                                                                       {name="arte","hielo", tipo="carga",cant=3,max=3},
                                                                                                                                                                                                                                                                                                                       {name="arte","electrico", tipo="carga",cant=3,max=3}},},
cetro_de_sanacion = {tipo_item="arma",name="cetro de sanacion  ",id="cetro_de_sanacion",  cost=10,wtipo="equipo",subFamilia="default",nv=1,def=0, familia="maza", w=8,bw=6,tipo="golpe",subTipo="hielo", modo="2h",smodo="white",dex="",fue="A", int="",pod="C",sh=false, cont=1, color={1,1,1,1},ataque="", damage="POD", isCast=false,cast={},extra={{name="arte","curar", tipo="carga",cant=2,max=2}},},



martillo = {tipo_item="arma",name="martillo",  cost=10,wtipo="equipo",id="martillo",subFamilia="default",nv=1,def=0, familia="martillo", w=8,bw=6,tipo="golpe",subTipo="hielo", modo="2h",smodo="white",dex="",fue="A", int="",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},

martillo_cegadora = {tipo_item="arma",name="martillo",  cost=10,wtipo="equipo",id="martillo",subFamilia="default",nv=1,def=0, familia="martillo", w=8,bw=6,tipo="golpe",subTipo="hielo", modo="2h",smodo="white",dex="",fue="A", int="",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"ceguera"},extra={},},
martillo_del_silencio = {tipo_item="arma",name="martillo del silencio", id="martillo_del_silencio" ,  cost=10,wtipo="equipo",subFamilia="default",nv=1,def=0, familia="martillo", w=8,bw=6,tipo="golpe",subTipo="hielo", modo="2h",smodo="white",dex="",fue="A", int="",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"silencio"},extra={},},
martillo_mermador = {tipo_item="arma",name="martillo mermador", id="martillo_mermador",  cost=10,wtipo="equipo",subFamilia="default",nv=1,def=0, familia="martillo", w=8,bw=6,tipo="golpe",subTipo="hielo", modo="2h",smodo="white",dex="",fue="A", int="",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"mermar"},extra={},},
martillo_cosmico = {tipo_item="arma",name="martillo cosmico", id="martillo_cosmico",  cost=10,wtipo="equipo",subFamilia="default",nv=1,def=0, familia="martillo", w=8,bw=6,tipo="golpe",subTipo="hielo", modo="2h",smodo="white",dex="",fue="A", int="",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"mermar"},extra={},},
martillo_catalizador = {tipo_item="arma",name="martillo catalizador", id="martillo_catalizador",  cost=10,wtipo="equipo",subFamilia="default",nv=1,def=0, familia="martillo", w=8,bw=6,tipo="golpe",subTipo="hielo", modo="2h",smodo="white",dex="",fue="A", int="",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"exiliar"},extra={{name="change",value="CON Cast"}},},


martillo_de_trabajo = {tipo_item="arma",name="martillo de trabajo",  cost=10,wtipo="equipo",id="martillo_de_trabajo",subFamilia="default",nv=1,def=0, familia="martillo", w=8,bw=6,tipo="golpe",subTipo="hielo", modo="2h",smodo="white",dex="",fue="A", int="",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
martillo_de_piedra = {tipo_item="arma",name="martillo de piedra",  cost=10,wtipo="equipo",id="martillo_de_piedra",subFamilia="default",nv=1,def=0, familia="martillo", w=8,bw=6,tipo="golpe",subTipo="hielo", modo="2h",smodo="white",dex="",fue="A", int="",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
martillo_de_la_tormenta = {tipo_item="arma",name="martillo de la tormenta",  cost=10,wtipo="equipo",id="martillo_de_la_tormenta",subFamilia="default",nv=1,def=0, familia="martillo", w=8,bw=6,tipo="golpe",subTipo="hielo", modo="2h",smodo="white",dex="",fue="A", int="",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"elemental_electrico"},extra={},},
ultra_martillo = {tipo_item="arma",name="ultra martillo",  cost=10,wtipo="equipo",id="ultra_martillo",subFamilia="default",nv=1,def=0, familia="martillo", w=8,bw=6,tipo="golpe",subTipo="hielo", modo="2h",smodo="white",dex="",fue="A", int="",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
gran_mazo = {tipo_item="arma",name="gran mazo",  cost=10,wtipo="equipo",id="gran_mazo",subFamilia="default",nv=1,def=0, familia="martillo", w=8,bw=6,tipo="golpe",subTipo="hielo", modo="2h",smodo="white",dex="",fue="A", int="",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
gran_Arbol_petrificado = {tipo_item="arma",name="gran Arbol petrificado",  cost=10,wtipo="equipo",id="gran_Arbol_petrificado",subFamilia="default",nv=1,def=0, familia="martillo", w=8,bw=6,tipo="golpe",subTipo="hielo", modo="2h",smodo="white",dex="",fue="A", int="",pod="C",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},

--Hachas
hacha = {tipo_item="arma",name="hacha",id="hacha",  cost=10,wtipo="equipo", familia="hachas",subFamilia="default",nv=1,def=0, w=6,bw=1,tipo="cortante",modo="1h",smodo="white",dex="E",fue="A", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
hacha_de_enano = {tipo_item="arma",name="hacha de enano",id="hachas_de_enano",  cost=10,wtipo="equipo", familia="hachas",subFamilia="default",nv=1,def=0, w=6,bw=1,tipo="cortante",modo="1h",smodo="white",dex="E",fue="A", int="",pod="",sh=false, cont=1, color={1,1,1,1},  ataque="", damage="",isCast=false,cast={},extra={},},
hacha_de_gigante = {tipo_item="arma",name="hacha de gigante",id="hacha_de_gigante",  cost=10,wtipo="equipo", familia="hachas",subFamilia="default",nv=1,def=0, w=6,bw=1,tipo="cortante",modo="1h",smodo="white",dex="E",fue="A", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},

--dagas
daga={tipo_item="arma",name="daga",id="daga",  cost=10,wtipo="equipo",familia="dagas",subFamilia="default",nv=1,def=0, w=4,bw=1,tipo="cortante",modo="1h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
daga_venenosa = {tipo_item="arma",name="daga de serpiente",id="daga_venenosa",  cost=10,wtipo="equipo",familia="dagas",subFamilia="default",nv=1,def=0, w=4,bw=1,tipo="cortante",modo="1h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"elemental_veneno"},extra={},},
daga_del_suenno = {tipo_item="arma",name="daga del sueño",id="daga_del_suenno",  cost=10,wtipo="equipo",familia="dagas",subFamilia="default",nv=1,def=0, w=4,bw=1,tipo="cortante",modo="1h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={"sueño"},extra={},},
daga_de_asesino = {tipo_item="arma",name="daga de asesino",id="daga_de_asesino",  cost=10,wtipo="equipo",familia="dagas",subFamilia="default",nv=1,def=0, w=4,bw=1,tipo="cortante",modo="1h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1},ataque="", damage="",  isCast=true,cast={"muerte"},extra={},},
daga_de_mago = {tipo_item="arma",name="daga de mago",id="daga_de_mago",  cost=10,wtipo="equipo",familia="dagas",subFamilia="default",nv=1,def=0, w=4,bw=1,tipo="cortante",modo="1h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={},extra={{name="comando",value={"magic"}}},},
daga_catalizadora = {tipo_item="arma",name="daga catalizadora",id="daga_catalizadora",  cost=10,wtipo="equipo",familia="dagas",subFamilia="default",nv=1,def=0, w=4,bw=1,tipo="cortante",modo="1h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=true,cast={},extra={{name="pod",value=20}}},

--florete

florete={tipo_item="arma",name="florete",id="florete",  cost=10,wtipo="equipo",familia="florete",subFamilia="default",nv=1,def=0, w=4,bw=1,tipo="perforante",modo="1h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
florete_catalizador={tipo_item="arma",name="florete catalizador",id="florete_catalizador",  cost=10,wtipo="equipo",familia="florete",subFamilia="default",nv=1,def=0, w=4,bw=1,tipo="perforante",modo="1h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={{name="pod",value="20"}},},
florete_de_asesino={tipo_item="arma",name="florete de asesino",id="florete_de_asesino",  cost=10,wtipo="equipo",familia="florete",subFamilia="default",nv=1,def=0, w=4,bw=1,tipo="perforante",modo="1h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={{name="arte","invisible"}},},


--Arcos
arco_corto = {tipo_item="arma",name="arco corto",id="arco_corto", cost=10,wtipo="equipo",familia="arco",subFamilia="default",nv=1,def=0, w=6,bw=1,tipo="perforante",modo="2h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
arco_largo = {tipo_item="arma",name="arco largo",id="arco_largo",  cost=10, wtipo="equipo",familia="arco",subFamilia="default",nv=1,def=0, w=6,bw=1,tipo="perforante",modo="2h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
arco_pesado = {tipo_item="arma",name="arco pesado",id="arco_pesado",  cost=10,wtipo="equipo",familia="arco",subFamilia="default",nv=1,def=0, w=6,bw=1,tipo="perforante",modo="2h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="",  isCast=false,cast={},extra={},},

--Grimorios
grimorio_de_fuego = {tipo_item="arma",name="grimorio de fuego",id="grimorio_de_fuego",  cost=10,wtipo="equipo",familia="grimorio",subFamilia="default",nv=1,def=0, w=4,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="",isCast=false,cast={}, extra={{name="spell",value={"fuego","fuego+"}}},},
grimorio_de_hielo = {tipo_item="arma",name="grimorio de hielo",id="grimorio_de_hielo",  cost=10,wtipo="equipo",familia="grimorio",subFamilia="default",nv=1,def=0, w=4,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1},ataque="", damage="", isCast=false,cast={}, extra={{name="spell",value={"hielo","hielo+"}}},},
grimorio_del_rayo = {tipo_item="arma",name="grimorio de rayo",id="grimorio_del_rayo",  cost=10,wtipo="equipo",familia="grimorio",subFamilia="default",nv=1,def=0, w=4,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1},ataque="", damage="",isCast=false,cast={}, extra={{name="spell",value={"electro","electro+"}}},},
grimorio_basico = {tipo_item="arma",name="grimorio basico",id="grimorio_basico",  cost=10,wtipo="equipo", familia="grimorio",subFamilia="default",w=4,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="", int="",pod="",sh=false,cont=1, color={1,1,1,1}, ataque="", damage="",isCast=false,cast={},extra={name="spell.list",value={{name="fuego",id="fuego",tipo="equip",cont=5,max=5},{name="electro",id="electro",tipo="equip",cont=5,max=5},{name="agua",id="agua",tipo="equip",cont=5,max=5}}}},


--Fuego
revolver = {tipo_item="arma",name="revolver",id="revolver",  cost=10,wtipo="equipo",familia="revolver",subFamilia="default",nv=1,def=2, w=4,bw=2,tipo="golpe",modo="1h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
escopeta = {tipo_item="arma",name="escopeta",id="revolver",  cost=10,wtipo="equipo",familia="revolver",subFamilia="default",nv=1,def=2, w=6,bw=3,tipo="golpe",modo="2h",smodo="white",dex="B",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
ballesta = {tipo_item="arma",name="ballesta",id="ballesta",  cost=10,wtipo="equipo",familia="ballesta",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="B",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
fusil = {tipo_item="arma",name="fusil",id="fusil",  cost=10,wtipo="equipo",familia="ballesta",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="B",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
ametralladora = {tipo_item="arma",name="ametralladora",id="ametralladora",  cost=10,wtipo="equipo",familia="ballesta",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="B",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},



--instrumento
campana = {tipo_item="arma",name="campana",id="campana",  cost=10,wtipo="equipo",familia="instrumento",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
harpa = {tipo_item="arma",name="harpa",id="harpa",  cost=10,wtipo="equipo",familia="instrumento",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
guitarra = {tipo_item="arma",name="guitarra",id="guitarra",  cost=10,wtipo="equipo",familia="instrumento",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="A",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},

--Escudos
escudo_de_madera = {tipo_item="arma",name="escudo de madera",id="escudo_de_madera",  cost=10,wtipo="equipo",familia="escudo",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
escudo_de_diamante = {tipo_item="arma",name="escudo de diamante",id="escudo_de_diamante",  cost=10,wtipo="equipo",familia="escudo",subFamilia="default",nv=1,def=2, mdef=0,w=8,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1},ataque="", damage="",isCast=false,cast={}, extra={},},
escudo_de_hielo = {tipo_item="arma",name="escudo de hielo",id="escudo_de_hielo",  cost=10,wtipo="equipo",familia="escudo",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="",  isCast=false,cast={},extra={{name="perks",value={id="ABS_HIE",name="ABS.HIE", from="equip", value=0, str=""}}},},
escudo_de_fuego = {tipo_item="arma",name="escudo de fuego",id="escudo_de_fuego",  cost=10,wtipo="equipo",familia="escudo",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="",  isCast=false,cast={},extra={{name="perks",value={id="ABS_FUE",name="ABS.FUE", from="equip", value=0, str=""}}},},
escudo_del_rayo = {tipo_item="arma",name="escudo del rayo",id="escudo_del_rayo",  cost=10,wtipo="equipo",familia="escudo",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={{name="perks",value={id="ABS_ELE",name="ABS.ELE", from="equip", value=0, str=""}}},},
escudo_de_bronce = {tipo_item="arma",name="escudo de bronce",id="escudo_de_bronce",  cost=10,wtipo="equipo",familia="escudo",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
escudo_de_plata = {tipo_item="arma",name="escudo de plata",id="escudo_de_plata",  cost=10,wtipo="equipo",familia="escudo",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
escudo_dorado = {tipo_item="arma",name="escudo dorado",id="escudo_dorado",  cost=10,wtipo="equipo",familia="escudo",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
escudo_de_mitrilo = {tipo_item="arma",name="escudo de mitrilo",id="escudo_de_mitrilo",  cost=10,wtipo="equipo",familia="escudo",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",dex="A",fue="", int="",pod="",smodo="white",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},
escudo_del_bosque = {tipo_item="arma",name="escudo del bosque",id="escudo_del_bosque",  cost=10,wtipo="equipo",familia="escudo",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",dex="A",fue="", int="",pod="",smodo="white",sh=false, cont=1, color={1,1,1,1},ataque="", damage="",  isCast=false,cast={},extra={},},
escudo_espejo = {tipo_item="arma",name="escudo espejo",id="escudo_espejo",  cost=10,wtipo="equipo",familia="escudo",subFamilia="default",nv=1,def=1,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={{name="perks",value={id="REFLEJO",name="REFLEJO", from="equip", value=0, str=""}}},},
escudo_de_puas = {tipo_item="arma",name="escudo de puas",id="escudo_de_puas",  cost=10,wtipo="equipo",familia="escudo",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="", damage="", isCast=false,cast={},extra={},},

--exoticos


disco = {tipo_item="arma",name="disco",id="disco",  cost=10,wtipo="equipo",familia="lanzables",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="ataque_amplio", damage="", isCast=false,cast={},extra={},},
bumeran = {tipo_item="arma",name="bumeran",id="bumeran",  cost=10,wtipo="equipo",familia="lanzables",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="ataque_amplio", damage="", isCast=false,cast={},extra={},},
latigo = {tipo_item="arma",name="latigo",id="latigo",  cost=10,wtipo="equipo",familia="latigo",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="ataque_amplio",damage="", isCast=false,cast={},extra={},},

--azar
Dado_solitario={tipo_item="arma",name="Dado_solitario",id="Dado_solitario",  cost=10,wtipo="equipo",familia="azar",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="Dado_solitario", damage="",isCast=false,cast={},extra={},},
Dados_gemelos={tipo_item="arma",name="Dados_gemelos",id="Dados_gemelos",  cost=10,wtipo="equipo",familia="azar",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="Dados_gemelos", damage="",isCast=false,cast={},extra={},},
Dados_trillisos={tipo_item="arma",name="Dados_trillisos",id="Dados_trillisos",  cost=10,wtipo="equipo",familia="azar",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="Dados_gemelos", damage="",isCast=false,cast={},extra={},},
Dados_arreglados={tipo_item="arma",name="Dados_arreglados",id="Dados_arreglados",  cost=10,wtipo="equipo",familia="azar",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="Dados_gemelos",damage="", isCast=false,cast={},extra={},},
mazo_ingles={tipo_item="arma",name="mazo_ingles",id="mazo_ingles",  cost=10,wtipo="equipo",familia="azar",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="Dados_gemelos", damage="",isCast=false,cast={},extra={},},  
mazo_espannol={tipo_item="arma",name="mazo_espannol",id="mazo_espannol",  cost=10,wtipo="equipo",familia="azar",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="Dados_gemelos", damage="",isCast=false,cast={},extra={},},
mazo_tarot  ={tipo_item="arma",name="mazo_tarot",id="mazo_tarot",  cost=10,wtipo="equipo",familia="azar",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="Dados_gemelos", damage="",isCast=false,cast={},extra={},},
Dardos={tipo_item="arma",name="Dardos",id="Dardos",  cost=10,wtipo="equipo",familia="azar",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="Dados_gemelos", damage="",isCast=false,cast={},extra={},},
D100={tipo_item="arma",name="D100",id="D100",  cost=10,wtipo="equipo",familia="azar",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="Dados_gemelos", damage="",isCast=false,cast={},extra={},},
D20={tipo_item="arma",name="D20",id="D20",  cost=10,wtipo="equipo",familia="azar",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="Dados_gemelos", damage="",isCast=false,cast={},extra={},},
D12={tipo_item="arma",name="D12",id="D12",  cost=10,wtipo="equipo",familia="azar",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="Dados_gemelos", damage="",isCast=false,cast={},extra={},},
d10={tipo_item="arma",name="d10",id="d10",  cost=10,wtipo="equipo",familia="azar",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="Dados_gemelos", damage="",isCast=false,cast={},extra={},},
D8={tipo_item="arma",name="D8",id="D8",  cost=10,wtipo="equipo",familia="azar",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="Dados_gemelos", damage="",isCast=false,cast={},extra={},},
D4={tipo_item="arma",name="D4",id="D4",  cost=10,wtipo="equipo",familia="azar",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="Dados_gemelos", damage="",isCast=false,cast={},extra={},},
coin={tipo_item="arma",name="coin",id="coin",  cost=10,wtipo="equipo",familia="azar",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="Dados_gemelos",damage="", isCast=false,cast={},extra={},},

--lanzador

lanzador_de_bombas= {tipo_item="arma",name="lanzador_de_bombas",id="lanzador_de_bombas",  cost=10,wtipo="equipo",familia="lanzador",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="",damage="", isCast=false,cast={},extra={},},
resolteras= {tipo_item="arma",name="resolteras",id="resolteras",  cost=10,wtipo="equipo",familia="lanzador",subFamilia="default",nv=1,def=2, w=6,bw=1,tipo="golpe",modo="2h",smodo="white",dex="",fue="", int="",pod="",sh=false, cont=1, color={1,1,1,1}, ataque="",damage="", isCast=false,cast={},extra={},},
}

armadura_mod={}

armadura_inventary_see={}
armadura_inventary={
       
}

armadura_list={
        ropa_simple= {tipo_item="torso",name="ropa simple",id="ropa_simple",wtipo="equipo",familia="liviana",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={},},
        armadura_bronce = {tipo_item="torso",name="armadura bronce",id="armadura_bronce",wtipo="equipo",familia="pesada",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={},},
        armadura_plata = {tipo_item="torso",name="armadura plata",id="armadura_plata",wtipo="equipo",familia="pesada",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={},},
        armadura_mitrillo = {tipo_item="torso",name="armadura mitrillo",id="armadura_mitrillo",wtipo="equipo",familia="pesada",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={},},
        armadura_dorada = {tipo_item="torso",name="armadura dorada",id="armadura_dorada",wtipo="equipo",familia="pesada",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={},},
        armadura_oscura = {tipo_item="torso",name="armadura oscura",id="armadura_oscura",wtipo="equipo",familia="pesada",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={},},
        armadura_de_diamante = {tipo_item="torso",name="armadura de diamante",id="armadura_de_diamante",wtipo="equipo",familia="pesada",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={},},
        armadura_de_cuero = {tipo_item="torso",name="armadura de cuero",id="armadura_de_cuero",wtipo="equipo",familia="livina",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={},},
        capa = {tipo_item="torso",name="capa",id="capa",wtipo="equipo",familia="livina",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={},},
        capa_de_heroe = {tipo_item="torso",name="capa de heroe",id="capa_de_heroe",wtipo="equipo",familia="livina",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={},},
        poncho = {tipo_item="torso",name="poncho",id="poncho",wtipo="equipo",familia="livina",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={},},
        tunica = {tipo_item="torso",name="tunica",id="tunica",wtipo="equipo",familia="livina",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={},},
        tunica_de_escolar = {tipo_item="torso",name="tunica de escolar",id="tunica_de_escolar",wtipo="equipo",familia="livina",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={},},
        tunica_de_mago = {tipo_item="torso",name="tunica de mago",id="tunica_de_mago",wtipo="equipo",familia="livina",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={},},
        tunica_de_clerigo = {tipo_item="torso",name="tunica de clerigo",id="tunica_de_clerigo",wtipo="equipo",familia="livina",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={},},
        armadura_congelada = {tipo_item="torso",name="Armadura congelada",id="armadura_congelada",wtipo="equipo",familia="pesada",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={},},
        armadura_infernal = {tipo_item="torso",name="Armadura infernal",id="armadura_infernal",wtipo="equipo",familia="pesada",subFamilia="default",nv=1,def=2,mdef=0, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={},},
}
Accesorios_inventary_see={}
Accesorios_inventary={
        {tipo_item="accesorio",name="lazo rojo",id="lazo_rojo",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasivo",value={name="ALL Resist",id="ALL_Resist",value=0}}},},
        {tipo_item="accesorio",name="absorvedor",id="absorvedor",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="comando",value="extraer"}},},
        {tipo_item="accesorio",name="collar_de_huesos",id="collar_de_huesos",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="comando",value={name="desarrollo",id="desarollo",value=0}}},},      
        {tipo_item="accesorio",name="anillo rojo",id="anillo_rojo",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="HP +50%",id="HP_+50%",value=50, operation="+%"}}},},
        {tipo_item="accesorio",name="anillo azul",id="anillo_azul",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="MP +50%",id="HP_+50%",value=50,operation="+%"}}},},  
        {tipo_item="accesorio",name="anillo del guerrero",id="anillo_del_guerrero",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="FUE +5",id="FUE_+5",value=5,operation="+"}}},},
        {tipo_item="accesorio",name="anillo del guardian",id="anillo_del_guardian",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="CON +5",id="CON_+5",value=5,operation="+"}}},},
        {tipo_item="accesorio",name="anillo del escolar",id="anillo_del_escolar",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="INT +5",id="INT_+5",value=5,operation="+"}}},},
        {tipo_item="accesorio",name="anillo del hechizero",id="anillo_del_Hechizero",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="POD +5",id="POD_+5",value=5,operation="+"}}},},
        {tipo_item="accesorio",name="anillo del asesino",id="anillo_del_asesino",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="AGI +5",id="AGI_+5",value=5,operation="+"}}},},
        {tipo_item="accesorio",name="anillo del arquero",id="anillo_del_arquero",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="DEX +5",id="DEX_+5",value=5,operation="+"}}},},
        {tipo_item="accesorio",name="anillo ambidiestro",id="anillo_ambidiestro",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="ambidiestro",id="ambidiestro",value=5,operation="+"}}},},
        {tipo_item="accesorio",name="anillo del heroe",id="anillo_del_heroe",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="ALL +1",id="ALL_+1",value=5,operation="+"}}},},
        {tipo_item="accesorio",name="anillo de eficiencia",id="anillo_de_eficiencia",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="Mana -1",id="Mana_-1",value=5,operation="+"}}},},
        {tipo_item="accesorio",name="tablilla",id="tablilla",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="1 slot",id="1_slot",value=5,operation="+"}}},},
        {tipo_item="accesorio",name="tablilla dual",id="tablilla_dual",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="2 slots",id="2_slots",value=5,operation="+"}}},},
        {tipo_item="accesorio",name="tablilla de tres",id="tablilla_de_tres",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="3 slots",id="3_slots",value=5,operation="+"}}},},
        {tipo_item="accesorio",name="brasalete de furia",id="brasalete_de_furia",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="estado",value={name="furia",id="furia",value=5,operation="+"}}},},
        {tipo_item="accesorio",name="brasalete de mercurio",id="brasalete_de_mercurio",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="estado",value={name="prisa",id="prisa",value=5,operation="+"}}},},

}

Accesorios_list={
        lazo_rojo = {tipo_item="accesorio",name="lazo rojo",id="lazo_rojo",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasivo",value={name="ALL Resist",id="ALL_Resist",value=0}}},},
        absorvedor = {tipo_item="accesorio",name="absorvedor",id="absorvedor",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="comando",value="extraer"}},},
        collar_de_huesos = {tipo_item="accesorio",name="collar_de_huesos",id="collar_de_huesos",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1, cost=10,color={1,1,1,1},extra={{name="comando",value={name="desarrollo",id="desarollo",value=0}}},},      
        anillo_rojo = {tipo_item="accesorio",name="anillo rojo",id="anillo_rojo",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="HP +50%",id="HP_+50%",value=50, operation="+%"}}},},
        anillo_azul = {tipo_item="accesorio",name="anillo azul",id="anillo_azul",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="MP +50%",id="HP_+50%",value=50,operation="+%"}}},},  
        anillo_del_guerrero = {tipo_item="accesorio",name="anillo del guerrero",id="anillo_del_guerrero",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="FUE +5",id="FUE_+5",value=5,operation="+"}}},},
        anillo_del_guardian = {tipo_item="accesorio",name="anillo del guardian",id="anillo_del_guardian",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="CON +5",id="CON_+5",value=5,operation="+"}}},},
        anillo_del_escolar = {tipo_item="accesorio",name="anillo del escolar",id="anillo_del_escolar",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="INT +5",id="INT_+5",value=5,operation="+"}}},},
        anillo_del_Hechizero = {tipo_item="accesorio",name="anillo del hechizero",id="anillo_del_Hechizero",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="POD +5",id="POD_+5",value=5,operation="+"}}},},
        anillo_del_asesino = {tipo_item="accesorio",name="anillo del asesino",id="anillo_del_asesino",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="AGI +5",id="AGI_+5",value=5,operation="+"}}},},
        anillo_del_arquero = {tipo_item="accesorio",name="anillo del arquero",id="anillo_del_arquero",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="DEX +5",id="DEX_+5",value=5,operation="+"}}},},
        anillo_ambidiestro = {tipo_item="accesorio",name="anillo ambidiestro",id="anillo_ambidiestro",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="ambidiestro",id="ambidiestro",value=5,operation="+"}}},},
        anillo_del_heroe = {tipo_item="accesorio",name="anillo del heroe",id="anillo_del_heroe",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="ALL +1",id="ALL_+1",value=5,operation="+"}}},},
        anillo_de_eficiencia = {tipo_item="accesorio",name="anillo de eficiencia",id="anillo_de_eficiencia",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="Mana -1",id="Mana_-1",value=5,operation="+"}}},},
        tablilla = {tipo_item="accesorio",name="tablilla",id="tablilla",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="1 slot",id="1_slot",value=5,operation="+"}}},},
        tablilla_dual = {tipo_item="accesorio",name="tablilla dual",id="tablilla_dual",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="2 slots",id="2_slots",value=5,operation="+"}}},},
        tablilla_de_tres = {tipo_item="accesorio",name="tablilla de tres",id="tablilla_de_tres",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="pasiva",value={name="3 slots",id="3_slots",value=5,operation="+"}}},},
        brasalete_de_furia = {tipo_item="accesorio",name="brasalete de furia",id="brasalete_de_furia",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1, cost=10,color={1,1,1,1},extra={{name="estado",value={name="furia",id="furia",value=5,operation="+"}}},},
        brasalete_de_mercurio = {tipo_item="accesorio",name="brasalete de mercurio",id="brasalete_de_mercurio",wtipo="accesorio",familia="accesorio",subFamilia="default",nv=1,def=2, w=8,bw=1,tipo="golpe",modo="1h",smodo="white",sh=false, cont=1,cost=10, color={1,1,1,1},extra={{name="estado",value={name="prisa",id="prisa",value=5,operation="+"}}},},

}


Complemento_inventary_see={}
Complemento_inventary={}
Complemento_list={
["extractor"]={},
["Municion_revolver"]={},
["Municion_escopeta"]={},
["Municion_fusil"]={},
["Municion_balas_de_cannon"]={},
["carcaj_flechas"]={},
["carcaj_flechas_de_luz"]={},
["carcaj_flechas_de_fuego"]={},
["carcaj_flechas_de_veneno"]={},
["carcaj_flechas_de_electrico"]={},
["carcaj_flechas_de_hielo"]={},
["carcaj_flechas_de_puños"]={},
["carcaj_dardos_111"]={},
["carcaj_dardos_1111"]={},
["carcaj_dardos_11111"]={},
["carcaj_dardos_explosivos"]={},
["carcaj_dardos_penetrantes"]={},
["cargador_radiacion"]={},
["cargador_electricidad"]={},
["cargador_lazer"]={},
["cargador_fuerza"]={},
["cargador_gravedad"]={},
["cargador_desintegracion"]={},
["cargador_salud"]={},
["cargador_toxico"]={},
["galon_fuego"]={},
["galon_nitrogeno"]={},
["bomba_fuego"]={},
["bomba_hielo"]={},
["bomba_electrico"]={},
["misil"]={},


}


Artefacto_inventary_see={}
Artefacto_inventary={}
Artefacto_list={}



Talismanes_inventary={}
Talismanes_list={}




lista_items_juego={
        pocion={
                tipo_item="consumible",
                name="pocion",
                id="pocion_item",
                wtipo="consumible",
                tipo="consumible",
                dir="c",
                curar=10,
                attack=0,
                cost=5,
                cont=22,  
                },
        ether =        {
                tipo_item="consumible",
                name="ether",
                id="ether_item",
                wtipo="consumible",
                tipo="consumible",
                dir="c",
                curar=10,
                attack=0,
                cost=5,
                cont=22,  
                },
        bomba =        {
                tipo_item="consumible",
                name="bomba",
                id="bomba",
                wtipo="consumible",
                tipo="consumible",
                dir="e",
                value=10,
                attack=10,
                cost=5,
                cont=30,  
                },
        revivir=        {
                tipo_item="consumible",
                name="revivir",
                id="revivir",
                wtipo="consumible",
                tipo="consumible",
                dir="d",
                curar=10,
                value=10,
                attack=10,
                cost=5,
                cont=30,  
                },
        roca =        {
                tipo_item="consumible",
                name="roca",
                id="roca",
                wtipo="consumible",
                tipo="consumible",
                dir="e",
                curar=10,
                value=10,
                attack=4,
                cost=5,
                cont=30,  
                },      
                
        antidoto =        {
                tipo_item="consumible",
                name="antidoto",
                id="antidoto",
                wtipo="consumible",
                tipo="consumible",
                dir="c",
                curar=10,
                value=10,
                attack=4,
                cost=5,
                cont=1,  
                },  
        piedra_roja=        {
                tipo_item="consumible",
                name="piedra roja",
                id="piedra_roja",
                tipo="piedra_especial",
                wtipo="consumible",
                subTipo="",
                dir="n",
                curar=0,
                attack=0,
                cost=0,
                cont=22,
                add={},
                },
        piedra_azul =        {
                tipo_item="consumible",
        name="piedra_azul",
        id="piedra_azul",
        tipo="piedra_especial",
        wtipo="consumible",
        subTipo="",
        dir="n",
        curar=0,
        attack=0,
        cost=0,
        cont=22,
        add={},
        },
        piedra_liviana =         {
                tipo_item="consumible",
        name="piedra_liviana",
        id="piedra_liviana",
        tipo="piedra_especial",
        wtipo="consumible",
        subTipo="",
        dir="n",
        curar=0,
        attack=0,
        cost=0,
        cont=22,
        add={},
        },
        piedra_maleable =        {
                tipo_item="consumible",
        name="piedra_maleable",
        id="piedra_maleable",
        tipo="piedra_especial",
        wtipo="consumible",
        subTipo="",
        dir="n",
        curar=0,
        attack=0,
        cost=0,
        cont=22,
        add={},
        },
        piedra_pesada =        {
                tipo_item="consumible",
        name="piedra_pesada",
        id="piedra_pesada",
        tipo="piedra_especial",
        wtipo="consumible",
        subTipo="",
        dir="n",
        curar=0,
        attack=0,
        cost=0,
        cont=22,
        add={},
        },
        piedra_resistente =        {
                tipo_item="consumible",
        name="piedra_resistente",
        id="piedra_resistente",
        tipo="piedra_especial",
        wtipo="consumible",
        subTipo="",
        dir="n",
        curar=0,
        attack=0,
        cost=0,
        cont=22,
        add={},
        },
        piedra_energizante =        {
                tipo_item="consumible",
        name="piedra_energizante",
        id="piedra_energizante",
        tipo="piedra_especial",
        wtipo="consumible",
        subTipo="",
        dir="n",
        curar=0,
        attack=0,
        cost=0,
        cont=22,
        add={},
        },
        piedra_clara =        {
                tipo_item="consumible",
        name="piedra_clara",
        id="piedra_clara",
        tipo="piedra_especial",
        wtipo="consumible",
        subTipo="",
        dir="n",
        curar=0,
        attack=0,
        cost=0,
        cont=22,
        add={},
        },
        piedra_transparante =        {
                tipo_item="consumible",
        name="piedra_transparante",
        id="piedra_transparante",
        tipo="piedra_especial",
        wtipo="consumible",
        subTipo="",
        dir="n",
        curar=0,
        attack=0,
        cost=0,
        cont=22,
        add={},
        },
        piedra_hermosa =        {
                tipo_item="consumible",
        name="piedra_hermosa",
        id="piedra_hermosa",
        tipo="piedra_especial",
        wtipo="consumible",
        subTipo="",
        dir="n",
        curar=0,
        attack=0,
        cost=0,
        cont=22,
        add={},
        },
        piedra_luminosa =                {
                tipo_item="consumible",
        name="piedra_luminosa",
        id="piedra_luminosa",
        tipo="piedra_especial",
        wtipo="consumible",
        subTipo="",
        dir="n",
        curar=0,
        attack=0,
        cost=0,
        cont=22,
        add={},
        },
        potenciador =        {
                tipo_item="consumible",
        name="potenciador",
        id="potenciador",
        tipo="ingredientes",
        wtipo="consumible",
        dir="c",
        curar=10,
        attack=0,
        cost=5,
        cont=22,  
        },

}


numero_spell={["fuego"]={num=10},["fuego+"]={num=5},["fuego++"]={num=1},
              ["hielo"]={num=10},["hielo+"]={num=5},["hielo++"]={num=1},}


objetos_especiales={
        metralleta={tipo_item="especiales",name="metralleta",id="metralleta",wtipo="tools",dir="e",cost=500},
        lanza_llamas={tipo_item="especiales",name="lanza llamas",id="lanza_llamas",wtipo="tools",dir="e",cost=500},
        generador_electrico={tipo_item="especiales",name="generador electrico",id="generador_electrico",wtipo="tools",dir="e",cost=500},
        generador_de_gravedad={tipo_item="especiales",name="generador de gravedad",id="generador_de_gravedad",wtipo="tools",dir="e",cost=500},
        misiles={tipo_item="especiales",name="misiles",id="misiles",wtipo="tools",dir="e",cost=500},
        disparador_sonico={tipo_item="especiales",name="disparador sonico",id="disparador_sonico",wtipo="tools",dir="e",cost=500},
}


ListaFuerzasMagicas={
        
        gema_fuego="fuego",
}

Evocaciones={}

lista_tools = {
        metralleta={tipo_item="especiales",name="metralleta",id="metralleta",wtipo="tools", ingredientes = {"metralleta"},dir="e",},
        lanza_llamas={tipo_item="especiales",name = "lanza llamas",id="lanza_llamas", wtipo="tools",ingredientes = {"lanza_llamas"},dir="e",},
        generador_electrico={tipo_item="especiales",name = "generador electrico",id="generador_electrico",wtipo="tools", ingredientes = {"generador_electrico"},dir="e",},
        generador_de_gravedad ={tipo_item="especiales",name = "generador de gravedad",id="generador_de_gravedad", wtipo="tools",ingredientes = {"generador_de_gravedad"},dir="e",},
        misiles={tipo_item="especiales",name = "misiles",id="misiles", wtipo="tools", ingredientes = {"misiles"},dir="e",},
        disparador_sonico={tipo_item="especiales",name = "disparador sonico",id="disparador_sonico", wtipo="tools", ingredientes = {"disparador_sonico"},dir="e",},
}


libros_lista={
        libro_fuego = {
                tipo_item="consumible",
        name="libro fuego",
        id="libro_fuego",
        tipo="libro",
        wtipo="consumible",
        subTipo="dark.magic",
        dir="c",
        curar=10,
        attack=0,
        cost=5,
        cont=22,
        add={name="fuego",dir="e",cost=1,},
        },
        libro_agua = {
                tipo_item="consumible",
        name="libro agua",
        id="libro_agua",
        tipo="libro",
        wtipo="consumible",
        subTipo="dark.magic",
        dir="c",
        curar=10,
        attack=0,
        cost=5,
        cont=22,
        add={name="agua",dir="e",cost=1,},
        },
        libro_oscuridad = {
                tipo_item="consumible",
        name="libro oscuridad",
        id="libro_oscuridad",
        tipo="libro",
        wtipo="consumible",
        subTipo="dark.magic",
        dir="c",
        curar=10,
        attack=0,
        cost=5,
        cont=22,
        add={name="oscuridad",dir="e",cost=1,},
        },
        libro_aire = {
                tipo_item="consumible",
        name="libro aire",
        id="libro_aire",
        tipo="libro",
        wtipo="consumible",
        subTipo="light.magic",
        dir="c",
        curar=10,
        attack=0,
        cost=5,
        cont=22,
        add={name="aire",dir="e",cost=1,},
        },

        libro_hielo = {
                tipo_item="consumible",
        name="libro hielo",
        id="libro_hielo",
        tipo="libro",
        wtipo="consumible",
        subTipo="light.magic",
        dir="c",
        curar=10,
        attack=0,
        cost=5,
        cont=22,
        add={id="hielo",name="hielo",dir="e",cost=1,},
        },
        libro_electro = {
                tipo_item="consumible",
        name="libro electro",
        id="libro_electro",
        tipo="libro",
        wtipo="consumible",
        subTipo="dark.magic",
        dir="c",
        curar=10,
        attack=0,
        cost=5,
        cont=22,
        add={id="electro",name="electro",dir="e",cost=1,},
        },
        libro_bio = {
                tipo_item="consumible",
        name="libro bio",
        id="libro_bio",
        tipo="libro",
        wtipo="consumible",
        subTipo="dark.magic",
        dir="c",
        curar=10,
        attack=0,
        cost=5,
        cont=22,
        add={id="bio",name="bio",dir="e",cost=1,},
        },
        libro_dormir = {
                tipo_item="consumible",
        name="libro dormir",
        id="libro_dormir",
        tipo="libro",
        wtipo="consumible",
        subTipo="light.magic",
        dir="c",
        curar=10,
        attack=0,
        cost=5,
        cont=22,
        add={id="dormir",name="dormir",dir="e",cost=1,},
        },
        libro_silencio = {
                tipo_item="consumible",
        name="libro silencio",
        id="libro_silencio",
        tipo="libro",
        wtipo="consumible",
        subTipo="light.magic",
        dir="c",
        curar=10,
        attack=0,
        cost=5,
        cont=22,
        add={id="silencio",name="silencio",dir="e",cost=1,},
        },
        libro_ceguera = {
                tipo_item="consumible",
        name="libro ceguera",
        id="libro_ceguera",
        tipo="libro",
        wtipo="consumible",
        subTipo="light.magic",
        dir="c",
        curar=10,
        attack=0,
        cost=5,
        cont=22,
        add={id="ceguera",name="ceguera",dir="e",cost=1,},
        },
        libro_petrificacion = {
                tipo_item="consumible",
        name="libro petrificacion",
        id="libro_petrificacion",
        tipo="libro",
        wtipo="consumible",
        subTipo="dark.magic",
        dir="c",
        curar=10,
        attack=0,
        cost=5,
        cont=22,
        add={id="petrificacion",name="petrificacion",dir="e",cost=1,},
        },

        libro_sagrado = {
                tipo_item="consumible",
        name="libro sagrado",
        id="libro_sagrado",
        tipo="libro",
        wtipo="consumible",
        subTipo="white.magic",
        dir="c",
        curar=10,
        attack=0,
        cost=5,
        cont=22,
        add={id="sagrado",name="sagrado",dir="e",cost=1,},
        },

        libro_terremoto = {
                tipo_item="consumible",
        name="libro terremoto",
        id="libro_terremoto",
        tipo="libro",
        wtipo="consumible",
        subTipo="dark.magic",
        dir="c",
        curar=10,
        attack=0,
        cost=5,
        cont=22,
        add={id="terremoto",name="terremoto",dir="e",cost=1,},
        },

        libro_gravedad = {
                tipo_item="consumible",
        name="libro gravedad",
        id="libro_gravedad",
        tipo="libro",
        wtipo="consumible",
        subTipo="dark.magic",
        dir="c",
        curar=10,
        attack=0,
        cost=5,
        cont=22,
        add={id="gravedad",name="gravedad",dir="e",cost=1,},
        },

        libro_tornado = {
                tipo_item="consumible",
        name="libro tornado",
        id="libro_tornado",
        tipo="libro",
        wtipo="consumible",
        subTipo="dark.magic",
        dir="c",
        curar=10,
        attack=0,
        cost=5,
        cont=22,
        add={id="tornado",name="tornado",dir="e",cost=1,},
        },

        libro_meteoro = {
                tipo_item="consumible",
        name="libro meteoro",
        id="libro_meteoro",
        tipo="libro",
        wtipo="consumible",
        subTipo="dark.magic",
        dir="c",
        curar=10,
        attack=0,
        cost=5,
        cont=22,
        add={id="meteoro",name="meteoro",dir="e",cost=1,},
        },

        libro_ultima = {
                tipo_item="consumible",
        name="libro ultima",
        id="libro_ultima",
        tipo="libro",
        wtipo="consumible",
        subTipo="dark.magic",
        dir="c",
        curar=10,
        attack=0,
        cost=5,
        cont=22,
        add={id="ultima",name="ultima",dir="e",cost=1,},
        },

}

items={
        {
                tipo_item="consumible",
        name="pocion",
        id="pocion_item",
        tipo="consumible",
        wtipo="consumible",
        dir="c",
        curar=10,
        attack=0,
        cost=5,
        cont=22,  
        },
        {
                tipo_item="consumible",
        name="ether",
        id="ether_item",
        tipo="consumible",
        wtipo="consumible",
        dir="c",
        curar=10,
        attack=0,
        cost=5,
        cont=22,  
        },
        {
                tipo_item="consumible",
        name="bomba",
        id="bomba_item",
        tipo="consumible",
        wtipo="consumible",
        dir="e",
        value=10,
        attack=10,
        cost=5,
        cont=30,  
        },
        {
                tipo_item="consumible",
        name="revivir",
        id="revivir_item",
        tipo="consumible",
        wtipo="consumible",
        dir="d",
        curar=10,
        value=10,
        attack=10,
        cost=5,
        cont=30,  
        },
        {
                tipo_item="consumible",
        name="roca",
        id="roca_item",
        tipo="consumible",
        wtipo="consumible",
        dir="e",
        curar=10,
        value=10,
        attack=4,
        cost=5,
        cont=30,  
        },
        {
                tipo_item="consumible",
        name="Balas Potentes",
        id="Balas_Potentes",
        tipo="consumible",
        wtipo="consumible",
        dir="e",
        curar=10,
        value=10,
        attack=4,
        cost=5,
        cont=30,  
        },
        --Objeto para pruebas
        {
                tipo_item="consumible",
        name="Objeto anomalo",
        id="libro_fuego",
        tipo="libro",
        wtipo="consumible",
        subTipo="dark.magic",
        dir="c",
        curar=10,
        attack=0,
        cost=5,
        cont=22,
        add={{name="fuego", id="fuego",dir="e",cost=1,tipo="ofensivo",}},
        },


}

invo={{name="murcielago",id="murcielago",dir="x",cost=1,},{name="zombie",id="zombie",dir="x",cost=1,}, {name="esqueleto",id="esqueleto",dir="x",cost=1,}, {name="demonio",id="demonio",dir="x",cost=1,} }



monster_weakness={["murcielago"]= true, ["murcielago_fuego"]= true,["murcielago_hielo"]= true,
                ["fuego_fuego"]= true,["fuego_hielo"]= true,["fuego_electrico"]= true,["evil_eye"]= true,["slime_azul"]= true,
                ["slime_amarillo"]= true,["slime_rojo"]= true,["slime_rainbow"]= true,["serpiente_verde"]= true,
                ["Murcielago_electrico"]= true,["serpiente_purpura"]= true,["objetos"]= true,
                ["dummy"]=true,}



lista_elemto_terreno={
        ["agua"]="agua",
        ["cueva"]="fuego",
        ["pladera"]="aire",
        ["tierra"]="fuego",
	["fuego"]="fuego",
	["nevado"]="hielo",
}


lista_fondo={
        ["pradera"]=0,
        ["cueva"]=1,
        ["underwater"]=2,
        ["ocean"]=3,

}

lista_terreno={
        ["agua"]={{x=30,y=110,spr=8},{x=300,y=220,spr=9},{x=570,y=260,spr=10},{x=540,y=110,spr=11},},
        ["cueva"]={{x=30,y=110,spr=0},{x=300,y=220,spr=1},{x=570,y=260,spr=2},{x=540,y=110,spr=3},},
        ["pladera"]={{x=30,y=110,spr=4},{x=300,y=220,spr=5},{x=570,y=260,spr=6},{x=540,y=110,spr=7},},
        ["tierra"]={{x=30,y=110,spr=0},{x=300,y=220,spr=1},{x=570,y=260,spr=2},{x=540,y=110,spr=3},},
        ["fuego"]={{x=30,y=110,spr=4},{x=300,y=220,spr=5},{x=570,y=260,spr=6},{x=540,y=110,spr=7},},
        ["nevado"]={{x=30,y=110,spr=4},{x=300,y=220,spr=5},{x=570,y=260,spr=6},{x=540,y=110,spr=7},},

}

lista_todos={"Todos"}

lista_mix = {
        {name = "Ultra pocion",id="Ultra_pocion", ingredientes = {"pocion", "potenciador"},dir="c",},
        {name = "Ultra ether",id="Ultra_ether", ingredientes = {"ether", "potenciador"},dir="c",},
        {name = "Ultra veneno",id="Ultra_veneno", ingredientes = {"veneno", "potenciador"},dir="c",},
        {name = "Ultra Dormir",id="Ultra_Dormir", ingredientes = {"estracto_del_sueño", "potenciador"},dir="c",},
        {name = "Ultra paralisis",id="Ultra_paralisis", ingredientes = {"paralizante", "potenciador"},dir="c",},
        {name = "Ultra bomba",id="Ultra_bomba", ingredientes = {"bomba", "potenciador"},dir="c",},
        {name = "Ultra elixir",id="ultra_elixir", ingredientes = {"elixir", "potenciador"},dir="c",},
        {name = "Ultra revivir",id="Ultra_revivir", ingredientes = {"resurrecion", "potenciador"},dir="a",},
        {name = "Ultra potencia",id="Ultra_potencia", ingredientes = {"pocion_de_potencia", "potenciador"},dir="c"},
        {name = "Ultra evasion",id="Ultra_evacion", ingredientes = {"pocion_de_evacion", "potenciador"},dir="c"},
        {name = "Ultra rapidez",id="Ultra_rapidez", ingredientes = {"pocion_de_rapidez", "potenciador"},dir="e"},
        {name = "Ultra defenza",id="Ultra_defenza", ingredientes = {"pocion_de_defenza", "potenciador"},dir="e"},
        {name = "panacea spray",id="panacea_spray", ingredientes = {"panacea", "pulverizador"},dir="e"},
        {name = "pocion spray",id="Pocion_spray", ingredientes = {"pocion", "pulverizador"},dir="e"},
        {name = "ether spray",id="Ether_spray", ingredientes = {"ether", "pulverizador"},dir="e"},
        {name = "elixir spray",id="elixir_spray", ingredientes = {"elixir", "pulverizador"},dir="e"},
        {name = "Gas de resureccion",id="Gas_de_resureccion", ingredientes = {"resurrecion", "pulverizador"},dir="c",},
        {name = "Gas Venenoso",id="Gas_Venenoso", ingredientes = {"veneno", "pulverizador"},dir="c",},
        {name = "Gas dormir",id="Gas_dormir", ingredientes = {"estracto_del_sueño", "pulverizador"},dir="c",},
        {name = "Gas paralisante",id="Gas_paralisante", ingredientes = {"paralizante", "pulverizador"},dir="c",},
        {name = "Gas de potencia",id="Gas_de_potencia", ingredientes = {"pocion_de_potencia", "pulverizador"},dir="c",},
        {name = "Gas de evacion",id="Gas_de_evacion", ingredientes = {"pocion_de_evacion", "pulverizador"},dir="c",},
        {name = "Gas de rapidez",id="Gas_de_rapidez", ingredientes = {"pocion_de_rapidez", "pulverizador"},dir="c",},
        {name = "Gas de defenza",id="Gas_de_defenza", ingredientes = {"pocion_de_defenza", "pulverizador"},dir="a",},
        {name = "Bomba electricidad",id="bomba_electricidad", ingredientes = {"Escama_electrica", "bomba"},dir="c"},
        {name = "Bomba glaciar",id="bomba_glaciar", ingredientes = {"Escama_de_frio", "bomba"},dir="c"},
        {name = "Bomba de veneno",id="Bomba_de_veneno", ingredientes = {"veneno", "bomba"},dir="e"},
        {name = "Bomba del sueño",id="Bomba_del_sueño", ingredientes = {"estracto_del_sueño", "bomba"},dir="e"},
        {name = "Mix pocion-ether",id="Mix_Pocion-ether", ingredientes = {"pocion", "ether"},dir="e"},
        {name = "Mix panacea-pocion",id="Mix_Panacea-pocion", ingredientes = {"panacea", "pocion"},dir="e"},
        {name = "Mix panacea-ether",id="Mix_Panacea-ether", ingredientes = {"panacea", "ether"},dir="e"},
}

lista_bullet = {
        {name = "Balas potentes",id="Balas_Potentes", ingredientes = {"Balas_Potentes"},dir="e",},
}


lista_azul = {
        {name = "aliento de fuego",id="aliento_de_fuego", ingredientes = {"murcielago_fuego"},dir="e",},
        {name = "aliento de hielo",id="aliento_de_hielo", ingredientes = {"murcielago_hielo"},dir="e",},
        {name = "fuego",id="fuego", ingredientes = {"murcielago_fuego"},dir="e",},
        {name = "hielo",id="hielo", ingredientes = {"murcielago_hielo"},dir="e",},
}

monster_diccionario={["murcielago"]= "aliento_de_fuego", ["murcielago_fuego"]= "fuego",["murcielago_hielo"]= "hielo",
                ["fuego_fuego"]= "true",["fuego_hielo"]= "true",["fuego_electrico"]= "true",["evil_eye"]= "true",["slime_azul"]= "true",
                ["slime_amarillo"]= "true",["slime_rojo"]= "true",["slime_rainbow"]= "true",["serpiente_verde"]= "true",
                ["Murcielago_electrico"]= "true",["serpiente_purpura"]= "true",["objetos"]= "true",}



lista_encuentro={["murcielago"]= true, ["murcielago_fuego"]= false,["murcielago_hielo"]= false,
                ["fuego_fuego"]= false,["fuego_hielo"]= false,["fuego_electrico"]= false,["evil_eye"]= false,["slime_azul"]= false,
                ["slime_amarillo"]= false,["slime_rojo"]= false,["slime_rainbow"]= false,["serpiente_verde"]= false,
                ["Murcielago_electrico"]= false,["serpiente_purpura"]= false,["objetos"]= false,
        ["dummy"]= false,}


anim_list={["ataque_arma"]=
        {ti=0,ac=1,
        frm={{t=8,spr=0},{t=8,spr=1},{t=16,spr=2},{t=8,spr=3},{t=8,spr=4}}},
        ["magia"]=
        {ti=0,ac=1,
        frm={{t=8,spr=5},{t=8,spr=6},{t=16,spr=7},{t=8,spr=8},{t=8,spr=9}}},
        ["corte"]=
        {ti=0,ac=1,
        frm={{t=8,spr=10},{t=8,spr=11},{t=16,spr=12},{t=8,spr=13},{t=8,spr=14}}},
        ["golpe"]=
        {ti=0,ac=1,
        frm={{t=8,spr=15},{t=8,spr=16},{t=16,spr=17},{t=8,spr=18},{t=8,spr=19}}},
        ["puñetazos"]=
        {ti=0,ac=1,
        frm={{t=8,spr=20},{t=8,spr=21},{t=16,spr=22},{t=8,spr=24},{t=8,spr=25}}},
        ["lanzar"]=
        {ti=0,ac=1,
        frm={{t=8,spr=26},{t=8,spr=27},{t=16,spr=28},{t=8,spr=29},{t=8,spr=30}}},
        ["fuego"]=
        {ti=0,ac=1,
        frm={{t=4,spr=55},{t=4,spr=56},{t=4,spr=57},{t=4,spr=58},{t=4,spr=59}}},
        ["hielo"]=
        {ti=0,ac=1,
        frm={{t=4,spr=60},{t=4,spr=61},{t=8,spr=62},{t=4,spr=63},{t=4,spr=64}}},
        ["rayo"]=
        {ti=0,ac=1,
        frm={{t=4,spr=65},{t=4,spr=66},{t=8,spr=67},{t=4,spr=68},{t=4,spr=69}}},
        ["Demonio_protector"]=
        {ti=0,ac=1,
        frm={{t=824,spr=26}}},
}

anim_summon_list={
        ["Demonio_protector"]=
        {ti=0,ac=1,w=4,h=2,x=1,y=150,x_=0,y_=0,frm={{t=16,spr=116}}},

        ["anomalia"]=
        {ti=0,ac=1,w=1,h=1,x=1,y=150,x_=0,y_=0,frm={{t=32,spr=76},{t=32,spr=77},}},

}


--anim={ti=0,ac=1,frm={{t=32,spr=76},{t=32,spr=77},}},

npc={{   
        name="vendedor",
        opciones={"hablar", "comerciar"},
        dialogo_intro={"hola"},
        dialogo_conversacion={
                {{msg="dialogo 1",tipo="msg"},{msg="dialogo 2",tipo="msg"}},
                --{{msg="dialogo 1",tipo="msg"},{msg="dialogo 2",tipo="que"}},
        },
        dialogo_tag={},
        desc="alegre vendedor",
        inventario={{id="pocion",name="pocion",cont=5},{id="pocion",name="pocion",cont=5}},   
},
}

Desc_Weaponss={

}

Desc_Comandos={

}
--        mg={ },



posiciones_jugadores={
{x=120,y=116-16},
{x=182,y=182-16},
{x=120,y=238-16},
{x=80,y=116+16},
{x=50,y=182+16},
{x=10,y=182-16},
}

aliadosPosicion={
[1]={x=260,y=110},
[2]={x=280,y=176},
[3]={x=260,y=242},
}

aliados={}



invocaciones_fisicas={["murcielago_aliado"]={
                name="murcielago aliado",
                id="murcielago_aliado",
                tipo="aliado",
                id_mons="murcielago",
                x=380,
                y=160,
                x_=380,
                y_=160,
                jump_time=0,
                avanzar_time=0,
                jump=false,
                rest=true,
                avanzar=false,
                weak ={fuego="fuego"},
                ventaja={volar="volar"},
                ia={"atacar"},
                p=1,
                anim={ti=0,ac=1,frm={{t=32,spr=3},{t=32,spr=32},}},
                spr=6,
                ico=32,
                lastDmg=0,
                lastDmgM="",
                lastDmgC="R",
                slDmg=false,
                live=true,                
                anim_acc="",
                anim_col={1,1,1,1},
                items={"pocion", "bomba"},
                ext=0,
                def=false,
                state={},
                tag={},
                hp=10,
                hp_=10,
                mp=5,
                mp_=5,
                sh=0,
                sh_=0,
                gl=0,
                gl_=1,
                agi=3,
                fue=3,
                con=1,
                dex=1,
                ini=0},

                ["Esqueleto_aliado"]= {
                name="Esqueleto aliado",
                id="Esqueleto_aliado",
                tipo="aliado",
                id_mons="Esqueleto",
                x=380,
                y=160,
                x_=380,
                y_=160,
                jump_time=0,
                avanzar_time=0,
                jump=false,
                rest=true,
                avanzar=false,
                weak ={fuego="fuego"},
                ventaja={volar="volar"},
                ia={"atacar"},
                p=1,
                anim={ti=0,ac=1,frm={{t=32,spr=80},{t=32,spr=81},}},
                spr=6,
                ico=32,
                lastDmg=0,
                lastDmgM="",
                lastDmgC="R",
                slDmg=false,
                live=true,                
                anim_acc="",
                anim_col={1,1,1,1},
                items={"pocion", "bomba"},
                ext=0,
                def=false,
                state={},
                tag={},
                hp=10,
                hp_=10,
                mp=5,
                mp_=5,
                sh=0,
                sh_=0,
                gl=0,
                gl_=1,
                agi=3,
                fue=3,
                con=1,
                dex=1,
                ini=0},

                ["zombie_aliado"]= {
                name="zombie aliado",
                id="zombie_aliado",
                tipo="aliado",
                id_mons="zombie",
                x=380,
                y=160,
                x_=380,
                y_=160,
                jump_time=0,
                avanzar_time=0,
                jump=false,
                rest=true,
                avanzar=false,
                weak ={fuego="fuego"},
                ventaja={volar="volar"},
                ia={"atacar"},
                p=1,
                anim={ti=0,ac=1,frm={{t=32,spr=82},{t=32,spr=83},}},
                spr=6,
                ico=32,
                lastDmg=0,
                lastDmgM="",
                lastDmgC="R",
                slDmg=false,
                live=true,                
                anim_acc="",
                anim_col={1,1,1,1},
                items={"pocion", "bomba"},
                ext=0,
                def=false,
                state={},
                tag={},
                hp=10,
                hp_=10,
                mp=5,
                mp_=5,
                sh=0,
                sh_=0,
                gl=0,
                gl_=1,
                agi=3,
                fue=3,
                con=1,
                dex=1,
                ini=0},

                ["demonio_aliado"]= {
                name="demonio aliado",
                id="demonio_aliado",
                tipo="aliado",
                id_mons="demonio",
                x=380,
                y=160,
                x_=380,
                y_=160,
                jump_time=0,
                avanzar_time=0,
                jump=false,
                rest=true,
                avanzar=false,
                weak ={fuego="fuego"},
                ventaja={volar="volar"},
                ia={"atacar"},
                p=1,
                anim={ti=0,ac=1,frm={{t=32,spr=3},{t=32,spr=32},}},
                spr=6,
                ico=32,
                lastDmg=0,
                lastDmgM="",
                lastDmgC="R",
                slDmg=false,
                live=true,                
                anim_acc="",
                anim_col={1,1,1,1},
                items={"pocion", "bomba"},
                ext=0,
                def=false,
                state={},
                tag={},
                hp=10,
                hp_=10,
                mp=5,
                mp_=5,
                sh=0,
                sh_=0,
                gl=0,
                gl_=1,
                agi=3,
                fue=3,
                con=1,
                dex=1,
                ini=0},
                }






anim_hide={ti=0,ac=1,frm={{t=32,spr=94},{t=32,spr=95},}}



Desc_Spells={
        fuego={name="fuego",full_name="fuego",desc="Hechizo de fuego"},
        hielo={name="hielo",full_name="hielo",desc="Hechizo de fuego"},
        aire={name="aire",full_name="aire",desc="Hechizo de fuego"},
        agua={name="agua",full_name="agua",desc="Hechizo de fuego"},
        electro={name="electro",full_name="Electricidad",desc="Hechizo de fuego"},
        curar={name="curar",full_name="curar",desc="Hechizo de fuego"},
        sanar={name="sanar",full_name="sanar",desc="Hechizo de fuego"},
        revivir={name="revivir",full_name="revivir",desc="Hechizo de fuego"},
        Sw_Fire={name="Sw.Fire",full_name="Espada de fuego",desc="Hechizo de fuego"},
        Sw_ice={name="Sw.ice",full_name="Espada de hielo",desc="Hechizo de fuego"},
        rapido={name="rapido",full_name="rapido",desc="Hechizo de fuego"},
        lento={name="lento",full_name="lento",desc="Hechizo de fuego"},
        paralisis={name="paralisis",full_name="paralisis",desc="Hechizo de fuego"},
        congelar={name="congelar",full_name="congelar",desc="Hechizo de fuego"},

}


listaCaptura={
                ["murcielago"]= {name="murcielago",id="murcielago",dir="x",cost=1,}, 
                ["murcielago_fuego"]= {name="murcielago fuego",id="murcielago_fuego",dir="x",cost=1,},
                ["murcielago_hielo"]= {name="murcielago hielo",id="murcielago_hielo",dir="x",cost=1,},
                ["fuego_fuego"]= {name="fuego fuego",id="fuego_fuego",dir="x",cost=1,},
                ["fuego_hielo"]= {name="fuego hielo",id="fuego_hielo",dir="x",cost=1,},
                ["fuego_electrico"]= {name="fuego electrico",id="fuego_electrico",dir="x",cost=1,},
                ["slime_azul"]= {name="slime azul",id="slime_azul",dir="x",cost=1,},
                ["slime_amarillo"]= {name="slime amarillo",id="slime_amarillo",dir="x",cost=1,},
                ["slime_rojo"]= {name="slime rojo",id="slime_rojo",dir="x",cost=1,},
                ["serpiente_verde"]= {name="serpiente verde",id="serpiente_verde",dir="x",cost=1,},
                ["Murcielago_electrico"]= {name="Murcielago electrico",id="Murcielago_electrico",dir="x",cost=1,},
                ["serpiente_purpura"]= {name="serpiente purpura",id="serpiente_purpura",dir="x",cost=1,},
                ["objetos"]= {name="objetos",id="objetos",dir="x",cost=1,},
        }

Spell_books={

        ["fuego"]={name="fuego", id="fuego",dir="e",cost=5,tipo="ofensivo",color="red",lv=1,all=true,cant_=5, cant=5, tcost="carga"}, 
        ["fuego+"]={name="fuego+", id="fuego+",dir="e",cost=15,tipo="ofensivo",color="red",lv=1,all=true, cant_=5, cant=5, tcost="carga"}, 
        ["fuego++"]={name="fuego++", id="fuego++",dir="e",cost=30,tipo="ofensivo",color="red",lv=1,all=true, cant_=5, cant=5, tcost="carga"}, 
        
        ["piedra"]={name="piedra",id="piedra" ,dir="e",cost=5,tipo="ofensivo",color="green",lv=1,all=true, cant_=5, cant=5, tcost="carga"}, 
        ["piedra+"]={name="piedra+",id="piedra+" ,dir="e",cost=15,tipo="ofensivo", color="green" ,lv=2,all=true, cant_=5, cant=5, tcost="carga"},
        ["piedra++"]={name="piedra++",id="piedra++" ,dir="e",cost=30,tipo="ofensivo",color="green",lv=3,all=true, cant_=5, cant=5, tcost="carga"}, 

        ["hielo"]=         {name="hielo",  id="hielo",dir="e",cost=5,tipo="ofensivo",color="white",lv=1,all=true, cant_=5, cant=5, tcost="carga"}, 
        ["hielo+"]=         {name="hielo+",  id="hielo+",dir="e",cost=15,tipo="ofensivo",color="white",lv=2,all=true, cant_=5, cant=5, tcost="carga"}, 
        ["hielo++"]=         {name="hielo++",  id="hielo++",dir="e",cost=30,tipo="ofensivo",color="white",lv=3,all=true, cant_=5, cant=5, tcost="carga"}, 

        ["aire"]=         {name="aire", id="aire",dir="e",cost=5,tipo="ofensivo",color="light_blue",lv=1,all=true, cant_=5, cant=5, tcost="carga"},
        ["aire+"]=         {name="aire+", id="aire+",dir="e",cost=15,tipo="ofensivo",color="light_blue",lv=2,all=true, cant_=5, cant=5, tcost="carga"},
        ["aire++"]=         {name="aire++", id="aire++",dir="e",cost=30,tipo="ofensivo",color="light_blue",lv=3,all=true, cant_=5, cant=5, tcost="carga"},

        ["agua"]=         {name="agua", id="agua",dir="e",cost=5,tipo="ofensivo",color="blue",lv=1,all=true, cant_=5, cant=5, tcost="carga"}, 
        ["agua+"]=         {name="agua+", id="agua+",dir="e",cost=15,tipo="ofensivo",color="blue",lv=2,all=true, cant_=5, cant=5, tcost="carga"}, 
        ["agua++"]=         {name="agua++", id="agua++",dir="e",cost=30,tipo="ofensivo",color="blue",lv=3,all=true, cant_=5, cant=5, tcost="carga"}, 

        ["electro"]=         {name="electro", id="electro",dir="e",cost=5,tipo="ofensivo", color="yellow",lv=1,all=true, cant_=5, cant=5, tcost="carga"},
        ["electro+"]=         {name="electro+", id="electro+",dir="e",cost=15,tipo="ofensivo", color="yellow",lv=2,all=true, cant_=5, cant=5, tcost="carga"},
        ["electro++"]=         {name="electro++", id="electro++",dir="e",cost=30,tipo="ofensivo", color="yellow",lv=3,all=true, cant_=5, cant=5, tcost="carga"},

        ["Sw.Fire"]=         {name="Sw.Fire",id="Sw_Fire",dir="e",cost=3,tipo="ofensivo",color="red",lv=1,all=true, cant_=5, cant=5, tcost="carga"},
        ["Sw.Fire+"]=        {name="Sw.Fire+",id="Sw_Fire+",dir="e",cost=9,tipo="ofensivo",color="red",lv=2,all=true, cant_=5, cant=5, tcost="carga"},
        ["Sw.Fire++"]=         {name="Sw.Fire++",id="Sw_Fire++",dir="e",cost=18,tipo="ofensivo",color="red",lv=3,all=true, cant_=5, cant=5, tcost="carga"},

        ["Sw.ice"]=         {name="Sw.ice", id="Sw_ice", dir="e",cost=3,tipo="ofensivo",color="white",lv=1,all=true, cant_=5, cant=5, tcost="carga"},
        ["Sw.ice+"]=         {name="Sw.ice+", id="Sw_ice+", dir="e",cost=9,tipo="ofensivo",color="white",lv=2,all=true, cant_=5, cant=5, tcost="carga"},
        ["Sw.ice++"]=         {name="Sw.ice++", id="Sw_ice++", dir="e",cost=18,tipo="ofensivo",color="white",lv=3,all=true, cant_=5, cant=5, tcost="carga"},

        ["Sw.electro"]=         {name="Sw.electro", id="Sw_electro", dir="e",cost=3,tipo="ofensivo", color="yellow",lv=1,all=false, cant_=5, cant=5, tcost="carga"},
        ["Sw.electro+"]=         {name="Sw.electro+", id="Sw_electro+", dir="e",cost=9,tipo="ofensivo", color="yellow",lv=2,all=false, cant_=5, cant=5, tcost="carga"},
        ["Sw.electro++"]=         {name="Sw.electro++", id="Sw_electro++", dir="e",cost=18,tipo="ofensivo", color="yellow",lv=3,all=false, cant_=5, cant=5, tcost="carga"},
                
        ["curar"]=         {name="curar", id="curar",dir="c",cost=5,tipo="sanacion",color="green",lv=1,all=true, cant_=5, cant=5, tcost="carga"},
        ["curar+"]=         {name="curar+", id="curar+",dir="c",cost=10,tipo="sanacion",color="green",lv=2,all=true, cant_=5, cant=5, tcost="carga"},
        ["curar++"]=         {name="curar++", id="curar++",dir="c",cost=20,tipo="sanacion",color="green",lv=3,all=true, cant_=5, cant=5, tcost="carga"},

        ["lento"]=         {name="lento", id="lento",dir="e",cost=10,tipo="ofensivo",color="purple",lv=2,all=false, cant_=5, cant=5, tcost="carga"},
        ["paralisis"]=         {name="paralisis", id="paralisis",dir="e",cost=5,tipo="ofensivo",color="yellow",lv=2,all=false, cant_=5, cant=5, tcost="carga"}, 
        ["congelar"]=         {name="congelar", id="congelar",dir="e",cost=10,tipo="ofensivo",color="white",lv=2,all=false, cant_=5, cant=5, tcost="carga"}, 
        ["veneno"]=         {name="veneno", id="veneno",dir="e",cost=2,tipo="ofensivo",color="purple",lv=1,all=false, cant_=5, cant=5, tcost="carga"}, 
        ["dormir"]=         {name="dormir", id="dormir",dir="e",cost=3,tipo="ofensivo",color="white",lv=1,all=false, cant_=5, cant=5, tcost="carga"}, 
	["ceguera"]=     {name="ceguera",id="ceguera" ,dir="e",cost=5,tipo="ofensivo",color="purple",lv=2,all=false, cant_=5, cant=5, tcost="carga"}, 	
        ["confundir"]=         {name="confundir",id="confundir" ,dir="e",cost=10,tipo="ofensivo",color="purple",lv=2,all=false, cant_=5, cant=5, tcost="carga"}, 
        ["silencio"]=         {name="silencio",id="silencio" ,dir="e",cost=5,tipo="ofensivo",color="purple",lv=2,all=false, cant_=5, cant=5, tcost="carga"},


}

all_spell={
        --elemental
        hielo={name="hielo", id="hielo",dir="e",cost=1,},
        fuego={name="fuego", id="fuego", dir="e",cost=1,}, 
        aire={name="aire", id="aire", dir="e",cost=1,},
        agua={name="agua", id="agua", dir="e",cost=1,}, 
        electro={name="electro", id="electro", dir="e",cost=1,},
        lianas={name="lianas",id="lianas" ,dir="e",cost=1,}, 

	--clima
	terremoto={name="terremoto",id="terremoto" ,dir="e",cost=8,}, 
	bio={name="bio",id="bio" ,dir="e",cost=8,}, 
	gravedad={name="gravedad",id="gravedad" ,dir="e",cost=8,}, 
	tornado={name="tornado",id="tornado" ,dir="e",cost=8,}, 
	sangrado={name="sangrado",id="sangrado" ,dir="e",cost=8,}, 
	meteoro={name="meteoro",id="meteoro" ,dir="e",cost=8,}, 
	muerte={name="muerte",id="muerte" ,dir="e",cost=8,}, 
				
	--Espacio
	teleport={name="teleport",id="teleport" ,dir="e",cost=4,}, 
	portal={name="portal",id="portal" ,dir="e",cost=8,}, 
	exiliar={name="exiliar",id="exiliar" ,dir="e",cost=4,}, 
	expulsar={name="expulsar",id="expulsar" ,dir="e",cost=4,}, 
	volar={name="volar",id="volar" ,dir="e",cost=4,}, 

	--MP-HP
	drenar={name="drenar",id="drenar" ,dir="e",cost=8,},
	absorber={name="absurber",id="absurber" ,dir="e",cost=8,},	

	--proteccion
	reflejar={name="reflejar",id="reflejar" ,dir="c",cost=8,}, 
	defensa={name="defensa",id="defensa" ,dir="c",cost=8,}, 
	fuerza={name="fuerza",id="fuerza" ,dir="c",cost=8,}, 
	super={name="super",id="super" ,dir="c",cost=8,}, 
	rapido={name="rapido", id="rapido",dir="c",cost=1,},
	escudo={name="escudo",id="escudo" ,dir="c",cost=8,},
	coraza={name="coraza",id="coraza" ,dir="c",cost=8,},

	--Sanacion
        curar={name="curar", id="curar",dir="c",cost=1,},  
        sanar={name="sanar", id="sanar", dir="c",cost=1,},
        revivir={name="revivir", id="revivir",dir="d",cost=1,},
	disipar={name="disipar",id="disipar" ,dir="e",cost=8,}, 


	--Estados
        
        lento={name="lento", id="lento",dir="e",cost=1,},
        paralisis={name="paralisis", id="paralisis",dir="e",cost=1,},
        congelar={name="congelar", id="congelar",dir="e",cost=3,}, 
        veneno={name="veneno", id="veneno",dir="e",cost=3,}, 
        dormir={name="dormir", id="dormir",dir="e",cost=1,}, 			
	petrificacion=	{name="petrificacion",id="petrificacion" ,dir="e",cost=3,}, 
	ceguera={name="ceguera",id="ceguera" ,dir="e",cost=3,}, 
	confundir={name="confundir",id="confundir" ,dir="e",cost=3,}, 
	silencio={name="silencio",id="silencio" ,dir="e",cost=3,}, 


        Sw_Fire={name="Sw.Fire",id="Sw_Fire",dir="e",cost=1,},
        Sw_ice={name="Sw.ice", id="Sw_ice", dir="e",cost=1,},
        Sw_electro={name="Sw.electro", id="Sw_electro", dir="e",cost=1,}, 



	--artes de combate
        ["golpe_fuerte"]={name="golpe fuerte",id="golpe_fuerte",isCharge=false,dir="e"},
        ["golpe_cargado"]={name="golpe cargado",id="golpe_cargado",isCharge=true,dir="e"},
        ["desenbocado"]={name="desenbocado",id="desenbocado",isCharge=true,dir="a"},
        ["incontrolable"]={name="incontrolable",id="incontrolable",isCharge=true,dir="e"},
        ["disparo_preciso"]={name="disparo preciso",id="disparo_preciso",isCharge=true,dir="e"},		
        ["lluvia_de_flechas"]={name="lluvia de flechas",id="lluvia_de_flechas",isCharge=true,dir="e"},
        ["disparo_rapido"]={name="disparo rapido",id="disparo_rapido",isCharge=true,dir="e"},
		
	--limites
		
	--Armas de combate

	---invocacion
        murcielago={name="murcielago",id="murcielago", dir="x",cost=1,} ,
        ["zombie"]={name="zombie", id="zombie",dir="e",cost=1,},
        ["esqueleto"]={name="esqueleto",id="esqueleto",dir="e",cost=1,},
        ["demonio"]={name="demonio",id="demonio",dir="e",cost=1,} ,

        --comandos

        ["atacar"]={name="atacar",id="atacar",dir="e",cost=1,} ,
        ["slash"]={name="slash",id="slash",dir="e",cost=1,} ,
        ["quitar"]={name="quitar",id="quitar",dir="e",cost=1,} ,
        ["robar"]={name="robar",id="robar",dir="e",cost=1,} ,
        ["combo"]={name="combo",id="combo",dir="e",cost=1,} ,
        ["proteger"]={name="proteger",id="proteger",dir="x",cost=1,} ,
        ["saltar"]={name="saltar",id="saltar",dir="e",cost=1,} ,
        ["suerte"]={name="suerte",id="suerte",dir="x",cost=1,} ,
        ["geo"]={name="geo",id="geo",dir="a",cost=1,} ,


}


skill={
juego_de_manos={name="juego de manos",id="juego_de_manos", Nv=0, spoint=0},
lockpick={name="lockpick",id="lockpick", Nv=0 , spoint=0},
saber={name="saber",id="saber", Nv=0 , spoint=0},
historia={name="historia",id="historia", Nv=0 , spoint=0},
arcana={name="arcana",id="arcana", Nv=0 , spoint=0},
atletismo={name="atletismo",id="atletismo", Nv=0 , spoint=0},
acrobacia={name="acrobacia",id="acrobacia", Nv=0 , spoint=0},
sigilo={name="sigilo",id="sigilo", Nv=0 , spoint=0},
investigacion={name="investigacion",id="sigilo", Nv=0 , spoint=0},
naturaleza={name="naturaleza",id="sigilo", Nv=0 , spoint=0},
religion={name="religion",id="religion", Nv=0 , spoint=0},
comunion={name="comunion",id="comunion", Nv=0 , spoint=0},
medicina={name="medicina",id="medicina", Nv=0 , spoint=0},
instinto={name="instinto",id="instinto", Nv=0 , spoint=0},
supervivencia={name="supervivencia",id="supervivencia", Nv=0 , spoint=0},
mentir={name="mentir",id="mentir", Nv=0 , spoint=0},
intimidar={name="intimidar",id="intimidar", Nv=0 , spoint=0},
persuadir={name="persuadir",id="persuadir", Nv=0 , spoint=0},
actuacion={name="actuacion",id="actuacion", Nv=0 , spoint=0},
}


skill_weapon={
                marcial={id="marcial",exp=0,nivel=0},
                espadas={id="espadas",exp=0,nivel=0},
                lanzas={id="lanzas",exp=0,nivel=0},
                mazas={id="mazas",exp=0,nivel=0},
                hachas={id="hachas",exp=0,nivel=0},
                dagas={id="dagas",exp=0,nivel=0},
                varas={id="varas",exp=0,nivel=0},
                armas={id="armas",exp=0,nivel=0},
                arcos={id="arcos",exp=0,nivel=0},
                ballestas={id="ballestas",exp=0,nivel=0},
        }

skill_stats={
                HP={id="HP", exp=0,nivel=0},
                MP={id="MP", exp=0,nivel=0},
                CON={id="CON",exp=0,nivel=0},
                DEX={id="DEX",exp=0,nivel=0},
                AGI={id="AGI",exp=0,nivel=0},
                POD={id="POD",exp=0,nivel=0},
                MND={id="MND",exp=0,nivel=0},
                INT={id="INT",exp=0,nivel=0},
                CAR={id="CAR",exp=0,nivel=0},
                PER={id="PER",exp=0,nivel=0},
}


runas={
["ataque_final"]={id="ataque_final",name="ataque final"},
["ataque_furtivo"]={id="ataque_furtivo",name="ataque furtivo"},
["contra_ataque"]={id="contra_ataque",name="contra ataque"},
["ataque_añadido"]={id="ataque_añadido",name="ataque añadido"},
["cuatro_magias"]={id="cuatro_magias",name="cuatro magias"},
["efecto_añadido"]={id="efecto_añadido",name="efecto añadido"},
["elemento_basico"]={id="elemento_basico",name="elemento basico"},
["robo_simultaneo"]={id="robo_simultaneo",name="robo simultaneo"},
["todo"]={id="todo",name="todo"},
["sobrecarga"]={id="sobrecarga",name="sobrecarga"},
}

perks={
["HP.J"]={id="HP.J", name="HP.J", from="equip", value=5, str=""},
["HP+20%"]={id="HP+20%", name="HP+20%", from="equip", value=5, str=""},
["HP+40%"]={id="HP+40%", name="HP+40%", from="equip", value=5, str=""},
["HP+60%"]={id="HP+60%", name="HP+60%", from="equip", value=5, str=""},
["HP+80%"]={id="HP+80%", name="HP+80%", from="equip", value=5, str=""},
["HP+100%"]={id="HP+100%",name="HP+100%", from="equip", value=5, str=""},

["MP.j"]={id="MP.J", name="MP.J", from="equip", value=5, str=""},
["MP+20%"]={id="MP+20%", name="MP+20%", from="equip", value=5, str=""},
["MP+40%"]={id="MP+40%", name="MP+40%", from="equip", value=5, str=""},
["MP+60%"]={id="MP+60%", name="MP+60%", from="equip", value=5, str=""},
["MP+80%"]={id="MP+80%", name="MP+80%", from="equip", value=5, str=""},
["MP+100%"]={id="MP+100%",name="MP+100%", from="equip", value=5, str=""},

["RES.FUE"]={id="RES.FUE",name="RES.FUE", from="equip", value=5, str=""},
["RES.FUE.j"]={id="RES.FUE.J",name="RES.FUE.J", from="equip", value=5, str=""},
["RES.ELE"]={id="RES.ELE",name="RES.ELE", from="equip", value=5, str=""},
["RES.ELE.J"]={id="RES.ELE.J",name="RES.ELE.J", from="equip", value=5, str=""},
["RES.HIE"]={id="RES.HIE",name="RES.HIE", from="equip", value=5, str=""},
["RES.HIE.J"]={id="RES.HIE.J",name="RES.HIE.J", from="equip", value=5, str=""},
["RES.VEN"]={id="RES.VEN",name="RES.VEN", from="equip", value=5, str=""},
["RES.VEN.J"]={id="RES.VEN.J",name="RES.VEN.J", from="equip", value=5, str=""},

["RES.FIS"]={id="RES.FIS",name="RES.FIS", from="equip", value=5, str=""},
["RES.FIS.J.FIS.JRRR"]={id="RES.FIS.J",name="RES.FIS.J", from="equip", value=5, str=""},

["CON.J"]={id="CON.J",name="CON.J", from="equip", value=5, str=""},
["CON+10%"]={id="CON+10%",name="CON+10%", from="equip", value=5, str=""},
["CON+30%"]={id="CON+30%",name="CON+30%", from="equip", value=5, str=""},
["CON+50%"]={id="CON+50%",name="CON+50%", from="equip", value=5, str=""},

["DEX.J"]={id="DEX.J",name="DEX.J", from="equip", value=5, str=""},                
["DEX+20%"]={id="DEX+10%",name="DEX+10%", from="equip", value=5, str=""},
["DEX+30%"]={id="DEX+30%",name="DEX+30%", from="equip", value=5, str=""},
["DEX+50%"]={id="DEX+50%",name="DEX+50%", from="equip", value=5, str=""},

["AGI.J"]={id="AGI.J",name="AGI.J", from="equip", value=5, str=""},
["AGI+10%"]={id="AGI+10%",name="AGI+10%", from="equip", value=5, str=""},
["AGI+30%"]={id="AGI+30%",name="AGI+30%", from="equip", value=5, str=""},
["AGI+50%"]={id="AGI+50%",name="AGI+50%", from="equip", value=5, str=""},

["POD.J"]={id="POD.J",name="POD.J", from="equip", value=5, str=""},
["POD+10%"]={id="POD+10%",name="POD+10%", from="equip", value=5, str=""},
["POD+20%"]={id="POD+30%",name="POD+30%", from="equip", value=5, str=""},
["POD+30%"]={id="POD+50%",name="POD+50%", from="equip", value=5, str=""},

["MND.J"]={id="MND.J",name="MND.J", from="equip", value=5, str=""},
["MND+10%"]={id="MND+10%",name="MND+10%", from="equip", value=5, str=""},
["MND+30%"]={id="MND+30%",name="MND+30%", from="equip", value=5, str=""},
["MND+50%"]={id="MND+50%",name="MND+50%", from="equip", value=5, str=""},

["INT.J"]={id="INT.J",name="INT.J", from="equip", value=5, str=""},
["INT+10%"]={id="INT+10%",name="INT+10%", from="equip", value=5, str=""},
["INT+30%"]={id="INT+30%",name="INT+30%", from="equip", value=5, str=""},
["INT+50%"]={id="INT+50%",name="INT+50%", from="equip", value=5, str=""},

["CAR.J"]={id="CAR.J",name="CAR.J", from="equip", value=5, str=""},
["CAR+10%"]={id="CAR+10%",name="CAR+10%", from="equip", value=5, str=""},
["CAR+20%"]={id="CAR+30%",name="CAR+30%", from="equip", value=5, str=""},
["CAR+50%"]={id="CAR+50%",name="CAR+50%", from="equip", value=5, str=""},

["PER.J"]={id="PER.J",name="PER.J", from="equip", value=5, str=""},
["PER+10%"]={id="PER+10%",name="PER+10%", from="equip", value=5, str=""},
["PER+30%"]={id="PER+30%",name="PER+30%", from="equip", value=5, str=""},
["PER+50%"]={id="PER+50%",name="PER+50%", from="equip", value=5, str=""},


["Auto_Potion"]={id="Auto_Potion",name="Auto-Potion", from="equip", value=5, str=""},
["Auto_Reflect"]={id="Auto_Reflect",name="Auto-Reflect", from="equip", value=5, str=""},
["Auto_Protect"]={id="Auto_Protect",name="Auto-Protect", from="equip", value=5, str=""},
["Auto_Shell"]={id="Auto_Shell",name="Auto-Shell", from="equip", value=5, str=""},
["Auto_Float"]={id="Auto_Float",name="Auto-Float", from="equip", value=5, str=""},
["Auto_Regen"]={id="Auto_Regen",name="Auto-Regen", from="equip", value=5, str=""},
["Auto_Life"]={id="Auto_Life",name="Auto-Life", from="equip", value=5, str=""},
["Auto_Charge"]={id="Auto_Charge",name="Auto-Charge", from="equip", value=5, str=""},

["3_Element"]={id="3_Element",name="3 Element", from="equip", value=5, str=""},

["Free_action_support"]={id="Free_action_support",name="Free action support", from="equip", value=5, str=""},
["Half_MP"]={id="Half_MP",name="Half.MP", from="equip", value=5, str=""},
["one_MP"]={id="one_MP",name="1 MP", from="equip", value=5, str=""},
["Reflect_Null"]={id="Reflect_Null",name="Reflect-Null", from="equip", value=5, str=""},

["GL+1"]={id="GL+1",name="GL+1", from="equip", value=5, str=""},
["DEF.GL+1"]={id="DEF.GL+1",name="DEF.GL+1", from="equip", value=5, str=""},
["ATK.GL+1"]={id="ATK.GL+1",name="ATK.GL+1", from="equip", value=5, str=""},
["DMG.GL+1"]={id="DMG.GL+1",name="DMG.GL+1", from="equip", value=5, str=""},
["EVA.GL+1"]={id="EVA.GL+1",name="EVA.GL+1", from="equip", value=5, str=""},

["contra_ataque"]={id="contra_ataque",name="contra ataque", from="equip", value=5, str=""},
["return_DMG"]={id="return_DMG",name="return.DMG", from="equip", value=5, str=""},

["INM.FUE.DEB.HIE"]={id="INM.FUE.DEB.HIE",name="INM.FUE.DEB.HIE", from="equip", value=5, str=""},
["INM.HIE.DEB.ELE"]={id="INM.HIE.DEB.ELE",name="INM.HIE.DEB.ELE", from="equip", value=5, str=""},
["INM.ELE.DEB.FUE"]={id="INM.ELE.DEB.FUE",name="INM.ELE.DEB.FUE", from="equip", value=5, str=""},
["ABS.FUE.DEB.HIE.ELE"]={id="ABS.FUE.DEB.HIE.ELE",name="ABS.FUE.DEB.HIE.ELE", from="equip", value=5, str=""},
["ABS.HIE.DEB.ELE.FUE"]={id="ABS.HIE.DEB.ELE.FUE",name="ABS.HIE.DEB.ELE.FUE", from="equip", value=5, str=""},
["ABS.ELE.SDEB.FUE.HIE"]={id="ABS.ELE.SDEB.FUE.HIE",name="ABS.ELE.SDEB.FUE.HIE", from="equip", value=5, str=""},



["ABS_ELE"]={id="ABS_ELE",name="ABS.ELE", from="equip", value=5, str=""},
["ABS_HIE"]={id="ABS_HIE",name="ABS.HIE", from="equip", value=5, str=""},
["ABS_FUE"]={id="ABS_FUE",name="ABS.FUE", from="equip", value=5, str=""},

--bonificador acumulativo, max igual al atributo Base
["Comida_Fuerza"]={id="Comida_Fuerza",name="Comida Fuerza", from="equip", value=1, str=""},
["Comida_Constitucion"]={id="Comida_Constitucion",name="Comida Fuerza", from="equip", value=1, str=""},
["Comida_Dextreza"]={id="Comida_Dextreza",name="Comida Fuerza", from="equip", value=1, str=""},
["Comida_Agilidad"]={id="Comida_Agilidad",name="Comida Fuerza", from="equip", value=1, str=""},
["Comida_Inteligencia"]={id="Comida_Inteligencia",name="Comida Fuerza", from="equip", value=1, str=""},
["Comida_Poder"]={id="Comida_Poder",name="Comida Fuerza", from="equip", value=1, str=""},
["Comida_Carisma"]={id="Comida_Carisma",name="Comida Fuerza", from="equip", value=1, str=""},
["Comida_Percepcion"]={id="Comida_Percepcion",name="Comida Fuerza", from="equip", value=1, str=""},

--Atributo fisico que aumenta Beneficios dependiendo del nivel
["musculatura"]={id="Comida_Percepcion",name="Comida Fuerza", from="equip", value=1, str=""},



["ataque_doble"]={id="ataque_doble",name="ataque doble", from="equip", value=5, str=""},
["ataque_tiple"]={id="ataque_tiple",name="ataque tiple", from="equip", value=5,  str=""},
["ataque_cuadriple"]={id="ataque_cuadriple",name="ataque cuadriple", from="equip", value=5, str=""},

["doble_items"]={id="doble_items",name="doble_items", from="equip", value=5, str="doble.items"},

["fulminar"]={id="fulminar",name="fulminar", from="equip", value=5, str="fulminar"},
["gesticular"]={id="gesticular",name="gesticular", from="equip", value=5, str="gesticular"},
["golpe_especial"]={id="golpe_especial",name="golpe_especial", from="equip", value=5, str="golpe_especial"},
["habilidad_enemiga"]={id="habilidad_enemiga",name="habilidad_enemiga", from="equip", value=5, str="Blu.magic"},
["invocacion_dual"]={id="invocacion_dual",name="invocacion_dual", from="equip", value=5, str="inv.dual"},
["lanzar"]={id="lanzar",name="lanzar", from="equip", value=5, str="lanzar"},
["magia_dual"]={id="magia_dual",name="magia dual", from="equip", value=5, str="dual M."},
["manipular"]={id="manipular",name="manipular", from="equip", value=5, str="manipular"},
["trasmutacion"]={id="trasmutacion",name="trasmutacion", from="equip", value=5, str="trasmutacion"},
["robar"]={id="robar",name="robar", from="equip", value=5, str="robar"},
["analisis"]={id="analisis",name="analisis", from="equip", value=5, str="analisis"},

["Sebo"]={id="Sebo",name="Sebo", from="equip", value=5, str=""},
["repelente"]={id="repelente",name="repelente", from="equip", value=5, str=""},

["auto_proteger"]={id="auto_proteger",name="auto-proteger", from="equip", value=5, str=""},
["ampliar_rango"]={id="ampliar_rango",name="ampliar rango", from="equip", value=5, str=""},
["ultra_todo"]={id="ultra_todo",name="ultra todo", from="equip", value=5, str=""},
["rotar_MP_HP"]={id="rotar_MP_HP",name="rotar MP HP", from="equip", value=5, str=""},
["ataque_sorpresa"]={id="ataque_sorpresa",name="ataque sorpresa", from="equip", value=5, str=""},
["EXP_rapida"]={id="EXP_rapida",name="EXP rapida", from="equip", value=5, str=""},
["Dinero_extra"]={id="Dinero_extra",name="Dinero extra", from="equip", value=5, str=""},
["millonario"]={id="millonario",name="millonario", from="equip", value=5, str=""},
["ataque_furtivo"]={id="ataque_furtivo",name="ataque furtivo", from="equip", value=5, str=""},


["SUPER_FUERZA"]={id="SUPER_FUERZA",name="SUPER FUERZA", from="equip", value=5, str=""},
["SUPER_CONSTITUCION"]={id="SUPER_FUERZA",name="SUPER FUERZA", from="equip", value=5, str=""},
["SUPER_DESTREZA"]={id="SUPER_DESTREZA",name="SUPER DESTREZA", from="equip", value=5, str=""},
["SUPER_AGILIDAD"]={id="SUPER_AGILIDAD",name="SUPER AGILIDAD", from="equip", value=5, str=""},
["SUPER_PODER"]={id="SUPER_PODER",name="SUPER PODER", from="equip", value=5, str=""},
["SUPER_PERCEPCION"]={id="SUPER_PERCEPCION",name="SUPER PERCEPCION", from="equip", value=5, str=""},
["SUPER_INTELIGENCIA"]={id="SUPER_INTELIGENCIA",name="SUPER INTELIGENCIA", from="equip", value=5, str=""},
["SUPER_CARISMA"]={id="SUPER_CARISMA",name="SUPER CARISMA", from="equip", value=5, str=""},



}

level_Up={

                HP={id="HP", name="HP", every=1,add=1},
                MP={id="MP", name="MP", every=1,add=1},
                CON={id="CON", name="CON",every=4,add=1},
                DEX={id="DEX", name="DEX",every=4,add=1},
                AGI={id="AGI", name="AGI",every=4,add=1},
                POD={id="POD", name="POD",every=4,add=1},
                MND={id="MND", name="MND",every=4,add=1},
                INT={id="INT", name="INT",every=4,add=1},
                CAR={id="CAR", name="CAR",every=4,add=1},
                PER={id="PER", name="PER",every=4,add=1},

                HP_PLUS={id="HP_PLUS", name="HP+", every=1,add=2},
                MP_PLUS={id="MP_PLUS", name="MP+", every=1,add=2},
                CON_PLUS={id="CON_PLUS", name="CON+",every=3,add=1},
                DEX_PLUS={id="DEX_PLUS", name="DEX+",every=3,add=1},
                AGI_PLUS={id="AGI_PLUS", name="AGI+",every=3,add=1},
                POD_PLUS={id="POD_PLUS", name="POD+",every=3,add=1},
                MND_PLUS={id="MND_PLUS", name="MND+",every=3,add=1},
                INT_PLUS={id="INT_PLUS", name="INT+",every=3,add=1},
                CAR_PLUS={id="CAR_PLUS", name="CAR+",every=3,add=1},
                PER_PLUS={id="PER_PLUS", name="PER+",every=3,add=1},


                HP_PLUS2={id="HP_PLUS2", name="HP++", every=1,add=3},
                MP_PLUS2={id="MP_PLUS2", name="MP++", every=1,add=3},
                CON_PLUS2={id="CON_PLUS2", name="CON++",every=2,add=1},
                DEX_PLUS2={id="DEX_PLUS2", name="DEX++",every=2,add=1},
                AGI_PLUS2={id="AGI_PLUS2", name="AGI++",every=2,add=1},
                POD_PLUS2={id="POD_PLUS2", name="POD++",every=2,add=1},
                MND_PLUS2={id="MND_PLUS2", name="MND++",every=2,add=1},
                INT_PLUS2={id="INT_PLUS2", name="INT++",every=2,add=1},
                CAR_PLUS2={id="CAR_PLUS2", name="CAR++",every=2,add=1},
                PER_PLUS2={id="PER_PLUS2", name="PER++",every=2,add=1},

                HP_PLUS3={id="HP_PLUS3", name="HP+++", every=1,add=4},
                MP_PLUS3={id="MP_PLUS3", name="MP+++", every=1,add=4},
                CON_PLUS3={id="CON_PLUS3", name="CON+++",every=1,add=1},
                DEX_PLUS3={id="DEX_PLUS3", name="DEX+++",every=1,add=1},
                AGI_PLUS3={id="AGI_PLUS3", name="AGI+++",every=1,add=1},
                POD_PLUS3={id="POD_PLUS3", name="POD+++",every=1,add=1},
                MND_PLUS3={id="MND_PLUS3", name="MND+++",every=1,add=1},
                INT_PLUS3={id="INT_PLUS3", name="INT+++",every=1,add=1},
                CAR_PLUS3={id="CAR_PLUS3", name="CAR+++",every=1,add=1},
                PER_PLUS3={id="PER_PLUS3", name="PER+++",every=1,add=1},



}


Tecnicas_scroll={
	--tecnicas asesinas
	asesinar={name="asesinar",id="asesinar",isCharge=false,isCommand=true,isReplace=false,tCost="",dir="e"},
	esconderse={name="esconderse",id="esconderse",isCharge=false,isCommand=true,isReplace=false,tCost="",dir="x"},

	--tecnicas berserks
	desenbocado={name="desenbocado",id="desenbocado",isCharge=true,isCommand=false, tCost="charge",dir="x"},
	incontrolable={name="incontrolable",id="incontrolable",isCharge=true,isCommand=true,tCost="charge", dir="x"},
	
	--tecnicas Genericas
	recuperacion={name="recuperacion",id="recuperacion",isCharge=false,isCommand=false,isList=true,tCost="rc",dir="x"},
	golpe_fuerte={name="golpe fuerte",id="golpe_fuerte",isCharge=false,tCost="",dir="e"},
	golpe_cargado={name="golpe cargado",id="golpe_cargado",isCharge=true,isCommand=false,tCost="charge",dir="e"},

	--tecnias de punteria
        enfocarse={name="enfocarse",id="enfocarse",isCharge=false,isCommand=false,tCost="",dir="x"},
	
	--tecnicas desarmado
	combo={name="combo",id="combo",isCharge=true,isCommand=false,tCost="mana",cost=0, dir="x"},
		
        rompe_defensa={name="rompe defensa",id="rompe_defensa",isCharge=false,tCost="",dir="e"},
        rompe_espiritu={name="rompe espiritu",id="rompe_espiritu",isCharge=false,tCost="",dir="e"},
        rompe_magia={name="rompe magia",id="rompe_magia",isCharge=false,tCost="",dir="e"},
        rompe_ataque={name="rompe ataque",id="rompe_ataque",isCharge=false,tCost="",dir="e"},
        ataque_erradicos={name="ataque_erradicos",id="ataque_erradicos",isCharge=false,tCost="",dir="e"},
        ataque_critico={name="ataque critico",id="ataque_critico",isCharge=false,tCost="",dir="e"},
        

        --tecnicas_brutales
        pisoton_de_puas={name="pisoton de puas",id="pisoton_de_puas",isCharge=false,tCost="",dir="e"},
        punnetazo_de_tierra={name="puñetazo de tierra",id="punnetazo_de_tierra",isCharge=false,tCost="",dir="e"},
        pisoton_terremoto={name="pisoton terremoto",id="pisoton_terremoto",isCharge=false,tCost="",dir="e"},
        lanza_roca={name="lanza roca",id="lanza_roca",isCharge=false,tCost="",dir="e"},

        --tecnicas avanzadas

        golpe_espiritu={name="golpe espiritu",id="golpe_espiritu",isCharge=false,tCost="",dir="e"},
        presion_espiritual={name="presion espiritual",id="presion_espiritual",isCharge=false,tCost="",dir="e"},
        sed_de_sangre={name="sed de sangre",id="sed_de_sangre",isCharge=false,tCost="",dir="e"},

        cuerpo_de_papel={name="cuerpo de papel",id="cuerpo_de_papel",isCharge=false,tCost="",dir="e"},
        piel_de_hierro={name="piel de hierro",id="piel_de_hierro",isCharge=false,tCost="",dir="e"},
        camino_lunar={name="camino lunar",id="camino_lunar",isCharge=false,tCost="",dir="e"},
        salto_fantasma={name="salto fantasma",id="salto_fantasma",isCharge=false,tCost="",dir="e"},
        corte_de_aire={name="corte de aire",id="corte_de_aire",isCharge=false,tCost="",dir="e"},
        balas_de_aire={name="balas de aire",id="balas_de_aire",isCharge=false,tCost="",dir="e"},

        golpe_vibratorio={name="golpe vibratorio",id="golpe_vibratorio",isCharge=false,tCost="",dir="e"},
        ataque_concentrado={name="ataque concentrado",id="ataque_concentrado",isCharge=false,tCost="",dir="e"},
        cuerpo_concentrado={name="cuerpo concentrado",id="cuerpo_concentrado",isCharge=false,tCost="",dir="e"},
        golpe_atmosferico={name="golpe atmosferico",id="golpe_atmosferico",isCharge=false,tCost="",dir="e"},
        gotas_de_agua={name="gotas de agua",id="gotas_de_agua",isCharge=false,tCost="",dir="e"},
        Modo_salvaje={name="Modo salvaje",id="Modo_salvaje",isCharge=false,tCost="",dir="e"},
        berserk={name="berserk",id="berserk",isCharge=false,tCost="",dir="e"},
        doble_imagen={name="doble imagen",id="doble_imagen",isCharge=false,tCost="",dir="e"},
        escupir_fuego={name="escupir fuego",id="escupir_fuego",isCharge=false,tCost="",dir="e"},
        Estilo_borracho={name="Estilo borracho",id="Estilo_borracho",isCharge=false,tCost="",dir="e"},
        Estilo_ciego={name="Estilo ciego",id="Estilo_ciego",isCharge=false,tCost="",dir="e"},



}

Lista_Weapon_Arts={      
        golpe_fuerte = {name="golpe fuerte",id="golpe_fuerte",isCharge=false,isCommand=false,tCost="",dir="e", lvm=1,requerimiento={"espada_larga","espada_corta","katana"}},
        golpe_cargado = {name="golpe cargado",id="golpe_cargado",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"espada_larga","espada_corta","katana"}},
        slash = {name="slash",id="slash",need={},isCharge=false,isCommand=false,tCost="rc",dir="x", lvm=1,requerimiento={"katana"}},
        --desenbocado = {name="desenbocado",id="desenbocado",isCharge=true,isCommand=false, tCost="charge",dir="x",requerimiento={"desarmado"}},
        --incontrolable = {name="incontrolable",id="incontrolable",isCharge=true,isCommand=true,tCost="charge", dir="x",requerimiento={"desarmado"}},
        disparo_preciso = {name="disparo preciso",id="disparo_preciso",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"revolver","arco","cannon"}},
        disparo_rapido = {name="disparo rapido",id="disparo_rapido",isCharge=true,isCommand=true,tCost="charge",dir="e", lvm=1,requerimiento={"revolver","arco"}},
        lluvia_de_flechas = {name="lluvia de flechas",id="lluvia_de_flechas",isCharge=true,isCommand=false,tCost="charge",dir="e",lvm=1,requerimiento={"arco"}},
        saltar = {name="saltar",id="saltar",isCharge=true,isCommand=false,tCost="charge",dir="e",lvm=1,requerimiento={"lanza","alabarda"}},

        --espadas
	corte_aplastante = {name="corte aplastante",id="corte_aplastante",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"espada_larga"}},
        paso_veloz = {name="paso veloz",id="paso_veloz",isCharge=true,isCommand=false,tCost="charge",dir="x",lvm=1,requerimiento={"espada_corta"}},	
        doble_corte = {name="doble corte",id="doble_corte",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"espada_larga","espada_corta","katana"}},
        perforacion_repetida = {name="perforacion repetido",id="perforacion_repetida",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"espada_corta"}},
	colmillo_perforador = {name="colmillo perforador",id="colmillo_perforador",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"espada_corta"}},
        corte_giratorio = {name="corte giratorio",id="corte_giratorio",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"espada_larga","espada_corta","katana"}},
        tornado_cortante = {name="tornado cortante",id="tornado_cortante",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"espada_larga","espada_corta","katana"}},
        viento_cortante = {name="viento cortante",id="viento_cortante",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"espada_larga","espada_corta","katana"}},
        vacio_cortante = {name="vacio cortante",id="vacio_cortante:",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"espada_larga","espada_corta","katana"}},
        arma_giratoria = {name="arma giratoria",id="arma_giratoria",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"espada_larga","espada_corta","katana"}},
        corte_de_fuego = {name="corte de fuego",id="corte_de_fuego",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"espada_larga","espada_corta","katana"}},
        corte_relampago = {name="corte relampago",id="corte_relampago",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"espada_larga","espada_corta","katana"}},
        corte_congelante = {name="corte congelante",id="corte_congelante",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"espada_larga","espada_corta","katana"}},
        viento_sagrado = {name="viento sagrado",id="viento_sagrado",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"espada_larga","espada_corta","katana"}},
        viento_sangrante = {name="viento sangrante",id="viento_sangrante",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"espada_larga","espada_corta","katana"}},
        corte_lanzador = {name="corte lanzador",id="corte_lanzador",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"espada_larga","espada_corta","katana"}},
        cazador_de_gigante = {name="cazador_de_gigante",id="cazador_de_gigante",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"espada_larga","espada_corta","katana"}},
        corte_amplio = {name="corte amplio",id="corte_amplio",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"espada_larga","espada_corta","katana"}},
        ataque_fantasma = {name="ataque fantasma",id="ataque_fantasma",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"espada_larga","espada_corta","katana"}},
        salto_tormenta = {name="salto tormenta",id="salto_tormenta",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"espada_larga","espada_corta","katana"}},
        danza_aerea = {name="danza aerea",id="danza_aerea",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"espada_larga","espada_corta","katana"}},
        giro_helicoptero = {name="giro helicoptero",id="giro_helicoptero",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"espada_larga","espada_corta","katana"}},
	
        --contundente, mazas y martillos
        estampar = {name="estampar",id="estampar",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"martillos"}},
        impacto_terremoto = {name="impacto terremoto",id="impacto_terremoto",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"maza","martillo"}},
        puas_de_roca = {name="puas de roca",id="puas_de_roca",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"maza","martillo"}},
        punnetazo_de_piedra = {name="puñetazo de piedra",id="punnetazo_de_piedra",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"maza","martillo"}},
        impacto_sonnador = {name="impacto soñador",id="impacto_sonnador",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"maza","martillo"}},
        impacto_aturdidor = {name="impacto aturdidor",id="impacto_aturdidor",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"maza","martillo"}},
        impacto_lanzador = {name="impacto lanzador",id="impacto_lanzador",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"maza","martillo"}},
        impacto_silenciador = {name="impacto silenciador",id="impacto_silenciador",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"maza","martillo"}},
        impacto_segador = {name="impacto segador",id="impacto_segador",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"maza","martillo"}},
        
	--lanzas perforantes
	lanza_espectral = {name="lanza espectral",id="lanza_espectral",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"lanza","alabarda"}},
        lanzas_de_hielo = {name="lanzas de hielo",id="lanzas_de_hielo",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"lanza","alabarda"}},
        anti_armadura = {name="anti_armadura",id="anti_armadura",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"lanza","alabarda","estoque"}},
	danno_interno_ligero = {name="daño_interno_ligero",id="danno_interno_ligero",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"lanza","alabarda","estoque"}},
	danno_interno_medio = {name="daño_interno_medio",id="danno_interno_medio",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"lanza","alabarda","estoque"}},
	danno_interno_alto = {name="daño_interno_alto",id="danno_interno_alto",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"lanza","alabarda","estoque"}},
	danno_interno_maximo = {name="daño_interno_maximo",id="danno_interno_maximo",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"lanza","alabarda","estoque"}},
	danno_calculado = {name="Daño_calculado",id="danno_calculado",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"lanza","alabarda","estoque"}},
        perforacion_critica={name="perforacion critica",id="perforacion_critica",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"lanza","alabarda","estoque"}},
        --proyectiles
	disparos_multiples = {name="disparos multiples",id="disparos_multiples",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"revolver","arco"}},
        super_disparo = {name="super disparo",id="super_disparo",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"revolver","arco"}},
        
        --flechas
	flecha_aerea = {name="flecha aerea",id="flecha_aerea",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"arco"}},
        flecha_pesada = {name="flecha pesada",id="flecha_pesada",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"arco"}},
        
        --escudos
	golpe_escudo = {name="golpe escudo",id="golpe_escudo",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"escudo"}},
        carga_escudo = {name="carga escudo",id="carga_escudo",isCharge=true,isCommand=false,tCost="charge",dir="e", lvm=1,requerimiento={"escudo"}},


        
		
	
}

--[[


espada_larga
espada_corta
katana
lanza
alabarda
hachas
martillo
baculo
dagas
baston
cetro
revolver
ballesta
instrumento
escudo
grimorio





]]
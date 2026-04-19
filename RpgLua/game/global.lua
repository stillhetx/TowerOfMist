
global={
    defender_id=""
}

TipoLevel=""
--tabla con el orden de los turnos
ListaTurnos={}
Order={}
All={}
--tabla con los personajes aliados en defensa
Protectores={}
--tabla para las acciones extra. ¿Deprecar?
Extra_action={}

Actual={}

--tablas de enermigos y party
My_party={}
ActiveParty={}
Show_party={}
Death_party={}
All_party={}
Total_enemy={}
Show_enemy={}

State_list={{"haste","c"},{"berserk","c"},{"Shield","c"}}

Init_b=false

-- Select: Espera las acciones del jugador. 
-- Wait: tiempo de espera para animaciones.

Msg_debug=""

ERROR_MSG=""

State="wait"

SubState=""

SeeHP=true

Buton_bonus=0

Dinero=1000

NivelEnemy=1 --No usado
Nvg=1

List_trigger={}

---lista de acciones a ejecutar
Acciones = {}
Pendientes = {}

--- contenedores de listas a desplegar
EnemigosVivos={}
GruposEnemigos={}
AliadosVivos={}
AliadosMuertos={}

--FiltrarEnemigoVivos()
--FiltrarGrupoEnemigoVivos()
--FiltrarAliadosVivos()
--FiltrarAliadosVivos()

--contador de turnos
Turno=1

--Variables de arrow
Op=1
Opv=1


Opm=1

select_mp="select"
accion_mp=""

select_mp_Item=""
select_mp_slot=""

SelectEnemigo={}

showPerfil="perfil"

-- botones bonus

Buton_bonus=0
--Sistema de seleccion de munu


Acc=""
Replace_Acc=false
obj=""
Last_sel_e=""
Sel_e=""
Sel_ee=""
Last_sel_ee=""
Sel_i=""



Ttipo=""
Ccolor=""
Llv=0
Ccost=0
Mg_sel=""
Last_mg_sel=""
Mg_2sel=""
Last_mg_2sel=""
Last_sel_c=""
Sel_c=""
Last_sel_cc=""
Sel_cc=""
Dirr="e"
Dirr2=""

Ttipo2=""
Ccolor2=""
Llv2=0
Ccost2=0

Last_dirr=""
Last_acc=""
Number_sel=0

IsInterruccion=false
INTERRUCCION_MSG=""

continuar_turno=false

IsCharge=false
Sel_t_cost=""
Sel_command=false

--bolean sobre la ejecucion de habilidades
Execute=false

objetivo=0

time=10

auto=false
count_auto=0

cont=0

--Modo="overWorld"  

Modo="combat"

last_a="" --Deprecado?
last_e="" --Deprecado?


str="" --Deprecado?

--contador del mensaje de daño
timer_dmg_txt=0
max_timer_dmg_txt=40

-- is mostrar texto de daño
b_dmg_txt=false

--Tiempo para animaciones
timer_wait=0
max_timer_wait=40

--Tiempo para invocacion


--revisar
bono=1

-- is wait
B_wait=false

still_turn=true

DesktOpwidth, DesktOpheight = love.window.getDesktopDimensions()
WIDTH_SIZE, HEIGHT_SIZE = DesktOpwidth * 0.8 , DesktOpheight * 0.8
--parametros de dimensiones y escala
VIRTUAL_WIDTH= 128
VIRTUAL_HEIGHT=128
game_width = 640
game_height = 480
scale_mode = true
scale=8

cont_dt=0
max_dt=100


Show_view="graph"
--Show_view="travel"

Temp_e=""  
Temp_c=""  



--tabla_menu={} --Deprecado?
Name_action=""
last_key=""

inverso=false 

start_caracter=false 

flag=""


win_wait=false 


delCounter=0
delMaxCounter=6


auto_obj=""

-- Ejecutar Objetos
Cancel_ejecutar=false
pass_time=0
max_pass_time=2

max_count_win_wait=60
count_win_wait=0

last_num=0

speed=1


world_X=10
world_y=10

ini_overworld=true

seePerfil=1

maps={

{id="mapa01", ini_x=50,ini_y=50}

}

Red={1,0,0,1}
Green={0,1,0,1}
Blue={0,0,1,1}
Yellow={1,1,0,1}
Magenta={1,0,1,1}
Cyan={0,1,1,1}
Purpura={160,32,240,255}

Acc_cost="free"

ini_view=1
fin_view=0

bonus_boton_time_max=26
bonus_boton_time_cont=0
bonus_button=false


ComeBackView=""
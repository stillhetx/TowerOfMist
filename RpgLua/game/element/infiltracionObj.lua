InfiltracionData={}
InfiltracionData.State_table={
    Organizar="Organizar", Resolver="Resolver", Evento="Evento"
}

InfiltracionData.Niveles_Table={
    MUY_BASICO=2, BASICO=3, MEDIO=4, ALTO=6, MUY_ALTO=8,
}
InfiltracionData.Limit_Table={
    TENSION="Tension", TIMER="Timer",
}
InfiltracionData.CombatType_Table={
    FULL="full", sorpresa="sorpresa", oculto="oculto"
}
InfiltracionData.Op=1
InfiltracionData.Info={}
InfiltracionData.seeEnemys=false
InfiltracionData.Action_label=""
InfiltracionData.ini_view=1
InfiltracionData.numero_char=0
InfiltracionData.Actual_char={}
InfiltracionData.IsFinished=false
InfiltracionData.IsEscape=false
InfiltracionData.IsWin=false
InfiltracionData.RollList={}
InfiltracionData.StartEvent=false  ---MArcador para buscar evento
InfiltracionData.StartCombat=false --marcador para iniciar combate
InfiltracionData.Numero_adversarios=0
InfiltracionData.where=""
InfiltracionData.where_table={
    afuera="afuera", dentro="dentro"
}
InfiltracionData.CombatType=""     --marcador para iniciar tipo de comabate
      --- Enemigos dentro
InfiltracionData.State = InfiltracionData.State_table.Organizar
InfiltracionData.Nivel_busqueda = InfiltracionData.Niveles_Table.BASICO
InfiltracionData.list_used_action={}
InfiltracionData.Nivel_alerta=0
InfiltracionData.Nivel_infiltracion = 0 
InfiltracionData.Nivel_tension = 0
InfiltracionData.MAX_TENSION = 6
InfiltracionData.Timer_dice = 0
InfiltracionData.DC_AREA = 8
InfiltracionData.NmOutside=0
InfiltracionData.NmInside=0
InfiltracionData.Limit_type = InfiltracionData.Limit_Table.TENSION
InfiltracionData.Char_state={}
InfiltracionData.tiles={}
InfiltracionData.tiles={
[2]=1411,
[3]=1536,
[4]=1413,
[6]=1539,
[8]=1473,

}
InfiltracionData.posiciones_table={
    afuera="afuera", dentro="dentro"
}
InfiltracionData.posiciones={
[1]=InfiltracionData.posiciones_table.afuera,
[2]=InfiltracionData.posiciones_table.afuera,
[3]=InfiltracionData.posiciones_table.afuera,

}

InfiltracionData.Deck={}

InfiltracionData.Acciones_base_outside={


{name="disfrazarse", id="disfrazarse"},
{name="investigar", id="investigar"},
{name="distraer en puerta", id="distraer_en_puerta"},
{name="pedir ayuda (distraccion)", id="pedir_ayuda"},
{name="atacar frente", id="atacar_frente"},
{name="infiltrarse", id="infiltrarse"},

}
InfiltracionData.Acciones_base_inside={
    {name="infiltrarse", id="infiltrarse"},
    {name="enfrentar enemigos(sigilo)", id="enfrentar_enemigos"},
    {name="buscar", id="buscar"},
    {name="robar en sigilo", id="robar_sigilo"},
    
    --{name="bloquear puerta", id="bloquear_puerta"},
    {name="ocultarse", id="ocultarse"},
    {name="Escapar", id="Escapar"},
}
InfiltracionData.Acciones_base_extra={{name="invisible", id="invisible"},}

---{3-4-6}

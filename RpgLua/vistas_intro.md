# Vistas de la pantalla inicial

La pantalla inicial esta separada en dos archivos:

- `game/element/IntroControl.lua` guarda el estado y procesa la navegacion.
- `game/graficos/graficos_intro_seleccion.lua` dibuja la vista activa.

`IntroControl.view` identifica la vista interna (`title`, `mode`, `party` u
`options`). `Show_view` sigue siendo el selector de vistas globales del juego:
al confirmar la party, el controlador inicializa la partida y cambia
`Show_view` a `allWorld`.

## Controles actuales

- Flechas arriba y abajo: mover la seleccion.
- Z, Espacio o Enter: elegir una opcion o personaje.
- X o Retroceso: quitar el ultimo personaje elegido.
- Enter: empezar cuando ya hay tres personajes elegidos.
- Esc: volver a la vista anterior; en el titulo, salir del juego.

## Agregar una vista inicial

1. Agrega un identificador nuevo a `IntroControl.view` cuando navegues a la
   vista desde `IntroControl.keypressed` o desde la accion que corresponda.
2. Implementa la entrada de teclado necesaria en `IntroControl.keypressed`.
   Mantén aqui los cambios de estado; no dibujes desde el controlador.
3. En `graficos/graficos_intro_seleccion.lua`, crea una funcion local de dibujo
   para la vista. Agrega una rama para su identificador dentro de
   `IntroControl.draw()`.
4. Si la vista necesita animacion o actualizaciones por tiempo, agrega
   `IntroControl.update(dt)` en el controlador y llamala desde `love.update()`
   en `main.lua` cuando `Show_view == "intro"`.

Las coordenadas de dibujo usan un lienzo de 640 x 480. `IntroControl.draw()`
restablece temporalmente la transformacion grafica y recupera el estado al
terminar, asi que cada vista puede dibujarse en esas coordenadas sin depender
de la escala global. Usa `love.graphics.push("all")` / `love.graphics.pop()`
para mantener aislados los cambios de color, fuente y transformacion.

Los modos disponibles se declaran en la tabla local `game_modes` del
controlador. Para agregar otro modo, agrega su entrada y maneja su `id` en
`confirm_selection()`. La lista de personajes proviene de `Nuevas_clases`;
para cambiar el equipo inicial, conserva tres indices validos al llamar
`_init(selectedClasses)`.

## Agregar paginas al LevelUP

Las paginas se registran en `game/element/levelUPLogic.lua` con
`LevelUP.registerPage`. Cada pagina recibe el estado activo y define una
funcion `draw(current)` y otra `control(current, key)`. Cuando termine su
flujo, debe llamar `LevelUP.nextPage()` para abrir la siguiente pagina o volver
al juego si era la ultima.

```lua
LevelUP.registerPage({
    id = "pagina_extra",
    title = "Mi pagina",
    draw = function(current)
        love.graphics.print("Contenido de la pagina", 40, 100)
    end,
    control = function(current, key)
        if key == "return" then
            LevelUP.nextPage()
        end
    end
})
```

Las nuevas paginas se agregan al final de `LevelUP.pages`; asi se conservan
las dos paginas iniciales y no hay que modificar el enrutamiento general.
La mejora de habilidad se guarda en `habilidad.levelUP`; las habilidades del
juego todavia no tienen un sistema de rangos que afecte sus efectos de combate.

function EvaluarGambits(self, target, lista)
    for _, gambit in ipairs(lista) do
        if gambit.condicion(self, target) then
            return gambit.accion(self, target), gambit.nombre
        end
    end

    return "idle", "sin accion"
end
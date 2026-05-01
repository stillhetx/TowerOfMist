Gambits = {
   ["HP_menor_30%"]= {
        id_accion ="HP_menor_30%",
        desc = "HP menor 30%",
        condicion = function(self, target)
            return self.hp < self.maxHp * 0.3
        end,
        accion = function(self, target)
            return "curar"
        end
    },
    {
        id_accion ="atacar",
        desc = "Atacar enemigo",
        condicion = function(self, target)
            return target.hp > 0
        end,
        accion = function(self, target)
            return "atacar"
        end
    }
}


Gambits["HP_menor_30%"]=function(self, target)
            return self.hp < self.maxHp * 0.3
        end



Gambits["HP_mayor_0"]=function(self, target)
            return target.hp > 0
        end
class Receta {
    var ingredientes = []
    var nivelDeDificultad
    var comidaResultante
    

    method ingredientes() = ingredientes
    method nivelDeDificultad() = nivelDeDificultad  
    method comidaResultante() = comidaResultante

    method cantidadDeIngredientes() = ingredientes.size()

    method noEsDificil() = nivelDeDificultad < 5 && self.cantidadDeIngredientes() < 10

    method experienciaSegunReceta() = self.cantidadDeIngredientes() * nivelDeDificultad 

    method recetaSimilar(unaReceta) = self.ingredientesIguales(unaReceta) && self.dificultadSimilar(unaReceta) 

    method dificultadSimilar(unaReceta) = (self.nivelDeDificultad() - unaReceta.nivelDeDificultad()).max(0) <= 1

    method ingredientesIguales(unaReceta) =  self.ingredientes() == unaReceta.ingredientes()

  
}

//Punto 4
class RecetaGourmet inherits Receta {

    override method noEsDificil() = false 

    override method experienciaSegunReceta() = super() * 2 

    
}








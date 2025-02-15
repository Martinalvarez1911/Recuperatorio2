import nivelAprendizaje.*
import recetas.*
import comida.*

class Cocinero {
    var nivelAprendizaje = principiante
    var comidas = []
    var experiencia

    method nivelAprendizaje() = nivelAprendizaje

    method agregarcomidas(comida) {
      comidas.add(comida)
    }

    method agregarExperiencia(unValor) {
      experiencia += unValor
    }

    method cambiarNivel() {
      nivelAprendizaje.pasarA()
    }

    method cantidadDeComidas() = comidas.size() 

    method recetaSimilar(unaReceta) = self.tieneIngredientesIguales(unaReceta) || self.tieneDificultadSimilar(unaReceta)

    method tieneDificultadSimilar(unaReceta) = comidas.any{comida => (comida.receta().dificultadSimilar(unaReceta))}  

    method tieneIngredientesIguales(unaReceta) = comidas.any{comida => comida.receta().ingredientesIguales(unaReceta)}

    method cantidadDeRecetasSimilares(unaReceta) {
        var comidasSimilares = comidas.filter{comida => comida.recetaSimilar(unaReceta)}
        return comidasSimilares.size()
    }


    //Punto 1

    method experienciaAdquirida() {
      var experienciaAdqurida = comidas.sum{plato => plato.experienciaFinal()}
      self.agregarExperiencia(experienciaAdqurida)

    }

    method experiencia() =  experiencia

    //Punto 2

    method superoNivelDeAprendizaje() = nivelAprendizaje.superarNivel(self) 

    //Punto 3

    method prepararComida(unaReceta) {

        if (self.nivelAprendizaje().puedePreparar(self, unaReceta)) {
             self.nivelAprendizaje().permiteElaborar(unaReceta)
            comidas.add(unaReceta.comidaResultante())
            self.pasarNivel()

        }
    }

    method pasarNivel() {
        if (self.superoNivelDeAprendizaje()) {
            self.cambiarNivel()
        }
    } 


    




}


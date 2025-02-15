import recetas.*
import cocinero.*
import comida.*


class NivelDeAprendizaje {

    method superarNivel(cocinero)  

     method puedePreparar(cocinero, receta) 

     method permiteElaborar(cocinero, receta) 

     method pasarA() 

     
}

object principiante inherits NivelDeAprendizaje  {
  
  override method puedePreparar(cocinero, receta) = receta.noEsDificil()

  override method permiteElaborar(cocinero, receta){

    if(receta.cantidadDeIngredientes() < 4) {
      receta.comidaResultante().cambiarCalidad(normal)
    }
    else {
      receta.comidaResultante().cambiarCalidad(pobre)
    }
  }

  override method superarNivel(cocinero) = cocinero.experiencia() > 100

  override method pasarA() = experimentado


}

object experimentado inherits NivelDeAprendizaje {
  var logroPerfreccionar = false
  var plus = 0

  method logroPerfreccionar(cocinero, receta) {
    return cocinero.comidas().recetaSimilar(receta).sum {comida => comida.experiencia()} > receta.comidaResultante().experiencia() * 3 
  }
  override method puedePreparar(cocinero, receta) = receta.noEsDificil() && cocinero.recetaSimilar(receta)

  override method permiteElaborar(cocinero, receta) {
    if (self.logroPerfreccionar(cocinero,receta)) {
      receta.comidaResultante().cambiarCalidad(superior)
      superior.cambiarPlus(cocinero.cantidadDeComidasSimilares() / 10)
    } else {
      receta.comidaResultante().cambiarCalidad(normal)
    }
  }

 

  override method superarNivel(cocinero) = cocinero.cantidadDeComidas() > 5

  override method pasarA() = chef
}

object chef inherits experimentado  {
  var logroPerfreccionar = false //se que se repita logica pero no llegaba con el tiempo a cambiarlo D:
  var plus = 0

   method puedenPreparar(cocinero, receta) = true

    method logroPerfreccionar(cocinero, receta) {
    return cocinero.comidas().recetaSimilar(receta).sum {comida => comida.experiencia()} > receta.comidaResultante().experiencia() * 3 
  }

   method permiteElaborar(cocinero, receta) {
    if (self.logroPerfreccionar(cocinero,receta)) {
      receta.comidaResultante().cambiarCalidad(superior)
      superior.cambiarPlus(cocinero.cantidadDeComidasSimilares() / 10)
    } else {
      receta.comidaResultante().cambiarCalidad(normal)
    }
  }

   method superarNivel(cocinero) = false

    method pasarA() = false
}
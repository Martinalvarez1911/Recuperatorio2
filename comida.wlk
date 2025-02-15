import recetas.*

class Comida {
    var calidad
    const receta

    method calidad() = calidad 

    method experiencia() = receta.experienciaSegunReceta() 

    method experienciaFinal() = self.experiencia() + calidad.experienciaExtra(self)

    method esCalidad(unaCalidad) {
        calidad == unaCalidad
    } 

    method cambiarCalidad(nuevaCalidad) {
      calidad = nuevaCalidad
    }

    method receta() =  receta


}

class Calidad inherits Comida {

    method experienciaExtra(comida)

       
}

object pobre    {
  var experienciaMaxima = 0

  method cambiarExperienciaMaxima(unValor) {
    experienciaMaxima = unValor
  }

   method experienciaExtra(comida) = comida.experiencia().min(experienciaMaxima) 
}

object superior   {
    var plus = 10 //cambiar

    method cambiarPlus(unValor) {
    plus = unValor
  }

      method experienciaExtra(comida) = plus
}

object normal   {
  
}
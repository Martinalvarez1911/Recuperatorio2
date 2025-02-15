import cocinero.*


//Punto 5
class Academia {
    var estudiantes = []
    var recetario = []

    method entrenarEstudiantes() {
      estudiantes.map{estudiante => estudiante.prepararComida(self.recetaQueMasExperienciaAporta())}
      
    }

    method recetaQueMasExperienciaAporta() = recetario.max{receta => receta.experiencia()} 
}

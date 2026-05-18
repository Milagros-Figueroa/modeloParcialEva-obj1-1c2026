import PilotosDisponibles.*
import cuartel.*


object eva01 {
    //el eva empieza en 100 de energia y un campo at de 2110
    var energia = 100
    var campoAt = 2110
    //el eva puede sincronizarse con un piloto, lo que le baja 25 de energia y le sube el campo hasta 2150
    method efectoDeSincronizacionCon(piloto) {
        energia = energia - 25
        campoAt = 2150.min(campoAt +1)
        piloto.sincronizar(self)

    }
    method campoAt() { return campoAt }
    method puedeSincronizarseCon(piloto) {return energia > 30 && piloto.puntosDeEntrenamiento() >= 4} //BOOLEANO
    // Cuando se sincroniza otorga 2 puntos de entrenamiento al piloto
    method puntosDeEntrenamiento() {return 2}
    //Se recarga 30 por hora con tope maximo de 100, es decir un min.()
    method cargaEnergia(hora) { energia = (energia + (30 * hora)).min(100) }
    method energia() { return energia }

}
object eva02 {
    //el eva empieza en 100 de energia y un campo at de 2114
    var energia = 100
    var modo = estandar
    method campoAt() { return 2114 }
    method energia() { return energia }
    //puede cambiar de modo
    method cambiarModo(modoNuevo) { modo = modoNuevo }  //cambia el modo del eva
    method efectoDeSincronizacionCon(piloto) { 
        energia = energia - modo.consumo() //el eva baja su energia segun el modo en el que este
        piloto.sincronizar(self) } 
    method puedeSincronizarseCon(piloto) {return energia > 20 && piloto.puntosDeEntrenamiento() >= 2} //BOOLEANO
    //el modo le consume energia
    method modoDeCombate(piloto) { energia = energia - modo.consumo() }
    method cargaEnergia(hora) { energia = (energia + (25 * hora)).min(100) }
     method puntosDeEntrenamiento() {return modo.puntosDeEntrenamiento()}
}


// MODOS DEL EVA02
object estandar {
    method consumo() {return 10}
    method puntosDeEntrenamiento() { return 1 }
}
object ataque {
    method consumo() {return 20}
    method puntosDeEntrenamiento() { return 3 }
}
object berserk {
    method consumo() {return 35}
    method puntosDeEntrenamiento() {return 6}
}

object eva00 {
    var campoAt = 2100
    method mejorarCampoAt(fuerza) { campoAt = 2150.min(campoAt + fuerza)}
    method campoAt() { return campoAt  }
    method puedeSincronizarseCon(piloto) { return true }
    method efectoDeSincronizacionCon(piloto) { }
    method puntosDeEntrenamiento() { return 1 }
    // method energia() {  }

  
}

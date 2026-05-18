
import EVAS.*


object shinji {
    var puntosDeEntrenamiento = 2
    var estaCansado = false
    var evasSincronizados = []
    method puedeSincronizarseCon(eva) { return !estaCansado }
    method debeDescansar() { estaCansado = true }
    method seConsideraSatisfecho(evasDelCuartel) {
    return evasDelCuartel.all({ eva => evasSincronizados.contains(eva) })
}
    method puntosDeEntrenamiento() {return puntosDeEntrenamiento}
     method sincronizar(eva) {
        puntosDeEntrenamiento = puntosDeEntrenamiento + eva.puntosDeEntrenamiento()
        estaCansado = true
        evasSincronizados.add(eva) }
    

  
}

object asuka {
    var puntosDeEntrenamiento = 5
    var ultimoEva = sinEva

    method puedeSincronizarseCon(eva) { return true }
    method sincronizar(eva) {
        puntosDeEntrenamiento = puntosDeEntrenamiento + eva.puntosDeEntrenamiento()
        ultimoEva = eva
    }
    method puntosDeEntrenamiento() { return puntosDeEntrenamiento }
    method seConsideraSatisfecha() { return ultimoEva.campoAt() > 2115 }
}
object rei {
    var puntosDeEntrenamiento = 0
    var cantidadDeSincronizaciones = 0
     method puntosDeEntrenamiento() { return puntosDeEntrenamiento  }
     //Se puede sincronizar mientras el eva tenga un campo at de al menos 2110 y no haya superado las 5 sincronizaciones
     method puedeSincronizarseCon(eva) { return eva.campoAt() >= 2110 && cantidadDeSincronizaciones < 5 } 
     //Se considera santisfecho si se ha sincronizado al menos una vez
     method seConsideraSatisfecho(evasDelCuartel) { return cantidadDeSincronizaciones > 0 }
        method sincronizar(eva) {
        puntosDeEntrenamiento = puntosDeEntrenamiento + eva.puntosDeEntrenamiento()
          
            cantidadDeSincronizaciones = cantidadDeSincronizaciones + 1}
}
object sinEva {
    method campoAt() { return 0 }
}

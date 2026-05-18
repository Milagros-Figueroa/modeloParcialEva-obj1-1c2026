import EVAS.*
import PilotosDisponibles.*

object nerv {
    var evasDisponibles = []
    var pilotos = []
    method puedeRegistrarEvas(eva) { evasDisponibles.add(eva)}
    method puedeRegistrarPilotos(piloto) { pilotos.add(piloto)}
    method evas() { return evasDisponibles }
    method pilotos() { return pilotos }
    method intentaSincronizar(eva, piloto) {
        if (eva.puedeSincronizarseCon(piloto) && piloto.puedeSincronizarseCon(eva)) {
            eva.efectoDeSincronizacionCon(piloto)
            piloto.sincronizar(eva)
        } else {
            throw new DomainException(message = "No se pudieron sincronizar")
        }
    }
    method promedioDePuntosDeEntrenamientoDeLosPilotos() {
        //Recorremos la lista de pilotos, obtenemos sus puntos de entrenamiento, los sumamos y dividimos por la cantidad de pilotos
        return pilotos.map({ piloto => piloto.puntosDeEntrenamiento() }).sum() / pilotos.size()
    }
    method pilotoConMasPuntos() {
        return pilotos.max({ piloto => piloto.puntosDeEntrenamiento() })
    }
    method listaDeLosEvasConMasAT() {
        //Obtenemos el campo at de cada eva, encontramos el maximo y luego filtramos los evas que tengan ese campo at
        return evasDisponibles.filter({ eva => eva.campoAt() == evasDisponibles.map({ e => e.campoAt() }).max() })
      
    }
    method listaDeEvasEnCondicionesDeUsarse() {
        //Un eva esta en condiciones de usarse si tiene energia mayor a 0 y su campo at es mayor a 2100
        return evasDisponibles.filter({ eva => eva.energia() > 0 && eva.campoAt() > 2100 })
      
    }

    method seConsideraSantisfecho(piloto) {
        //Un piloto se considera satisfecho si se ha sincronizado con todos los evas del cuartel
        return piloto.seConsideraSatisfecho(evasDisponibles)
      
    }


  
}
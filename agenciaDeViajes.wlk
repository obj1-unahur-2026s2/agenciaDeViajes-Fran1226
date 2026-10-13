class Packs {
    const precioBase
    var  dias
    var coordinadorACargo
    const beneficiosVigentes = []

    method dias() = dias
    method precioBase() = precioBase
    method beneficiosVigentes() = beneficiosVigentes 
    method coordinadorACargo() = coordinadorACargo
    method valorFinal() = precioBase + self.costosDeBeneficios()
    method costosDeBeneficios() = beneficiosVigentes.sum({b => b.costo()})
    method agregarBeneficios(listaDeBeneficios) {beneficiosVigentes.addAll(listaDeBeneficios)}
    method esPackPremium() {}
}

class PacksNacionales inherits Packs {
    const actividadesIncluidas = [] //lista de strings.

    method provinciaDestino() {}
    override method esPackPremium() = dias > 10 and coordinadorACargo.esCalificado()
}

class PacksInternacionales inherits Packs {
    const esLugarDeInteres
    const cantEscalas
    const paisDestino

    method paisDestino() = paisDestino
    method cantEscalas() = cantEscalas
    method esLugarDeInteres() = esLugarDeInteres
    override method valorFinal() = super() * 1.2
    override method esPackPremium() = esLugarDeInteres and dias > 20 and cantEscalas == 0

}

class Coordinadores {
    var añosExperiencia
    var viajesRealizados
    var estaMotivado
    const rolesAceptados = [Guia, AsistenteLogistico, Acompañante]

    method viajesRealizados() = viajesRealizados
    method estaMotivado() = estaMotivado
    method añosExperiencia() = añosExperiencia
    method cambiarRol(nuevoRol) {
        if (self.esRolAceptado(nuevoRol)) {
            nuevoRol
        } else {
            self.error("El rol indicado no es admitido")
        }
        
    }
    method esRolAceptado(unRol) {return rolesAceptados.any({r => r == unRol})}
    method esCalificado() = viajesRealizados > 20
}

class Guia inherits Coordinadores {

    override method esCalificado() = super() and estaMotivado
}
class AsistenteLogistico inherits Coordinadores {

    override method esCalificado() = super() and añosExperiencia >= 3

}

class Acompañante inherits Coordinadores {

}

class Beneficios {
    var tipo = ""
    var costo

    method costo() {return costo}
    method estaVigente() {}
}

class TrasladosPrivados inherits Beneficios {


}

class AccesoSalasVip inherits Beneficios {

    
}

class SegurosAdicionales inherits Beneficios {

    
}
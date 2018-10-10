class Persona{
	var property temperatura = 36
	var property celulas = 0
	var property enfermedades = []
	
	method infectar (_enfermedad){
		enfermedades.add(_enfermedad)
		_enfermedad.portador(self)
	}
	
	method vivirUnDia(){
		enfermedades.forEach({enf => enf.afectar(self)})
	}
	
	method aumentarTemperatura (_temperatura){
		self.temperatura((temperatura + _temperatura).max(45) )
	}
	
	method destruirCelulas(_celulasEliminadas){
		self.celulas(celulas - _celulasEliminadas)
	}
	
	method recibir(dosis){
		enfermedades.forEach({enf=>enf.atenuarse(dosis*15)})
		enfermedades.removeAllSuchThat({enf=>enf.estaCurada()})
	}
}


class EnfermedadInfecciosa inherits Enfermedad{
//	var property celulasAmenazadas = 0
	var property portador = "Fulano"
	
	method afectar(){
		portador.aumentarTemperatura(celulasAmenazadas)
	}
	
	method esAgresiva(){
		return celulasAmenazadas > (portador.celulas()) / 10
	}
	
	method duplicar(){
		celulasAmenazadas = celulasAmenazadas*2
	}
}

class EnfermedadAutoinmune inherits Enfermedad{
//	var property celulasAmenazadas = 0
	var property portador = "Fulano"
	var property diasAfectando = 0
	
	method afectar(){
		portador.destruirCelulas(celulasAmenazadas/1000)
		diasAfectando += 1
	}
	
	method esAgresiva(){
		return portador.diasAfectado() > 30
	}
}

class Medico inherits Persona{
	
	var dosis
	
	method atenderA(paciente){
		paciente.recibir(dosis)
	}
}

class Enfermedad{
	
	var celulasAmenazadas
	
	method atenuarse(cuantas){
		celulasAmenazadas = 0.max(celulasAmenazadas - cuantas)
	}

	method estaCurada(){
		return celulasAmenazadas == 0
	}
}

class JefeDepartamento inherits Medico{

	var property subordinados = []
	
	override method atenderA(paciente){
		subordinados.anyone({sub=>sub.atenderA(paciente)})
	}	
}


/*
Clases sobre las cuales nunca vamos a instanciar un objeto se llaman CLASES ABSTRACTAS. (Class Enfermedad) 
El opuesto son las CLASES CONCRETAS. (Class EnfermedadInfecciosa | EnfermedadAutoinmune)

Que una sublclase pise el metodo de su superclase con nuevo comportamiento se define como 
*/
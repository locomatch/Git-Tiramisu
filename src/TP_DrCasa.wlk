class Persona{
	var property temperatura = 36
	var property celulas = 0
	var property enfermedades = []
	var property diasAfectado = 0
	
	method infectar (_enfermedad){
		enfermedades.add(_enfermedad)
		_enfermedad.portador(self)
	}
	
	method aumentarTemperatura (_temperatura){
		self.temperatura((temperatura + _temperatura).max(45) )
	}
	
	method destruirCelulas(_celulasAmenazadas){
		self.celulas(celulas - _celulasAmenazadas)
	}
}


class EnfermedadInfecciosa{
	var property celulasAmenazadas = 0
	var property portador = "Fulano"
	
	method activarEnfermedad(){
		portador.autmentarTemperatura(celulasAmenazadas)
	}
	
	method esAgresiva(){
		return celulasAmenazadas > (portador.celulas()) / 10
	}
}

class EnfermedadAutoinmune{
	var property celulasAmenazadas = 0
	var property portador = "Fulano"
	
	method activarEnfermedad(){
		portador.destruirCelulas(celulasAmenazadas)
	}
	
	method esAgresiva(){
		return portador.diasAfectado() > 30
	}
}


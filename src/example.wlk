/** Rolando, experto en lucha y hechicería  **/

/**
Creo que Fuerza Oscura tiene que ir en un objeto mas global, para que no se tenga que entrar por
medio de Rolando cada vez que se quiera acceder.

object mundo{
var property fuerzaOscura = 5
}
**/

object mundo{
	
	var property fuerzaOscura = 5

	method eclipse(){
		fuerzaOscura = fuerzaOscura * 2
	}		
}

object rolando {

/** Punto 1 **/

	var hechizoPreferido = libroDeHechizos

/** Punto 2**/
	var property artefactos = []
	var valorBaseLucha = 1

/** Punto 3**/	

	var libroDeHechizos = []	

	
	
/** Punto 1 **/	
	method hechizoPreferido(_hechizoPreferido){
    	hechizoPreferido =_hechizoPreferido
    }
	
	method nivelDeHechiceria(){
		
		return (3 * hechizoPreferido.poder() + mundo.fuerzaOscura())  
	
	}
	
	method esPoderoso(){
		return hechizoPreferido.esPoderoso()
	}

/** Punto 2 **/
	method agregarArtefacto (_objeto){
		artefactos.add(_objeto)
	}
	
	method eliminarArtefacto (_objeto){
		artefactos.remove(_objeto)
	}

	method cambiarValorBase(_nuevoValor){
		valorBaseLucha = _nuevoValor
	}

	method nivelDeLucha(){
		return valorBaseLucha + artefactos.sum({ artef => artef.lucha() })
	}

/** Punto 3 **/
	
	method estaCargado (){
		return artefactos.size() > 4
	}
	
}

/** Punto 1 **/
object espectroMalefico{
	var property nombre = "espectro malefico"
	method poder(){
		return nombre.size()
	}
	
	method cambiarNombre(_nuevoNombre){
		nombre = _nuevoNombre
	}
	
	method esPoderoso(){     
		return nombre.size()>15
	}
}

/** Punto 1 **/
object hechizoBasico{
	var property valorPoder = 10
	
	method poder(){
		return valorPoder
	}

	method esPoderoso(){
		return false
	}
}
/** Punto 2 **/
object espadaDelDestino{
	method lucha (guerrero){
		return 3
	}
}
/** Punto 2 **/
object collarDivino{
	var property perlas = 5
	
	method lucha (guerrero){
		return perlas
	}
}
/** Punto 2 **/
object mascaraOscura{
	method lucha (){
		return [4,(mundo.fuerzaOscura())/2].max()
	}
}

object armadura{
	var refuerzo = ninguno
	
	method lucha(){
		return 2+ refuerzo.aplicar()
	}
}

object ninguno{
	method aplicar(){
		return 0
	}
}

object cotaDeMalla{
	method aplicar (){
		return 1
	}
}

//PROBLEMA CON ROLANDO.   Podria poner en el () al guerrero que quiera pero lo deberia usar en todas partes

object bendicion{
	method aplicar (){
		return rolando.nivelDeHechiceria()
	}
}

object hechizo{
	var hechizoSeleccionado = espectroMalefico
	
	method cambiarDeHechizo (_nuevoHechizo){
		hechizoSeleccionado = _nuevoHechizo
	}
	
	method aplicar (){
		hechizoSeleccionado.poder()
	}
	
}

object espejo{
	method usar(){
		/** NI IDEA **/	
	}
}

object libroDeHechizos{
	var hechizos = []
	
	method esPoderoso(){
		return hechizos.esPoderoso()
	}

	method poder(){
		return hechizos.sum({ hechizo => hechizo.esPoderoso().poder() })
	}	

	method agregarHechizo (_hechizo){
		hechizos.add(_hechizo)
	}
	
	method eliminarHechizo (_hechizo){
		hechizos.remove(_hechizo)
	}

}














/** Rolando, experto en lucha y hechicería  **/

/**
Creo que Fuerza Oscura tiene que ir en un objeto mas global, para que no se tenga que entrar por
medio de Rolando cada vez que se quiera acceder.

object mundo{
var property fuerzaOscura = 5
}
**/

object rolando {

/** Punto 1 **/
	var property fuerzaOscura = 5
	var hechizoPreferido = espectroMalefico

/** Punto 2**/
	var property artefactos = []
	var valorBaseLucha = 1



/** Punto 1 **/	
	method hechizoPreferido(_hechizoPreferido){
    hechizoPreferido =_hechizoPreferido
    }
    
	method eclipse(){
		fuerzaOscura = fuerzaOscura * 2
	}
	
	method nivelDeHechiceria(){
		
	return (3 * hechizoPreferido.poder() + fuerzaOscura)  
	
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
	method agregarPertenencia (_objeto){
		pertenencias.add(_objeto)
	}
	
	method eliminarPertenencia (_objeto){
		pertenencias.remove(_objeto)
	}
	
	method estaCargado (){
		return artefactos.size > 4
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
		return [4,(rolando.fuerzaOscura())/2].max()
	}
}

object armadura{
	var refuerzo = 0
	
	method usar(){
		return 2+ refuerzo.aplicar()
	}
}

object cotaDeMalla{
	method aplicar (guerrero){
		return 1
	}
}

object bendicion{
	method aplicar (guerrero){
		return guerrero.nivelDeHechiceria()
	}
}

object hechizo{
	var hechizoSeleccionado = espectroMalefico
	
	method cambiarDeHechizo (_nuevoHechizo){
		hechizoSeleccionado = _nuevoHechizo
	}
	
	method aplicar (guerrero){
		hechizoSeleccionado.poder()
	}
	
}

object espejo{
	method usar(){
		/** NI IDEA **/	
	}
}

















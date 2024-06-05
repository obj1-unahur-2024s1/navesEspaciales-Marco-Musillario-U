import modeloBasicoNaves.*

class NaveBaliza inherits Nave{
	var color 
	var cambioElColor = false
	
	method initialize(){
		self.validarColores(color)
	}
	
	method validarColores(unColor){
		if(not ["Verde","Rojo","Azul"].contains(unColor))
			self.error("Color no valido")
	}
	
	method cambiarColorDeBaliza(colorNuevo){
		self.validarColores(colorNuevo)
		color = colorNuevo
		cambioElColor = true
	}
	
	override method prepararViaje(){
		super()
		self.cambiarColorDeBaliza("Verde")
		self.ponerseEnParaleloAlSol()
	}
	
	override method estaTranquila()= super() and color != "Rojo"
	
	override method escapar(){
		self.irHaciaElSol()
	}
	
	override method avisar(){
		self.cambiarColorDeBaliza("Rojo")
	}
	
	override method condicionAdicionalRelajo()= not cambioElColor
}

class NaveDePasajeros inherits Nave{
	const cantidadPasajeros
	var racionesComida
	var racionesBebida
	var cantidadComidaServida = 0
	
	method cargarComida(cantidad){
		racionesComida += cantidad
	}
	
	method descargarComida(cantidad){
		racionesComida = 0.max(racionesComida - cantidad)
	}
	
	method servirComida(cantidad){
		self.descargarComida(cantidad)
		cantidadComidaServida = cantidadComidaServida + cantidad
	}
	
	method cargarBebida(cantidad){
		racionesBebida += cantidad
	}
	
	method descargarBebida(cantidad){
		racionesBebida = 0.max(racionesBebida - cantidad)
	}
	
	override method prepararViaje(){
		super()
		self.cargarComida(4 * cantidadPasajeros)
		self.cargarBebida(6 * cantidadPasajeros)
		self.acercarseUnPocoAlSol()
	}
	
	override method escapar(){
		self.acelerar(velocidad)
	}
	
	override method avisar(){
		self.descargarBebida(2*cantidadPasajeros)
		self.servirComida(cantidadPasajeros)
	}
	
	override method condicionAdicionalRelajo()= cantidadComidaServida >= 50
}

class NaveDeCombate inherits Nave{
	var misilesDesplegados = false
	const mensajesEmitidos = []
	var  estaVisible = true
	
	method ponerseVisible(){
		estaVisible = true
	}
	
	method ponerseInvisible(){
		estaVisible = false
	}
	
	method estaInvisible()= not estaVisible
	
	method desplegarMisiles(){
		misilesDesplegados = true
	}
	
	method replegarMisiles(){
		misilesDesplegados = false
	}
	
	method misilesDesplegados()= misilesDesplegados
	
	method emitirMensaje(mensaje){
		mensajesEmitidos.add(mensaje)
	}
	
	method mensajesEmitidos()= mensajesEmitidos
	
	method primerMensajeEmitido() = mensajesEmitidos.first()
	method ultimoMensajeEmitido() = mensajesEmitidos.last()
	
	method esEscueta() = mensajesEmitidos.any({ mensaje => mensaje.length() > 30 })
	method emitioMensaje(mensaje) = mensajesEmitidos.contains(mensaje)
	
 	override method prepararViaje(){
 		super()
 		self.ponerseVisible()
 		self.replegarMisiles()
 		self.acelerar(15000)
 		self.emitirMensaje("Saliendo en misión.")
 	}
 	
 	override method estaTranquila()= super() and not misilesDesplegados
 	
 	override method escapar(){
		self.acercarseUnPocoAlSol()
		self.acercarseUnPocoAlSol()
	}
	
	override method avisar(){
		self.emitirMensaje("Amenaza recibida")
	}
	
	override method condicionAdicionalRelajo()= self.esEscueta()

}
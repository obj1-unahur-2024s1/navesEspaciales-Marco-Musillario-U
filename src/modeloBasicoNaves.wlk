class Nave{
	var velocidad = 0
	var direccionAlSol = 0
	var combustible = 0
	
	method initialize(){
		if (not direccionAlSol.between(-10,10)){
			self.error("direccion incorrecta")
		}
		
		if (not velocidad.between(0,100000)){
			self.error("velocidad incorrecta")
		}
	}
	
	method acelerar(cantidad){
		velocidad = (velocidad+cantidad).min(100000)
	}
	
	method desacelerar(cantidad){
		velocidad = 0.max(velocidad-cantidad)
	}
	
	method irHaciaElSol(){
		direccionAlSol = 10
	}
	
	method escaparDelSol(){
		direccionAlSol = -10
	}
	
	method ponerseEnParaleloAlSol(){
		direccionAlSol = 0
	}
	
	method acercarseUnPocoAlSol(){
		direccionAlSol += 1
		direccionAlSol = -10.max(direccionAlSol.min(10))
	}
	
	method alejarseUnPocoDelSol(){
		direccionAlSol -= 1
		direccionAlSol = -10.max(direccionAlSol.min(10))
	}
	
	method prepararViaje(){
		self.cargarCombustible(30000)
		self.acelerar(5000)
	}
	
	method cargarCombustible(cantidad){
		combustible += cantidad
	}
	
	method descargarCombustible(cantidad){
		combustible = 0.max(combustible-cantidad)
	}
	
	method estaTranquila()= combustible >= 4000 and velocidad <= 12000 
	
	method recibirAmenaza(){
		self.escapar()
		self.avisar()
	}
	
	method escapar()
	
	method avisar()
	
	method estaDeRelajo()= self.estaTranquila() and self.condicionAdicionalRelajo()
	
	method condicionAdicionalRelajo()
}




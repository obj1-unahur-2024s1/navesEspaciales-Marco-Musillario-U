import modelosNave.*

class NaveHospital inherits NaveDePasajeros{
	var property quirofanosPreparados 
	
	override method estaTranquila()= super() and not quirofanosPreparados
	
	override method recibirAmenaza(){
		super()
		quirofanosPreparados = true
	}
}

class NaveDeCombateSigilosa inherits NaveDeCombate{
	override method estaTranquila()= super() and estaVisible
	
	override method recibirAmenaza(){
		super()
		self.desplegarMisiles()
		self.ponerseInvisible()
	}
}

class InvitedUser < User

	#Aqui simularemos un usuario invitado, heredando desde la clase User

	#El attr_accessor le permite a la clase adoptar y almacenar datos pos si sola, sin base de datos
	#OJO: accessor es con dos c y dos s
	#Son setters and getters
	attr_accessor :name, :first_name, :last_name, :email

	#Luego, le daremos los datos en el concern current_user_concern de los controladores

end
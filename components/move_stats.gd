class_name MoveStats
extends Resource

#gestisce le variabili del movimento come la velocità, accelerazione, ecc.
#anzichè usare un componente, in questo caso usiamo una risorsa dato che ci saranno solo dati e non logica o funzioni

@export var x_speed: int = 100
@export var acceleration: int = 15
@export var friction: int = 10
@export var terminal_velocity: int = 200



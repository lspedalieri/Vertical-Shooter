class_name MoveInputComponent
extends Node
#Fornisce l'input di movimento al componente MoveComponent
#usa una risorsa MoveStats per prendere i dati sulla velocità

@export var move_stats : MoveStats
@export var move_component : MoveComponent

func _input(event: InputEvent) -> void:
	var input_axis = Input.get_axis("ui_left", "ui_right")
	move_component.velocity = Vector2(input_axis * move_stats.x_speed, 0)

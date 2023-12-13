class_name MoveComponent
extends Node

#permette il movimento di un nodo, gestisce la velocità proporzionata con il numero di frame (delta)

@export var actor: Node2D
@export var velocity : Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	actor.translate(velocity * delta)

class_name PinkEnemy
extends Enemy

@onready var states: Node = $States

@onready var move_down_state: = %MoveDownState as TimedStateComponent
@onready var move_side_state: = %MoveSideState as TimedStateComponent
@onready var pause_state: = %PauseState as TimedStateComponent
@onready var move_side_component = $States/MoveSideState/MoveSideComponent as MoveComponent
@onready var projectile_spawner_component: = %ProjectileSpawnerComponent as SpawnerComponent
@onready var fire_state: = %FireState as StateComponent

func _ready() -> void:
	super()
	for state in states.get_children():
		state = state  as StateComponent
		state.disable()
	move_side_component.velocity.x = [-20, 20].pick_random()

	#state loop
	move_down_state.state_finished.connect(move_side_state.enable)
	#At the end of side state, spawn a projectile with fire state
	#then switch to the next state (pause state)
	move_side_state.state_finished.connect(func():
		scale_component.tween_scale()
		projectile_spawner_component.spawn(global_position)
		fire_state.disable()
		fire_state.state_finished.emit()
	)
	fire_state.state_finished.connect(pause_state.enable)
	pause_state.state_finished.connect(move_down_state.enable)

	#start state loop
	move_down_state.enable()

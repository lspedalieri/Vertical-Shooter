extends Node2D

@onready var left_muzzle : Marker2D = $LeftMuzzle
@onready var right_muzzle : Marker2D = $RightMuzzle
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var fire_rate_timer: Timer = $FireRateTimer
@onready var scale_component: ScaleComponent = $ScaleComponent as ScaleComponent
#@onready var muzzle_flash : CPUParticles2D = $MuzzleFlash as CPUParticles2D
@onready var animated_sprite_2d = $Anchor/AnimatedSprite2D
@onready var move_component : MoveComponent = $MoveComponent as MoveComponent
@onready var flame_animated_sprite = $Anchor/FlameAnimatedSprite

func _ready() ->void:
	move_component.velocity.y = 0
	fire_rate_timer.timeout.connect(fire_lasers)

func fire_lasers() -> void:
	spawner_component.spawn(left_muzzle.global_position)
	spawner_component.spawn(right_muzzle.global_position)
	scale_component.tween_scale()
	
func _process(delta : float) -> void:
	animate_the_ship()
	
func animate_the_ship() -> void:
	if move_component.velocity.x < 0:
		animated_sprite_2d.play("roll_left")
		flame_animated_sprite.play("left")
	elif move_component.velocity.x > 0:
		animated_sprite_2d.play("roll_right")
		flame_animated_sprite.play("right")
	else:
		animated_sprite_2d.play("center")
		flame_animated_sprite.play("center")


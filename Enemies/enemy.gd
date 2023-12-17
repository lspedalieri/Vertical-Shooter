extends Node2D

@onready var stats_component : StatsComponent = $StatsComponent as StatsComponent
@onready var move_component : MoveComponent = $MoveComponent as MoveComponent
@onready var scale_component : ScaleComponent = $ScaleComponent as ScaleComponent
@onready var flash_component : FlashComponent = $FlashComponent as FlashComponent
@onready var shake_component : ShakeComponent = $ShakeComponent as ShakeComponent
@onready var hurtbox_component : HurtboxComponent = $HurtboxComponent as HurtboxComponent
@onready var hitbox_component : HitboxComponent = $HitboxComponent as HitboxComponent
@onready var visible_on_screen_notifier_2d : VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D


func _ready() -> void:
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):
		queue_free()
	)




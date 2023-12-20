extends Node2D

@export var game_stats: GameStats

@onready var ship = $Ship
@onready var score_label: Label = $ScoreLabel

# no health signal
# score component -> sets the score
# signal score change
# updates the score label

func _ready() -> void:
	randomize()
	update_score_label(game_stats.score)
	game_stats.score_changed.connect(update_score_label)
	ship.tree_exiting.connect(func():
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://menus/game_over.tscn")
	)

func update_score_label(new_score: int):
	score_label.text = "Score: " + str(new_score)
	

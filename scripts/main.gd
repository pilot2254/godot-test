extends Node3D

@onready var score_label: Label = %ScoreLabel
@onready var win_label: Label = %WinLabel

var score := 0
var total := 0

func _ready() -> void:
	var coins := get_tree().get_nodes_in_group("coins")
	total = coins.size()
	for coin in coins:
		coin.collected.connect(_on_coin_collected)
	_update_score()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()

func _on_coin_collected() -> void:
	score += 1
	_update_score()
	if score == total:
		win_label.show()
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _update_score() -> void:
	score_label.text = "score: %d / %d" % [score, total]

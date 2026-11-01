extends Control

# aaaaaa

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	%PlayButton.pressed.connect(_on_play_pressed)
	%QuitButton.pressed.connect(get_tree().quit)

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")

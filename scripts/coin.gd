extends Area3D

# yeee im coding dw w dev

signal collected

func _ready() -> void:
	add_to_group("coins")
	body_entered.connect(_on_body_entered)

func _process(delta: float) -> void:
	rotate_y(delta * 2.0)

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		collected.emit()
		queue_free()

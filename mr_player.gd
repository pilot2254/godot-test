extends CharacterBody3D

# genuinely what the fuck am i looking at ?
# python with a go tattoo (:=), a rust arrow (->) and a java annotation (@export).. somewhere a c++ dev (me) is screaming "WHERE ARE MY SEMICOLONS"

# and i thought that zssk blinded me today while i was in train going back home. guess i was wrong

@export var speed := 6.0
@export var jump_velocity := 5.0

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta
	elif Input.is_action_just_pressed("move_jump"):
		velocity.y = jump_velocity

	var input := Input.get_vector("move_left", "move_right", "move_forward", "move_backwards")
	var dir := (transform.basis * Vector3(input.x, 0, input.y)).normalized()
	velocity.x = dir.x * speed
	velocity.z = dir.z * speed

	move_and_slide()

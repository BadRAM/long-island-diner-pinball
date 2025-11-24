extends AudioStreamPlayer

@export var action: StringName
@export var press: bool

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if press && Input.is_action_just_pressed(action):
		play()
	if !press && Input.is_action_just_released(action):
		play()

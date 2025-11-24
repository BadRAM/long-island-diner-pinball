extends Sprite3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	look_at(position + Vector3.UP, Vector3.FORWARD)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !visible: return
	position = get_parent().position
	rotate(Vector3.UP, get_parent().angular_velocity.y * delta)

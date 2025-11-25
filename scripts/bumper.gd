extends Area3D

var cooldown = 0.0
@export var sound: AudioStreamPlayer

func _physics_process(delta: float) -> void:
	cooldown = move_toward(cooldown, 0.0, delta)

func _on_body_entered(body: Node3D) -> void:
	if cooldown != 0: return
	if body is not Ball: return
	body.linear_velocity += Plane(Vector3.UP).project(body.global_position - global_position).normalized() * 50
	cooldown = 0.2
	sound.play()
	if body.level != 2: return
	if body.type != "Shake": return
	body.cook()

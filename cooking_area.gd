extends Area3D

@export var sound: AudioStreamPlayer
@export var level: int
@export var foodType: String

func _on_body_entered(body: Node3D) -> void:
	if body is not Ball: return
	sound.play()
	if body.level != level: return
	if body.type != foodType: return
	body.cook()

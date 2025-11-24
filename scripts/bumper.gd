extends Area3D

var cooldown = 0.0

func _physics_process(delta: float) -> void:
	cooldown = move_toward(cooldown, 0.0, delta)
	if cooldown != 0: return
	for other in get_overlapping_bodies():
		if other is not Ball: continue
		other.linear_velocity += (other.global_position - global_position).normalized() * 50
		cooldown = 0.2
		other.cook_process("Shake", 2)

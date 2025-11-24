extends HingeJoint3D

@export var speed = 10
@export var right: bool

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("both_flippers"):
		set_param(PARAM_MOTOR_TARGET_VELOCITY, speed)
	else:
		set_param(PARAM_MOTOR_TARGET_VELOCITY, -speed)

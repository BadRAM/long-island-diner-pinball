extends Node

@export var spawnerNode: Node3D
@export var newBallSound: AudioStreamPlayer
var ballScene = load("res://scenery/ball.tscn")
var nextBallTimer = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_N):
		nextBallTimer = 0
	pass

func _physics_process(delta: float) -> void:
	nextBallTimer -= delta
	if nextBallTimer <= 0:
		nextBallTimer = 10
		var newball = ballScene.instantiate()
		add_sibling(newball)
		newball.position = spawnerNode.position
		newball.linear_velocity = spawnerNode.transform.basis.z * 25
		newBallSound.play()

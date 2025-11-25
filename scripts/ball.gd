class_name Ball extends RigidBody3D

var type = ""
var level = 1
var sprite: Sprite3D
var sound: AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var r = randi_range(1,3)
	if r == 1:
		type = "Burger"
	if r == 2:
		type = "Fries"
	if r == 3:
		type = "Shake"
	
	sprite = find_child("Sprite{0}{1}".format([type,level]))
	sprite.visible = true;
	sound = sprite.find_child("Sound")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func cook() -> void:
	find_child("Sprite{0}{1}".format([type,level])).visible = false
	level += 1
	find_child("Sprite{0}{1}".format([type,level])).visible = true
	sound = sprite.find_child("Sound")

func _on_body_entered(body: Node) -> void:
	if sound.finished:
		sound.play()

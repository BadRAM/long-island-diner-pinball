class_name Ball extends RigidBody3D

var type = ""
var level = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var r = randi_range(1,3)
	if r == 1:
		type = "Burger"
	if r == 2:
		type = "Fries"
	if r == 3:
		type = "Shake"
	
	find_child("Sprite{0}{1}".format([type,level])).visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func cook_process(desiredType: String, desiredLevel: int) -> void:
	if desiredType != type: return
	if desiredLevel != level: return
	find_child("Sprite{0}{1}".format([type,level])).visible = false
	level += 1
	find_child("Sprite{0}{1}".format([type,level])).visible = true

extends Position3D

onready var intr = preload("res://interasp.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func irspawn():
	var intrinst = intr.instance()
#	var youi = get_node("Sphere/interapt")
#	intrinst.transform.origin = youi.global_transform.origin
#	print(intrinst.transform.origin)
#	print(youi.global_transform.origin)
#	#location is completely fusky yay
#	#add to tree
	add_child(intrinst)
	#interapt set to despawn after x frametime
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

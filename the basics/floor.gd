extends MeshInstance

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	#globule.fload("res://name.txt")
	print(globule.cname);
	#pass # Replace with function body.
	globule.hold_you = get_node("../you")#fix later lol

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

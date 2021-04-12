extends Area

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var ee;

# Called when the node enters the scene tree for the first time.
func _ready():
	ee = get_node("/root/Spatial/you")
	#print(ee.name)
	pass # Replace with function body.

func _on_grasspt_body_entered(body):
	print(ee.name)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if overlaps_body(ee):
		#print("e")
		if ee.velocity.length_squared() > 0:
			print("c")
			#globule.handle_grass()
		
	pass

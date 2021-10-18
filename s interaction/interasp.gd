extends MeshInstance

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer = .03

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer -= delta
	#print(timer)
	if timer <= 0:
		queue_free()

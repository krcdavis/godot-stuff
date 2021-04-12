extends Area

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var poopees = get_overlapping_bodies()
	for poopee in poopees:
		print(poopee.name)
		#if grass, if you.velocity.length_squared > 0:
		# set some particle flags idk
	pass

extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#spawn just offscreen (set rect_position:x)
	#iterate through mon's moves, sanity check, instance opt for each, label&stats, add_child
	#depends on move data format, just hack stg together for now ofc- json?
	rect_position += Vector2(250,0)#lmao works
	#print(rect_position)
	
	var item = preload("res://opt.tscn")
	var itemst
	itemst = item.instance()
	itemst.name="move0"
	add_child(itemst)
	itemst = item.instance()
	itemst.name="move1"
	add_child(itemst)
	itemst = item.instance()
	itemst.name="move2"
	add_child(itemst)
	itemst = item.instance()
	itemst.name="move3"
	add_child(itemst)
	get_node("move0/indcp").visible = true
	#globule.cursor = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

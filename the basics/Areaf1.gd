extends Area

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Areaf1_body_entered(body):
	 # I-
	if body.has_method("is_you"):
		globule.goto_scene("res://floor2.tscn","Areaf2")
		#target exit2
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


func _on_doorleft_body_entered(body):
	if body.has_method("is_you"):
		globule.goto_scene("res://the hallway.tscn","arch3")

func _on_doorleft2_body_entered(body):
	if body.has_method("is_you"):
		globule.goto_scene("res://the hallway.tscn","arch2")
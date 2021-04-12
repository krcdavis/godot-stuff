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


func _on_Area1_body_entered(body):
	if body.has_method("is_you"):
		globule.goto_scene("res://one room.tscn","dummy")


func _on_Area2_body_entered(body):
	if body.has_method("is_you"):
		globule.goto_scene("res://room1.tscn","doorleft2")


func _on_Area3_body_entered(body):
	if body.has_method("is_you"):
		globule.goto_scene("res://room1.tscn","doorleft")


func _on_Area4_body_entered(body):
	if body.has_method("is_you"):
		globule.goto_scene("res://left end room.tscn","dummy")
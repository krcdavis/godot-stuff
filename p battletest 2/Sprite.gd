extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var c = 0#frame index
var d = 4#frame max


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	#index increment, loop back from 4
	c += 1
	set_frame(c % d)
	#restart timer
	pass # Replace with function body.

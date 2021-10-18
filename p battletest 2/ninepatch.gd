extends NinePatchRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var finished = false
export(float) var textSpeed = 0.05

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = textSpeed
	finished = false
	$textt/Sprite.visible=false
	#visible = false

# hardcoded for just one line, for now...
func _process(delta):
	if globule.printing:
		$textt/Sprite.visible=finished
		if Input.is_action_just_pressed("ui_accept"):
			if !finished:
				$textt.visible_characters = len($textt.text)
			else:
				#reset...
				visible=false
				globule.printing = false
				#globule.mode="you"

func textplay(quote):
	globule.printing = true
	visible=true
	finished=false
	$textt.bbcode_text = quote
	$textt.visible_characters = 0
	while $textt.visible_characters < len($textt.text):
		$textt.visible_characters += 1
		$Timer.start()
		yield($Timer, "timeout")
	finished = true
	return

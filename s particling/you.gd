extends KinematicBody

var speed = 130
var dir =  Vector3()
var grabity = -9
var velocity = Vector3()

# snap to floor idk
func _ready():
	if globule.exit_waiting ==1:
		var tempn=get_node("/root/Spatial/"+globule.hold_exit +"/Position3D")
		if tempn:
			self.transform.origin=tempn.global_transform.origin
		globule.exit_waiting=0
	move_and_slide_with_snap(Vector3(0,0,0),Vector3(0,-1,0),Vector3(0,1,0),true)


func _physics_process(delta):
	dir=Vector3(0,0,0)
	if Input.is_action_pressed("ui_left"):
		dir.x-=1
	if Input.is_action_pressed("ui_right"):
		dir.x+=1
	if Input.is_action_pressed("ui_up"):
		dir.z-=1
	if Input.is_action_pressed("ui_down"):
		dir.z+=1
	
	dir=dir.normalized()
	dir=dir*speed*delta;
	
	velocity.y += grabity*delta;
	velocity.x=dir.x
	velocity.z=dir.z
	
	#stop on slope
	velocity = move_and_slide(velocity,Vector3(0,1,0),true)
	#velocity = move_and_slide_with_snap(velocity,Vector3(0,-0.1,0),Vector3(0,1,0),true)
	
	#if Area overlaps_body something named grassplane, emit grass particles ?
	var youa = get_node("youarea")
	var poopees = youa.get_overlapping_bodies()
	for poopee in poopees:
		print(poopee.name)
		#if poopee.name == "grassp", set particle grassp/youptc on
	
func is_you():
	pass;
	#a cheap trick
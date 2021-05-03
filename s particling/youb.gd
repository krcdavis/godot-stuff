extends KinematicBody

var speed = 130
var dir =  Vector3()
var grabity = -9
var velocity = Vector3()
var dirnow = 0
var dirold = -PI/2 #should default to...
var dirnew = 0
var spintimer = 0
var spinstandard = .23
var derp = 0

# snap to floor idk
func _ready():
	if globule.exit_waiting ==1:
		var tempn=get_node("/root/Spatial/"+globule.hold_exit +"/Position3D")
		if tempn:
			self.transform.origin=tempn.global_transform.origin
		globule.exit_waiting=0
	
	#dirold = -Vector2(dir.x,dir.z).angle()-PI/2#get_rot?
	#dirnew = -Vector2(dir.x,dir.z).angle()-PI/2
	move_and_slide_with_snap(Vector3(0,0,0),Vector3(0,-1,0),Vector3(0,1,0),true)

func _physics_process(delta):
	#print(delta)
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
	dirnow = -Vector2(dir.x,dir.z).angle()-PI/2

	#stop on slope
	velocity = move_and_slide(velocity,Vector3(0,1,0),true)
	#velocity = move_and_slide_with_snap(velocity,Vector3(0,-0.1,0),Vector3(0,1,0),true)

	#if Area overlaps_body something named grassplane, emit grass particles ?
	var youa = get_node("youarea")
	var youp = get_node("Sphere/youptc")
	var youc = get_node("Sphere")
	var grasson = false;
	#print(rad2deg(Vector2(dir.x,dir.z).angle()))
	if velocity.length_squared() > 0:
		#set rotation here pls
		if (dirnow != dirnew):
			dirold=dirnew
			dirnew=dirnow
			#if ...
			if (abs(dirnew - dirold) < 2):
				spintimer=spinstandard
		derp=dirnow
		if (spintimer>0):
			derp = lerp(dirold, dirnew, (spinstandard-spintimer)/(spinstandard+.05))
			spintimer -= delta*2
		#print(dirnow)
		youc.set_rotation(Vector3(0,derp,0))
		
		var poopees = youa.get_overlapping_bodies()
		for poopee in poopees:
		#print(poopee.name)
			if poopee.name == "grassp":
				print(poopee.name)
				grasson = true
	youp.set_emitting(grasson)

func is_you():
	pass;
	#a cheap trick
extends Node

var current_scene = null;
var hold_exit = "";
var exit_waiting = 0;
var cname = "";
var scname = ""
var mode = "you"
var busy = false
var printing = false

var tenmp = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)

func goto_scene(path, exit_path):#,name
	hold_exit=exit_path;#do not get node, can't get node until next scene loaded
	exit_waiting=1;
	call_deferred("_deferred_goto_scene", path)
	
func _deferred_goto_scene(path):
	# It is now safe to remove the current scene
	current_scene.free()
	# Load the new scene.
	var s = ResourceLoader.load(path)
	# Instance the new scene.
	current_scene = s.instance()
	# Add it to the active scene, as child of root.
	get_tree().get_root().add_child(current_scene)
	# Optionally, to make it compatible with the SceneTree.change_scene() API.
	get_tree().set_current_scene(current_scene)

func fload(path):
	var file = File.new()
	file.open(path, File.READ)
	cname = file.get_as_text()
	file.close()

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var slots = []#who's in battle- generally [0] is (you), [1] is the mon immediately opposite, add as needed
#battlescene will have position3ds to be filled with mons depending on the script
var party = []
var partytemp = []
#var party_in_battle=-1
var sbub = ["u","d","l","r"]

var brek = true
var mode = "input"#excecute turn, etc

class Monster:
	var name: String
	var species_id: int
	#unique stats- ala IVs
	var qhp: int
	var qattack: int
	var qspeed: int
	#gained stats ala EVs
	var ghp: int#etc
	#calculated stats and current health
	var hp: int
	var health: int
	var moveset = [0,0,0,0]
	
class iMonster: #in-battle monstar
	var name: String
	var species_id: int
	#calculated stats
	var hp: int
	var health: int
	var speed: int
	var attack: int
	#stat modifs from -7 to 7 or stg
	#calculated calculated stats
	var moveset = [0,0,0,0]
	var movenext = [-1,-1,-1]#moveslot, id of move used next turn, target
	var yours: bool#should be more in-depth but for now...
	var temp = -1#this will be used
	
	#func: sanity-check moveslist when moving from monster to imonster
	func movecheck():
		#for n in moveset:
		# if n > movestart and n < moveend:
		#	if !moveban.has(n):
		#		dewit. push to new moveset, inc pointie
		pass
	
class Species:
	var sname: String
	var type: int
	var battack: int
	var bhp: int
	var bspeed: int

onready var your
onready var opp
onready var your2
onready var your3

var moves = ["","Nut Shot","Claw","Sunny Beam","Hot Spit","NONE", "Electricate","Chompchomp","NONE2", "Cold One","Sprinkle Sprackle","end"]
	#5/8 represents an invalid value
var moveban = [5,8]
var movestart = 0
var moveend = 9

var state = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	instigate()
	turncall()
	#$hud/ninepatch.textplay("what do?")
	#turn()
	pass # Replace with function body.

#read prepared globl daytah and begin battle
#for example, that you've encountered a wild __, or that you're in an npc double battle with __ and __
func instigate():
	
	your = iMonster.new()
	your.name = "Magnut"
	$hud/Label.text = your.name
	your.attack = 5
	your.hp = 29
	your.health = your.hp
	your.speed = 1
	#invalid moves for debugging purposes
	your.moveset = [1,6,7,0]
	your.yours=true
	your.temp=0
	
	your2 = iMonster.new()
	your2.name = "Eggry"
	#$hud/Label.text = your.name
	your2.attack = 5
	your2.hp = 29
	your2.health = your2.hp
	your2.speed = 1
	#invalid moves for debugging purposes... or not
	your2.moveset = [2,4,0,0]
	your2.yours=true
	your2.temp=1
	
	your3 = iMonster.new()
	your3.name = "Slowcone"
	#$hud/Label.text = your.name
	your3.attack = 5
	your3.hp = 29
	your3.health = your.hp
	your3.speed = 1
	#invalid moves for debugging purposes
	your3.moveset = [9,10,0,0]
	your3.yours=true
	your3.temp=3
	
	
	opp = iMonster.new()
	opp.name = "Eggry"
	$hud/Label2.text = opp.name
	opp.attack = 10
	opp.hp = 30
	opp.health = opp. hp
	opp.speed = 3
	#ditto
	opp.moveset=[2,4,0,0]
	opp.yours = false
	
	party.append(your)
	party.append(your2)
	party.append(your3)
	
	slots.append(party[0])
	slots.append(opp)
	
	return
	
func turn():
	if(mode == "input"):#so much needs to be reworked lmao
		if Input.is_action_just_pressed("ui_up"):
			if slots[0].moveset[0] !=0:
				slots[0].movenext=[0,slots[0].moveset[0],1]
				mode="exec"
		if Input.is_action_just_pressed("ui_down"):
			if slots[0].moveset[1] !=0:
				slots[0].movenext=[1,slots[0].moveset[1],1]
				mode="exec"
		if Input.is_action_just_pressed("ui_left"):
			if slots[0].moveset[2] !=0:
				slots[0].movenext=[2,slots[0].moveset[2],1]
				mode="exec"
		if Input.is_action_just_pressed("ui_right"):
			if slots[0].moveset[3] !=0:
				slots[0].movenext=[3,slots[0].moveset[3],1]
				mode="exec"
		#if input something else: partycall()
		if Input.is_action_just_pressed("ui_cancel"):
			partycall()
	if mode == "party":#party!
		if Input.is_action_just_pressed("ui_up"):#there's at least one valid mon in the party to get this far so...
			reparty(0,partytemp[0])#or whichever slots slot is sent in
			#update label, model, etc
		if partytemp.size() >0:
			if Input.is_action_just_pressed("ui_down"):
				reparty(0,partytemp[1])
		if partytemp.size() >1:
			if Input.is_action_just_pressed("ui_left"):
				reparty(0,partytemp[2])
		if partytemp.size() >2:
				reparty(0,partytemp[3])
		if Input.is_action_just_released("ui_cancel"):#this needs to be something else
			#turncall()
			#mode = "input"
			pass
			#leave without doing anything; return to moves
	if mode == "exec":
		#determine ai move- temp hardcode
			opp.movenext=[1,4,0]
			#pass your and opp into execute turn function
			mode = exec_turn()
			#it will return win, loss, continue or whatever
	
func turncall():
		var strign = ""
		$hud/ninepatch.textplay("What do?")
		var id = 0
		
		for n in slots[0].moveset:
			if n != 0:
				#instantiate an opt in movenode i guess
				strign += "\n" + sbub[id] + ") " + moves[n]
				id += 1
		strign += "\nesc to party"
		$hud/debug.textplay(strign)
		mode = "input"#should change to "turn" and return it
	
func exec_turn():#test
	#add everybody to "speed queue", sort by speed; do something about ties
	var speedqueue = slots.duplicate(false)
	speedqueue.sort_custom(self, "speedTie")
	#you are now ready
	#speedqueue n takes aim at slots[n.movenext[2]]
	for n in speedqueue:
		if n.health > 0 and slots[n.movenext[2]].health > 0:
			print("Monstar ", n.name, " takes aim at ", slots[n.movenext[2]].name, "!")
			print(n.name, " used ", moves[n.movenext[1]], "!")
			#damage(aaaaa)
			if slots[n.movenext[2]].health <= n.attack:
				slots[n.movenext[2]].health = 0
				print(slots[n.movenext[2]].name, " daed")
				#if n is yours return win else return faint
			else:
				slots[n.movenext[2]].health -= n.attack
				print(slots[n.movenext[2]].name, " health taken to ", slots[n.movenext[2]].health, "!")
				
	for n in slots: 
		if n.health <= 0: 
			if n.yours: 
				partycall() #with some specific flag/text?
	return "input"
	
func partycall():
	mode = "party"
	var strign = ""
	var id = 0
	$hud/ninepatch.textplay("party")
	partytemp=[]
	for n in party:
		if n.temp != slots[0].temp and n.health >0:
			strign += "\n" + sbub[id] + ") " + n.name
			partytemp.append(n)
			id += 1
	$hud/debug.textplay(strign)
		#print sbub[id] and n.name id+=1
		#wait on input... in turn function
		#and an option to go back also ui_cancel/esc
		
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	turn()
	pass

func speedTie(mona, monb):
	if mona.speed != monb.speed:
		return mona.speed > monb.speed
	else: #speedtie
		return randi() < randi()#lmao

func reparty(slotn, montar):
	#swap monstar into slots[slotn]
	slots[slotn]=montar
	$hud/Label.text = slots[slotn].name
	#model later
	turncall()
	mode="input"
	pass

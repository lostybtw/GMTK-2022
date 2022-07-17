extends Node2D

var state1 = [1,0,0,0]
var state2 = [0,1,0,0]
var state3 = [0,0,1,0]
var state4 = [0,0,0,1]
var states = [state1,state2,state3,state4]
var state_names = [0,1,2,3]

signal state_is_0
signal state_is_1
signal state_is_2
signal state_is_3

var qbit = []
var stop_time = null
var spins = 2

func _on_Spin_Button_pressed():
	$AudioStreamPlayer.play(1.35)
	var random = RandomNumberGenerator.new()
	random.randomize()
	var stop_state = state_names[random.randi_range(0,3)]
	if stop_state == 3:
		$AnimationPlayer.play("roll_dice_3") 
	elif stop_state == 2:
		$AnimationPlayer.play("roll_dice_2")
	elif stop_state == 1:
		$AnimationPlayer.play("roll_dice_1")
	elif stop_state == 0:
		$AnimationPlayer.play("roll_dice_0")
	qbit = states[stop_state]
	print(qbit)
	print(stop_state)
	if stop_state == 0:
		emit_signal("state_is_0")
	elif stop_state == 1:
		emit_signal("state_is_1")
	elif stop_state == 2:
		emit_signal("state_is_2")
	elif stop_state == 3:
		emit_signal("state_is_3")
	spins -= 1

func _physics_process(_delta):
	if spins == 0:
		$Roll_Button.visible = false

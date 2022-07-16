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

func _on_Spin_Button_pressed():
	var random = RandomNumberGenerator.new()
	random.randomize()
	var stop_state = state_names[random.randi_range(0,3)]
	var stop_time = stop_state
	$AnimationPlayer.play("roll_dice")
	qbit = states[stop_state]
	print(qbit)
	print(stop_state)
	if $AnimationPlayer.is_playing() == false : $Sprite.frame = stop_state



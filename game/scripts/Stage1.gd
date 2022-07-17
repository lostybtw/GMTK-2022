extends Node2D

var outcomes = ["live","live,die","die,live","die"]
var outcome = ""

signal invoke_die
signal live
signal live_die
signal die_live

func _on_qbit_state_is_0():
	outcome = outcomes[0]
	print(outcome)
	emit_signal("live")

func _on_qbit_state_is_1():
	outcome = outcomes[1]
	print(outcome)
	emit_signal("live_die")


func _on_qbit_state_is_2():
	outcome = outcomes[2]
	print(outcome)
	emit_signal("die_live")


func _on_qbit_state_is_3():
	outcome = outcomes[3]
	print(outcome)
	emit_signal("invoke_die")

func _process(_delta):
	pass

func _on_death_Platform_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://scenes/died.tscn")


extends Node2D

var outcomes = ["die","live,die","die,live","die"]
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

func _ready():
	$cat.get_child(2).play("cat_idle")


func _on_lab_body_entered(body):
		print("body came")
		var scene = get_tree().get_current_scene().get_name()
		print(scene)
		if scene == "Stage1":
			scene = "Stage2"
		if scene == "Stage2":
			scene = "Stage3"
		elif scene == "Stage3":
			scene = "Win"
		scene = "res://scenes/" + scene + ".tscn"
		get_tree().change_scene(scene)

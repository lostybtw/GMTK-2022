extends StaticBody2D

func _on_Area2D2_body_entered(body):
	if body.name == "Player":
		$AnimationPlayer.play("flag_down")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "flag_down":
		var scene = get_tree().get_current_scene().get_name()
		if scene == "Stage1":
			scene = "Stage2"
		elif scene == "Stage2":
			scene = "Stage3"
		elif scene == "Stage3":
			scene = "Win"
			
		get_tree().change_scene("res://scenes/" + scene + ".tscn")

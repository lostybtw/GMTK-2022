extends StaticBody2D

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "jump":
		get_child(1).disabled = true
		visible = false

extends StaticBody2D

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "transform":
		get_tree().change_scene("res://scenes/died.tscn")

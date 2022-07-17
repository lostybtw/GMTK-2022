extends StaticBody2D

func _ready():
	$AnimationPlayer.play("cat_idle")

signal player_entered(name)

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "cat_die":
		visible = false
		$Area2D.monitoring = false
		$CollisionShape2D.disabled = true
		#$Area2D/CollisionShape2D.disabled = true
		get_tree().change_scene("res://scenes/died.tscn")


func _on_Area2D_body_entered(body):
	emit_signal("player_entered",body)

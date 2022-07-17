extends Control


func _on_Retry_pressed():
	var command = "res://scenes/" + Global.get_scene_died() + ".tscn"
	print(command)
	get_tree().change_scene(command)


func _on_Back_pressed():
	get_tree().change_scene("res://scenes/main_menu.tscn")

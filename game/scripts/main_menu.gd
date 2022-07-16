extends Control


func _on_Play_pressed():
	get_tree().change_scene("res://scenes/level selector.tscn")


func _on_About_pressed():
	pass # Replace with function body.


func _on_Quit_pressed():
	get_tree().quit()

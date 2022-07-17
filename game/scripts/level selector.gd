extends Control


func _on_Level1_pressed():
	get_tree().change_scene("res://scenes/Stage1.tscn")


func _on_Level2_pressed():
	get_tree().change_scene("res://scenes/Stage2.tscn")


func _on_Level3_pressed():
	get_tree().change_scene("res://scenes/Stage3.tscn")

func _on_Back_To_Menu_pressed():
	get_tree().change_scene("res://scenes/main_menu.tscn")

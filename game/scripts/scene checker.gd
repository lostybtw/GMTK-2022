extends Node2D

onready var current_scene = get_tree().get_current_scene().get_name()

func _ready():
	Global.set_scene_died(current_scene)

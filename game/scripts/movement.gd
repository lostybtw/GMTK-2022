extends KinematicBody2D

const speed = 400
const jump = -600
const gravity = 20
const up = Vector2(0,-1)

var motion = Vector2()

func _physics_process(delta):
	motion.y += gravity
	
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
	else: motion.x = 0
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = jump

	motion = move_and_slide(motion, up)
	


func _on_Area2D_body_entered(body):
	print_debug(body.name)
	if body.name == "Player":
		var node = get_parent()
		var anim = node.get_child(4)
		anim = anim.get_child(0)
		anim = anim.get_child(0)
		print(anim)
		anim.play("kill")
		var death_particles = node.get_child(6)
		print(death_particles)
		$AnimationPlayer.play("Death")
		death_particles.emitting = true


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Death":
		get_tree().change_scene("res://scenes/main_menu.tscn")

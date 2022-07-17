extends KinematicBody2D

const speed = 400
const jump = -800
const gravity = 20
const up = Vector2(0,-1)

var motion = Vector2()

var die = false
var live = true
var superposition_set = null


func _physics_process(_delta):
	motion.y += gravity
	
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		$walk.play()
		#get_parent().get_child(0).position -= Vector2(10,0)
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
		$walk.play()
		#get_parent().get_child(0).position += Vector2(10,0)
	else: 
		motion.x = 0
		$walk.stop()
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = jump
			$hop.play()

	motion = move_and_slide(motion, up)
	
func _on_Stage1_die_live():
	die = true
	live = true
	superposition_set = "die_live"
func _on_Stage1_invoke_die():
	die = true
	live = false
func _on_Stage1_live():
	live = true
	die = false
func _on_Stage1_live_die():
	live = true
	die = true
	superposition_set = "live_die"
	print(superposition_set)
func _on_Stage_2_die_live():
	die = true
	live = true
	superposition_set = "die_live"
func _on_Stage_2_invoke_die():
	die = true
	live = false 
func _on_Stage_2_live():
	live = true
	die = false
func _on_Stage_2_live_die():
	die = true
	live = true
	superposition_set = "live_die"
func _on_Stage3_die_live():
	die = true
	live = true
	superposition_set = "die_live"
func _on_Stage3_invoke_die():
	die = true
	live = false
func _on_Stage3_live():
	live = true
	die = false
func _on_Stage3_live_die():
	live = true
	die = true
	superposition_set = "live_die"

func superposition(player):
		print(superposition_set)
		if player.name == "Player":
			if superposition_set == "die_live":
				var probabilty_death = 0.7
				var probability_life = 0.85
				var randomfloat = randf()
				print(randomfloat)
				
				if randomfloat < probabilty_death:
					live = false
				elif randomfloat < probability_life:
					die = false
				#live_or_die(body)
			elif superposition_set == "live_die":
				var probabilty_death = 0.95
				var probability_life = 0.8
				var randomfloat = randf()
				print(randomfloat)
				if randomfloat < probabilty_death:
					live = false
				elif randomfloat < probability_life:
					die = false
				#live_or_die(body)
			elif superposition_set == null:
				pass


func live_or_die(body_entered):
	var current_scene = get_tree().get_current_scene().get_name()
	print(current_scene)
	if current_scene == "Stage1":
		if body_entered.name == "Player":
			if live == false and die == true:
				var node = get_parent()
				var anim = node.get_child(3)
				anim = anim.get_child(0)
				anim = anim.get_child(0)
				#get_tree().change_scene("res://scenes/Stage2.tscn")
				anim.play("jump")
			elif die == false and live == true:
				var node = get_parent()
				var anim = node.get_child(3)
				anim = anim.get_child(0)
				anim = anim.get_child(0)
				print(anim)
				anim.play("kill")
				var death_particles = node.get_child(5)
				print(death_particles)
				$AnimationPlayer.play("Death")
				$die.play()
				death_particles.emitting = true
	elif current_scene == "Stage2":
		print(body_entered.name)
		if body_entered.name == "Player":
			print("Stage2")
			if live == false and die == true:
				print("1 works")
				var node = get_parent()
				var anim = node.get_child(2)
				anim = anim.get_child(0)
				print(anim)
				anim.position = Vector2(0,0)
			elif die == false and live == true:
				print("2 works")
				var node = get_parent()
				var anim = node.get_child(2)
				anim = anim.get_child(2)
				print(anim)
				anim.play("cat_die")
				$die.play()
				var death_particles = node.get_child(5)
				print(death_particles)
				death_particles.emitting = true
	elif current_scene == "Stage3":
		print(body_entered.name)
		if body_entered.name == "Player":
			print("Stage3")
			if live == false and die == true:
				var node = get_parent()
				var anim = node.get_child(2)
				anim.position = Vector2(0,0)
			elif die == false and live == true:
				var node = get_parent()
				var anim = node.get_child(2)
				anim = anim.get_child(3)
				print(anim)
				anim.play("transform")
				$die.play()
				
func _on_Area2D_body_entered(body): 
	print_debug(body.name)
	if live == true and die == true:
		superposition(body)
	live_or_die(body)


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Death":
		get_tree().change_scene("res://scenes/died.tscn")


func _on_cat_player_entered(name):
	print_debug(name.name)
	if live == true and die == true:
		superposition(name)
	live_or_die(name)

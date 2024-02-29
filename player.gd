extends RigidBody2D


var up : bool = false
var down : bool = false
var left : bool = false
var right : bool = false
var z : bool = false
var x : bool = false
var c : bool = false

var alt_layout : bool = true

var w : bool = false
var a : bool = false
var s : bool = false
var d : bool = false

var left_mouse : bool = false
var right_mouse : bool = false

func _unhandled_input(event):
	
	if event is InputEventMouseButton:
		if event.is_action_pressed("left_mouse"):
			left_mouse = true
		if event.is_action_released("left_mouse"):
			left_mouse = false
		
		if event.is_action_pressed("right_mouse"):
			right_mouse = true
		if event.is_action_released("right_mouse"):
			right_mouse = false
	
	if event is InputEventKey:
		if event.is_action_pressed("up"):
			up = true
		if event.is_action_released("up"):
			up = false
		
		if event.is_action_pressed("down"):
			down = true
		if event.is_action_released("down"):
			down = false
		
		if event.is_action_pressed("left"):
			left = true
		if event.is_action_released("left"):
			left = false
		
		if event.is_action_pressed("right"):
			right = true
		if event.is_action_released("right"):
			right = false
		
		if event.is_action_pressed("w"):
			w = true
		if event.is_action_released("w"):
			w = false
		
		if event.is_action_pressed("a"):
			a = true
		if event.is_action_released("a"):
			a = false
		
		if event.is_action_pressed("s"):
			s = true
		if event.is_action_released("s"):
			s = false
		
		if event.is_action_pressed("d"):
			d = true
		if event.is_action_released("d"):
			d = false
		
		if event.is_action_pressed("z"):
			z = true
		if event.is_action_released("z"):
			z = false
		
		if event.is_action_pressed("x"):
			x = true
		if event.is_action_released("x"):
			x = false
		
		if event.is_action_pressed("c"):
			z = true
		if event.is_action_released("c"):
			z = false

func _process(delta):
	var speed : float = 500
	#if alt_layout and w:
	#	position.y -= 1 * speed * delta
	#if alt_layout and a:
	#	position.x -= 1 * speed * delta
	#if alt_layout and s:
	#	position.y += 1 * speed * delta
	#if alt_layout and d:
	#	position.x += 1 * speed * delta
	#
	#if !alt_layout and up:
	#	position.y -= 1 * speed * delta
	#if !alt_layout and left:
	#	position.x -= 1 * speed * delta
	#if !alt_layout and down:
	#	position.y += 1 * speed * delta
	#if !alt_layout and right:
	#	position.x += 1 * speed * delta
	
	
	position.x = clamp(position.x, -540+16, 540-16)
	
	# set rotation of sprite
	rotation = (get_global_mouse_position() - position).angle()


var bullet_tick = 0
func _physics_process(delta):
	if w:
		apply_central_impulse(Vector2(1,10) * delta)
	
	if left_mouse:
		if bullet_tick == 0:
			var bullet_instance = preload("res://bullets/player_bullet.tscn").instantiate()
			var direction : Vector2 = -(position - get_global_mouse_position()).normalized()
			bullet_instance.init(1000, direction)
			bullet_instance.position = position
			get_parent().add_child(bullet_instance)
		
		bullet_tick += 1
		
		# 1/30th of a second fire rate
		if bullet_tick == 2:
			bullet_tick = 0

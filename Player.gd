extends Area2D

export var SPEED : int = 400

var velocity: Vector2
var screen_size: Vector2
var is_stop: bool

func _ready():
	screen_size = get_viewport().size

# Hoo.., ok, jadi nilai dari delta ini lebih kecil 
# daripada 1 ya? Makanya dikalikan delta untuk speednya
func _process(delta):
	# restart velocity at every process
	velocity = Vector2()
	
	if not is_stop:
		# determine the velocity change based on user input
		if Input.is_action_pressed("ui_left"):
			velocity.x -= 1
		if Input.is_action_pressed("ui_right"):
			velocity.x += 1
		if Input.is_action_pressed("ui_down"):
			velocity.y += 1
		if Input.is_action_pressed("ui_up"):
			velocity.y -= 1
		
	if velocity.length() > 0:
		$AnimatedSprite.play()
		$AnimatedSprite.flip_h = (velocity.x < 0)
		velocity = velocity.normalized() * SPEED
	else:
		$AnimatedSprite.stop()
		$AnimatedSprite.frame = 0
	
	# move player position
	position += velocity * delta
	# clamp player position so it could not go outside screen
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func start_player():
	is_stop = false
	
func stop_player():
	is_stop = true

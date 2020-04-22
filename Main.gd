extends Node2D

export var collectible : PackedScene
export var num_collectibles : int = 10

var current_num_collectibles : int
var screen_size: Vector2

func _ready():
	_on_HUD_replay()
	
func _on_HUD_replay():
	$Player.scale = Vector2(1.3, 1.3)
	$Player.start_player()
	current_num_collectibles = num_collectibles
	screen_size = get_viewport_rect().size
	spawn_collectibles(current_num_collectibles)

func spawn_collectibles(n: int):
	for i in range(0, n):
		randomize()
		var c = collectible.instance()
		add_child(c)
		c.position = Vector2(randf() * screen_size.x, randf() * screen_size.y)
		c.connect("collected", self, "_on_Collectible_collected")

func _on_Collectible_collected():
	$CoinSound.play()
	$Player.scale += Vector2(0.1, 0.1)
	current_num_collectibles -= 1
	if current_num_collectibles == 0:
		$Player.stop_player()
		$HUD.show_replay()
		



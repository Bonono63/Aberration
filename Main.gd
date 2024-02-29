extends Node

enum enemy_types
{
	template
	
}

var queue : Dictionary = {
	"200" = [Entry.new(0, Vector2(100,100))],
}

class Entry:
	var type : int
	var pos : Vector2
	func _init( _type : int, _pos : Vector2):
		type = _type
		pos = _pos


var tick : int = 0
func _physics_process(delta):
	tick += 1
	
	#spawn enemies
	if queue.has(str(tick)):
		for entry in queue[str(tick)]:
			var instance
			match(entry.type):
				enemy_types.template:
					instance = preload("res://type/enemy_template.tscn").instantiate()
					instance.position = entry.pos
					add_child(instance)
	
	var player_position = $SubViewportContainer/SubViewport/player.position
	player_position *= 0.0125
	$SubViewportContainer/SubViewport/Camera3D.position.x = player_position.x * delta
	$SubViewportContainer/SubViewport/Camera3D.position.z = player_position.y * delta


func _process(delta):
	$CanvasLayer/Debug.text = str("FPS: ", Engine.get_frames_per_second(), "\ntick: ", tick)


func _ready():
	Engine.max_fps = 165
	pass

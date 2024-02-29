extends Node

enum enemy_types
{
	template
}

var queue : Dictionary = {
	"200" = Entry.new(0, Vector2(100,-10))
}

class Entry:
	var type : int
	var pos : Vector2
	func _init( _type : int, _pos : Vector2):
		type = _type
		pos = _pos

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var tick : int = 0
func _physics_process(_delta):
	tick += 1
	
	if queue.has(str(tick)):
		for entry in queue[str(tick)]:
			var instance
			match(entry.type):
				enemy_types.template:
					instance = preload("res://type/enemy_template.tscn").instantiate()
					instance.position = entry.pos
					add_child(instance)

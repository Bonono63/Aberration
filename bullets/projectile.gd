extends Sprite2D

var speed : float
var velocity : Vector2

func init(_speed : float = 1000, _velocity : Vector2 = Vector2(0, -1)):
	speed = _speed
	velocity = _velocity

func _process(delta):
	position += velocity * speed * delta

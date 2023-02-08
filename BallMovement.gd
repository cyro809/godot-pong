extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var direction = Vector2(-1.0, 0.0)
var speed = 80
var velocity = Vector2()
var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.ball_node = self
	velocity = Vector2(speed, 0)
	pass # Replace with function body.


func _physics_process(delta):
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.name == "Player1Goal" or collision.collider.name == "Player2Goal":
			 _reset_ball()
		else:
			_handle_direction(collision)
		

func _handle_direction(collision: KinematicCollision2D):
	if collision.collider.name == "Roof" or collision.collider.name == "Ceilling":
		velocity.y = -velocity.y
	else:
		velocity = velocity.bounce(collision.normal)
		velocity.x = velocity.x - 100 if velocity.x < 0 else velocity.x + 100
		velocity.y = rng.randi_range(-250, 250)
	
func _reset_ball():
	print(get_viewport_rect().size)
	self.position.x = get_viewport_rect().size.x/2
	self.position.y = get_viewport_rect().size.y/2

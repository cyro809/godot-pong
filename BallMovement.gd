extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var direction = Vector2(-1.0, 0.0)
var INITIAL_SPEED = 200
var speed = INITIAL_SPEED
var velocity = Vector2()
var rng = RandomNumberGenerator.new()
signal score_signal(goal_name)
var ANGLE_OFFSET = 8
var X_SPEED_OFFSET = 100
var INITIAL_POSITION = position


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.ball_node = self
	velocity = Vector2(speed, 0)
	pass # Replace with function body.


func _physics_process(delta):
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		if is_goal(collision):
			add_score(collision.collider.name)
			_reset_ball()
		else:
			_handle_direction(collision)
		

func _handle_direction(collision: KinematicCollision2D):
	if collision.collider.name == "Roof" or collision.collider.name == "Ceilling":
		velocity.y = -velocity.y
	else:
		var paddle_position = collision.collider.global_position
		var collision_position = collision.position
		var paddle_height = collision.collider.get_node("AnimatedSprite").frames.get_frame("default", 0).get_height()
		velocity = velocity.bounce(collision.normal)
		velocity.x = velocity.x - X_SPEED_OFFSET if velocity.x < 0 else velocity.x + X_SPEED_OFFSET
		velocity.y = ((collision_position.y - paddle_position.y) * ANGLE_OFFSET)

func is_goal(collision: KinematicCollision2D):
	return collision.collider.name == "Player1Goal" or collision.collider.name == "Player2Goal"

func add_score(goal_name: String):
	emit_signal("score_signal", goal_name)
	

func _reset_ball():
	self.position = INITIAL_POSITION
	velocity.x = INITIAL_SPEED
	velocity.y = 0
	
func _handle_ball_angle(collision_position):
	pass

extends CharacterBody2D

@export var walk_speed: int = 50
@export var run_speed: int = 75
@export var animator: AnimationPlayer
@export var sprite: Sprite2D

func _physics_process(delta: float):
	var speed: int = run_speed if Input.is_action_pressed("run") else walk_speed
	var vel: Vector2 = Vector2.ZERO
	if not(Input.is_action_pressed("down") and Input.is_action_pressed("up")):
		if Input.is_action_pressed("down"):
			vel.y = 1
		if Input.is_action_pressed("up"):
			vel.y = -1
	if not(Input.is_action_pressed("left") and Input.is_action_pressed("right")):
		if Input.is_action_pressed("left"):
			vel.x = -1
		if Input.is_action_pressed("right"):
			vel.x = 1
	if vel != Vector2.ZERO:
		animator.play("Walk")
		if vel.x != 0:
			sprite.flip_h = vel.x < 0
	else:
		animator.stop()
		sprite.frame = 1
	velocity = vel.normalized() * speed
	move_and_slide()

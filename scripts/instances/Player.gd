extends "res://engine/entity.gd"

signal health_changed
signal died

const TYPE = "PLAYER"
const SPEED = 200

var state = "default"

func _physics_process(delta):
	match state:
		"default":
			state_default()
		"swing":
			state_swing()


func state_default():
	controls_loop()
	movement_loop()
	spritedir_loop()
	damage_loop() 
	#movedir = dir.center
	
	if movedir != Vector2(0,0):
		anim_switch("walk")
	else:
		anim_switch("idle")
		
	if Input.is_action_just_pressed("a"):
		use_item(preload("res://Items/sword.tscn"))

func state_swing():
	anim_switch("idle")
	damage_loop()

func controls_loop():
	var LEFT 	= Input.is_action_pressed("ui_left")
	var RIGHT 	= Input.is_action_pressed("ui_right")
	var UP	 	= Input.is_action_pressed("ui_up")
	var DOWN 	= Input.is_action_pressed("ui_down")
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) +int(DOWN)
	
func newUbication(vector):
	set_global_position(vector)

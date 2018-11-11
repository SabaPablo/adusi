extends "res://engine/entity.gd"


const SPEED = 40
const DAMAGE = 10

var movetimer_length = 30
var movetimer = 0

func _ready():
	$Anim.play("idledown")
	movedir = dir.rand()
	
func _physics_process(delta):
	movement_loop()
	damage_loop()
	if movetimer >0:
		movetimer -= 1
	if movetimer == 0 || is_on_wall():
		movedir = dir.rand()
		movetimer = movetimer_length
	if movedir != Vector2(0,0):
		anim_switch("walk")
	else:
		anim_switch("idle")
	
	spritedir_loop()
	
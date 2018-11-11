extends CanvasLayer

var x
var real_head

func _ready():
	x = 0
	real_head = 100
	

func _process(delta):
	$hp.set_region_rect(Rect2(0,0,x,12))
	if(x<real_head):
		x=x+1
	elif(x==real_head):
		pass
	else:
		x= x -1


func _on_player_health_changed(heald):
	real_head = heald

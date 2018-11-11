extends Sprite

var x

func _ready():
	set_region_rect(Rect2(0,0,0,12))
	x=0
	


func _process(delta):
	set_region_rect(Rect2(0,0,x,12))
	if(x<100):
		x=x+1


extends ParallaxBackground

var parallax_offset = Vector2()

onready var chao = $ParallaxLayer/Chao
onready var main = get_parent()

var para = false

func _ready():
	chao.set_position(Vector2(160,164))
	
func _process(delta):
	if para:
		return
	
	parallax_offset -= main.velocidade * -delta
	set_scroll_offset(parallax_offset)

func parar():
	para = true

func continuar():
	para = false

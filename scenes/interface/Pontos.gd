extends MarginContainer

onready var pontos = $HBoxContainer/Pontos
onready var icone = $HBoxContainer/TextureRect

func _ready():
	pass

func show():
	$AnimationPlayer.play("Show")

func get_cor_pontos():
	return Color(1, 1, 1, 1)
	
func get_cor_virus():
	return Color(0, 0.7, 0, 1)

func set_cor(cor):
	pontos.add_color_override("font_color", cor)

func set_pontos(tipo, valor):
	if tipo == "virus":
		icone.show()
		set_cor(get_cor_virus())
		pontos.text = str(valor)
	else:
		icone.hide()
		set_cor(get_cor_pontos())
		pontos.text = str(valor) + " Pts"

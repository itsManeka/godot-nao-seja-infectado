extends Area2D

onready var main = get_parent()
onready var jogador = main.get_node("Jogador")

export var pontos = 10
export var tempo_invencivel = 2
export var cura = 10
export var y_modifier = 0.0
export var nome = ""

var inicial = Vector2(340, 100)

func _ready():
	randomize()
	
	inicial.y = rand_range(50, 125)
	
	set_position(inicial)
	
func _physics_process(delta):
	if not main.iniciado:
		return
		
	set_position(position + (main.velocidade * 1.5) * delta)
	position.y = inicial.y + y_modifier
	
	if get_position().x < -10:
		queue_free()

func deve_limpar():
	return true

func set_atingiu():
	main.add_pontos(pontos)
	
	if cura > 0:
		jogador.cura(cura)
	
	if tempo_invencivel > 0:
		jogador.set_invencivel(tempo_invencivel)
	
	if nome == "cloroquina":
		PGS.increment_achievement(PGS.CONQUISTA_CLOROQUINA, 1)
	elif nome == "mascara":
		PGS.increment_achievement(PGS.CONQUISTA_MASCARA, 1)
	elif nome == "alcool":
		PGS.increment_achievement(PGS.CONQUISTA_ALCOOL, 1)
	
	queue_free()

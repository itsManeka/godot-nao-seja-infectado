extends Area2D

onready var main = get_parent()
onready var jogador = main.get_node("Jogador")
onready var sprite = $Medidor

export var multiplicador = 10

var inicial = Vector2(360, 140)

func _ready():
	var s = randi()%4
	sprite.play("med" + str(s))
	
	set_position(inicial)

func _physics_process(delta):
	if not main.iniciado:
		return
	
	set_position(position + main.velocidade * delta)
	
	if get_position().x < -25:
		queue_free()
	
func set_atingiu():
	var pontos = 0
	var infeccao = jogador.get_infeccao()
	var max_infeccao = jogador.get_max_infeccao()
	
	PGS.increment_achievement(PGS.CONQUISTA_SUS, 1)
	
	if infeccao <= 50:
		pontos = (max_infeccao - infeccao) * multiplicador
		if jogador.is_invencivel():
			pontos = pontos * 1.5
			PGS.unlock_achievement(PGS.CONQUISTA_SENSATEZ)
	
	if infeccao <= 0:
		PGS.unlock_achievement(PGS.CONQUISTA_AQUI_NAO)
	
	main.add_pontos(pontos)

func deve_limpar():
	return true

func pausar_elemento():
	sprite.stop()
	
func continuar_elemento():
	sprite.play()

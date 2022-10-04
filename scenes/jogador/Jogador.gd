extends Area2D

signal jogador_infectou

onready var main = get_parent()
onready var animacao = $Animacao
onready var sprite = $Sprite
onready var mascara = $Mascara

var inicial = Vector2(75, 140)
var velocidade = Vector2()
var gravidade = 1500
var velocidade_pulo = -460
var modificador_gravidade = 1.7

var infeccao = 0
var max_infeccao = 100

var tempo_invencivel = 0
var invencivel = false

var chao = true

var touching = false

func _ready():
	var s = randi()%4
	sprite.play("jogador" + str(s))
	
	set_posicao_inicial()

func _unhandled_input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			touching = true
		else:
			touching = false

func _process(delta):
	if not main.iniciado and not main.pausado:
		if Input.is_action_just_pressed("pular") or touching:
			main.iniciar()
		return
	
	if Input.is_action_just_pressed("pular") or touching:
		if chao:
			chao = false
			PGS.increment_achievement(PGS.CONQUISTA_PULO_100, 1)
			PGS.increment_achievement(PGS.CONQUISTA_PULO_200, 1)
			$Pulo.play()
		
	if invencivel:
		tempo_invencivel -= delta
		if tempo_invencivel < 0:
			invencivel = false
			animacao.play("regular")
			mascara.hide()

func _physics_process(delta):
	if not main.iniciado:
		return
	
	if Input.is_action_pressed("pular") or touching:
		velocidade.y += gravidade * delta
	else:
		velocidade.y += gravidade * delta *  modificador_gravidade
	
	if (Input.is_action_just_pressed("pular") or touching) and position == inicial:
		velocidade.y = velocidade_pulo
	
	position += velocidade * delta
	
	if get_position().y > inicial.y :
		set_posicao_inicial()
		velocidade = Vector2()
		chao = true
		touching = false

func jogador_infectou(valor):
	if invencivel: return
	
	$Urr.play()
	
	animacao.play("infectado")
	
	infeccao += valor
	infeccao = clamp(infeccao, 0, max_infeccao)
	
	main.mostra_pontuacao(valor, "virus")
	
	emit_signal("jogador_infectou", infeccao)
	
	if infeccao == max_infeccao:
		main.finalizar()

func cura(valor):
	infeccao -= valor
	infeccao = clamp(infeccao, 0, max_infeccao)
	
	emit_signal("jogador_infectou", infeccao)

func parar():
	sprite.stop()
	sprite.frame = 1
	
func continuar():
	sprite.play()

func set_invencivel(tempo):
	mascara.show()
	animacao.play("invensivel")
	tempo_invencivel = tempo
	invencivel = true

func is_invencivel():
	return invencivel

func get_infeccao():
	return infeccao
	
func get_max_infeccao():
	return max_infeccao

func _on_colidiu(area):
	if area.has_method("get_infeccao"):
		jogador_infectou(area.get_infeccao())
		
	if area.has_method("set_atingiu"):
		area.set_atingiu()

func set_posicao_inicial():
	set_position(inicial)

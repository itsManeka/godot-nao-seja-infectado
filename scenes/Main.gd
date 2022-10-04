extends Node2D

onready var label_pontos = $Pontos
onready var jogador = $Jogador
onready var inicia = $Iniciar
onready var bg = $ParallaxBackground
onready var animador = $Animacao

export var cor_bg: Color
export var velocidade = Vector2(-150, 0)
export var velocidade_max = -220
export var max_tempo_dificuldade = 2
export var dificuldade = 0
var tempo_dificuldade = max_tempo_dificuldade

var inimigos_gerados = 0
var gerou_inimigo_grande = false
export var intervalo_inimigos_gerar_postinho = 10
var inimigos = [preload("res://scenes/inimigos/Tossidor.tscn"),
				preload("res://scenes/inimigos/Espirro.tscn")]

var postinho = preload("res://scenes/postinho/Postinho.tscn")

var itens = [preload("res://scenes/itens/Mascara.tscn"),
			 preload("res://scenes/itens/Cloroquina.tscn"),
			 preload("res://scenes/itens/Alcool.tscn")]

var efeito_pontos = preload("res://scenes/interface/Pontos.tscn")

export var intervalo_inicial_inimigo = 1.0
var tempo_inimigo = 0.0
var intervalo_inimigo = intervalo_inicial_inimigo
export var intervalo_inimigo_min = 1.0
export var intervalo_inimigo_max = 3.0
export var intervalo_min_limite = 0.5
export var intervalo_max_limite = 0.54

export var intervalo_inicial_item = 6.0
var tempo_item = 0.0
var intervalo_item = intervalo_inicial_item
export var intervalo_item_min = 3.0
export var intervalo_item_max = 11.0

var dia = true

var iniciado = false
var acabou = false
var pausado = false

var incluiu_aglomero = false

func _ready():
	randomize()
	$Corona.hide()
	$PauseMenu.hide()
	VisualServer.set_default_clear_color(cor_bg)

func _process(delta):
	if not iniciado:
		return
		
	VisualServer.set_default_clear_color(cor_bg)
	
	tempo_dificuldade -= delta
	if tempo_dificuldade <= 0:
		dificuldade += 1
		print("dificuldade: " + str(dificuldade))
		if velocidade.x > velocidade_max:
			velocidade.x += -0.9
			print("velocidade: " + str(velocidade.x))
		
		if intervalo_inimigo_min > intervalo_min_limite:
			intervalo_inimigo_min -= (intervalo_inimigo_min * 0.01)
			print(intervalo_inimigo_min)
			
		if intervalo_inimigo_max > intervalo_max_limite:
			intervalo_inimigo_max -= (intervalo_inimigo_max * 0.02)
			print(intervalo_inimigo_max)
			
		tempo_dificuldade = max_tempo_dificuldade
		
		if dificuldade > 20 and not incluiu_aglomero:
			incluiu_aglomero = true
			inimigos.append(preload("res://scenes/inimigos/Aglomero.tscn"))
		
		if dificuldade % 15 == 0:
			intervalo_inimigos_gerar_postinho += 1
		
		if dificuldade % 50 == 0:
			if dia:
				dia = false
				animador.play("Anoitecer")
			else:
				PGS.unlock_achievement(PGS.CONQUISTA_CORUJAO)
				dia = true
				animador.play("Amanhecer")
				
	var pontuacao = "0000000000" + str(Global.get_pontos())
	label_pontos.text = "Pontos: " + pontuacao.right(pontuacao.length() - 10)

func _physics_process(delta):
	if not iniciado:
		return
	
	velocidade.x -= delta / 5
	
	gera_inimigo(delta)
	gera_item(delta)

func iniciar():
	if not acabou:
		inicia.hide()
		iniciado = true

func finalizar():
	acabou = true
	iniciado = false
	
	jogador.parar()
	bg.parar()
	
	for i in range(get_child_count()):
		if get_child(i).has_method("deve_limpar"):
			get_child(i).queue_free()
	
	animador.play("Finalizar")

func game_over():
	get_tree().change_scene("res://scenes/GameOver.tscn")

func gera_item(delta):
	tempo_item += delta
	
	if tempo_item >= intervalo_item:
		tempo_item = 0
		
		var i = rand_range(0, itens.size())
		var item = itens[i].instance()
		item.z_index = -1
		add_child(item)
		
		intervalo_item = rand_range(intervalo_item_min, intervalo_item_max)
	
func gera_inimigo(delta):
	var inimigo
	
	tempo_inimigo += delta
	
	if tempo_inimigo >= intervalo_inimigo:
		inimigos_gerados += 1
		tempo_inimigo = 0
		
		if inimigos_gerados > intervalo_inimigos_gerar_postinho:
			inimigos_gerados = 0
			inimigo = postinho.instance()
		else:
			var i = 0
			if !gerou_inimigo_grande or !incluiu_aglomero:
				i = rand_range(0, inimigos.size())
			else:
				i = rand_range(0, inimigos.size() - 1)
			
			inimigo = inimigos[i].instance()
			gerou_inimigo_grande = inimigo.is_obstaculo_grande()
			
		inimigo.z_index = -1
		add_child(inimigo)
		
		intervalo_inimigo = rand_range(intervalo_inimigo_min, intervalo_inimigo_max)

func mostra_pontuacao(valor, tipo):
	var p = efeito_pontos.instance()
	jogador.get_node("Pontuacao").add_child(p)
	
	p.set_pontos(tipo, valor)
	p.show()

func add_pontos(valor):
	var pontos
	pontos = Global.get_pontos()
	
	mostra_pontuacao(valor, "pontos")
	
	pontos += valor
	if (pontos < 0): pontos = 0
	
	Global.set_pontos(pontos)

func _on_GUI_pausar():
	if iniciado and not pausado:
		pausado = true
		iniciado = false
		bg.parar()
		jogador.set_posicao_inicial()
		jogador.parar()
		$PauseMenu.show()
		
		for i in range(get_child_count()):
			if get_child(i).has_method("pausar_elemento"):
				get_child(i).pausar_elemento()

func _on_PauseMenu_continuar():
	$PauseMenu.hide()
	bg.continuar()
	jogador.continuar()
	
	for i in range(get_child_count()):
		if get_child(i).has_method("continuar_elemento"):
			get_child(i).continuar_elemento()
	
	pausado = false
	iniciado = true

func _on_PauseMenu_menu():
	get_tree().change_scene("res://scenes/MainMenu.tscn")

extends MarginContainer

signal pausar

onready var barra = $Barra/VBoxContainer/Infeccao/TextureProgress
onready var tween = $Tween
onready var main = get_parent()
onready var jogador = main.get_node("Jogador")

var animacao_infeccao = 0

func _ready():
	var maximo = jogador.max_infeccao
	barra.max_value = maximo
	atualiza_infeccao(0)
	
func _on_jogador_infectou(infeccao):
	atualiza_infeccao(infeccao)

func atualiza_infeccao(valor):
	tween.interpolate_property(self, "animacao_infeccao", animacao_infeccao, valor, 0.6, Tween.TRANS_LINEAR, Tween.EASE_IN)
	if not tween.is_active():
		tween.start()

func _process(delta):
	var valor_redondo = round(animacao_infeccao)
	barra.value = valor_redondo
	
func _on_Pause_pressed():
	emit_signal("pausar")

extends MarginContainer

onready var logs = $ColorRect/Log
onready var btn_pontuacao = $ColorRect/VBoxContainer/VBoxContainer2/Pontuacao
onready var btn_conquistas = $ColorRect/VBoxContainer/VBoxContainer2/Conquistas

func _ready():
	if Global.is_android():
		if !Global.is_ja_logou_ggp():
			PGS.connect("sign_in_failed", self, "_sign_in_failed")
			PGS.connect("sign_in_success", self, "_sign_in_sucess")
			
			logs.text = "Conectando ao Google Play Games..."
			
			PGS.sign_in()
		else:
			habilita_botoes()
	else:
		btn_pontuacao.hide()
		btn_conquistas.hide()

func _on_Jogar_button_down():
	if !Global.get_ja_jogou_uma() or !Global.is_android():
		Global.set_ja_jogou_uma()
		get_tree().change_scene("res://scenes/Dicas.tscn")
	else:
		get_tree().change_scene("res://scenes/ADS.tscn")

func _on_Creditos_button_down():
	get_tree().change_scene("res://scenes/Creditos.tscn")

func _on_Como_jogar_button_down():
	get_tree().change_scene("res://scenes/como_jogar/ComoJogar1.tscn")

func _on_Pontuacao_button_down():
	PGS.show_leaderboard(PGS.PLACAR_PONTUACAO)

func _sign_in_failed(error_code):
	logs.text = "Não foi possível conectar ao Google Play (Código " + str(error_code) + ")"

func habilita_botoes():
	btn_pontuacao.disabled = false
	btn_conquistas.disabled = false

func _sign_in_sucess(id):
	Global.set_ja_logou_ggp()
	logs.text = "Conectado com sucesso!"
	habilita_botoes()

func _on_Conquistas_button_down():
	PGS.show_achievements()

extends MarginContainer

onready var pontos = $ColorRect/VBoxContainer/Pontos
onready var logs = $ColorRect/Log

onready var btn_jogar = $ColorRect/VBoxContainer/Jogar
onready var btn_tuitar = $ColorRect/VBoxContainer/Tuitar 
onready var btn_menu = $ColorRect/VBoxContainer/Menu
onready var btn_placar = $ColorRect/VBoxContainer/Placar

func _ready():
	if Global.is_android():
		PGS.connect("leaderboard_score_submitting_failed", self, "_falhou_submeter_pontuacao")
		PGS.connect("leaderboard_score_submitted", self, "_pontuacao_submetida_sucesso")
		PGS.connect("achievement_incrementing_failed", self, "_erro_incremetar_conquista")
	else:
		habilita_botoes()
		btn_placar.hide()
	
	pontos.text = str(Global.get_pontos()) + " pontos!"
	
	if Global.is_android():
		PGS.increment_achievement(PGS.CONQUISTA_ENTUSIASTA, 1)
		PGS.increment_achievement(PGS.CONQUISTA_PROFISSA, 1)
		PGS.increment_achievement(PGS.CONQUISTA_NEGOCIOS, 1)
		
		logs.text = "Submetendo pontuação..."
		PGS.submit_leaderboard_score(PGS.PLACAR_PONTUACAO, Global.get_pontos())
	
	if (Global.get_pontos() > 13200):
		PGS.unlock_achievement(PGS.CONQUISTA_PONTUACAO)

func _on_Jogar_button_down():
	if OS.get_name() != "Android":
		get_tree().change_scene("res://scenes/Dicas.tscn")
	else:
		get_tree().change_scene("res://scenes/ADS.tscn")
	pass 

func _on_Menu_button_down():
	get_tree().change_scene("res://scenes/MainMenu.tscn")
	pass 

func _on_TT_pressed():
	PGS.unlock_achievement(PGS.CONQUISTA_TWITTER)
	
	var link = ""
	
	var endpoint = "https://twitter.com/intent/tweet"
	var quebra = "%0D%0A"
	var espaco = "%20"
	var titulo = "Não Seja Infectado!"
	var texto = "Fiz " + str(Global.get_pontos()) + " pontos!"
	var endereco = "https://play.google.com/store/apps/details?id=org.mnk.naosejainfectado"
	var tags = "NaoSejaInfectado"
	
	link = endpoint + "?text=" + titulo + quebra + texto + quebra + endereco + quebra + "&hashtags=" + tags
	link.replace(" ", espaco)
	
	OS.shell_open(link)

func habilita_botoes():
	btn_jogar.disabled = false
	btn_menu.disabled = false
	btn_tuitar.disabled = false
	btn_placar.disabled = false

func _falhou_submeter_pontuacao(id):
	habilita_botoes()
	logs.text = "Falha ao submeter pontuação."
	
func _pontuacao_submetida_sucesso(id):
	habilita_botoes()
	logs.text = "Pontuação submetida com sucesso!"

func _on_Placar_button_down():
	PGS.show_leaderboard(PGS.PLACAR_PONTUACAO)

func _erro_incremetar_conquista(conquista):
	logs.text = "Ocorreu um erro ao incremetar uma conquista."

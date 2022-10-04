extends MarginContainer

func _ready():
	if has_node("ColorRect/ColorRect/VBoxContainer/Comandos"):
		var objetivo = $ColorRect/ColorRect/VBoxContainer/Comandos
		if OS.get_name() ==  "Android":
			objetivo.text = "Comandos: \n" \
						  + "Para jogar é simples, basta tocar na tela para pular.\n" \
						  + "Ao tocar na tela por mais tempo é possível pular mais alto!"
	pass

func _on_voltar_button_down():
	get_tree().change_scene("res://scenes/MainMenu.tscn")

func _on_comandos_button_down():
	get_tree().change_scene("res://scenes/como_jogar/ComoJogar2.tscn")

func _on_objetivo_button_down():
	get_tree().change_scene("res://scenes/como_jogar/ComoJogar1.tscn")

func _on_itens_button_down():
	get_tree().change_scene("res://scenes/como_jogar/ComoJogar3.tscn")

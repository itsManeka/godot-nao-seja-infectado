extends MarginContainer

func _ready():
	PGS.unlock_achievement(PGS.CONQUISTA_CREDITOS)
	pass

func _on_voltar_button_down():
	get_tree().change_scene("res://scenes/MainMenu.tscn")

func _on_TT_pressed():
	OS.shell_open("https://twitter.com/itsManeka")

func _on_IG_pressed():
	OS.shell_open("https://www.instagram.com/emanuelozorio")

func _on_EMAIL_pressed():
	OS.shell_open("mailto:emanuel.ozoriodias@gmail.com")
	
func _on_spritelink_pressed():
	OS.shell_open("https://itsManeka.itch.io/assets-nao-seja-infectado")

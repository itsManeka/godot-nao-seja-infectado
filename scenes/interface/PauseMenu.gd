extends MarginContainer

signal continuar
signal menu

func _ready():
	pass

func _on_Continuar_pressed():
	emit_signal("continuar")

func _on_Menu_pressed():
	emit_signal("menu")

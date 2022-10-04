extends Node

var pontos = 0
var ja_jogou_uma = false
var ja_logou_ggp = false

func _ready():
	randomize()

func reset():
	pontos = 0

func get_pontos():
	return pontos

func set_pontos(valor):
	pontos = valor

func get_ja_jogou_uma():
	return ja_jogou_uma

func set_ja_jogou_uma():
	ja_jogou_uma = true

func is_android():
	return OS.get_name() == "Android"

func set_ja_logou_ggp():
	ja_logou_ggp = true

func is_ja_logou_ggp():
	return ja_logou_ggp

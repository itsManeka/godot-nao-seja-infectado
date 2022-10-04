extends Area2D

onready var main = get_parent()
onready var jogador = main.get_node("Jogador")
onready var sprite = $Sprite

var inicial = Vector2(340, 140)
var pulou = false
var atingiu = false

export var infeccao = 10
export var pontos = 15

export var sprite_text = ""
export var quantidade_sprites = 0

export var obstaculo_grande = false

func _ready():
	var s = randi()%quantidade_sprites
	sprite.play(sprite_text + str(s))
	
	if has_node("Sprite2"):
		s = randi()%quantidade_sprites
		$Sprite2.play(sprite_text + str(s))
	
	if $Som:
		$Som.play()
	set_position(inicial)

func _physics_process(delta):
	if not main.iniciado:
		return
		
	set_position(position + main.velocidade * delta)
	
	if not pulou:
		if get_position().x + 10 < jogador.get_position().x:
			if not atingiu or jogador.is_invencivel():
				pulou = true
				main.add_pontos(pontos)
				
	if get_position().x < -20:
		queue_free()
				
func deve_limpar():
	return true
	
func get_infeccao():
	return infeccao
	
func set_atingiu():
	atingiu = true

func pausar_elemento():
	$Som.stop()
	sprite.stop()
	
	if has_node("Sprite2"):
		$Sprite2.stop()
	
func continuar_elemento():
	$Som.play()
	sprite.play()
	
	if has_node("Sprite2"):
		$Sprite2.play()

func is_obstaculo_grande():
	return obstaculo_grande

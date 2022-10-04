extends ColorRect

var dicas = ["Use máscara. Salve vidas.", 
			 "Lave suas mãos com frequência. Use sabão e água ou álcool em gel.",
			 "Mantenha uma distância segura de pessoas que estiverem tossindo ou espirrando.",
			 "Use máscara quando não for possível manter o distanciamento físico.",
			 "Não toque nos olhos, no nariz ou na boca.",
			 "Cubra seu nariz e boca com o braço dobrado ou um lenço ao tossir ou expirar.",
			 "Fique em casa se você se sentir indisposto.",
			 "Fique em casa, se puder.",
			 "Procure atendimento médico se tiver febre, tosse e dificuldade para respirar.",
			 "Não é uma gripezinha."]

func _ready():
	randomize()
	
	var i = rand_range(0, dicas.size())
	$Label.text = dicas[i]
	
	$Timer.start(3)
	
func _on_Timer_timeout():
	Global.reset()
	get_tree().change_scene("res://scenes/Main.tscn")

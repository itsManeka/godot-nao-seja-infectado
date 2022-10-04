extends Node2D

onready var admob = $AdMob

var mostrou_ads = false

func _ready():
	loadAds()

func loadAds():
	admob.load_interstitial()

func proxima_cena():
	get_tree().change_scene("res://scenes/Dicas.tscn")
	
func _on_AdMob_interstitial_closed():
	proxima_cena()

func _on_AdMob_interstitial_failed_to_load(error_code):
	proxima_cena()

func _on_AdMob_interstitial_loaded():
	if not mostrou_ads:
		mostrou_ads = true
		admob.show_interstitial()

func _on_AdMob_network_error():
	proxima_cena()

func _on_Exit_pressed():
	proxima_cena()

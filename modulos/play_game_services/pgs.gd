extends Node

# placares
const PLACAR_PONTUACAO = "CgkIwdOr7ucXEAIQAQ"

# conquistas
const CONQUISTA_CREDITOS = "CgkIwdOr7ucXEAIQAA"
const CONQUISTA_AQUI_NAO = "CgkIwdOr7ucXEAIQAw"
const CONQUISTA_TWITTER = "CgkIwdOr7ucXEAIQBA"
const CONQUISTA_SUS = "CgkIwdOr7ucXEAIQBQ"
const CONQUISTA_MASCARA = "CgkIwdOr7ucXEAIQBg"
const CONQUISTA_ENTUSIASTA = "CgkIwdOr7ucXEAIQBw"
const CONQUISTA_PROFISSA = "CgkIwdOr7ucXEAIQCQ"
const CONQUISTA_NEGOCIOS = "CgkIwdOr7ucXEAIQCg"
const CONQUISTA_ALCOOL = "CgkIwdOr7ucXEAIQCw"
const CONQUISTA_CLOROQUINA = "CgkIwdOr7ucXEAIQDA"
const CONQUISTA_CORUJAO = "CgkIwdOr7ucXEAIQDQ"
const CONQUISTA_PULO_100 = "CgkIwdOr7ucXEAIQDg"
const CONQUISTA_PULO_200 = "CgkIwdOr7ucXEAIQDw"
const CONQUISTA_PONTUACAO = "CgkIwdOr7ucXEAIQEA"
const CONQUISTA_SENSATEZ = "CgkIwdOr7ucXEAIQEQ"

# signals
signal sign_in_success(account_id)
signal sign_in_failed(error_code)
signal sign_out_success()
signal sign_out_failed()
signal achievement_unlocked(achievement)
signal achievement_unlocking_failed(achievement)
signal achievement_revealed(achievement)
signal achievement_revealing_failed(achievement)
signal achievement_incremented(achievement)
signal achievement_incrementing_failed(achievement)
signal achievement_steps_set(achievement)
signal achievement_steps_setting_failed(achievement)
signal leaderboard_score_submitted(leaderboard_id)
signal leaderboard_score_submitting_failed(leaderboard_id)

var _pgs_singleton

func _ready():
	if not init():
		print("Play Game Services Godot Plugin not found. This plugin will only work on Android")

func init() -> bool:
	if OS.get_name() != "Android":
		return false
	
	if Engine.has_singleton("GodotPlayGamesServices"):
		if not _pgs_singleton:
			_pgs_singleton = Engine.get_singleton("GodotPlayGamesServices")
			
			# check if one signal is already connected
			if not _pgs_singleton.is_connected("_on_sign_in_success", self, "_on_sign_in_success"):
				connect_signals()
		
			_pgs_singleton.init(true)

		return true
	return false

func connect_signals() -> void:
		_pgs_singleton.connect("_on_sign_in_success", self, "_on_sign_in_success")
		_pgs_singleton.connect("_on_sign_in_failed", self, "_on_sign_in_failed")
		_pgs_singleton.connect("_on_sign_out_success", self, "_on_sign_out_success")
		_pgs_singleton.connect("_on_sign_out_failed", self, "_on_sign_out_failed")
		_pgs_singleton.connect("_on_achievement_unlocked", self, "_on_achievement_unlocked")
		_pgs_singleton.connect("_on_achievement_unlocking_failed", self, "_on_achievement_unlocking_failed")
		_pgs_singleton.connect("_on_achievement_revealed", self, "_on_achievement_revealed")
		_pgs_singleton.connect("_on_achievement_revealing_failed", self, "_on_achievement_revealing_failed")
		_pgs_singleton.connect("_on_achievement_incremented", self, "_on_achievement_incremented")
		_pgs_singleton.connect("_on_achievement_incrementing_failed", self, "_on_achievement_incrementing_failed")
		_pgs_singleton.connect("_on_achievement_steps_set", self, "_on_achievement_steps_set")
		_pgs_singleton.connect("_on_achievement_steps_setting_failed", self, "_on_achievement_steps_setting_failed")
		_pgs_singleton.connect("_on_leaderboard_score_submitted", self, "_on_leaderboard_score_submitted")
		_pgs_singleton.connect("_on_leaderboard_score_submitting_failed", self, "_on_leaderboard_score_submitting_failed")

# Sign-in/sign-out methods
func sign_in() -> void:
	if _pgs_singleton:
		_pgs_singleton.signIn()

func sign_out() -> void:
	if _pgs_singleton:
		_pgs_singleton.signOut()

func check_if_signed_in() -> void:
	if _pgs_singleton:
		var is_signed_in: bool = _pgs_singleton.isSignedIn()
		print("Signed in: %s"%is_signed_in)	

# Achievements methods
func unlock_achievement(achievement) -> void:
	if _pgs_singleton:
		_pgs_singleton.unlockAchievement(achievement)

func reveal_achievement(achievement) -> void:
	if _pgs_singleton:
		_pgs_singleton.revealachievement(achievement) 

func increment_achievement(achievement, step) -> void:
	if _pgs_singleton:
		_pgs_singleton.incrementAchievement(achievement, step) 

func set_achievement_steps(achievement, steps) -> void:
	if _pgs_singleton:
		_pgs_singleton.setAchievementsSteps(achievement, steps)

func show_achievements() -> void:
	if _pgs_singleton:
		_pgs_singleton.showAchievements()

# Leaderboards methods
func show_leaderboard(leaderboard_id) -> void:
	if _pgs_singleton:
		_pgs_singleton.showLeaderBoard(leaderboard_id) 

func show_all_leaderboards() -> void:
	if _pgs_singleton:
		_pgs_singleton.showAllLeaderBoards()

func submit_leaderboard_score(leaderboard_id, score) -> void:
	if _pgs_singleton:
		_pgs_singleton.submitLeaderBoardScore(leaderboard_id, score)

# CALLBACKS
# Sign-in / sign-out callbacks
func _on_sign_in_success(account_id: String) -> void:
	emit_signal("sign_in_success", account_id)

func _on_sign_in_failed(error_code: int) -> void:
	emit_signal("sign_in_failed", error_code)

func _on_sign_out_success() -> void:
	emit_signal("sign_out_success")

func _on_sign_out_failed() -> void:
	emit_signal("sign_out_failed")

# Achievements callbacks
func _on_achievement_unlocked(achievement: String) -> void:
	emit_signal("achievement_unlocked", achievement)

func _on_achievement_unlocking_failed(achievement: String) -> void:
	emit_signal("achievement_unlocking_failed", achievement)

func _on_achievement_revealed(achievement: String) -> void:
	emit_signal("achievement_revealed", achievement)

func _on_achievement_revealing_failed(achievement: String) -> void:
	emit_signal("achievement_revealing_failed", achievement)

func _on_achievement_incremented(achievement: String) -> void:
	emit_signal("achievement_incremented", achievement)

func _on_achievement_incrementing_failed(achievement: String) -> void:
	emit_signal("achievement_incrementing_failed", achievement)

func _on_achievement_steps_set(achievement: String) -> void:
	emit_signal("achievement_steps_set", achievement)

func _on_achievement_steps_setting_failed(achievement: String) -> void:
	emit_signal("achievement_steps_setting_failed", achievement)

# Leaderboards callbacks
func _on_leaderboard_score_submitted(leaderboard_id: String) -> void:
	emit_signal("leaderboard_score_submitted", leaderboard_id)

func _on_leaderboard_score_submitting_failed(leaderboard_id: String) -> void:
	emit_signal("leaderboard_score_submitting_failed", leaderboard_id)

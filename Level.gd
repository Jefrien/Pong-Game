extends Node2D

var scorePlayer = 0
var scoreOponent = 0
onready var global = get_node("/root/Global")

func _process(delta):
	$ScorePlayer.text = str(scorePlayer)
	$ScoreOponent.text = str(scoreOponent)
	if scorePlayer == 10 || scoreOponent == 10:		
		global.scorep1 = scorePlayer
		global.scorep2 = scoreOponent
		get_tree().change_scene("res://results.tscn")
	

func _ready():
	_restart_game()
	$AudioAmbient.play()

func _restart_game():
	$Ball.is_moving = false
	$Ball.direction = Vector2.ZERO
	$Ball.position = Vector2(960,540)	
	#$Ball.reset_ball()
	$RestartTimer.start()

func _on_PlayerWall_body_entered(body):	
	if body is Ball:
		scoreOponent += 1
		_restart_game()	
		$AudioGoal.play()


func _on_OponentWall_body_entered(body):
	if body is Ball:
		scorePlayer += 1
		_restart_game()
		$AudioGoal.play()

extends Node

signal game_over

var score = 0
var lives = 3

func _process(delta):
    # Update score based on screen scroll
    score += 10 * delta  # Assuming 1 pixel per frame

func obstacle_passed():
    score += 100

func lose_life():
    lives -= 1
    if lives <= 0:
        emit_signal("game_over")

func reset_game():
    score = 0
    lives = 3

func get_score() -> int:
    return score

func get_lives() -> int:
    return lives

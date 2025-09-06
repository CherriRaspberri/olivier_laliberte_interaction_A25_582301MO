extends AnimatedSprite2D
#DICE:
#nb generated for the value on the dice
var dice_face = 1
var random_nb = 1

#KEY PRESSED EVENTS:
#booleans used for toggles
var is_toggled = false

#onready: grabs the current sprites
@onready var dice = $"."

#function: randomizes a number between 1 and 6 (for each face of the dice)
func generate_random_nb():
	randomize()
	random_nb = int(randi_range(1, 6))

#function: creates a tween and rotates it with ease out transition (Animation length: .5 sec)
func rotate_dice():
	var tween = create_tween()
	tween.tween_property(self, "rotation", rotation + 2 * PI, 0.5)\
	.set_trans(Tween.TRANS_CUBIC)\
	.set_ease(Tween.EASE_OUT)
	await get_tree().create_timer(0.51).timeout

func _process(delta):
	#if only left arrow is pressed, only roll the left dice
	if Input.is_action_just_pressed("left_arrow"):
		#when key is pressed, release focus from button
		$"../../Button_onclick".release_focus()
		#if toggle is turned on, generate random nb; determines what face the dice should land on
		if !is_toggled:
			generate_random_nb()
			dice_face = random_nb
		#toggle on/off
		is_toggled = not is_toggled
	
	#if toggle is on, play animation
	if is_toggled:
		rotate_dice()
	#if toggle is off, checks value of random number and sets it to the dice
	else:
		if dice_face >= 1 and dice_face <= 6:
			dice.play("dice_0%d" % dice_face)

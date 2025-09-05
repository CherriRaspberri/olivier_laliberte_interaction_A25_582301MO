extends AnimatedSprite2D
#DICE:
#nb generated for the value on the left dice
var random_nb = 1
#KEY PRESSED EVENTS:
#boolean used to toggle
var is_toggled = false

#onready: grabs the current sprites
@onready var left_dice = $"."
@onready var right_dice = $"../dice_02_ontoggle"

#function: randomizes a number between 1 and 6 (for each face of the dice)
func generate_random_nb():
	randomize()
	random_nb = int(randi_range(1, 6))

#function: creates a tween and rotates it (Animation length: .5 sec)
func rotate_dice(selected_dice):
	var tween = create_tween()
	tween.tween_property(selected_dice, "rotation", rotation + 2 * PI, 0.5)
	await get_tree().create_timer(0.51).timeout

func _process(delta):
	#if only left arrow is pressed, only roll the left dice
	if Input.is_action_just_pressed("left_arrow"):
		
		pass
	
	#if only right arrow is pressed, only roll the right dice
	if Input.is_action_just_pressed("right_arrow"):
		pass
	
	#checks every frame if spacebar is pressed; on press, toggle on/off
	if Input.is_action_just_pressed("spacebar_pressed"):
		#when key is pressed, release focus from button
		$"../../Button_onclick".release_focus()
		#if toggle is turned on, generate random nb
		if !is_toggled:
			generate_random_nb()
		#toggle on/off
		is_toggled = not is_toggled
	
	#if toggle is on, play animation
	if is_toggled:
		rotate_dice(left_dice)
	#if toggle is off, checks value of random number and sets it to the dice
	else:
		if random_nb == 1:
			left_dice.play("dice_01")
		if random_nb == 2:
			left_dice.play("dice_02")
		if random_nb == 3:
			left_dice.play("dice_03")
		if random_nb == 4:
			left_dice.play("dice_04")
		if random_nb == 5:
			left_dice.play("dice_05")
		if random_nb == 6:
			left_dice.play("dice_06")
	

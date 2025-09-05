extends AnimatedSprite2D
#DICE:
#nb generated for the value on the dice
var random_nb = 1;
#KEY PRESSED EVENTS:
#boolean used to toggle
var is_toggled = false

#onready: grabs the current sprite
@onready var dice = $"./"

#function: randomizes a number between 1 and 6 (for each face of the dice)
func generate_random_nb():
	randomize()
	random_nb = int(randi_range(1, 6))

func _process(delta):
	#checks every frame if spacebar is pressed; on press, toggle on/off
	if Input.is_action_just_pressed("spacebar_pressed"):
		#if toggle is turned on, generate random nb
		if !is_toggled:
			generate_random_nb()
		#toggle on/off
		is_toggled = not is_toggled
	
	#if toggle is on, play animation
	if is_toggled:
		#creates a tween and rotates it (Animation length: .5 sec)
		var tween = create_tween()
		tween.tween_property(self, "rotation", rotation + 2 * PI, 0.5)
		await get_tree().create_timer(0.51).timeout
	#if toggle is off, checks value of random number and sets it to the dice
	else:
		if random_nb == 1:
			dice.play("dice_01")
		if random_nb == 2:
			dice.play("dice_02")
		if random_nb == 3:
			dice.play("dice_03")
		if random_nb == 4:
			dice.play("dice_04")
		if random_nb == 5:
			dice.play("dice_05")
		if random_nb == 6:
			dice.play("dice_06")
	

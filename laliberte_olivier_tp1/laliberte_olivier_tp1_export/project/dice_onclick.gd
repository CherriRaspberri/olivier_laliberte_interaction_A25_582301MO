extends AnimatedSprite2D
#DICE:
#nb generated for the value on the dice
var random_nb = 1

#ANIMATION:
#number of rotations for the animation
var iterations = 2

#onready: grabs the current sprite 
@onready var dice = $"./"
#onready: grabs button and assigns it on_pressed function
@onready var button = $"../"
func _ready():
	button.pressed.connect(on_button_pressed)

#function: randomizes a number between 1 and 6 (for each face of the dice)
func generate_random_nb():
	randomize()
	random_nb = int(randi_range(1, 6))

#function: when button is pressed, start animation and change dice sprite to a random one
func on_button_pressed():
	#disables the button until the animation is done
	button.disabled = true
	#ANIMATION:
	#plays the sound 
	$AudioStreamPlayer.play()
	#creates a loop equals to the number of rotations we want the dice to have
	for i in iterations:
		#creates a tween and rotates it (Animation length: .5 sec)
		var tween = create_tween()
		tween.tween_property(self, "rotation", rotation + 2 * PI, 0.5)
		await get_tree().create_timer(0.51).timeout
	#DICE:
	#changes the number of the dice
	generate_random_nb()
	#re-enables the button to be clicked
	button.disabled = false

#function: checks every frame what the face of the dice should be
func _process(delta):
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

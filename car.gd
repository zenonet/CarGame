extends VehicleBody3D

const MAX_STEER = 0.8
const ENGINE_POWER = 300
const BOOST_ENGINE_POWER = 6000

func _ready():
	pass

func _process(delta):
	steering = move_toward(steering, Input.get_axis("right", "left")*MAX_STEER, delta*2.5)
	engine_force = Input.get_axis("decelerate", "accelerate") * (BOOST_ENGINE_POWER if Input.is_action_pressed("nitro") else ENGINE_POWER)
	brake = Input.get_action_strength("brake") * 10
	
	if(Input.is_action_just_released("quit")):
		get_tree().quit()

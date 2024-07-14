extends VehicleBody3D

const MAX_STEER = 0.8
const ENGINE_POWER = 300
const BOOST_ENGINE_POWER = 600

var nitro:float = 10.0

func _ready():
	pass

func _process(delta):
	steering = move_toward(steering, Input.get_axis("right", "left")*MAX_STEER, delta*2.5)
	engine_force = Input.get_axis("decelerate", "accelerate") * (BOOST_ENGINE_POWER if Input.is_action_pressed("nitro") && nitro > 0 else ENGINE_POWER)
	brake = Input.get_action_strength("brake") * 10
	
	if(Input.is_action_pressed("nitro")):
		nitro -= delta
	else:
		nitro += delta * 0.5
	
	if(Input.is_action_just_released("quit")):
		get_tree().quit()

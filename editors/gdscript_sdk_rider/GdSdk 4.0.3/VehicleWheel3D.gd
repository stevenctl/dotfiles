extends Node3D
#brief Physics object that simulates the behavior of a wheel.
#desc This node needs to be used as a child node of [VehicleBody3D] and simulates the behavior of one of its wheels. This node also acts as a collider to detect if the wheel is touching a surface.
#desc [b]Note:[/b] This class has known issues and isn't designed to provide realistic 3D vehicle physics. If you want advanced vehicle physics, you will probably have to write your own physics integration using another [PhysicsBody3D] class.
#tutorial [3D Truck Town Demo] https://godotengine.org/asset-library/asset/524
class_name VehicleWheel3D


#desc Slows down the wheel by applying a braking force. The wheel is only slowed down if it is in contact with a surface. The force you need to apply to adequately slow down your vehicle depends on the [member RigidBody3D.mass] of the vehicle. For a vehicle with a mass set to 1000, try a value in the 25 - 30 range for hard braking.
var brake: float:
	get = get_brake, set = set_brake

#desc The damping applied to the spring when the spring is being compressed. This value should be between 0.0 (no damping) and 1.0. A value of 0.0 means the car will keep bouncing as the spring keeps its energy. A good value for this is around 0.3 for a normal car, 0.5 for a race car.
var damping_compression: float:
	get = get_damping_compression, set = set_damping_compression

#desc The damping applied to the spring when relaxing. This value should be between 0.0 (no damping) and 1.0. This value should always be slightly higher than the [member damping_compression] property. For a [member damping_compression] value of 0.3, try a relaxation value of 0.5.
var damping_relaxation: float:
	get = get_damping_relaxation, set = set_damping_relaxation

#desc Accelerates the wheel by applying an engine force. The wheel is only sped up if it is in contact with a surface. The [member RigidBody3D.mass] of the vehicle has an effect on the acceleration of the vehicle. For a vehicle with a mass set to 1000, try a value in the 25 - 50 range for acceleration.
#desc [b]Note:[/b] The simulation does not take the effect of gears into account, you will need to add logic for this if you wish to simulate gears.
#desc A negative value will result in the wheel reversing.
var engine_force: float:
	get = get_engine_force, set = set_engine_force

#desc The steering angle for the wheel, in radians. Setting this to a non-zero value will result in the vehicle turning when it's moving.
var steering: float:
	get = get_steering, set = set_steering

#desc The maximum force the spring can resist. This value should be higher than a quarter of the [member RigidBody3D.mass] of the [VehicleBody3D] or the spring will not carry the weight of the vehicle. Good results are often obtained by a value that is about 3× to 4× this number.
var suspension_max_force: float:
	get = get_suspension_max_force, set = set_suspension_max_force

#desc This value defines the stiffness of the suspension. Use a value lower than 50 for an off-road car, a value between 50 and 100 for a race car and try something around 200 for something like a Formula 1 car.
var suspension_stiffness: float:
	get = get_suspension_stiffness, set = set_suspension_stiffness

#desc This is the distance the suspension can travel. As Godot units are equivalent to meters, keep this setting relatively low. Try a value between 0.1 and 0.3 depending on the type of car.
var suspension_travel: float:
	get = get_suspension_travel, set = set_suspension_travel

#desc If [code]true[/code], this wheel will be turned when the car steers. This value is used in conjunction with [member VehicleBody3D.steering] and ignored if you are using the per-wheel [member steering] value instead.
var use_as_steering: bool:
	get = is_used_as_steering, set = set_use_as_steering

#desc If [code]true[/code], this wheel transfers engine force to the ground to propel the vehicle forward. This value is used in conjunction with [member VehicleBody3D.engine_force] and ignored if you are using the per-wheel [member engine_force] value instead.
var use_as_traction: bool:
	get = is_used_as_traction, set = set_use_as_traction

#desc This determines how much grip this wheel has. It is combined with the friction setting of the surface the wheel is in contact with. 0.0 means no grip, 1.0 is normal grip. For a drift car setup, try setting the grip of the rear wheels slightly lower than the front wheels, or use a lower value to simulate tire wear.
#desc It's best to set this to 1.0 when starting out.
var wheel_friction_slip: float:
	get = get_friction_slip, set = set_friction_slip

#desc The radius of the wheel in meters.
var wheel_radius: float:
	get = get_radius, set = set_radius

#desc This is the distance in meters the wheel is lowered from its origin point. Don't set this to 0.0 and move the wheel into position, instead move the origin point of your wheel (the gizmo in Godot) to the position the wheel will take when bottoming out, then use the rest length to move the wheel down to the position it should be in when the car is in rest.
var wheel_rest_length: float:
	get = get_suspension_rest_length, set = set_suspension_rest_length

#desc This value affects the roll of your vehicle. If set to 1.0 for all wheels, your vehicle will be prone to rolling over, while a value of 0.0 will resist body roll.
var wheel_roll_influence: float:
	get = get_roll_influence, set = set_roll_influence



#desc Returns the contacting body node if valid in the tree, as [Node3D]. At the moment, [GridMap] is not supported so the node will be always of type [PhysicsBody3D].
#desc Returns [code]null[/code] if the wheel is not in contact with a surface, or the contact body is not a [PhysicsBody3D].
func get_contact_body() -> Node3D:
	pass;

#desc Returns the rotational speed of the wheel in revolutions per minute.
func get_rpm() -> float:
	pass;

#desc Returns a value between 0.0 and 1.0 that indicates whether this wheel is skidding. 0.0 is skidding (the wheel has lost grip, e.g. icy terrain), 1.0 means not skidding (the wheel has full grip, e.g. dry asphalt road).
func get_skidinfo() -> float:
	pass;

#desc Returns [code]true[/code] if this wheel is in contact with a surface.
func is_in_contact() -> bool:
	pass;


func get_brake() -> float:
	return brake

func set_brake(value: float) -> void:
	brake = value

func get_damping_compression() -> float:
	return damping_compression

func set_damping_compression(value: float) -> void:
	damping_compression = value

func get_damping_relaxation() -> float:
	return damping_relaxation

func set_damping_relaxation(value: float) -> void:
	damping_relaxation = value

func get_engine_force() -> float:
	return engine_force

func set_engine_force(value: float) -> void:
	engine_force = value

func get_steering() -> float:
	return steering

func set_steering(value: float) -> void:
	steering = value

func get_suspension_max_force() -> float:
	return suspension_max_force

func set_suspension_max_force(value: float) -> void:
	suspension_max_force = value

func get_suspension_stiffness() -> float:
	return suspension_stiffness

func set_suspension_stiffness(value: float) -> void:
	suspension_stiffness = value

func get_suspension_travel() -> float:
	return suspension_travel

func set_suspension_travel(value: float) -> void:
	suspension_travel = value

func is_used_as_steering() -> bool:
	return use_as_steering

func set_use_as_steering(value: bool) -> void:
	use_as_steering = value

func is_used_as_traction() -> bool:
	return use_as_traction

func set_use_as_traction(value: bool) -> void:
	use_as_traction = value

func get_friction_slip() -> float:
	return wheel_friction_slip

func set_friction_slip(value: float) -> void:
	wheel_friction_slip = value

func get_radius() -> float:
	return wheel_radius

func set_radius(value: float) -> void:
	wheel_radius = value

func get_suspension_rest_length() -> float:
	return wheel_rest_length

func set_suspension_rest_length(value: float) -> void:
	wheel_rest_length = value

func get_roll_influence() -> float:
	return wheel_roll_influence

func set_roll_influence(value: float) -> void:
	wheel_roll_influence = value


extends VisualShaderNode
#brief A visual shader helper node for multiplying position and rotation of particles.
#desc This node helps to multiply a position input vector by rotation using specific axis. Intended to work with emitters.
class_name VisualShaderNodeParticleMultiplyByAxisAngle


#desc If [code]true[/code], the angle will be interpreted in degrees instead of radians.
var degrees_mode: bool:
	get = is_degrees_mode, set = set_degrees_mode




func is_degrees_mode() -> bool:
	return degrees_mode

func set_degrees_mode(value: bool) -> void:
	degrees_mode = value


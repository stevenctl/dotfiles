extends VisualShaderNode
#brief A visual shader node that accelerates particles.
#desc Particle accelerator can be used in "process" step of particle shader. It will accelerate the particles. Connect it to the Velocity output port.
class_name VisualShaderNodeParticleAccelerator

#desc The particles will be accelerated based on their velocity.
#desc The particles will be accelerated towards or away from the center.
#desc The particles will be accelerated tangentially to the radius vector from center to their position.
#desc Represents the size of the [enum Mode] enum.

#enum Mode
enum {
    MODE_LINEAR = 0,
    MODE_RADIAL = 1,
    MODE_TANGENTIAL = 2,
    MODE_MAX = 3,
}
#desc Defines in what manner the particles will be accelerated.
var mode: int:
	get = get_mode, set = set_mode




func get_mode() -> int:
	return mode

func set_mode(value: int) -> void:
	mode = value


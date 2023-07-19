extends VisualShaderNode
#brief A base class for particle emitters.
#desc Particle emitter nodes can be used in "start" step of particle shaders and they define the starting position of the particles. Connect them to the Position output port.
class_name VisualShaderNodeParticleEmitter


#desc If [code]true[/code], the result of this emitter is projected to 2D space. By default it is [code]false[/code] and meant for use in 3D space.
var mode_2d: bool:
	get = is_mode_2d, set = set_mode_2d




func is_mode_2d() -> bool:
	return mode_2d

func set_mode_2d(value: bool) -> void:
	mode_2d = value


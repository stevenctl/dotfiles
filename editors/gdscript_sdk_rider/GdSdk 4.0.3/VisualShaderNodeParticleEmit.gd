extends VisualShaderNode
#brief A visual shader node that forces to emit a particle from a sub-emitter.
#desc This node internally calls [code]emit_subparticle[/code] shader method. It will emit a particle from the configured sub-emitter and also allows to customize how its emitted. Requires a sub-emitter assigned to the particles node with this shader.
class_name VisualShaderNodeParticleEmit

#desc If enabled, the particle starts with the position defined by this node.
#desc If enabled, the particle starts with the rotation and scale defined by this node.
#desc If enabled,the particle starts with the velocity defined by this node.
#desc If enabled, the particle starts with the color defined by this node.
#desc If enabled, the particle starts with the [code]CUSTOM[/code] data defined by this node.

#enum EmitFlags
enum {
    EMIT_FLAG_POSITION = 1,
    EMIT_FLAG_ROT_SCALE = 2,
    EMIT_FLAG_VELOCITY = 4,
    EMIT_FLAG_COLOR = 8,
    EMIT_FLAG_CUSTOM = 16,
}
#desc Flags used to override the properties defined in the sub-emitter's process material.
var flags: int:
	get = get_flags, set = set_flags




func get_flags() -> int:
	return flags

func set_flags(value: int) -> void:
	flags = value


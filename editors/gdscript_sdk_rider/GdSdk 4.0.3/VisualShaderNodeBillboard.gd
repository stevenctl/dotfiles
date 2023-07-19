extends VisualShaderNode
#brief A node that controls how the object faces the camera to be used within the visual shader graph.
#desc The output port of this node needs to be connected to [code]Model View Matrix[/code] port of [VisualShaderNodeOutput].
class_name VisualShaderNodeBillboard

#desc Billboarding is disabled and the node does nothing.
#desc A standard billboarding algorithm is enabled.
#desc A billboarding algorithm to rotate around Y-axis is enabled.
#desc A billboarding algorithm designed to use on particles is enabled.
#desc Represents the size of the [enum BillboardType] enum.

#enum BillboardType
enum {
    BILLBOARD_TYPE_DISABLED = 0,
    BILLBOARD_TYPE_ENABLED = 1,
    BILLBOARD_TYPE_FIXED_Y = 2,
    BILLBOARD_TYPE_PARTICLES = 3,
    BILLBOARD_TYPE_MAX = 4,
}
#desc Controls how the object faces the camera. See [enum BillboardType].
var billboard_type: int:
	get = get_billboard_type, set = set_billboard_type

#desc If [code]true[/code], the shader will keep the scale set for the mesh. Otherwise, the scale is lost when billboarding.
var keep_scale: bool:
	get = is_keep_scale_enabled, set = set_keep_scale_enabled




func get_billboard_type() -> int:
	return billboard_type

func set_billboard_type(value: int) -> void:
	billboard_type = value

func is_keep_scale_enabled() -> bool:
	return keep_scale

func set_keep_scale_enabled(value: bool) -> void:
	keep_scale = value


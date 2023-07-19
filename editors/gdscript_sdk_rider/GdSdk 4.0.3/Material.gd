extends Resource
#brief Abstract base [Resource] for coloring and shading geometry.
#desc Material is a base [Resource] used for coloring and shading geometry. All materials inherit from it and almost all [VisualInstance3D] derived nodes carry a Material. A few flags and parameters are shared between all material types and are configured here.
#tutorial [3D Material Testers Demo] https://godotengine.org/asset-library/asset/123
#tutorial [Third Person Shooter Demo] https://godotengine.org/asset-library/asset/678
class_name Material

#desc Maximum value for the [member render_priority] parameter.
const RENDER_PRIORITY_MAX = 127;

#desc Minimum value for the [member render_priority] parameter.
const RENDER_PRIORITY_MIN = -128;


#desc Sets the [Material] to be used for the next pass. This renders the object again using a different material.
#desc [b]Note:[/b] This only applies to [StandardMaterial3D]s and [ShaderMaterial]s with type "Spatial".
var next_pass: Material:
	get = get_next_pass, set = set_next_pass

#desc Sets the render priority for transparent objects in 3D scenes. Higher priority objects will be sorted in front of lower priority objects.
#desc [b]Note:[/b] This only applies to [StandardMaterial3D]s and [ShaderMaterial]s with type "Spatial".
#desc [b]Note:[/b] This only applies to sorting of transparent objects. This will not impact how transparent objects are sorted relative to opaque objects. This is because opaque objects are not sorted, while transparent objects are sorted from back to front (subject to priority).
var render_priority: int:
	get = get_render_priority, set = set_render_priority



func _can_do_next_pass() -> bool:
	pass;

func _can_use_render_priority() -> bool:
	pass;

func _get_shader_mode() -> int:
	pass;

func _get_shader_rid() -> RID:
	pass;

#desc Creates a placeholder version of this resource ([PlaceholderMaterial]).
func create_placeholder() -> Resource:
	pass;

func inspect_native_shader_code() -> void:
	pass;


func get_next_pass() -> Material:
	return next_pass

func set_next_pass(value: Material) -> void:
	next_pass = value

func get_render_priority() -> int:
	return render_priority

func set_render_priority(value: int) -> void:
	render_priority = value


extends PrimitiveMesh
class_name TubeTrailMesh


#desc If [code]true[/code], generates a cap at the bottom of the tube. This can be set to [code]false[/code] to speed up generation and rendering when the cap is never seen by the camera.
var cap_bottom: bool:
	get = is_cap_bottom, set = set_cap_bottom

#desc If [code]true[/code], generates a cap at the top of the tube. This can be set to [code]false[/code] to speed up generation and rendering when the cap is never seen by the camera.
var cap_top: bool:
	get = is_cap_top, set = set_cap_top

var curve: Curve:
	get = get_curve, set = set_curve

var radial_steps: int:
	get = get_radial_steps, set = set_radial_steps

var radius: float:
	get = get_radius, set = set_radius

var section_length: float:
	get = get_section_length, set = set_section_length

var section_rings: int:
	get = get_section_rings, set = set_section_rings

var sections: int:
	get = get_sections, set = set_sections




func is_cap_bottom() -> bool:
	return cap_bottom

func set_cap_bottom(value: bool) -> void:
	cap_bottom = value

func is_cap_top() -> bool:
	return cap_top

func set_cap_top(value: bool) -> void:
	cap_top = value

func get_curve() -> Curve:
	return curve

func set_curve(value: Curve) -> void:
	curve = value

func get_radial_steps() -> int:
	return radial_steps

func set_radial_steps(value: int) -> void:
	radial_steps = value

func get_radius() -> float:
	return radius

func set_radius(value: float) -> void:
	radius = value

func get_section_length() -> float:
	return section_length

func set_section_length(value: float) -> void:
	section_length = value

func get_section_rings() -> int:
	return section_rings

func set_section_rings(value: int) -> void:
	section_rings = value

func get_sections() -> int:
	return sections

func set_sections(value: int) -> void:
	sections = value


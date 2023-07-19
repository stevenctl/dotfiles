extends PrimitiveMesh
#brief Class representing a cylindrical [PrimitiveMesh].
#desc Class representing a cylindrical [PrimitiveMesh]. This class can be used to create cones by setting either the [member top_radius] or [member bottom_radius] properties to [code]0.0[/code].
class_name CylinderMesh


#desc Bottom radius of the cylinder. If set to [code]0.0[/code], the bottom faces will not be generated, resulting in a conic shape. See also [member cap_bottom].
var bottom_radius: float:
	get = get_bottom_radius, set = set_bottom_radius

#desc If [code]true[/code], generates a cap at the bottom of the cylinder. This can be set to [code]false[/code] to speed up generation and rendering when the cap is never seen by the camera. See also [member bottom_radius].
#desc [b]Note:[/b] If [member bottom_radius] is [code]0.0[/code], cap generation is always skipped even if [member cap_bottom] is [code]true[/code].
var cap_bottom: bool:
	get = is_cap_bottom, set = set_cap_bottom

#desc If [code]true[/code], generates a cap at the top of the cylinder. This can be set to [code]false[/code] to speed up generation and rendering when the cap is never seen by the camera. See also [member top_radius].
#desc [b]Note:[/b] If [member top_radius] is [code]0.0[/code], cap generation is always skipped even if [member cap_top] is [code]true[/code].
var cap_top: bool:
	get = is_cap_top, set = set_cap_top

#desc Full height of the cylinder.
var height: float:
	get = get_height, set = set_height

#desc Number of radial segments on the cylinder. Higher values result in a more detailed cylinder/cone at the cost of performance.
var radial_segments: int:
	get = get_radial_segments, set = set_radial_segments

#desc Number of edge rings along the height of the cylinder. Changing [member rings] does not have any visual impact unless a shader or procedural mesh tool is used to alter the vertex data. Higher values result in more subdivisions, which can be used to create smoother-looking effects with shaders or procedural mesh tools (at the cost of performance). When not altering the vertex data using a shader or procedural mesh tool, [member rings] should be kept to its default value.
var rings: int:
	get = get_rings, set = set_rings

#desc Top radius of the cylinder. If set to [code]0.0[/code], the top faces will not be generated, resulting in a conic shape. See also [member cap_top].
var top_radius: float:
	get = get_top_radius, set = set_top_radius




func get_bottom_radius() -> float:
	return bottom_radius

func set_bottom_radius(value: float) -> void:
	bottom_radius = value

func is_cap_bottom() -> bool:
	return cap_bottom

func set_cap_bottom(value: bool) -> void:
	cap_bottom = value

func is_cap_top() -> bool:
	return cap_top

func set_cap_top(value: bool) -> void:
	cap_top = value

func get_height() -> float:
	return height

func set_height(value: float) -> void:
	height = value

func get_radial_segments() -> int:
	return radial_segments

func set_radial_segments(value: int) -> void:
	radial_segments = value

func get_rings() -> int:
	return rings

func set_rings(value: int) -> void:
	rings = value

func get_top_radius() -> float:
	return top_radius

func set_top_radius(value: float) -> void:
	top_radius = value


extends PrimitiveMesh
class_name RibbonTrailMesh


#enum Shape
enum {
    SHAPE_FLAT = 0,
    SHAPE_CROSS = 1,
}
var curve: Curve:
	get = get_curve, set = set_curve

var section_length: float:
	get = get_section_length, set = set_section_length

var section_segments: int:
	get = get_section_segments, set = set_section_segments

var sections: int:
	get = get_sections, set = set_sections

var shape: int:
	get = get_shape, set = set_shape

var size: float:
	get = get_size, set = set_size




func get_curve() -> Curve:
	return curve

func set_curve(value: Curve) -> void:
	curve = value

func get_section_length() -> float:
	return section_length

func set_section_length(value: float) -> void:
	section_length = value

func get_section_segments() -> int:
	return section_segments

func set_section_segments(value: int) -> void:
	section_segments = value

func get_sections() -> int:
	return sections

func set_sections(value: int) -> void:
	sections = value

func get_shape() -> int:
	return shape

func set_shape(value: int) -> void:
	shape = value

func get_size() -> float:
	return size

func set_size(value: float) -> void:
	size = value


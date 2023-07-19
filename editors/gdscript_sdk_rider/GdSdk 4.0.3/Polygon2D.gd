extends Node2D
#brief A 2D polygon.
#desc A Polygon2D is defined by a set of points. Each point is connected to the next, with the final point being connected to the first, resulting in a closed polygon. Polygon2Ds can be filled with color (solid or gradient) or filled with a given texture.
class_name Polygon2D


#desc If [code]true[/code], polygon edges will be anti-aliased.
var antialiased: bool:
	get = get_antialiased, set = set_antialiased

#desc Internal list of [Bone2D] nodes used by the assigned [member skeleton]. Edited using the Polygon2D editor ("UV" button on the top toolbar).
var bones: Array:
	get = _get_bones, set = _set_bones

#desc The polygon's fill color. If [code]texture[/code] is defined, it will be multiplied by this color. It will also be the default color for vertices not set in [code]vertex_colors[/code].
var color: Color:
	get = get_color, set = set_color

#desc Number of internal vertices, used for UV mapping.
var internal_vertex_count: int:
	get = get_internal_vertex_count, set = set_internal_vertex_count

#desc Added padding applied to the bounding box when [member invert_enabled] is set to [code]true[/code]. Setting this value too small may result in a "Bad Polygon" error.
var invert_border: float:
	get = get_invert_border, set = set_invert_border

#desc If [code]true[/code], the polygon will be inverted, containing the area outside the defined points and extending to the [member invert_border].
var invert_enabled: bool:
	get = get_invert_enabled, set = set_invert_enabled

#desc The offset applied to each vertex.
var offset: Vector2:
	get = get_offset, set = set_offset

#desc The polygon's list of vertices. The final point will be connected to the first.
#desc [b]Note:[/b] This returns a copy of the [PackedVector2Array] rather than a reference.
var polygon: PackedVector2Array:
	get = get_polygon, set = set_polygon

#desc The list of polygons, in case more than one is being represented. Every individual polygon is stored as a [PackedInt32Array] where each [int] is an index to a point in [member polygon]. If empty, this property will be ignored, and the resulting single polygon will be composed of all points in [member polygon], using the order they are stored in.
var polygons: Array:
	get = get_polygons, set = set_polygons

#desc Path to a [Skeleton2D] node used for skeleton-based deformations of this polygon. If empty or invalid, skeletal deformations will not be used.
var skeleton: NodePath:
	get = get_skeleton, set = set_skeleton

#desc The polygon's fill texture. Use [code]uv[/code] to set texture coordinates.
var texture: Texture2D:
	get = get_texture, set = set_texture

#desc Amount to offset the polygon's [code]texture[/code]. If [code](0, 0)[/code] the texture's origin (its top-left corner) will be placed at the polygon's [code]position[/code].
var texture_offset: Vector2:
	get = get_texture_offset, set = set_texture_offset

#desc The texture's rotation in radians.
var texture_rotation: float:
	get = get_texture_rotation, set = set_texture_rotation

#desc Amount to multiply the [code]uv[/code] coordinates when using a [code]texture[/code]. Larger values make the texture smaller, and vice versa.
var texture_scale: Vector2:
	get = get_texture_scale, set = set_texture_scale

#desc Texture coordinates for each vertex of the polygon. There should be one [code]uv[/code] per polygon vertex. If there are fewer, undefined vertices will use [code](0, 0)[/code].
var uv: PackedVector2Array:
	get = get_uv, set = set_uv

#desc Color for each vertex. Colors are interpolated between vertices, resulting in smooth gradients. There should be one per polygon vertex. If there are fewer, undefined vertices will use [code]color[/code].
var vertex_colors: PackedColorArray:
	get = get_vertex_colors, set = set_vertex_colors



#desc Adds a bone with the specified [param path] and [param weights].
func add_bone(path: NodePath, weights: PackedFloat32Array) -> void:
	pass;

#desc Removes all bones from this [Polygon2D].
func clear_bones() -> void:
	pass;

#desc Removes the specified bone from this [Polygon2D].
func erase_bone(index: int) -> void:
	pass;

#desc Returns the number of bones in this [Polygon2D].
func get_bone_count() -> int:
	pass;

#desc Returns the path to the node associated with the specified bone.
func get_bone_path(index: int) -> NodePath:
	pass;

#desc Returns the height values of the specified bone.
func get_bone_weights(index: int) -> PackedFloat32Array:
	pass;

#desc Sets the path to the node associated with the specified bone.
func set_bone_path(index: int, path: NodePath) -> void:
	pass;

#desc Sets the weight values for the specified bone.
func set_bone_weights(index: int, weights: PackedFloat32Array) -> void:
	pass;


func get_antialiased() -> bool:
	return antialiased

func set_antialiased(value: bool) -> void:
	antialiased = value

func _get_bones() -> Array:
	return bones

func _set_bones(value: Array) -> void:
	bones = value

func get_color() -> Color:
	return color

func set_color(value: Color) -> void:
	color = value

func get_internal_vertex_count() -> int:
	return internal_vertex_count

func set_internal_vertex_count(value: int) -> void:
	internal_vertex_count = value

func get_invert_border() -> float:
	return invert_border

func set_invert_border(value: float) -> void:
	invert_border = value

func get_invert_enabled() -> bool:
	return invert_enabled

func set_invert_enabled(value: bool) -> void:
	invert_enabled = value

func get_offset() -> Vector2:
	return offset

func set_offset(value: Vector2) -> void:
	offset = value

func get_polygon() -> PackedVector2Array:
	return polygon

func set_polygon(value: PackedVector2Array) -> void:
	polygon = value

func get_polygons() -> Array:
	return polygons

func set_polygons(value: Array) -> void:
	polygons = value

func get_skeleton() -> NodePath:
	return skeleton

func set_skeleton(value: NodePath) -> void:
	skeleton = value

func get_texture() -> Texture2D:
	return texture

func set_texture(value: Texture2D) -> void:
	texture = value

func get_texture_offset() -> Vector2:
	return texture_offset

func set_texture_offset(value: Vector2) -> void:
	texture_offset = value

func get_texture_rotation() -> float:
	return texture_rotation

func set_texture_rotation(value: float) -> void:
	texture_rotation = value

func get_texture_scale() -> Vector2:
	return texture_scale

func set_texture_scale(value: Vector2) -> void:
	texture_scale = value

func get_uv() -> PackedVector2Array:
	return uv

func set_uv(value: PackedVector2Array) -> void:
	uv = value

func get_vertex_colors() -> PackedColorArray:
	return vertex_colors

func set_vertex_colors(value: PackedColorArray) -> void:
	vertex_colors = value


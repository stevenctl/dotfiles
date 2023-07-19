extends Node2D
#brief A 2D line.
#desc A line through several points in 2D space.
#tutorial [Matrix Transform Demo] https://godotengine.org/asset-library/asset/584
#tutorial [2.5D Demo] https://godotengine.org/asset-library/asset/583
class_name Line2D

#desc The line's joints will be pointy. If [code]sharp_limit[/code] is greater than the rotation of a joint, it becomes a bevel joint instead.
#desc The line's joints will be bevelled/chamfered.
#desc The line's joints will be rounded.
#desc Don't draw a line cap.
#desc Draws the line cap as a box.
#desc Draws the line cap as a circle.
#desc Takes the left pixels of the texture and renders it over the whole line.
#desc Tiles the texture over the line. [member CanvasItem.texture_repeat] of the [Line2D] node must be [constant CanvasItem.TEXTURE_REPEAT_ENABLED] or [constant CanvasItem.TEXTURE_REPEAT_MIRROR] for it to work properly.
#desc Stretches the texture across the line. [member CanvasItem.texture_repeat] of the [Line2D] node must be [constant CanvasItem.TEXTURE_REPEAT_DISABLED] for best results.

#enum LineJointMode
enum {
    LINE_JOINT_SHARP = 0,
    LINE_JOINT_BEVEL = 1,
    LINE_JOINT_ROUND = 2,
}
#enum LineCapMode
enum {
    LINE_CAP_NONE = 0,
    LINE_CAP_BOX = 1,
    LINE_CAP_ROUND = 2,
}
#enum LineTextureMode
enum {
    LINE_TEXTURE_NONE = 0,
    LINE_TEXTURE_TILE = 1,
    LINE_TEXTURE_STRETCH = 2,
}
#desc If [code]true[/code], the line's border will be anti-aliased.
#desc [b]Note:[/b] Line2D is not accelerated by batching when being anti-aliased.
var antialiased: bool:
	get = get_antialiased, set = set_antialiased

#desc Controls the style of the line's first point. Use [enum LineCapMode] constants.
var begin_cap_mode: int:
	get = get_begin_cap_mode, set = set_begin_cap_mode

#desc The line's color. Will not be used if a gradient is set.
var default_color: Color:
	get = get_default_color, set = set_default_color

#desc Controls the style of the line's last point. Use [enum LineCapMode] constants.
var end_cap_mode: int:
	get = get_end_cap_mode, set = set_end_cap_mode

#desc The gradient is drawn through the whole line from start to finish. The default color will not be used if a gradient is set.
var gradient: Gradient:
	get = get_gradient, set = set_gradient

#desc The style for the points between the start and the end.
var joint_mode: int:
	get = get_joint_mode, set = set_joint_mode

#desc The points that form the lines. The line is drawn between every point set in this array. Points are interpreted as local vectors.
var points: PackedVector2Array:
	get = get_points, set = set_points

#desc The smoothness of the rounded joints and caps. Higher values result in smoother corners, but are more demanding to render and update. This is only used if a cap or joint is set as round.
#desc [b]Note:[/b] The default value is tuned for lines with the default [member width]. For thin lines, this value should be reduced to a number between [code]2[/code] and [code]4[/code] to improve performance.
var round_precision: int:
	get = get_round_precision, set = set_round_precision

#desc The direction difference in radians between vector points. This value is only used if [member joint_mode] is set to [constant LINE_JOINT_SHARP].
var sharp_limit: float:
	get = get_sharp_limit, set = set_sharp_limit

#desc The texture used for the line's texture. Uses [code]texture_mode[/code] for drawing style.
var texture: Texture2D:
	get = get_texture, set = set_texture

#desc The style to render the [code]texture[/code] on the line. Use [enum LineTextureMode] constants.
var texture_mode: int:
	get = get_texture_mode, set = set_texture_mode

#desc The line's width.
var width: float:
	get = get_width, set = set_width

#desc The line's width varies with the curve. The original width is simply multiply by the value of the Curve.
var width_curve: Curve:
	get = get_curve, set = set_curve



#desc Adds a point with the specified [param position] relative to the line's own position. Appends the new point at the end of the point list.
#desc If [param index] is given, the new point is inserted before the existing point identified by index [param index]. Every existing point starting from [param index] is shifted further down the list of points. The index must be greater than or equal to [code]0[/code] and must not exceed the number of existing points in the line. See [method get_point_count].
func add_point(position: Vector2, index: int = -1) -> void:
	pass;

#desc Removes all points from the line.
func clear_points() -> void:
	pass;

#desc Returns the number of points in the line.
func get_point_count() -> int:
	pass;

#desc Returns the position of the point at index [param index].
func get_point_position(index: int) -> Vector2:
	pass;

#desc Removes the point at index [param index] from the line.
func remove_point(index: int) -> void:
	pass;

#desc Overwrites the position of the point at index [param index] with the supplied [param position].
func set_point_position(index: int, position: Vector2) -> void:
	pass;


func get_antialiased() -> bool:
	return antialiased

func set_antialiased(value: bool) -> void:
	antialiased = value

func get_begin_cap_mode() -> int:
	return begin_cap_mode

func set_begin_cap_mode(value: int) -> void:
	begin_cap_mode = value

func get_default_color() -> Color:
	return default_color

func set_default_color(value: Color) -> void:
	default_color = value

func get_end_cap_mode() -> int:
	return end_cap_mode

func set_end_cap_mode(value: int) -> void:
	end_cap_mode = value

func get_gradient() -> Gradient:
	return gradient

func set_gradient(value: Gradient) -> void:
	gradient = value

func get_joint_mode() -> int:
	return joint_mode

func set_joint_mode(value: int) -> void:
	joint_mode = value

func get_points() -> PackedVector2Array:
	return points

func set_points(value: PackedVector2Array) -> void:
	points = value

func get_round_precision() -> int:
	return round_precision

func set_round_precision(value: int) -> void:
	round_precision = value

func get_sharp_limit() -> float:
	return sharp_limit

func set_sharp_limit(value: float) -> void:
	sharp_limit = value

func get_texture() -> Texture2D:
	return texture

func set_texture(value: Texture2D) -> void:
	texture = value

func get_texture_mode() -> int:
	return texture_mode

func set_texture_mode(value: int) -> void:
	texture_mode = value

func get_width() -> float:
	return width

func set_width(value: float) -> void:
	width = value

func get_curve() -> Curve:
	return width_curve

func set_curve(value: Curve) -> void:
	width_curve = value


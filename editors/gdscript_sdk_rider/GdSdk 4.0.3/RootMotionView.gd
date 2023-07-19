extends VisualInstance3D
#brief Editor-only helper for setting up root motion in [AnimationTree].
#desc [i]Root motion[/i] refers to an animation technique where a mesh's skeleton is used to give impulse to a character. When working with 3D animations, a popular technique is for animators to use the root skeleton bone to give motion to the rest of the skeleton. This allows animating characters in a way where steps actually match the floor below. It also allows precise interaction with objects during cinematics. See also [AnimationTree].
#desc [b]Note:[/b] [RootMotionView] is only visible in the editor. It will be hidden automatically in the running project.
#tutorial [Using AnimationTree - Root motion] https://docs.godotengine.org/en/stable/tutorials/animation/animation_tree.html#root-motion
class_name RootMotionView


#desc Path to an [AnimationTree] node to use as a basis for root motion.
var animation_path: NodePath:
	get = get_animation_path, set = set_animation_path

#desc The grid's cell size in 3D units.
var cell_size: float:
	get = get_cell_size, set = set_cell_size

#desc The grid's color.
var color: Color:
	get = get_color, set = set_color

#desc The grid's radius in 3D units. The grid's opacity will fade gradually as the distance from the origin increases until this [member radius] is reached.
var radius: float:
	get = get_radius, set = set_radius

#desc If [code]true[/code], the grid's points will all be on the same Y coordinate ([i]local[/i] Y = 0). If [code]false[/code], the points' original Y coordinate is preserved.
var zero_y: bool:
	get = get_zero_y, set = set_zero_y




func get_animation_path() -> NodePath:
	return animation_path

func set_animation_path(value: NodePath) -> void:
	animation_path = value

func get_cell_size() -> float:
	return cell_size

func set_cell_size(value: float) -> void:
	cell_size = value

func get_color() -> Color:
	return color

func set_color(value: Color) -> void:
	color = value

func get_radius() -> float:
	return radius

func set_radius(value: float) -> void:
	radius = value

func get_zero_y() -> bool:
	return zero_y

func set_zero_y(value: bool) -> void:
	zero_y = value


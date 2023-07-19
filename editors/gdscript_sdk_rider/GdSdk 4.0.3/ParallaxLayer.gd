extends Node2D
#brief A parallax scrolling layer to be used with [ParallaxBackground].
#desc A ParallaxLayer must be the child of a [ParallaxBackground] node. Each ParallaxLayer can be set to move at different speeds relative to the camera movement or the [member ParallaxBackground.scroll_offset] value.
#desc This node's children will be affected by its scroll offset.
#desc [b]Note:[/b] Any changes to this node's position and scale made after it enters the scene will be ignored.
class_name ParallaxLayer


#desc The ParallaxLayer's [Texture2D] mirroring. Useful for creating an infinite scrolling background. If an axis is set to [code]0[/code], the [Texture2D] will not be mirrored.
#desc If the length of the viewport axis is bigger than twice the mirrored axis size, it will not repeat infinitely, as the parallax layer only draws 2 instances of the texture at any one time.
var motion_mirroring: Vector2:
	get = get_mirroring, set = set_mirroring

#desc The ParallaxLayer's offset relative to the parent ParallaxBackground's [member ParallaxBackground.scroll_offset].
var motion_offset: Vector2:
	get = get_motion_offset, set = set_motion_offset

#desc Multiplies the ParallaxLayer's motion. If an axis is set to [code]0[/code], it will not scroll.
var motion_scale: Vector2:
	get = get_motion_scale, set = set_motion_scale




func get_mirroring() -> Vector2:
	return motion_mirroring

func set_mirroring(value: Vector2) -> void:
	motion_mirroring = value

func get_motion_offset() -> Vector2:
	return motion_offset

func set_motion_offset(value: Vector2) -> void:
	motion_offset = value

func get_motion_scale() -> Vector2:
	return motion_scale

func set_motion_scale(value: Vector2) -> void:
	motion_scale = value


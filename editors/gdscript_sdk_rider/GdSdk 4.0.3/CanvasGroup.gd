extends Node2D
#brief Merges several 2D nodes into a single draw operation.
#desc Child [CanvasItem] nodes of a [CanvasGroup] are drawn as a single object. It allows to e.g. draw overlapping translucent 2D nodes without blending (set [member CanvasItem.self_modulate] property of [CanvasGroup] to achieve this effect).
#desc [b]Note:[/b] The [CanvasGroup] uses a custom shader to read from the backbuffer to draw its children. Assigning a [Material] to the [CanvasGroup] overrides the builtin shader. To duplicate the behavior of the builtin shader in a custom [Shader] use the following:
#desc [codeblock]
#desc shader_type canvas_item;
#desc render_mode unshaded;
#desc 
#desc uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
#desc 
#desc void fragment() {
#desc vec4 c = textureLod(screen_texture, SCREEN_UV, 0.0);
#desc 
#desc if (c.a > 0.0001) {
#desc c.rgb /= c.a;
#desc }
#desc 
#desc COLOR *= c;
#desc }
#desc [/codeblock]
#desc [b]Note:[/b] Since [CanvasGroup] and [member CanvasItem.clip_children] both utilize the backbuffer, children of a [CanvasGroup] who have their [member CanvasItem.clip_children] set to anything other than [constant CanvasItem.CLIP_CHILDREN_DISABLED] will not function correctly.
class_name CanvasGroup


#desc Sets the size of the margin used to expand the clearing rect of this [CanvasGroup]. This expands the area of the backbuffer that will be used by the [CanvasGroup]. A smaller margin will reduce the area of the backbuffer used which can increase performance, however if [member use_mipmaps] is enabled, a small margin may result in mipmap errors at the edge of the [CanvasGroup]. Accordingly, this should be left as small as possible, but should be increased if artifacts appear along the edges of the canvas group.
var clear_margin: float:
	get = get_clear_margin, set = set_clear_margin

#desc Sets the size of a margin used to expand the drawable rect of this [CanvasGroup]. The size of the [CanvasGroup] is determined by fitting a rect around its children then expanding that rect by [member fit_margin]. This increases both the backbuffer area used and the area covered by the [CanvasGroup] both of which can reduce performance. This should be kept as small as possible and should only be expanded when an increased size is needed (e.g. for custom shader effects).
var fit_margin: float:
	get = get_fit_margin, set = set_fit_margin

#desc If [code]true[/code], calculates mipmaps for the backbuffer before drawing the [CanvasGroup] so that mipmaps can be used in a custom [ShaderMaterial] attached to the [CanvasGroup]. Generating mipmaps has a performance cost so this should not be enabled unless required.
var use_mipmaps: bool:
	get = is_using_mipmaps, set = set_use_mipmaps




func get_clear_margin() -> float:
	return clear_margin

func set_clear_margin(value: float) -> void:
	clear_margin = value

func get_fit_margin() -> float:
	return fit_margin

func set_fit_margin(value: float) -> void:
	fit_margin = value

func is_using_mipmaps() -> bool:
	return use_mipmaps

func set_use_mipmaps(value: bool) -> void:
	use_mipmaps = value


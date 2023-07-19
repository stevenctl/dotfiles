extends Viewport
#brief Creates a sub-view into the screen.
#desc [SubViewport] is a [Viewport] that isn't a [Window], i.e. it doesn't draw anything by itself. To display something, [SubViewport]'s [member size] must be non-zero and it should be either put inside a [SubViewportContainer] or assigned to a [ViewportTexture].
#tutorial [Using Viewports] https://docs.godotengine.org/en/stable/tutorials/rendering/viewports.html
#tutorial [Viewport and canvas transforms] https://docs.godotengine.org/en/stable/tutorials/2d/2d_transforms.html
#tutorial [GUI in 3D Demo] https://godotengine.org/asset-library/asset/127
#tutorial [3D in 2D Demo] https://godotengine.org/asset-library/asset/128
#tutorial [2D in 3D Demo] https://godotengine.org/asset-library/asset/129
#tutorial [Screen Capture Demo] https://godotengine.org/asset-library/asset/130
#tutorial [Dynamic Split Screen Demo] https://godotengine.org/asset-library/asset/541
#tutorial [3D Viewport Scaling Demo] https://godotengine.org/asset-library/asset/586
class_name SubViewport

#desc Always clear the render target before drawing.
#desc Never clear the render target.
#desc Clear the render target on the next frame, then switch to [constant CLEAR_MODE_NEVER].
#desc Do not update the render target.
#desc Update the render target once, then switch to [constant UPDATE_DISABLED].
#desc Update the render target only when it is visible. This is the default value.
#desc Update the render target only when its parent is visible.
#desc Always update the render target.

#enum ClearMode
enum {
    CLEAR_MODE_ALWAYS = 0,
    CLEAR_MODE_NEVER = 1,
    CLEAR_MODE_ONCE = 2,
}
#enum UpdateMode
enum {
    UPDATE_DISABLED = 0,
    UPDATE_ONCE = 1,
    UPDATE_WHEN_VISIBLE = 2,
    UPDATE_WHEN_PARENT_VISIBLE = 3,
    UPDATE_ALWAYS = 4,
}
#desc The clear mode when the sub-viewport is used as a render target.
#desc [b]Note:[/b] This property is intended for 2D usage.
var render_target_clear_mode: int:
	get = get_clear_mode, set = set_clear_mode

#desc The update mode when the sub-viewport is used as a render target.
var render_target_update_mode: int:
	get = get_update_mode, set = set_update_mode

#desc The width and height of the sub-viewport. Must be set to a value greater than or equal to 2 pixels on both dimensions. Otherwise, nothing will be displayed.
#desc [b]Note:[/b] If the parent node is a [SubViewportContainer] and its [member SubViewportContainer.stretch] is [code]true[/code], the viewport size cannot be changed manually.
var size: Vector2i:
	get = get_size, set = set_size

#desc The 2D size override of the sub-viewport. If either the width or height is [code]0[/code], the override is disabled.
var size_2d_override: Vector2i:
	get = get_size_2d_override, set = set_size_2d_override

#desc If [code]true[/code], the 2D size override affects stretch as well.
var size_2d_override_stretch: bool:
	get = is_size_2d_override_stretch_enabled, set = set_size_2d_override_stretch




func get_clear_mode() -> int:
	return render_target_clear_mode

func set_clear_mode(value: int) -> void:
	render_target_clear_mode = value

func get_update_mode() -> int:
	return render_target_update_mode

func set_update_mode(value: int) -> void:
	render_target_update_mode = value

func get_size() -> Vector2i:
	return size

func set_size(value: Vector2i) -> void:
	size = value

func get_size_2d_override() -> Vector2i:
	return size_2d_override

func set_size_2d_override(value: Vector2i) -> void:
	size_2d_override = value

func is_size_2d_override_stretch_enabled() -> bool:
	return size_2d_override_stretch

func set_size_2d_override_stretch(value: bool) -> void:
	size_2d_override_stretch = value


extends VisualInstance3D
#brief Detects approximately when the node is visible on screen.
#desc The VisibleOnScreenNotifier3D detects when it is visible on the screen. It also notifies when its bounding rectangle enters or exits the screen or a [Camera3D]'s view.
#desc If you want nodes to be disabled automatically when they exit the screen, use [VisibleOnScreenEnabler3D] instead.
#desc [b]Note:[/b] VisibleOnScreenNotifier3D uses the render culling code to determine whether it's visible on screen, which also means that its [member Node3D.visible] must be [code]true[/code] to work correctly.
class_name VisibleOnScreenNotifier3D

#desc Emitted when the VisibleOnScreenNotifier3D enters the screen.
signal screen_entered
#desc Emitted when the VisibleOnScreenNotifier3D exits the screen.
signal screen_exited

#desc The VisibleOnScreenNotifier3D's bounding box.
var aabb: AABB:
	get = get_aabb, set = set_aabb



#desc If [code]true[/code], the bounding box is on the screen.
#desc [b]Note:[/b] It takes one frame for the node's visibility to be assessed once added to the scene tree, so this method will return [code]false[/code] right after it is instantiated, even if it will be on screen in the draw pass.
func is_on_screen() -> bool:
	pass;


func get_aabb() -> AABB:
	return aabb

func set_aabb(value: AABB) -> void:
	aabb = value


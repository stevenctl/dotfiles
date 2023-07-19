extends Node2D
#brief Detects when the node extents are visible on screen.
#desc The VisibleOnScreenNotifier2D detects when it is visible on the screen. It also notifies when its bounding rectangle enters or exits the screen or a viewport.
#desc If you want nodes to be disabled automatically when they exit the screen, use [VisibleOnScreenEnabler2D] instead.
#desc [b]Note:[/b] VisibleOnScreenNotifier2D uses the render culling code to determine whether it's visible on screen, which also means that its [member CanvasItem.visible] must be [code]true[/code] to work correctly.
#tutorial [2D Dodge The Creeps Demo] https://godotengine.org/asset-library/asset/515
class_name VisibleOnScreenNotifier2D

#desc Emitted when the VisibleOnScreenNotifier2D enters the screen.
signal screen_entered
#desc Emitted when the VisibleOnScreenNotifier2D exits the screen.
signal screen_exited

#desc The VisibleOnScreenNotifier2D's bounding rectangle.
var rect: Rect2:
	get = get_rect, set = set_rect



#desc If [code]true[/code], the bounding rectangle is on the screen.
#desc [b]Note:[/b] It takes one frame for the node's visibility to be assessed once added to the scene tree, so this method will return [code]false[/code] right after it is instantiated, even if it will be on screen in the draw pass.
func is_on_screen() -> bool:
	pass;


func get_rect() -> Rect2:
	return rect

func set_rect(value: Rect2) -> void:
	rect = value


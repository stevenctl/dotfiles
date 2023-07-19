extends VisibleOnScreenNotifier2D
#brief Automatically disables another node if not visible on screen.
#desc VisibleOnScreenEnabler2D detects when it is visible on screen (just like [VisibleOnScreenNotifier2D]) and automatically enables or disables the target node. The target node is disabled when [VisibleOnScreenEnabler2D] is not visible on screen (including when [member CanvasItem.visible] is [code]false[/code]), and enabled when the enabler is visible. The disabling is achieved by changing [member Node.process_mode].
class_name VisibleOnScreenEnabler2D

#desc Corresponds to [constant Node.PROCESS_MODE_INHERIT].
#desc Corresponds to [constant Node.PROCESS_MODE_ALWAYS].
#desc Corresponds to [constant Node.PROCESS_MODE_WHEN_PAUSED].

#enum EnableMode
enum {
    ENABLE_MODE_INHERIT = 0,
    ENABLE_MODE_ALWAYS = 1,
    ENABLE_MODE_WHEN_PAUSED = 2,
}
#desc Determines how the node is enabled. Corresponds to [enum Node.ProcessMode]. Disabled node uses [constant Node.PROCESS_MODE_DISABLED].
var enable_mode: int:
	get = get_enable_mode, set = set_enable_mode

#desc The path to the target node, relative to the [VisibleOnScreenEnabler2D]. The target node is cached; it's only assigned when setting this property (if the [VisibleOnScreenEnabler2D] is inside scene tree) and every time the [VisibleOnScreenEnabler2D] enters the scene tree. If the path is invalid, nothing will happen.
var enable_node_path: NodePath:
	get = get_enable_node_path, set = set_enable_node_path




func get_enable_mode() -> int:
	return enable_mode

func set_enable_mode(value: int) -> void:
	enable_mode = value

func get_enable_node_path() -> NodePath:
	return enable_node_path

func set_enable_node_path(value: NodePath) -> void:
	enable_node_path = value


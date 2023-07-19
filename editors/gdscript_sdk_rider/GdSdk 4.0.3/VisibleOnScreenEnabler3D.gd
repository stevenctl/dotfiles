extends VisibleOnScreenNotifier3D
#brief Enables certain nodes only when approximately visible.
#desc The VisibleOnScreenEnabler3D will disable [RigidBody3D] and [AnimationPlayer] nodes when they are not visible. It will only affect other nodes within the same scene as the VisibleOnScreenEnabler3D itself.
#desc If you just want to receive notifications, use [VisibleOnScreenNotifier3D] instead.
#desc [b]Note:[/b] VisibleOnScreenEnabler3D uses an approximate heuristic for performance reasons. It doesn't take walls and other occlusion into account. The heuristic is an implementation detail and may change in future versions. If you need precise visibility checking, use another method such as adding an [Area3D] node as a child of a [Camera3D] node and/or [method Vector3.dot].
#desc [b]Note:[/b] VisibleOnScreenEnabler3D will not affect nodes added after scene initialization.
class_name VisibleOnScreenEnabler3D


#enum EnableMode
enum {
    ENABLE_MODE_INHERIT = 0,
    ENABLE_MODE_ALWAYS = 1,
    ENABLE_MODE_WHEN_PAUSED = 2,
}
var enable_mode: int:
	get = get_enable_mode, set = set_enable_mode

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


extends Node2D
#brief Generic 2D position hint for editing.
#desc Generic 2D position hint for editing. It's just like a plain [Node2D], but it displays as a cross in the 2D editor at all times. You can set cross' visual size by using the gizmo in the 2D editor while the node is selected.
class_name Marker2D


#desc Size of the gizmo cross that appears in the editor.
var gizmo_extents: float:
	get = get_gizmo_extents, set = set_gizmo_extents




func get_gizmo_extents() -> float:
	return gizmo_extents

func set_gizmo_extents(value: float) -> void:
	gizmo_extents = value


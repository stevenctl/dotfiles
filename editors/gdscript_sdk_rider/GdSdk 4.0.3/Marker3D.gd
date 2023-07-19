extends Node3D
#brief Generic 3D position hint for editing.
#desc Generic 3D position hint for editing. It's just like a plain [Node3D], but it displays as a cross in the 3D editor at all times.
class_name Marker3D


#desc Size of the gizmo cross that appears in the editor.
var gizmo_extents: float:
	get = get_gizmo_extents, set = set_gizmo_extents




func get_gizmo_extents() -> float:
	return gizmo_extents

func set_gizmo_extents(value: float) -> void:
	gizmo_extents = value


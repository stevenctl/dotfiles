extends PlaneMesh
#brief Class representing a square mesh facing the camera.
#desc Class representing a square [PrimitiveMesh]. This flat mesh does not have a thickness. By default, this mesh is aligned on the X and Y axes; this rotation is more suited for use with billboarded materials. A [QuadMesh] is equivalent to a [PlaneMesh] except its default [member PlaneMesh.orientation] is [constant PlaneMesh.FACE_Z].
#tutorial [GUI in 3D Demo] https://godotengine.org/asset-library/asset/127
#tutorial [2D in 3D Demo] https://godotengine.org/asset-library/asset/129
class_name QuadMesh


var orientation: int:
	get = get_orientation, set = set_orientation

var size: Vector2:
	get = get_size, set = set_size




func get_orientation() -> int:
	return orientation

func set_orientation(value: int) -> void:
	orientation = value

func get_size() -> Vector2:
	return size

func set_size(value: Vector2) -> void:
	size = value


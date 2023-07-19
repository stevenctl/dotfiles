extends Resource
#brief Represents a GLTF camera.
#desc Represents a camera as defined by the base GLTF spec.
#tutorial [GLTF camera detailed specification] https://registry.khronos.org/glTF/specs/2.0/glTF-2.0.html#reference-camera
#tutorial [GLTF camera spec and example file] https://github.com/KhronosGroup/glTF-Tutorials/blob/master/gltfTutorial/gltfTutorial_015_SimpleCameras.md
class_name GLTFCamera


#desc The distance to the far culling boundary for this camera relative to its local Z axis, in meters. This maps to GLTF's [code]zfar[/code] property.
var depth_far: float:
	get = get_depth_far, set = set_depth_far

#desc The distance to the near culling boundary for this camera relative to its local Z axis, in meters. This maps to GLTF's [code]znear[/code] property.
var depth_near: float:
	get = get_depth_near, set = set_depth_near

#desc The FOV of the camera. This class and GLTF define the camera FOV in radians, while Godot uses degrees. This maps to GLTF's [code]yfov[/code] property. This value is only used for perspective cameras, when [member perspective] is true.
var fov: float:
	get = get_fov, set = set_fov

#desc Whether or not the camera is in perspective mode. If false, the camera is in orthographic/orthogonal mode. This maps to GLTF's camera [code]type[/code] property. See [member Camera3D.projection] and the GLTF spec for more information.
var perspective: bool:
	get = get_perspective, set = set_perspective

#desc The size of the camera. This class and GLTF define the camera size magnitude as a radius in meters, while Godot defines it as a diameter in meters. This maps to GLTF's [code]ymag[/code] property. This value is only used for orthographic/orthogonal cameras, when [member perspective] is false.
var size_mag: float:
	get = get_size_mag, set = set_size_mag



#desc Creates a new GLTFCamera instance by parsing the given [Dictionary].
static func from_dictionary(dictionary: Dictionary) -> GLTFCamera:
	pass;

#desc Create a new GLTFCamera instance from the given Godot [Camera3D] node.
static func from_node(camera_node: Camera3D) -> GLTFCamera:
	pass;

#desc Serializes this GLTFCamera instance into a [Dictionary].
func to_dictionary() -> Dictionary:
	pass;

#desc Converts this GLTFCamera instance into a Godot [Camera3D] node.
func to_node() -> Camera3D:
	pass;


func get_depth_far() -> float:
	return depth_far

func set_depth_far(value: float) -> void:
	depth_far = value

func get_depth_near() -> float:
	return depth_near

func set_depth_near(value: float) -> void:
	depth_near = value

func get_fov() -> float:
	return fov

func set_fov(value: float) -> void:
	fov = value

func get_perspective() -> bool:
	return perspective

func set_perspective(value: bool) -> void:
	perspective = value

func get_size_mag() -> float:
	return size_mag

func set_size_mag(value: float) -> void:
	size_mag = value


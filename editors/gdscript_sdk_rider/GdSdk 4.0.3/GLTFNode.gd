extends Resource
#brief GLTF node class.
#desc Represents a GLTF node. GLTF nodes may have names, transforms, children (other GLTF nodes), and more specialized properties (represented by their own classes).
#desc GLTF nodes generally exist inside of [GLTFState] which represents all data of a GLTF file. Most of GLTFNode's properties are indices of other data in the GLTF file. You can extend a GLTF node with additional properties by using [method get_additional_data] and [method set_additional_data].
#tutorial [GLTF scene and node spec] https://github.com/KhronosGroup/glTF-Tutorials/blob/master/gltfTutorial/gltfTutorial_004_ScenesNodes.md"
class_name GLTFNode


#desc If this GLTF node is a camera, the index of the [GLTFCamera] in the [GLTFState] that describes the camera's properties. If -1, this node is not a camera.
var camera: int:
	get = get_camera, set = set_camera

#desc The indices of the children nodes in the [GLTFState]. If this GLTF node has no children, this will be an empty array.
var children: PackedInt32Array:
	get = get_children, set = set_children

#desc How deep into the node hierarchy this node is. A root node will have a height of 0, its children will have a height of 1, and so on. If -1, the height has not been calculated.
var height: int:
	get = get_height, set = set_height

#desc If this GLTF node is a light, the index of the [GLTFLight] in the [GLTFState] that describes the light's properties. If -1, this node is not a light.
var light: int:
	get = get_light, set = set_light

#desc If this GLTF node is a mesh, the index of the [GLTFMesh] in the [GLTFState] that describes the mesh's properties. If -1, this node is not a mesh.
var mesh: int:
	get = get_mesh, set = set_mesh

#desc The index of the parent node in the [GLTFState]. If -1, this node is a root node.
var parent: int:
	get = get_parent, set = set_parent

#desc The position of the GLTF node relative to its parent.
var position: Vector3:
	get = get_position, set = set_position

#desc The rotation of the GLTF node relative to its parent.
var rotation: Quaternion:
	get = get_rotation, set = set_rotation

#desc The scale of the GLTF node relative to its parent.
var scale: Vector3:
	get = get_scale, set = set_scale

#desc If this GLTF node has a skeleton, the index of the [GLTFSkeleton] in the [GLTFState] that describes the skeleton's properties. If -1, this node does not have a skeleton.
var skeleton: int:
	get = get_skeleton, set = set_skeleton

#desc If this GLTF node has a skin, the index of the [GLTFSkin] in the [GLTFState] that describes the skin's properties. If -1, this node does not have a skin.
var skin: int:
	get = get_skin, set = set_skin

#desc The transform of the GLTF node relative to its parent. This property is usually unused since the position, rotation, and scale properties are preferred.
var xform: Transform3D:
	get = get_xform, set = set_xform



#desc Gets additional arbitrary data in this [GLTFNode] instance. This can be used to keep per-node state data in [GLTFDocumentExtension] classes, which is important because they are stateless.
#desc The argument should be the [GLTFDocumentExtension] name (does not have to match the extension name in the GLTF file), and the return value can be anything you set. If nothing was set, the return value is null.
func get_additional_data(extension_name: StringName) -> Variant:
	pass;

#desc Sets additional arbitrary data in this [GLTFNode] instance. This can be used to keep per-node state data in [GLTFDocumentExtension] classes, which is important because they are stateless.
#desc The first argument should be the [GLTFDocumentExtension] name (does not have to match the extension name in the GLTF file), and the second argument can be anything you want.
func set_additional_data(extension_name: StringName, additional_data: Variant) -> void:
	pass;


func get_camera() -> int:
	return camera

func set_camera(value: int) -> void:
	camera = value

func get_children() -> PackedInt32Array:
	return children

func set_children(value: PackedInt32Array) -> void:
	children = value

func get_height() -> int:
	return height

func set_height(value: int) -> void:
	height = value

func get_light() -> int:
	return light

func set_light(value: int) -> void:
	light = value

func get_mesh() -> int:
	return mesh

func set_mesh(value: int) -> void:
	mesh = value

func get_parent() -> int:
	return parent

func set_parent(value: int) -> void:
	parent = value

func get_position() -> Vector3:
	return position

func set_position(value: Vector3) -> void:
	position = value

func get_rotation() -> Quaternion:
	return rotation

func set_rotation(value: Quaternion) -> void:
	rotation = value

func get_scale() -> Vector3:
	return scale

func set_scale(value: Vector3) -> void:
	scale = value

func get_skeleton() -> int:
	return skeleton

func set_skeleton(value: int) -> void:
	skeleton = value

func get_skin() -> int:
	return skin

func set_skin(value: int) -> void:
	skin = value

func get_xform() -> Transform3D:
	return xform

func set_xform(value: Transform3D) -> void:
	xform = value


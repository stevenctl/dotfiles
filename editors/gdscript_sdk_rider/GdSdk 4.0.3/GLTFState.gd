extends Resource
#brief Represents all data of a GLTF file.
#desc Contains all nodes and resources of a GLTF file. This is used by [GLTFDocument] as data storage, which allows [GLTFDocument] and all [GLTFDocumentExtension] classes to remain stateless.
#desc GLTFState can be populated by [GLTFDocument] reading a file or by converting a Godot scene. Then the data can either be used to create a Godot scene or save to a GLTF file. The code that converts to/from a Godot scene can be intercepted at arbitrary points by [GLTFDocumentExtension] classes. This allows for custom data to be stored in the GLTF file or for custom data to be converted to/from Godot nodes.
class_name GLTFState

#desc Discards all embedded textures and uses untextured materials.
const HANDLE_BINARY_DISCARD_TEXTURES = 0;

#desc Extracts embedded textures to be reimported and compressed. Editor only. Acts as uncompressed at runtime.
const HANDLE_BINARY_EXTRACT_TEXTURES = 1;

#desc Embeds textures VRAM compressed with Basis Universal into the generated scene.
const HANDLE_BINARY_EMBED_AS_BASISU = 2;

#desc Embeds textures compressed losslessly into the generated scene, matching old behavior.
const HANDLE_BINARY_EMBED_AS_UNCOMPRESSED = 3;


var base_path: String:
	get = get_base_path, set = set_base_path

var buffers: Array[PackedByteArray]:
	get = get_buffers, set = set_buffers

var create_animations: bool:
	get = get_create_animations, set = set_create_animations

var glb_data: PackedByteArray:
	get = get_glb_data, set = set_glb_data

var json: Dictionary:
	get = get_json, set = set_json

var major_version: int:
	get = get_major_version, set = set_major_version

var minor_version: int:
	get = get_minor_version, set = set_minor_version

#desc The root nodes of the GLTF file. Typically, a GLTF file will only have one scene, and therefore one root node. However, a GLTF file may have multiple scenes and therefore multiple root nodes, which will be generated as siblings of each other and as children of the root node of the generated Godot scene.
var root_nodes: PackedInt32Array:
	get = get_root_nodes, set = set_root_nodes

#desc The name of the scene. When importing, if not specified, this will be the file name. When exporting, if specified, the scene name will be saved to the GLTF file.
var scene_name: String:
	get = get_scene_name, set = set_scene_name

var use_named_skin_binds: bool:
	get = get_use_named_skin_binds, set = set_use_named_skin_binds



#desc Appends an extension to the list of extensions used by this GLTF file during serialization. If [param required] is true, the extension will also be added to the list of required extensions. Do not run this in [method GLTFDocumentExtension._export_post], as that stage is too late to add extensions. The final list is sorted alphabetically.
func add_used_extension(extension_name: String, required: bool) -> void:
	pass;

func get_accessors() -> Array[GLTFAccessor]:
	pass;

#desc Gets additional arbitrary data in this [GLTFState] instance. This can be used to keep per-file state data in [GLTFDocumentExtension] classes, which is important because they are stateless.
#desc The argument should be the [GLTFDocumentExtension] name (does not have to match the extension name in the GLTF file), and the return value can be anything you set. If nothing was set, the return value is null.
func get_additional_data(extension_name: StringName) -> Variant:
	pass;

#desc Returns the [AnimationPlayer] node with the given index. These nodes are only used during the export process when converting Godot [AnimationPlayer] nodes to GLTF animations.
func get_animation_player(idx: int) -> AnimationPlayer:
	pass;

#desc Returns the number of [AnimationPlayer] nodes in this [GLTFState]. These nodes are only used during the export process when converting Godot [AnimationPlayer] nodes to GLTF animations.
func get_animation_players_count(idx: int) -> int:
	pass;

#desc Returns an array of all [GLTFAnimation]s in the GLTF file. When importing, these will be generated as animations in an [AnimationPlayer] node. When exporting, these will be generated from Godot [AnimationPlayer] nodes.
func get_animations() -> Array[GLTFAnimation]:
	pass;

func get_buffer_views() -> Array[GLTFBufferView]:
	pass;

#desc Returns an array of all [GLTFCamera]s in the GLTF file. These are the cameras that the [member GLTFNode.camera] index refers to.
func get_cameras() -> Array[GLTFCamera]:
	pass;

func get_handle_binary_image() -> int:
	pass;

func get_images() -> Array[Texture2D]:
	pass;

#desc Returns an array of all [GLTFLight]s in the GLTF file. These are the lights that the [member GLTFNode.light] index refers to.
func get_lights() -> Array[GLTFLight]:
	pass;

func get_materials() -> Array[Material]:
	pass;

#desc Returns an array of all [GLTFMesh]es in the GLTF file. These are the meshes that the [member GLTFNode.mesh] index refers to.
func get_meshes() -> Array[GLTFMesh]:
	pass;

#desc Returns an array of all [GLTFNode]s in the GLTF file. These are the nodes that [member GLTFNode.children] and [member root_nodes] refer to. This includes nodes that may not be generated in the Godot scene, or nodes that may generate multiple Godot scene nodes.
func get_nodes() -> Array[GLTFNode]:
	pass;

#desc Returns the Godot scene node that corresponds to the same index as the [GLTFNode] it was generated from. Not every [GLTFNode] will have a scene node generated, and not every generated scene node will have a corresponding [GLTFNode].
func get_scene_node(idx: int) -> Node:
	pass;

#desc Returns an array of all [GLTFSkeleton]s in the GLTF file. These are the skeletons that the [member GLTFNode.skeleton] index refers to.
func get_skeletons() -> Array[GLTFSkeleton]:
	pass;

#desc Returns an array of all [GLTFSkin]s in the GLTF file. These are the skins that the [member GLTFNode.skin] index refers to.
func get_skins() -> Array[GLTFSkin]:
	pass;

#desc Retrieves the array of texture samplers that are used by the textures contained in the GLTF.
func get_texture_samplers() -> Array[GLTFTextureSampler]:
	pass;

func get_textures() -> Array[GLTFTexture]:
	pass;

#desc Returns an array of unique animation names. This is only used during the import process.
func get_unique_animation_names() -> Array[String]:
	pass;

#desc Returns an array of unique node names. This is used in both the import process and export process.
func get_unique_names() -> Array[String]:
	pass;

func set_accessors(accessors: GLTFAccessor[]) -> void:
	pass;

#desc Sets additional arbitrary data in this [GLTFState] instance. This can be used to keep per-file state data in [GLTFDocumentExtension] classes, which is important because they are stateless.
#desc The first argument should be the [GLTFDocumentExtension] name (does not have to match the extension name in the GLTF file), and the second argument can be anything you want.
func set_additional_data(extension_name: StringName, additional_data: Variant) -> void:
	pass;

#desc Sets the [GLTFAnimation]s in the state. When importing, these will be generated as animations in an [AnimationPlayer] node. When exporting, these will be generated from Godot [AnimationPlayer] nodes.
func set_animations(animations: GLTFAnimation[]) -> void:
	pass;

func set_buffer_views(buffer_views: GLTFBufferView[]) -> void:
	pass;

#desc Sets the [GLTFCamera]s in the state. These are the cameras that the [member GLTFNode.camera] index refers to.
func set_cameras(cameras: GLTFCamera[]) -> void:
	pass;

func set_handle_binary_image(method: int) -> void:
	pass;

func set_images(images: Texture2D[]) -> void:
	pass;

#desc Sets the [GLTFLight]s in the state. These are the lights that the [member GLTFNode.light] index refers to.
func set_lights(lights: GLTFLight[]) -> void:
	pass;

func set_materials(materials: Material[]) -> void:
	pass;

#desc Sets the [GLTFMesh]es in the state. These are the meshes that the [member GLTFNode.mesh] index refers to.
func set_meshes(meshes: GLTFMesh[]) -> void:
	pass;

#desc Sets the [GLTFNode]s in the state. These are the nodes that [member GLTFNode.children] and [member root_nodes] refer to. Some of the nodes set here may not be generated in the Godot scene, or may generate multiple Godot scene nodes.
func set_nodes(nodes: GLTFNode[]) -> void:
	pass;

#desc Sets the [GLTFSkeleton]s in the state. These are the skeletons that the [member GLTFNode.skeleton] index refers to.
func set_skeletons(skeletons: GLTFSkeleton[]) -> void:
	pass;

#desc Sets the [GLTFSkin]s in the state. These are the skins that the [member GLTFNode.skin] index refers to.
func set_skins(skins: GLTFSkin[]) -> void:
	pass;

#desc Sets the array of texture samplers that are used by the textures contained in the GLTF.
func set_texture_samplers(texture_samplers: GLTFTextureSampler[]) -> void:
	pass;

func set_textures(textures: GLTFTexture[]) -> void:
	pass;

#desc Sets the unique animation names in the state. This is only used during the import process.
func set_unique_animation_names(unique_animation_names: String[]) -> void:
	pass;

#desc Sets the unique node names in the state. This is used in both the import process and export process.
func set_unique_names(unique_names: String[]) -> void:
	pass;


func get_base_path() -> String:
	return base_path

func set_base_path(value: String) -> void:
	base_path = value

func get_buffers() -> Array[PackedByteArray]:
	return buffers

func set_buffers(value: Array[PackedByteArray]) -> void:
	buffers = value

func get_create_animations() -> bool:
	return create_animations

func set_create_animations(value: bool) -> void:
	create_animations = value

func get_glb_data() -> PackedByteArray:
	return glb_data

func set_glb_data(value: PackedByteArray) -> void:
	glb_data = value

func get_json() -> Dictionary:
	return json

func set_json(value: Dictionary) -> void:
	json = value

func get_major_version() -> int:
	return major_version

func set_major_version(value: int) -> void:
	major_version = value

func get_minor_version() -> int:
	return minor_version

func set_minor_version(value: int) -> void:
	minor_version = value

func get_root_nodes() -> PackedInt32Array:
	return root_nodes

func set_root_nodes(value: PackedInt32Array) -> void:
	root_nodes = value

func get_scene_name() -> String:
	return scene_name

func set_scene_name(value: String) -> void:
	scene_name = value

func get_use_named_skin_binds() -> bool:
	return use_named_skin_binds

func set_use_named_skin_binds(value: bool) -> void:
	use_named_skin_binds = value


extends Resource
#desc Append a glTF2 3d format from a file, buffer or scene and then write to the filesystem, buffer or scene.
class_name GLTFDocument




#desc Takes a [PackedByteArray] defining a GLTF and imports the data to the given [GLTFState] object through the [param state] parameter.
#desc [b]Note:[/b] The [param base_path] tells [method append_from_buffer] where to find dependencies and can be empty.
func append_from_buffer(bytes: PackedByteArray, base_path: String, state: GLTFState, flags: int = 0) -> int:
	pass;

#desc Takes a path to a GLTF file and imports the data at that file path to the given [GLTFState] object through the [param state] parameter.
#desc [b]Note:[/b] The [param base_path] tells [method append_from_file] where to find dependencies and can be empty.
func append_from_file(path: String, state: GLTFState, flags: int = 0, base_path: String = "") -> int:
	pass;

#desc Takes a Godot Engine scene node and exports it and its descendants to the given [GLTFState] object through the [param state] parameter.
func append_from_scene(node: Node, state: GLTFState, flags: int = 0) -> int:
	pass;

#desc Takes a [GLTFState] object through the [param state] parameter and returns a GLTF [PackedByteArray].
func generate_buffer(state: GLTFState) -> PackedByteArray:
	pass;

#desc Takes a [GLTFState] object through the [param state] parameter and returns a Godot Engine scene node.
func generate_scene(state: GLTFState, bake_fps: float = 30, trimming: bool = false, remove_immutable_tracks: bool = true) -> Node:
	pass;

#desc Registers the given [GLTFDocumentExtension] instance with GLTFDocument. If [param first_priority] is true, this extension will be run first. Otherwise, it will be run last.
#desc [b]Note:[/b] Like GLTFDocument itself, all GLTFDocumentExtension classes must be stateless in order to function properly. If you need to store data, use the [code]set_additional_data[/code] and [code]get_additional_data[/code] methods in [GLTFState] or [GLTFNode].
static func register_gltf_document_extension(extension: GLTFDocumentExtension, first_priority: bool = false) -> void:
	pass;

#desc Unregisters the given [GLTFDocumentExtension] instance.
static func unregister_gltf_document_extension(extension: GLTFDocumentExtension) -> void:
	pass;

#desc Takes a [GLTFState] object through the [param state] parameter and writes a glTF file to the filesystem.
#desc [b]Note:[/b] The extension of the glTF file determines if it is a .glb binary file or a .gltf file.
func write_to_filesystem(state: GLTFState, path: String) -> int:
	pass;



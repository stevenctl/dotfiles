extends Resource
#brief [GLTFDocument] extension class.
#desc Extends the functionality of the [GLTFDocument] class by allowing you to run arbitrary code at various stages of GLTF import or export.
#desc To use, make a new class extending GLTFDocumentExtension, override any methods you need, make an instance of your class, and register it using [method GLTFDocument.register_gltf_document_extension].
#desc [b]Note:[/b] Like GLTFDocument itself, all GLTFDocumentExtension classes must be stateless in order to function properly. If you need to store data, use the [code]set_additional_data[/code] and [code]get_additional_data[/code] methods in [GLTFState] or [GLTFNode].
class_name GLTFDocumentExtension




#desc Part of the export process. This method is run after [method _export_preflight] and before [method _export_node].
#desc Runs when converting the data from a Godot scene node. This method can be used to process the Godot scene node data into a format that can be used by [method _export_node].
func _convert_scene_node(state: GLTFState, gltf_node: GLTFNode, scene_node: Node) -> void:
	pass;

#desc Part of the export process. This method is run after [method _convert_scene_node] and before [method _export_post].
#desc This method can be used to modify the final JSON of each node.
func _export_node(state: GLTFState, gltf_node: GLTFNode, json: Dictionary, node: Node) -> int:
	pass;

#desc Part of the export process. This method is run last, after all other parts of the export process.
#desc This method can be used to modify the final JSON of the generated GLTF file.
func _export_post(state: GLTFState) -> int:
	pass;

#desc Part of the export process. This method is run first, before all other parts of the export process.
#desc The return value is used to determine if this [GLTFDocumentExtension] instance should be used for exporting a given GLTF file. If [constant OK], the export will use this [GLTFDocumentExtension] instance. If not overridden, [constant OK] is returned.
func _export_preflight(state: GLTFState, root: Node) -> int:
	pass;

#desc Part of the import process. This method is run after [method _parse_node_extensions] and before [method _import_post_parse].
#desc Runs when generating a Godot scene node from a GLTFNode. The returned node will be added to the scene tree. Multiple nodes can be generated in this step if they are added as a child of the returned node.
func _generate_scene_node(state: GLTFState, gltf_node: GLTFNode, scene_parent: Node) -> Node3D:
	pass;

#desc Part of the import process. This method is run after [method _import_preflight] and before [method _parse_node_extensions].
#desc Returns an array of the GLTF extensions supported by this GLTFDocumentExtension class. This is used to validate if a GLTF file with required extensions can be loaded.
func _get_supported_extensions() -> PackedStringArray:
	pass;

#desc Part of the import process. This method is run after [method _import_post_parse] and before [method _import_post].
#desc This method can be used to make modifications to each of the generated Godot scene nodes.
func _import_node(state: GLTFState, gltf_node: GLTFNode, json: Dictionary, node: Node) -> int:
	pass;

#desc Part of the import process. This method is run last, after all other parts of the import process.
#desc This method can be used to modify the final Godot scene generated by the import process.
func _import_post(state: GLTFState, root: Node) -> int:
	pass;

#desc Part of the import process. This method is run after [method _generate_scene_node] and before [method _import_node].
#desc This method can be used to modify any of the data imported so far, including any scene nodes, before running the final per-node import step.
func _import_post_parse(state: GLTFState) -> int:
	pass;

#desc Part of the import process. This method is run first, before all other parts of the import process.
#desc The return value is used to determine if this [GLTFDocumentExtension] instance should be used for importing a given GLTF file. If [constant OK], the import will use this [GLTFDocumentExtension] instance. If not overridden, [constant OK] is returned.
func _import_preflight(state: GLTFState, extensions: PackedStringArray) -> int:
	pass;

#desc Part of the import process. This method is run after [method _get_supported_extensions] and before [method _generate_scene_node].
#desc Runs when parsing the node extensions of a GLTFNode. This method can be used to process the extension JSON data into a format that can be used by [method _generate_scene_node]. The return value should be a member of the [enum Error] enum.
func _parse_node_extensions(state: GLTFState, gltf_node: GLTFNode, extensions: Dictionary) -> int:
	pass;



extends Node2D
#brief Node that instances a [MultiMesh] in 2D.
#desc [MultiMeshInstance2D] is a specialized node to instance a [MultiMesh] resource in 2D.
#desc Usage is the same as [MultiMeshInstance3D].
class_name MultiMeshInstance2D

#desc Emitted when the [member texture] is changed.
signal texture_changed

#desc The [MultiMesh] that will be drawn by the [MultiMeshInstance2D].
var multimesh: MultiMesh:
	get = get_multimesh, set = set_multimesh

#desc The [Texture2D] that will be used if using the default [CanvasItemMaterial]. Can be accessed as [code]TEXTURE[/code] in CanvasItem shader.
var texture: Texture2D:
	get = get_texture, set = set_texture




func get_multimesh() -> MultiMesh:
	return multimesh

func set_multimesh(value: MultiMesh) -> void:
	multimesh = value

func get_texture() -> Texture2D:
	return texture

func set_texture(value: Texture2D) -> void:
	texture = value


extends Node2D
#brief Node used for displaying a [Mesh] in 2D.
#desc Node used for displaying a [Mesh] in 2D. A [MeshInstance2D] can be automatically created from an existing [Sprite2D] via a tool in the editor toolbar. Select the [Sprite2D] node, then choose [b]Sprite2D > Convert to MeshInstance2D[/b] at the top of the 2D editor viewport.
#tutorial [2D meshes] https://docs.godotengine.org/en/stable/tutorials/2d/2d_meshes.html
class_name MeshInstance2D

#desc Emitted when the [member texture] is changed.
signal texture_changed

#desc The [Mesh] that will be drawn by the [MeshInstance2D].
var mesh: Mesh:
	get = get_mesh, set = set_mesh

#desc The [Texture2D] that will be used if using the default [CanvasItemMaterial]. Can be accessed as [code]TEXTURE[/code] in CanvasItem shader.
var texture: Texture2D:
	get = get_texture, set = set_texture




func get_mesh() -> Mesh:
	return mesh

func set_mesh(value: Mesh) -> void:
	mesh = value

func get_texture() -> Texture2D:
	return texture

func set_texture(value: Texture2D) -> void:
	texture = value


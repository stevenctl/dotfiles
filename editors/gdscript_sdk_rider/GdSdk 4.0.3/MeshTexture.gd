extends Texture2D
#brief Simple texture that uses a mesh to draw itself.
#desc Simple texture that uses a mesh to draw itself. It's limited because flags can't be changed and region drawing is not supported.
class_name MeshTexture


#desc Sets the base texture that the Mesh will use to draw.
var base_texture: Texture2D:
	get = get_base_texture, set = set_base_texture

#desc Sets the size of the image, needed for reference.
var image_size: Vector2:
	get = get_image_size, set = set_image_size

#desc Sets the mesh used to draw. It must be a mesh using 2D vertices.
var mesh: Mesh:
	get = get_mesh, set = set_mesh

var resource_local_to_scene: bool:
	get = is_local_to_scene, set = set_local_to_scene




func get_base_texture() -> Texture2D:
	return base_texture

func set_base_texture(value: Texture2D) -> void:
	base_texture = value

func get_image_size() -> Vector2:
	return image_size

func set_image_size(value: Vector2) -> void:
	image_size = value

func get_mesh() -> Mesh:
	return mesh

func set_mesh(value: Mesh) -> void:
	mesh = value

func is_local_to_scene() -> bool:
	return resource_local_to_scene

func set_local_to_scene(value: bool) -> void:
	resource_local_to_scene = value


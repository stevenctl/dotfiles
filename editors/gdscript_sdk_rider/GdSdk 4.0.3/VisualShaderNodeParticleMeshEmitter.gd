extends VisualShaderNodeParticleEmitter
#brief A visual shader node that makes particles emitted in a shape defined by a [Mesh].
#desc [VisualShaderNodeParticleEmitter] that makes the particles emitted in a shape of the assigned [member mesh]. It will emit from the mesh's surfaces, either all or only the specified one.
class_name VisualShaderNodeParticleMeshEmitter


#desc The [Mesh] that defines emission shape.
var mesh: Mesh:
	get = get_mesh, set = set_mesh

#desc Index of the surface that emits particles. [member use_all_surfaces] must be [code]false[/code] for this to take effect.
var surface_index: int:
	get = get_surface_index, set = set_surface_index

#desc If [code]true[/code], the particles will emit from all surfaces of the mesh.
var use_all_surfaces: bool:
	get = is_use_all_surfaces, set = set_use_all_surfaces




func get_mesh() -> Mesh:
	return mesh

func set_mesh(value: Mesh) -> void:
	mesh = value

func get_surface_index() -> int:
	return surface_index

func set_surface_index(value: int) -> void:
	surface_index = value

func is_use_all_surfaces() -> bool:
	return use_all_surfaces

func set_use_all_surfaces(value: bool) -> void:
	use_all_surfaces = value


extends GPUParticlesAttractor3D
#brief Box-shaped 3D particle attractor affecting [GPUParticles3D] nodes.
#desc Box-shaped 3D particle attractor affecting [GPUParticles3D] nodes.
#desc [b]Note:[/b] Particle attractors only affect [GPUParticles3D], not [CPUParticles3D].
class_name GPUParticlesAttractorBox3D


#desc The attractor box's size in 3D units.
var size: Vector3:
	get = get_size, set = set_size




func get_size() -> Vector3:
	return size

func set_size(value: Vector3) -> void:
	size = value


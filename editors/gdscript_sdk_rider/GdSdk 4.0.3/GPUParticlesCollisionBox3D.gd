extends GPUParticlesCollision3D
#brief Box-shaped 3D particle collision shape affecting [GPUParticles3D] nodes.
#desc Box-shaped 3D particle collision shape affecting [GPUParticles3D] nodes.
#desc [b]Note:[/b] [member ParticleProcessMaterial.collision_mode] must be [constant ParticleProcessMaterial.COLLISION_RIGID] or [constant ParticleProcessMaterial.COLLISION_HIDE_ON_CONTACT] on the [GPUParticles3D]'s process material for collision to work.
#desc [b]Note:[/b] Particle collision only affects [GPUParticles3D], not [CPUParticles3D].
class_name GPUParticlesCollisionBox3D


#desc The collision box's size in 3D units.
var size: Vector3:
	get = get_size, set = set_size




func get_size() -> Vector3:
	return size

func set_size(value: Vector3) -> void:
	size = value


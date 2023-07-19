extends GPUParticlesAttractor3D
#brief Box-shaped 3D particle attractor with strength varying within the box, affecting [GPUParticles3D] nodes.
#desc Box-shaped 3D particle attractor with strength varying within the box, affecting [GPUParticles3D] nodes.
#desc Unlike [GPUParticlesAttractorBox3D], [GPUParticlesAttractorVectorField3D] uses a [member texture] to affect attraction strength within the box. This can be used to create complex attraction scenarios where particles travel in different directions depending on their location. This can be useful for weather effects such as sandstorms.
#desc [b]Note:[/b] Particle attractors only affect [GPUParticles3D], not [CPUParticles3D].
class_name GPUParticlesAttractorVectorField3D


#desc The size of the vector field box in 3D units.
var size: Vector3:
	get = get_size, set = set_size

#desc The 3D texture to be used. Values are linearly interpolated between the texture's pixels.
#desc [b]Note:[/b] To get better performance, the 3D texture's resolution should reflect the [member size] of the attractor. Since particle attraction is usually low-frequency data, the texture can be kept at a low resolution such as 64×64×64.
var texture: Texture3D:
	get = get_texture, set = set_texture




func get_size() -> Vector3:
	return size

func set_size(value: Vector3) -> void:
	size = value

func get_texture() -> Texture3D:
	return texture

func set_texture(value: Texture3D) -> void:
	texture = value


extends GPUParticlesCollision3D
#brief Real-time heightmap-shaped 3D particle attractor affecting [GPUParticles3D] nodes.
#desc Real-time heightmap-shaped 3D particle attractor affecting [GPUParticles3D] nodes.
#desc Heightmap shapes allow for efficiently representing collisions for convex and concave objects with a single "floor" (such as terrain). This is less flexible than [GPUParticlesCollisionSDF3D], but it doesn't require a baking step.
#desc [GPUParticlesCollisionHeightField3D] can also be regenerated in real-time when it is moved, when the camera moves, or even continuously. This makes [GPUParticlesCollisionHeightField3D] a good choice for weather effects such as rain and snow and games with highly dynamic geometry. However, since heightmaps cannot represent overhangs, [GPUParticlesCollisionHeightField3D] is not suited for indoor particle collision.
#desc [b]Note:[/b] [member ParticleProcessMaterial.collision_mode] must be [code]true[/code] on the [GPUParticles3D]'s process material for collision to work.
#desc [b]Note:[/b] Particle collision only affects [GPUParticles3D], not [CPUParticles3D].
class_name GPUParticlesCollisionHeightField3D

#desc Generate a 256×256 heightmap. Intended for small-scale scenes, or larger scenes with no distant particles.
#desc Generate a 512×512 heightmap. Intended for medium-scale scenes, or larger scenes with no distant particles.
#desc Generate a 1024×1024 heightmap. Intended for large scenes with distant particles.
#desc Generate a 2048×2048 heightmap. Intended for very large scenes with distant particles.
#desc Generate a 4096×4096 heightmap. Intended for huge scenes with distant particles.
#desc Generate a 8192×8192 heightmap. Intended for gigantic scenes with distant particles.
#desc Represents the size of the [enum Resolution] enum.
#desc Only update the heightmap when the [GPUParticlesCollisionHeightField3D] node is moved, or when the camera moves if [member follow_camera_enabled] is [code]true[/code]. An update can be forced by slightly moving the [GPUParticlesCollisionHeightField3D] in any direction, or by calling [method RenderingServer.particles_collision_height_field_update].
#desc Update the heightmap every frame. This has a significant performance cost. This update should only be used when geometry that particles can collide with changes significantly during gameplay.

#enum Resolution
enum {
    RESOLUTION_256 = 0,
    RESOLUTION_512 = 1,
    RESOLUTION_1024 = 2,
    RESOLUTION_2048 = 3,
    RESOLUTION_4096 = 4,
    RESOLUTION_8192 = 5,
    RESOLUTION_MAX = 6,
}
#enum UpdateMode
enum {
    UPDATE_MODE_WHEN_MOVED = 0,
    UPDATE_MODE_ALWAYS = 1,
}
#desc If [code]true[/code], the [GPUParticlesCollisionHeightField3D] will follow the current camera in global space. The [GPUParticlesCollisionHeightField3D] does not need to be a child of the [Camera3D] node for this to work.
#desc Following the camera has a performance cost, as it will force the heightmap to update whenever the camera moves. Consider lowering [member resolution] to improve performance if [member follow_camera_enabled] is [code]true[/code].
var follow_camera_enabled: bool:
	get = is_follow_camera_enabled, set = set_follow_camera_enabled

#desc Higher resolutions can represent small details more accurately in large scenes, at the cost of lower performance. If [member update_mode] is [constant UPDATE_MODE_ALWAYS], consider using the lowest resolution possible.
var resolution: int:
	get = get_resolution, set = set_resolution

#desc The collision heightmap's size in 3D units. To improve heightmap quality, [member size] should be set as small as possible while covering the parts of the scene you need.
var size: Vector3:
	get = get_size, set = set_size

#desc The update policy to use for the generated heightmap.
var update_mode: int:
	get = get_update_mode, set = set_update_mode




func is_follow_camera_enabled() -> bool:
	return follow_camera_enabled

func set_follow_camera_enabled(value: bool) -> void:
	follow_camera_enabled = value

func get_resolution() -> int:
	return resolution

func set_resolution(value: int) -> void:
	resolution = value

func get_size() -> Vector3:
	return size

func set_size(value: Vector3) -> void:
	size = value

func get_update_mode() -> int:
	return update_mode

func set_update_mode(value: int) -> void:
	update_mode = value


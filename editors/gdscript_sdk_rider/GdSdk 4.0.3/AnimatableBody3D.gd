extends StaticBody3D
#brief Physics body for 3D physics which moves only by script or animation (while affecting other bodies on its path). Useful for moving platforms and doors.
#desc Animatable body for 3D physics.
#desc An animatable body can't be moved by external forces or contacts, but can be moved by script or animation to affect other bodies in its path. It is ideal for implementing moving objects in the environment, such as moving platforms or doors.
#desc When the body is moved manually, either from code or from an [AnimationPlayer] (with [member AnimationPlayer.playback_process_mode] set to [code]physics[/code]), the physics will automatically compute an estimate of their linear and angular velocity. This makes them very useful for moving platforms or other AnimationPlayer-controlled objects (like a door, a bridge that opens, etc).
#desc [b]Warning:[/b] With a non-uniform scale this node will probably not function as expected. Please make sure to keep its scale uniform (i.e. the same on all axes), and change the size(s) of its collision shape(s) instead.
#tutorial [3D Physics Tests Demo] https://godotengine.org/asset-library/asset/675
#tutorial [Third Person Shooter Demo] https://godotengine.org/asset-library/asset/678
#tutorial [3D Voxel Demo] https://godotengine.org/asset-library/asset/676
class_name AnimatableBody3D


#desc If [code]true[/code], the body's movement will be synchronized to the physics frame. This is useful when animating movement via [AnimationPlayer], for example on moving platforms. Do [b]not[/b] use together with [method PhysicsBody3D.move_and_collide].
var sync_to_physics: bool:
	get = is_sync_to_physics_enabled, set = set_sync_to_physics




func is_sync_to_physics_enabled() -> bool:
	return sync_to_physics

func set_sync_to_physics(value: bool) -> void:
	sync_to_physics = value


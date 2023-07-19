extends CollisionObject3D
#brief 3D area for detection, as well as physics and audio influence.
#desc 3D area that detects [CollisionObject3D] nodes overlapping, entering, or exiting. Can also alter or override local physics parameters (gravity, damping) and route audio to custom audio buses.
#desc To give the area its shape, add a [CollisionShape3D] or a [CollisionPolygon3D] node as a [i]direct[/i] child (or add multiple such nodes as direct children) of the area.
#desc [b]Warning:[/b] See [ConcavePolygonShape3D] (also called "trimesh") for a warning about possibly unexpected behavior when using that shape for an area.
#desc [b]Warning:[/b] With a non-uniform scale this node will probably not function as expected. Please make sure to keep its scale uniform (i.e. the same on all axes), and change the size(s) of its collision shape(s) instead.
#tutorial [3D Platformer Demo] https://godotengine.org/asset-library/asset/125
#tutorial [GUI in 3D Demo] https://godotengine.org/asset-library/asset/127
class_name Area3D

#desc Emitted when the received [param area] enters this area. Requires [member monitoring] to be set to [code]true[/code].
signal area_entered(area: Area3D)
#desc Emitted when the received [param area] exits this area. Requires [member monitoring] to be set to [code]true[/code].
signal area_exited(area: Area3D)
#desc Emitted when a [Shape3D] of the received [param area] enters a shape of this area. Requires [member monitoring] to be set to [code]true[/code].
#desc [param local_shape_index] and [param area_shape_index] contain indices of the interacting shapes from this area and the other area, respectively. [param area_rid] contains the [RID] of the other area. These values can be used with the [PhysicsServer3D].
#desc [b]Example of getting the[/b] [CollisionShape3D] [b]node from the shape index:[/b]
#desc [codeblocks]
#desc [gdscript]
#desc var other_shape_owner = area.shape_find_owner(area_shape_index)
#desc var other_shape_node = area.shape_owner_get_owner(other_shape_owner)
#desc 
#desc var local_shape_owner = shape_find_owner(local_shape_index)
#desc var local_shape_node = shape_owner_get_owner(local_shape_owner)
#desc [/gdscript]
#desc [/codeblocks]
signal area_shape_entered(area_rid: RID, area: Area3D, area_shape_index: int, local_shape_index: int)
#desc Emitted when a [Shape3D] of the received [param area] exits a shape of this area. Requires [member monitoring] to be set to [code]true[/code].
#desc See also [signal area_shape_entered].
signal area_shape_exited(area_rid: RID, area: Area3D, area_shape_index: int, local_shape_index: int)
#desc Emitted when the received [param body] enters this area. [param body] can be a [PhysicsBody3D] or a [GridMap]. [GridMap]s are detected if their [MeshLibrary] has collision shapes configured. Requires [member monitoring] to be set to [code]true[/code].
signal body_entered(body: Node3D)
#desc Emitted when the received [param body] exits this area. [param body] can be a [PhysicsBody3D] or a [GridMap]. [GridMap]s are detected if their [MeshLibrary] has collision shapes configured. Requires [member monitoring] to be set to [code]true[/code].
signal body_exited(body: Node3D)
#desc Emitted when a [Shape3D] of the received [param body] enters a shape of this area. [param body] can be a [PhysicsBody3D] or a [GridMap]. [GridMap]s are detected if their [MeshLibrary] has collision shapes configured. Requires [member monitoring] to be set to [code]true[/code].
#desc [param local_shape_index] and [param body_shape_index] contain indices of the interacting shapes from this area and the interacting body, respectively. [param body_rid] contains the [RID] of the body. These values can be used with the [PhysicsServer3D].
#desc [b]Example of getting the[/b] [CollisionShape3D] [b]node from the shape index:[/b]
#desc [codeblocks]
#desc [gdscript]
#desc var body_shape_owner = body.shape_find_owner(body_shape_index)
#desc var body_shape_node = body.shape_owner_get_owner(body_shape_owner)
#desc 
#desc var local_shape_owner = shape_find_owner(local_shape_index)
#desc var local_shape_node = shape_owner_get_owner(local_shape_owner)
#desc [/gdscript]
#desc [/codeblocks]
signal body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int)
#desc Emitted when a [Shape3D] of the received [param body] exits a shape of this area. [param body] can be a [PhysicsBody3D] or a [GridMap]. [GridMap]s are detected if their [MeshLibrary] has collision shapes configured. Requires [member monitoring] to be set to [code]true[/code].
#desc See also [signal body_shape_entered].
signal body_shape_exited(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int)
#desc This area does not affect gravity/damping.
#desc This area adds its gravity/damping values to whatever has been calculated so far (in [member priority] order).
#desc This area adds its gravity/damping values to whatever has been calculated so far (in [member priority] order), ignoring any lower priority areas.
#desc This area replaces any gravity/damping, even the defaults, ignoring any lower priority areas.
#desc This area replaces any gravity/damping calculated so far (in [member priority] order), but keeps calculating the rest of the areas.

#enum SpaceOverride
enum {
    SPACE_OVERRIDE_DISABLED = 0,
    SPACE_OVERRIDE_COMBINE = 1,
    SPACE_OVERRIDE_COMBINE_REPLACE = 2,
    SPACE_OVERRIDE_REPLACE = 3,
    SPACE_OVERRIDE_REPLACE_COMBINE = 4,
}
#desc The rate at which objects stop spinning in this area. Represents the angular velocity lost per second.
#desc See [member ProjectSettings.physics/3d/default_angular_damp] for more details about damping.
var angular_damp: float:
	get = get_angular_damp, set = set_angular_damp

#desc Override mode for angular damping calculations within this area. See [enum SpaceOverride] for possible values.
var angular_damp_space_override: int:
	get = get_angular_damp_space_override_mode, set = set_angular_damp_space_override_mode

#desc The name of the area's audio bus.
var audio_bus_name: StringName:
	get = get_audio_bus_name, set = set_audio_bus_name

#desc If [code]true[/code], the area's audio bus overrides the default audio bus.
var audio_bus_override: bool:
	get = is_overriding_audio_bus, set = set_audio_bus_override

#desc The area's gravity intensity (in meters per second squared). This value multiplies the gravity direction. This is useful to alter the force of gravity without altering its direction.
var gravity: float:
	get = get_gravity, set = set_gravity

#desc The area's gravity vector (not normalized).
var gravity_direction: Vector3:
	get = get_gravity_direction, set = set_gravity_direction

#desc If [code]true[/code], gravity is calculated from a point (set via [member gravity_point_center]). See also [member gravity_space_override].
var gravity_point: bool:
	get = is_gravity_a_point, set = set_gravity_is_point

#desc If gravity is a point (see [member gravity_point]), this will be the point of attraction.
var gravity_point_center: Vector3:
	get = get_gravity_point_center, set = set_gravity_point_center

#desc The distance at which the gravity strength is equal to [member gravity]. For example, on a planet 100 meters in radius with a surface gravity of 4.0 m/s², set the [member gravity] to 4.0 and the unit distance to 100.0. The gravity will have falloff according to the inverse square law, so in the example, at 200 meters from the center the gravity will be 1.0 m/s² (twice the distance, 1/4th the gravity), at 50 meters it will be 16.0 m/s² (half the distance, 4x the gravity), and so on.
#desc The above is true only when the unit distance is a positive number. When this is set to 0.0, the gravity will be constant regardless of distance.
var gravity_point_unit_distance: float:
	get = get_gravity_point_unit_distance, set = set_gravity_point_unit_distance

#desc Override mode for gravity calculations within this area. See [enum SpaceOverride] for possible values.
var gravity_space_override: int:
	get = get_gravity_space_override_mode, set = set_gravity_space_override_mode

#desc The rate at which objects stop moving in this area. Represents the linear velocity lost per second.
#desc See [member ProjectSettings.physics/3d/default_linear_damp] for more details about damping.
var linear_damp: float:
	get = get_linear_damp, set = set_linear_damp

#desc Override mode for linear damping calculations within this area. See [enum SpaceOverride] for possible values.
var linear_damp_space_override: int:
	get = get_linear_damp_space_override_mode, set = set_linear_damp_space_override_mode

#desc If [code]true[/code], other monitoring areas can detect this area.
var monitorable: bool:
	get = is_monitorable, set = set_monitorable

#desc If [code]true[/code], the area detects bodies or areas entering and exiting it.
var monitoring: bool:
	get = is_monitoring, set = set_monitoring

#desc The area's priority. Higher priority areas are processed first.
var priority: float:
	get = get_priority, set = set_priority

#desc The degree to which this area applies reverb to its associated audio. Ranges from [code]0[/code] to [code]1[/code] with [code]0.1[/code] precision.
var reverb_bus_amount: float:
	get = get_reverb_amount, set = set_reverb_amount

#desc If [code]true[/code], the area applies reverb to its associated audio.
var reverb_bus_enabled: bool:
	get = is_using_reverb_bus, set = set_use_reverb_bus

#desc The name of the reverb bus to use for this area's associated audio.
var reverb_bus_name: StringName:
	get = get_reverb_bus_name, set = set_reverb_bus_name

#desc The degree to which this area's reverb is a uniform effect. Ranges from [code]0[/code] to [code]1[/code] with [code]0.1[/code] precision.
var reverb_bus_uniformity: float:
	get = get_reverb_uniformity, set = set_reverb_uniformity

#desc The exponential rate at which wind force decreases with distance from its origin.
var wind_attenuation_factor: float:
	get = get_wind_attenuation_factor, set = set_wind_attenuation_factor

#desc The magnitude of area-specific wind force.
var wind_force_magnitude: float:
	get = get_wind_force_magnitude, set = set_wind_force_magnitude

#desc The [Node3D] which is used to specify the direction and origin of an area-specific wind force. The direction is opposite to the z-axis of the [Node3D]'s local transform, and its origin is the origin of the [Node3D]'s local transform.
var wind_source_path: NodePath:
	get = get_wind_source_path, set = set_wind_source_path



#desc Returns a list of intersecting [Area3D]s. The overlapping area's [member CollisionObject3D.collision_layer] must be part of this area's [member CollisionObject3D.collision_mask] in order to be detected.
#desc For performance reasons (collisions are all processed at the same time) this list is modified once during the physics step, not immediately after objects are moved. Consider using signals instead.
func get_overlapping_areas() -> Array[Area3D]:
	pass;

#desc Returns a list of intersecting [PhysicsBody3D]s and [GridMap]s. The overlapping body's [member CollisionObject3D.collision_layer] must be part of this area's [member CollisionObject3D.collision_mask] in order to be detected.
#desc For performance reasons (collisions are all processed at the same time) this list is modified once during the physics step, not immediately after objects are moved. Consider using signals instead.
func get_overlapping_bodies() -> Array[Node3D]:
	pass;

#desc Returns [code]true[/code] if intersecting any [Area3D]s, otherwise returns [code]false[/code]. The overlapping area's [member CollisionObject3D.collision_layer] must be part of this area's [member CollisionObject3D.collision_mask] in order to be detected.
#desc For performance reasons (collisions are all processed at the same time) the list of overlapping areas is modified once during the physics step, not immediately after objects are moved. Consider using signals instead.
func has_overlapping_areas() -> bool:
	pass;

#desc Returns [code]true[/code] if intersecting any [PhysicsBody3D]s or [GridMap]s, otherwise returns [code]false[/code]. The overlapping body's [member CollisionObject3D.collision_layer] must be part of this area's [member CollisionObject3D.collision_mask] in order to be detected.
#desc For performance reasons (collisions are all processed at the same time) the list of overlapping bodies is modified once during the physics step, not immediately after objects are moved. Consider using signals instead.
func has_overlapping_bodies() -> bool:
	pass;

#desc Returns [code]true[/code] if the given [Area3D] intersects or overlaps this [Area3D], [code]false[/code] otherwise.
#desc [b]Note:[/b] The result of this test is not immediate after moving objects. For performance, list of overlaps is updated once per frame and before the physics step. Consider using signals instead.
func overlaps_area(area: Node) -> bool:
	pass;

#desc Returns [code]true[/code] if the given physics body intersects or overlaps this [Area3D], [code]false[/code] otherwise.
#desc [b]Note:[/b] The result of this test is not immediate after moving objects. For performance, list of overlaps is updated once per frame and before the physics step. Consider using signals instead.
#desc The [param body] argument can either be a [PhysicsBody3D] or a [GridMap] instance. While GridMaps are not physics body themselves, they register their tiles with collision shapes as a virtual physics body.
func overlaps_body(body: Node) -> bool:
	pass;


func get_angular_damp() -> float:
	return angular_damp

func set_angular_damp(value: float) -> void:
	angular_damp = value

func get_angular_damp_space_override_mode() -> int:
	return angular_damp_space_override

func set_angular_damp_space_override_mode(value: int) -> void:
	angular_damp_space_override = value

func get_audio_bus_name() -> StringName:
	return audio_bus_name

func set_audio_bus_name(value: StringName) -> void:
	audio_bus_name = value

func is_overriding_audio_bus() -> bool:
	return audio_bus_override

func set_audio_bus_override(value: bool) -> void:
	audio_bus_override = value

func get_gravity() -> float:
	return gravity

func set_gravity(value: float) -> void:
	gravity = value

func get_gravity_direction() -> Vector3:
	return gravity_direction

func set_gravity_direction(value: Vector3) -> void:
	gravity_direction = value

func is_gravity_a_point() -> bool:
	return gravity_point

func set_gravity_is_point(value: bool) -> void:
	gravity_point = value

func get_gravity_point_center() -> Vector3:
	return gravity_point_center

func set_gravity_point_center(value: Vector3) -> void:
	gravity_point_center = value

func get_gravity_point_unit_distance() -> float:
	return gravity_point_unit_distance

func set_gravity_point_unit_distance(value: float) -> void:
	gravity_point_unit_distance = value

func get_gravity_space_override_mode() -> int:
	return gravity_space_override

func set_gravity_space_override_mode(value: int) -> void:
	gravity_space_override = value

func get_linear_damp() -> float:
	return linear_damp

func set_linear_damp(value: float) -> void:
	linear_damp = value

func get_linear_damp_space_override_mode() -> int:
	return linear_damp_space_override

func set_linear_damp_space_override_mode(value: int) -> void:
	linear_damp_space_override = value

func is_monitorable() -> bool:
	return monitorable

func set_monitorable(value: bool) -> void:
	monitorable = value

func is_monitoring() -> bool:
	return monitoring

func set_monitoring(value: bool) -> void:
	monitoring = value

func get_priority() -> float:
	return priority

func set_priority(value: float) -> void:
	priority = value

func get_reverb_amount() -> float:
	return reverb_bus_amount

func set_reverb_amount(value: float) -> void:
	reverb_bus_amount = value

func is_using_reverb_bus() -> bool:
	return reverb_bus_enabled

func set_use_reverb_bus(value: bool) -> void:
	reverb_bus_enabled = value

func get_reverb_bus_name() -> StringName:
	return reverb_bus_name

func set_reverb_bus_name(value: StringName) -> void:
	reverb_bus_name = value

func get_reverb_uniformity() -> float:
	return reverb_bus_uniformity

func set_reverb_uniformity(value: float) -> void:
	reverb_bus_uniformity = value

func get_wind_attenuation_factor() -> float:
	return wind_attenuation_factor

func set_wind_attenuation_factor(value: float) -> void:
	wind_attenuation_factor = value

func get_wind_force_magnitude() -> float:
	return wind_force_magnitude

func set_wind_force_magnitude(value: float) -> void:
	wind_force_magnitude = value

func get_wind_source_path() -> NodePath:
	return wind_source_path

func set_wind_source_path(value: NodePath) -> void:
	wind_source_path = value


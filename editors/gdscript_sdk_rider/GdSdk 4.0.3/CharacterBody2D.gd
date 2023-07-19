extends PhysicsBody2D
#brief Specialized 2D physics body node for characters moved by script.
#desc Character bodies are special types of bodies that are meant to be user-controlled. They are not affected by physics at all; to other types of bodies, such as a rigid body, these are the same as a [AnimatableBody2D]. However, they have two main uses:
#desc [b]Kinematic characters:[/b] Character bodies have an API for moving objects with walls and slopes detection ([method move_and_slide] method), in addition to collision detection (also done with [method PhysicsBody2D.move_and_collide]). This makes them really useful to implement characters that move in specific ways and collide with the world, but don't require advanced physics.
#desc [b]Kinematic motion:[/b] Character bodies can also be used for kinematic motion (same functionality as [AnimatableBody2D]), which allows them to be moved by code and push other bodies on their path.
#tutorial [Kinematic character (2D)] https://docs.godotengine.org/en/stable/tutorials/physics/kinematic_character_2d.html
#tutorial [Using CharacterBody2D] https://docs.godotengine.org/en/stable/tutorials/physics/using_character_body_2d.html
#tutorial [2D Kinematic Character Demo] https://godotengine.org/asset-library/asset/113
#tutorial [2D Platformer Demo] https://godotengine.org/asset-library/asset/120
class_name CharacterBody2D

#desc Apply when notions of walls, ceiling and floor are relevant. In this mode the body motion will react to slopes (acceleration/slowdown). This mode is suitable for sided games like platformers.
#desc Apply when there is no notion of floor or ceiling. All collisions will be reported as [code]on_wall[/code]. In this mode, when you slide, the speed will always be constant. This mode is suitable for top-down games.
#desc Add the last platform velocity to the [member velocity] when you leave a moving platform.
#desc Add the last platform velocity to the [member velocity] when you leave a moving platform, but any downward motion is ignored. It's useful to keep full jump height even when the platform is moving down.
#desc Do nothing when leaving a platform.

#enum MotionMode
enum {
    MOTION_MODE_GROUNDED = 0,
    MOTION_MODE_FLOATING = 1,
}
#enum PlatformOnLeave
enum {
    PLATFORM_ON_LEAVE_ADD_VELOCITY = 0,
    PLATFORM_ON_LEAVE_ADD_UPWARD_VELOCITY = 1,
    PLATFORM_ON_LEAVE_DO_NOTHING = 2,
}
#desc If [code]true[/code], the body will be able to move on the floor only. This option avoids to be able to walk on walls, it will however allow to slide down along them.
var floor_block_on_wall: bool:
	get = is_floor_block_on_wall_enabled, set = set_floor_block_on_wall_enabled

#desc If [code]false[/code] (by default), the body will move faster on downward slopes and slower on upward slopes.
#desc If [code]true[/code], the body will always move at the same speed on the ground no matter the slope. Note that you need to use [member floor_snap_length] to stick along a downward slope at constant speed.
var floor_constant_speed: bool:
	get = is_floor_constant_speed_enabled, set = set_floor_constant_speed_enabled

#desc Maximum angle (in radians) where a slope is still considered a floor (or a ceiling), rather than a wall, when calling [method move_and_slide]. The default value equals 45 degrees.
var floor_max_angle: float:
	get = get_floor_max_angle, set = set_floor_max_angle

#desc Sets a snapping distance. When set to a value different from [code]0.0[/code], the body is kept attached to slopes when calling [method move_and_slide]. The snapping vector is determined by the given distance along the opposite direction of the [member up_direction].
#desc As long as the snapping vector is in contact with the ground and the body moves against [member up_direction], the body will remain attached to the surface. Snapping is not applied if the body moves along [member up_direction], meaning it contains vertical rising velocity, so it will be able to detach from the ground when jumping or when the body is pushed up by something. If you want to apply a snap without taking into account the velocity, use [method apply_floor_snap].
var floor_snap_length: float:
	get = get_floor_snap_length, set = set_floor_snap_length

#desc If [code]true[/code], the body will not slide on slopes when calling [method move_and_slide] when the body is standing still.
#desc If [code]false[/code], the body will slide on floor's slopes when [member velocity] applies a downward force.
var floor_stop_on_slope: bool:
	get = is_floor_stop_on_slope_enabled, set = set_floor_stop_on_slope_enabled

#desc Maximum number of times the body can change direction before it stops when calling [method move_and_slide].
var max_slides: int:
	get = get_max_slides, set = set_max_slides

#desc Sets the motion mode which defines the behavior of [method move_and_slide]. See [enum MotionMode] constants for available modes.
var motion_mode: int:
	get = get_motion_mode, set = set_motion_mode

#desc Collision layers that will be included for detecting floor bodies that will act as moving platforms to be followed by the [CharacterBody2D]. By default, all floor bodies are detected and propagate their velocity.
var platform_floor_layers: int:
	get = get_platform_floor_layers, set = set_platform_floor_layers

#desc Sets the behavior to apply when you leave a moving platform. By default, to be physically accurate, when you leave the last platform velocity is applied. See [enum PlatformOnLeave] constants for available behavior.
var platform_on_leave: int:
	get = get_platform_on_leave, set = set_platform_on_leave

#desc Collision layers that will be included for detecting wall bodies that will act as moving platforms to be followed by the [CharacterBody2D]. By default, all wall bodies are ignored.
var platform_wall_layers: int:
	get = get_platform_wall_layers, set = set_platform_wall_layers

#desc Extra margin used for collision recovery when calling [method move_and_slide].
#desc If the body is at least this close to another body, it will consider them to be colliding and will be pushed away before performing the actual motion.
#desc A higher value means it's more flexible for detecting collision, which helps with consistently detecting walls and floors.
#desc A lower value forces the collision algorithm to use more exact detection, so it can be used in cases that specifically require precision, e.g at very low scale to avoid visible jittering, or for stability with a stack of character bodies.
var safe_margin: float:
	get = get_safe_margin, set = set_safe_margin

#desc If [code]true[/code], during a jump against the ceiling, the body will slide, if [code]false[/code] it will be stopped and will fall vertically.
var slide_on_ceiling: bool:
	get = is_slide_on_ceiling_enabled, set = set_slide_on_ceiling_enabled

#desc Vector pointing upwards, used to determine what is a wall and what is a floor (or a ceiling) when calling [method move_and_slide]. Defaults to [code]Vector2.UP[/code]. As the vector will be normalized it can't be equal to [constant Vector2.ZERO], if you want all collisions to be reported as walls, consider using [constant MOTION_MODE_FLOATING] as [member motion_mode].
var up_direction: Vector2:
	get = get_up_direction, set = set_up_direction

#desc Current velocity vector in pixels per second, used and modified during calls to [method move_and_slide].
var velocity: Vector2:
	get = get_velocity, set = set_velocity

#desc Minimum angle (in radians) where the body is allowed to slide when it encounters a slope. The default value equals 15 degrees. This property only affects movement when [member motion_mode] is [constant MOTION_MODE_FLOATING].
var wall_min_slide_angle: float:
	get = get_wall_min_slide_angle, set = set_wall_min_slide_angle



#desc Allows to manually apply a snap to the floor regardless of the body's velocity. This function does nothing when [method is_on_floor] returns [code]true[/code].
func apply_floor_snap() -> void:
	pass;

#desc Returns the floor's collision angle at the last collision point according to [param up_direction], which is [code]Vector2.UP[/code] by default. This value is always positive and only valid after calling [method move_and_slide] and when [method is_on_floor] returns [code]true[/code].
func get_floor_angle(up_direction: Vector2 = Vector2(0, -1)) -> float:
	pass;

#desc Returns the surface normal of the floor at the last collision point. Only valid after calling [method move_and_slide] and when [method is_on_floor] returns [code]true[/code].
func get_floor_normal() -> Vector2:
	pass;

#desc Returns the last motion applied to the [CharacterBody2D] during the last call to [method move_and_slide]. The movement can be split into multiple motions when sliding occurs, and this method return the last one, which is useful to retrieve the current direction of the movement.
func get_last_motion() -> Vector2:
	pass;

#desc Returns a [KinematicCollision2D], which contains information about the latest collision that occurred during the last call to [method move_and_slide].
func get_last_slide_collision() -> KinematicCollision2D:
	pass;

#desc Returns the linear velocity of the platform at the last collision point. Only valid after calling [method move_and_slide].
func get_platform_velocity() -> Vector2:
	pass;

#desc Returns the travel (position delta) that occurred during the last call to [method move_and_slide].
func get_position_delta() -> Vector2:
	pass;

#desc Returns the current real velocity since the last call to [method move_and_slide]. For example, when you climb a slope, you will move diagonally even though the velocity is horizontal. This method returns the diagonal movement, as opposed to [member velocity] which returns the requested velocity.
func get_real_velocity() -> Vector2:
	pass;

#desc Returns a [KinematicCollision2D], which contains information about a collision that occurred during the last call to [method move_and_slide]. Since the body can collide several times in a single call to [method move_and_slide], you must specify the index of the collision in the range 0 to ([method get_slide_collision_count] - 1).
#desc [b]Example usage:[/b]
#desc [codeblocks]
#desc [gdscript]
#desc for i in get_slide_collision_count():
#desc var collision = get_slide_collision(i)
#desc print("Collided with: ", collision.get_collider().name)
#desc [/gdscript]
#desc [csharp]
#desc for (int i = 0; i < GetSlideCollisionCount(); i++)
#desc {
#desc KinematicCollision2D collision = GetSlideCollision(i);
#desc GD.Print("Collided with: ", (collision.GetCollider() as Node).Name);
#desc }
#desc [/csharp]
#desc [/codeblocks]
func get_slide_collision(slide_idx: int) -> KinematicCollision2D:
	pass;

#desc Returns the number of times the body collided and changed direction during the last call to [method move_and_slide].
func get_slide_collision_count() -> int:
	pass;

#desc Returns the surface normal of the wall at the last collision point. Only valid after calling [method move_and_slide] and when [method is_on_wall] returns [code]true[/code].
func get_wall_normal() -> Vector2:
	pass;

#desc Returns [code]true[/code] if the body collided with the ceiling on the last call of [method move_and_slide]. Otherwise, returns [code]false[/code]. The [member up_direction] and [member floor_max_angle] are used to determine whether a surface is "ceiling" or not.
func is_on_ceiling() -> bool:
	pass;

#desc Returns [code]true[/code] if the body collided only with the ceiling on the last call of [method move_and_slide]. Otherwise, returns [code]false[/code]. The [member up_direction] and [member floor_max_angle] are used to determine whether a surface is "ceiling" or not.
func is_on_ceiling_only() -> bool:
	pass;

#desc Returns [code]true[/code] if the body collided with the floor on the last call of [method move_and_slide]. Otherwise, returns [code]false[/code]. The [member up_direction] and [member floor_max_angle] are used to determine whether a surface is "floor" or not.
func is_on_floor() -> bool:
	pass;

#desc Returns [code]true[/code] if the body collided only with the floor on the last call of [method move_and_slide]. Otherwise, returns [code]false[/code]. The [member up_direction] and [member floor_max_angle] are used to determine whether a surface is "floor" or not.
func is_on_floor_only() -> bool:
	pass;

#desc Returns [code]true[/code] if the body collided with a wall on the last call of [method move_and_slide]. Otherwise, returns [code]false[/code]. The [member up_direction] and [member floor_max_angle] are used to determine whether a surface is "wall" or not.
func is_on_wall() -> bool:
	pass;

#desc Returns [code]true[/code] if the body collided only with a wall on the last call of [method move_and_slide]. Otherwise, returns [code]false[/code]. The [member up_direction] and [member floor_max_angle] are used to determine whether a surface is "wall" or not.
func is_on_wall_only() -> bool:
	pass;

#desc Moves the body based on [member velocity]. If the body collides with another, it will slide along the other body (by default only on floor) rather than stop immediately. If the other body is a [CharacterBody2D] or [RigidBody2D], it will also be affected by the motion of the other body. You can use this to make moving and rotating platforms, or to make nodes push other nodes.
#desc Modifies [member velocity] if a slide collision occurred. To get the latest collision call [method get_last_slide_collision], for detailed information about collisions that occurred, use [method get_slide_collision].
#desc When the body touches a moving platform, the platform's velocity is automatically added to the body motion. If a collision occurs due to the platform's motion, it will always be first in the slide collisions.
#desc The general behavior and available properties change according to the [member motion_mode].
#desc Returns [code]true[/code] if the body collided, otherwise, returns [code]false[/code].
func move_and_slide() -> bool:
	pass;


func is_floor_block_on_wall_enabled() -> bool:
	return floor_block_on_wall

func set_floor_block_on_wall_enabled(value: bool) -> void:
	floor_block_on_wall = value

func is_floor_constant_speed_enabled() -> bool:
	return floor_constant_speed

func set_floor_constant_speed_enabled(value: bool) -> void:
	floor_constant_speed = value

func get_floor_max_angle() -> float:
	return floor_max_angle

func set_floor_max_angle(value: float) -> void:
	floor_max_angle = value

func get_floor_snap_length() -> float:
	return floor_snap_length

func set_floor_snap_length(value: float) -> void:
	floor_snap_length = value

func is_floor_stop_on_slope_enabled() -> bool:
	return floor_stop_on_slope

func set_floor_stop_on_slope_enabled(value: bool) -> void:
	floor_stop_on_slope = value

func get_max_slides() -> int:
	return max_slides

func set_max_slides(value: int) -> void:
	max_slides = value

func get_motion_mode() -> int:
	return motion_mode

func set_motion_mode(value: int) -> void:
	motion_mode = value

func get_platform_floor_layers() -> int:
	return platform_floor_layers

func set_platform_floor_layers(value: int) -> void:
	platform_floor_layers = value

func get_platform_on_leave() -> int:
	return platform_on_leave

func set_platform_on_leave(value: int) -> void:
	platform_on_leave = value

func get_platform_wall_layers() -> int:
	return platform_wall_layers

func set_platform_wall_layers(value: int) -> void:
	platform_wall_layers = value

func get_safe_margin() -> float:
	return safe_margin

func set_safe_margin(value: float) -> void:
	safe_margin = value

func is_slide_on_ceiling_enabled() -> bool:
	return slide_on_ceiling

func set_slide_on_ceiling_enabled(value: bool) -> void:
	slide_on_ceiling = value

func get_up_direction() -> Vector2:
	return up_direction

func set_up_direction(value: Vector2) -> void:
	up_direction = value

func get_velocity() -> Vector2:
	return velocity

func set_velocity(value: Vector2) -> void:
	velocity = value

func get_wall_min_slide_angle() -> float:
	return wall_min_slide_angle

func set_wall_min_slide_angle(value: float) -> void:
	wall_min_slide_angle = value


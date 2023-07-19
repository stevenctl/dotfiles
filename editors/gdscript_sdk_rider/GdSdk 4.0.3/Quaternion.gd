#brief A unit quaternion used for representing 3D rotations.
#desc Quaternions are similar to [Basis], which implements the matrix representation of rotations. Unlike [Basis], which stores rotation, scale, and shearing, quaternions only store rotation.
#desc Quaternions can be parametrized using both an axis-angle pair or Euler angles. Due to their compactness and the way they are stored in memory, certain operations (obtaining axis-angle and performing SLERP, in particular) are more efficient and robust against floating-point errors.
#desc [b]Note:[/b] Quaternions need to be normalized before being used for rotation.
#tutorial [Using 3D transforms] https://docs.godotengine.org/en/stable/tutorials/3d/using_transforms.html#interpolating-with-quaternions
#tutorial [Third Person Shooter Demo] https://godotengine.org/asset-library/asset/678
class_name Quaternion

#desc The identity quaternion, representing no rotation. Equivalent to an identity [Basis] matrix. If a vector is transformed by an identity quaternion, it will not change.
const IDENTITY = Quaternion(0, 0, 0, 1);


#desc W component of the quaternion (real part).
#desc Quaternion components should usually not be manipulated directly.
var w: float

#desc X component of the quaternion (imaginary [code]i[/code] axis part).
#desc Quaternion components should usually not be manipulated directly.
var x: float

#desc Y component of the quaternion (imaginary [code]j[/code] axis part).
#desc Quaternion components should usually not be manipulated directly.
var y: float

#desc Z component of the quaternion (imaginary [code]k[/code] axis part).
#desc Quaternion components should usually not be manipulated directly.
var z: float


#desc Constructs a default-initialized quaternion with all components set to [code]0[/code].
func Quaternion() -> Quaternion:
	pass;

#desc Constructs a [Quaternion] as a copy of the given [Quaternion].
func Quaternion(from: Quaternion) -> Quaternion:
	pass;

#desc Constructs a quaternion representing the shortest arc between two points on the surface of a sphere with a radius of [code]1.0[/code].
func Quaternion(arc_from: Vector3, arc_to: Vector3) -> Quaternion:
	pass;

#desc Constructs a quaternion that will rotate around the given axis by the specified angle. The axis must be a normalized vector.
func Quaternion(axis: Vector3, angle: float) -> Quaternion:
	pass;

#desc Constructs a quaternion from the given [Basis].
func Quaternion(from: Basis) -> Quaternion:
	pass;

#desc Constructs a quaternion defined by the given values.
func Quaternion(x: float, y: float, z: float, w: float) -> Quaternion:
	pass;


#desc Returns the angle between this quaternion and [param to]. This is the magnitude of the angle you would need to rotate by to get from one to the other.
#desc [b]Note:[/b] The magnitude of the floating-point error for this method is abnormally high, so methods such as [code]is_zero_approx[/code] will not work reliably.
func angle_to(to: Quaternion) -> float:
	pass;

#desc Returns the dot product of two quaternions.
func dot(with: Quaternion) -> float:
	pass;

func exp() -> Quaternion:
	pass;

#desc Constructs a Quaternion from Euler angles in YXZ rotation order.
static func from_euler(euler: Vector3) -> Quaternion:
	pass;

func get_angle() -> float:
	pass;

func get_axis() -> Vector3:
	pass;

#desc Returns the quaternion's rotation in the form of Euler angles. The Euler order depends on the [param order] parameter, for example using the YXZ convention: since this method decomposes, first Z, then X, and Y last. See the [enum EulerOrder] enum for possible values. The returned vector contains the rotation angles in the format (X angle, Y angle, Z angle).
func get_euler(order: int = 2) -> Vector3:
	pass;

#desc Returns the inverse of the quaternion.
func inverse() -> Quaternion:
	pass;

#desc Returns [code]true[/code] if this quaternion and [param to] are approximately equal, by running [method @GlobalScope.is_equal_approx] on each component.
func is_equal_approx(to: Quaternion) -> bool:
	pass;

#desc Returns [code]true[/code] if this quaternion is finite, by calling [method @GlobalScope.is_finite] on each component.
func is_finite() -> bool:
	pass;

#desc Returns whether the quaternion is normalized or not.
func is_normalized() -> bool:
	pass;

#desc Returns the length of the quaternion.
func length() -> float:
	pass;

#desc Returns the length of the quaternion, squared.
func length_squared() -> float:
	pass;

func log() -> Quaternion:
	pass;

#desc Returns a copy of the quaternion, normalized to unit length.
func normalized() -> Quaternion:
	pass;

#desc Returns the result of the spherical linear interpolation between this quaternion and [param to] by amount [param weight].
#desc [b]Note:[/b] Both quaternions must be normalized.
func slerp(to: Quaternion, weight: float) -> Quaternion:
	pass;

#desc Returns the result of the spherical linear interpolation between this quaternion and [param to] by amount [param weight], but without checking if the rotation path is not bigger than 90 degrees.
func slerpni(to: Quaternion, weight: float) -> Quaternion:
	pass;

#desc Performs a spherical cubic interpolation between quaternions [param pre_a], this vector, [param b], and [param post_b], by the given amount [param weight].
func spherical_cubic_interpolate(b: Quaternion, pre_a: Quaternion, post_b: Quaternion, weight: float) -> Quaternion:
	pass;

#desc Performs a spherical cubic interpolation between quaternions [param pre_a], this vector, [param b], and [param post_b], by the given amount [param weight].
#desc It can perform smoother interpolation than [code]spherical_cubic_interpolate()[/code] by the time values.
func spherical_cubic_interpolate_in_time(b: Quaternion, pre_a: Quaternion, post_b: Quaternion, weight: float, b_t: float, pre_a_t: float, post_b_t: float) -> Quaternion:
	pass;



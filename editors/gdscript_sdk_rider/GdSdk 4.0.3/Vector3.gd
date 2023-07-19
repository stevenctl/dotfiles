#brief Vector used for 3D math using floating point coordinates.
#desc 3-element structure that can be used to represent positions in 3D space or any other triplet of numeric values.
#desc It uses floating-point coordinates. By default, these floating-point values use 32-bit precision, unlike [float] which is always 64-bit. If double precision is needed, compile the engine with the option [code]precision=double[/code].
#desc See [Vector3i] for its integer counterpart.
#desc [b]Note:[/b] In a boolean context, a Vector3 will evaluate to [code]false[/code] if it's equal to [code]Vector3(0, 0, 0)[/code]. Otherwise, a Vector3 will always evaluate to [code]true[/code].
#tutorial [Math documentation index] https://docs.godotengine.org/en/stable/tutorials/math/index.html
#tutorial [Vector math] https://docs.godotengine.org/en/stable/tutorials/math/vector_math.html
#tutorial [Advanced vector math] https://docs.godotengine.org/en/stable/tutorials/math/vectors_advanced.html
#tutorial [3Blue1Brown Essence of Linear Algebra] https://www.youtube.com/playlist?list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab
#tutorial [Matrix Transform Demo] https://godotengine.org/asset-library/asset/584
#tutorial [All 3D Demos] https://github.com/godotengine/godot-demo-projects/tree/master/3d
class_name Vector3

#desc Enumerated value for the X axis. Returned by [method max_axis_index] and [method min_axis_index].
const AXIS_X = 0;

#desc Enumerated value for the Y axis. Returned by [method max_axis_index] and [method min_axis_index].
const AXIS_Y = 1;

#desc Enumerated value for the Z axis. Returned by [method max_axis_index] and [method min_axis_index].
const AXIS_Z = 2;

#desc Zero vector, a vector with all components set to [code]0[/code].
const ZERO = Vector3(0, 0, 0);

#desc One vector, a vector with all components set to [code]1[/code].
const ONE = Vector3(1, 1, 1);

#desc Infinity vector, a vector with all components set to [constant @GDScript.INF].
const INF = Vector3(inf, inf, inf);

#desc Left unit vector. Represents the local direction of left, and the global direction of west.
const LEFT = Vector3(-1, 0, 0);

#desc Right unit vector. Represents the local direction of right, and the global direction of east.
const RIGHT = Vector3(1, 0, 0);

#desc Up unit vector.
const UP = Vector3(0, 1, 0);

#desc Down unit vector.
const DOWN = Vector3(0, -1, 0);

#desc Forward unit vector. Represents the local direction of forward, and the global direction of north.
const FORWARD = Vector3(0, 0, -1);

#desc Back unit vector. Represents the local direction of back, and the global direction of south.
const BACK = Vector3(0, 0, 1);


#desc The vector's X component. Also accessible by using the index position [code][0][/code].
var x: float

#desc The vector's Y component. Also accessible by using the index position [code][1][/code].
var y: float

#desc The vector's Z component. Also accessible by using the index position [code][2][/code].
var z: float


#desc Constructs a default-initialized [Vector3] with all components set to [code]0[/code].
func Vector3() -> Vector3:
	pass;

#desc Constructs a [Vector3] as a copy of the given [Vector3].
func Vector3(from: Vector3) -> Vector3:
	pass;

#desc Constructs a new [Vector3] from [Vector3i].
func Vector3(from: Vector3i) -> Vector3:
	pass;

#desc Returns a [Vector3] with the given components.
func Vector3(x: float, y: float, z: float) -> Vector3:
	pass;


#desc Returns a new vector with all components in absolute values (i.e. positive).
func abs() -> Vector3:
	pass;

#desc Returns the unsigned minimum angle to the given vector, in radians.
func angle_to(to: Vector3) -> float:
	pass;

#desc Returns the derivative at the given [param t] on the [url=https://en.wikipedia.org/wiki/B%C3%A9zier_curve]Bézier curve[/url] defined by this vector and the given [param control_1], [param control_2], and [param end] points.
func bezier_derivative(control_1: Vector3, control_2: Vector3, end: Vector3, t: float) -> Vector3:
	pass;

#desc Returns the point at the given [param t] on the [url=https://en.wikipedia.org/wiki/B%C3%A9zier_curve]Bézier curve[/url] defined by this vector and the given [param control_1], [param control_2], and [param end] points.
func bezier_interpolate(control_1: Vector3, control_2: Vector3, end: Vector3, t: float) -> Vector3:
	pass;

#desc Returns the vector "bounced off" from a plane defined by the given normal.
func bounce(n: Vector3) -> Vector3:
	pass;

#desc Returns a new vector with all components rounded up (towards positive infinity).
func ceil() -> Vector3:
	pass;

#desc Returns a new vector with all components clamped between the components of [param min] and [param max], by running [method @GlobalScope.clamp] on each component.
func clamp(min: Vector3, max: Vector3) -> Vector3:
	pass;

#desc Returns the cross product of this vector and [param with].
func cross(with: Vector3) -> Vector3:
	pass;

#desc Performs a cubic interpolation between this vector and [param b] using [param pre_a] and [param post_b] as handles, and returns the result at position [param weight]. [param weight] is on the range of 0.0 to 1.0, representing the amount of interpolation.
func cubic_interpolate(b: Vector3, pre_a: Vector3, post_b: Vector3, weight: float) -> Vector3:
	pass;

#desc Performs a cubic interpolation between this vector and [param b] using [param pre_a] and [param post_b] as handles, and returns the result at position [param weight]. [param weight] is on the range of 0.0 to 1.0, representing the amount of interpolation.
#desc It can perform smoother interpolation than [code]cubic_interpolate()[/code] by the time values.
func cubic_interpolate_in_time(b: Vector3, pre_a: Vector3, post_b: Vector3, weight: float, b_t: float, pre_a_t: float, post_b_t: float) -> Vector3:
	pass;

#desc Returns the normalized vector pointing from this vector to [param to]. This is equivalent to using [code](b - a).normalized()[/code].
func direction_to(to: Vector3) -> Vector3:
	pass;

#desc Returns the squared distance between this vector and [param to].
#desc This method runs faster than [method distance_to], so prefer it if you need to compare vectors or need the squared distance for some formula.
func distance_squared_to(to: Vector3) -> float:
	pass;

#desc Returns the distance between this vector and [param to].
func distance_to(to: Vector3) -> float:
	pass;

#desc Returns the dot product of this vector and [param with]. This can be used to compare the angle between two vectors. For example, this can be used to determine whether an enemy is facing the player.
#desc The dot product will be [code]0[/code] for a straight angle (90 degrees), greater than 0 for angles narrower than 90 degrees and lower than 0 for angles wider than 90 degrees.
#desc When using unit (normalized) vectors, the result will always be between [code]-1.0[/code] (180 degree angle) when the vectors are facing opposite directions, and [code]1.0[/code] (0 degree angle) when the vectors are aligned.
#desc [b]Note:[/b] [code]a.dot(b)[/code] is equivalent to [code]b.dot(a)[/code].
func dot(with: Vector3) -> float:
	pass;

#desc Returns a new vector with all components rounded down (towards negative infinity).
func floor() -> Vector3:
	pass;

#desc Returns the inverse of the vector. This is the same as [code]Vector3(1.0 / v.x, 1.0 / v.y, 1.0 / v.z)[/code].
func inverse() -> Vector3:
	pass;

#desc Returns [code]true[/code] if this vector and [param to] are approximately equal, by running [method @GlobalScope.is_equal_approx] on each component.
func is_equal_approx(to: Vector3) -> bool:
	pass;

#desc Returns [code]true[/code] if this vector is finite, by calling [method @GlobalScope.is_finite] on each component.
func is_finite() -> bool:
	pass;

#desc Returns [code]true[/code] if the vector is normalized, i.e. its length is approximately equal to 1.
func is_normalized() -> bool:
	pass;

#desc Returns [code]true[/code] if this vector's values are approximately zero, by running [method @GlobalScope.is_zero_approx] on each component.
#desc This method is faster than using [method is_equal_approx] with one value as a zero vector.
func is_zero_approx() -> bool:
	pass;

#desc Returns the length (magnitude) of this vector.
func length() -> float:
	pass;

#desc Returns the squared length (squared magnitude) of this vector.
#desc This method runs faster than [method length], so prefer it if you need to compare vectors or need the squared distance for some formula.
func length_squared() -> float:
	pass;

#desc Returns the result of the linear interpolation between this vector and [param to] by amount [param weight]. [param weight] is on the range of [code]0.0[/code] to [code]1.0[/code], representing the amount of interpolation.
func lerp(to: Vector3, weight: float) -> Vector3:
	pass;

#desc Returns the vector with a maximum length by limiting its length to [param length].
func limit_length(length: float = 1.0) -> Vector3:
	pass;

#desc Returns the axis of the vector's highest value. See [code]AXIS_*[/code] constants. If all components are equal, this method returns [constant AXIS_X].
func max_axis_index() -> int:
	pass;

#desc Returns the axis of the vector's lowest value. See [code]AXIS_*[/code] constants. If all components are equal, this method returns [constant AXIS_Z].
func min_axis_index() -> int:
	pass;

#desc Returns a new vector moved toward [param to] by the fixed [param delta] amount. Will not go past the final value.
func move_toward(to: Vector3, delta: float) -> Vector3:
	pass;

#desc Returns the result of scaling the vector to unit length. Equivalent to [code]v / v.length()[/code]. See also [method is_normalized].
#desc [b]Note:[/b] This function may return incorrect values if the input vector length is near zero.
func normalized() -> Vector3:
	pass;

#desc Returns the [Vector3] from an octahedral-compressed form created using [method octahedron_encode] (stored as a [Vector2]).
static func octahedron_decode(uv: Vector2) -> Vector3:
	pass;

#desc Returns the octahedral-encoded (oct32) form of this [Vector3] as a [Vector2]. Since a [Vector2] occupies 1/3 less memory compared to [Vector3], this form of compression can be used to pass greater amounts of [method normalized] [Vector3]s without increasing storage or memory requirements. See also [method octahedron_decode].
#desc [b]Note:[/b] [method octahedron_encode] can only be used for [method normalized] vectors. [method octahedron_encode] does [i]not[/i] check whether this [Vector3] is normalized, and will return a value that does not decompress to the original value if the [Vector3] is not normalized.
#desc [b]Note:[/b] Octahedral compression is [i]lossy[/i], although visual differences are rarely perceptible in real world scenarios.
func octahedron_encode() -> Vector2:
	pass;

#desc Returns the outer product with [param with].
func outer(with: Vector3) -> Basis:
	pass;

#desc Returns a vector composed of the [method @GlobalScope.fposmod] of this vector's components and [param mod].
func posmod(mod: float) -> Vector3:
	pass;

#desc Returns a vector composed of the [method @GlobalScope.fposmod] of this vector's components and [param modv]'s components.
func posmodv(modv: Vector3) -> Vector3:
	pass;

#desc Returns the result of projecting the vector onto the given vector [param b].
func project(b: Vector3) -> Vector3:
	pass;

#desc Returns the result of reflecting the vector from a plane defined by the given normal [param n].
func reflect(n: Vector3) -> Vector3:
	pass;

#desc Returns the result of rotating this vector around a given axis by [param angle] (in radians). The axis must be a normalized vector. See also [method @GlobalScope.deg_to_rad].
func rotated(axis: Vector3, angle: float) -> Vector3:
	pass;

#desc Returns a new vector with all components rounded to the nearest integer, with halfway cases rounded away from zero.
func round() -> Vector3:
	pass;

#desc Returns a new vector with each component set to [code]1.0[/code] if it's positive, [code]-1.0[/code] if it's negative, and [code]0.0[/code] if it's zero. The result is identical to calling [method @GlobalScope.sign] on each component.
func sign() -> Vector3:
	pass;

#desc Returns the signed angle to the given vector, in radians. The sign of the angle is positive in a counter-clockwise direction and negative in a clockwise direction when viewed from the side specified by the [param axis].
func signed_angle_to(to: Vector3, axis: Vector3) -> float:
	pass;

#desc Returns the result of spherical linear interpolation between this vector and [param to], by amount [param weight]. [param weight] is on the range of 0.0 to 1.0, representing the amount of interpolation.
#desc This method also handles interpolating the lengths if the input vectors have different lengths. For the special case of one or both input vectors having zero length, this method behaves like [method lerp].
func slerp(to: Vector3, weight: float) -> Vector3:
	pass;

#desc Returns a new vector slid along a plane defined by the given normal.
func slide(n: Vector3) -> Vector3:
	pass;

#desc Returns a new vector with each component snapped to the nearest multiple of the corresponding component in [param step]. This can also be used to round the components to an arbitrary number of decimals.
func snapped(step: Vector3) -> Vector3:
	pass;



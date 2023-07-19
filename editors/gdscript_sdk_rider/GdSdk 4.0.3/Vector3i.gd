#brief Vector used for 3D math using integer coordinates.
#desc 3-element structure that can be used to represent positions in 3D space or any other triplet of numeric values.
#desc It uses integer coordinates and is therefore preferable to [Vector3] when exact precision is required. Note that the values are limited to 32 bits, and unlike [Vector3] this cannot be configured with an engine build option. Use [int] or [PackedInt64Array] if 64-bit values are needed.
#desc [b]Note:[/b] In a boolean context, a Vector3i will evaluate to [code]false[/code] if it's equal to [code]Vector3i(0, 0, 0)[/code]. Otherwise, a Vector3i will always evaluate to [code]true[/code].
#tutorial [Math documentation index] https://docs.godotengine.org/en/stable/tutorials/math/index.html
#tutorial [Vector math] https://docs.godotengine.org/en/stable/tutorials/math/vector_math.html
#tutorial [3Blue1Brown Essence of Linear Algebra] https://www.youtube.com/playlist?list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab
class_name Vector3i

#desc Enumerated value for the X axis. Returned by [method max_axis_index] and [method min_axis_index].
const AXIS_X = 0;

#desc Enumerated value for the Y axis. Returned by [method max_axis_index] and [method min_axis_index].
const AXIS_Y = 1;

#desc Enumerated value for the Z axis. Returned by [method max_axis_index] and [method min_axis_index].
const AXIS_Z = 2;

#desc Zero vector, a vector with all components set to [code]0[/code].
const ZERO = Vector3i(0, 0, 0);

#desc One vector, a vector with all components set to [code]1[/code].
const ONE = Vector3i(1, 1, 1);

#desc Left unit vector. Represents the local direction of left, and the global direction of west.
const LEFT = Vector3i(-1, 0, 0);

#desc Right unit vector. Represents the local direction of right, and the global direction of east.
const RIGHT = Vector3i(1, 0, 0);

#desc Up unit vector.
const UP = Vector3i(0, 1, 0);

#desc Down unit vector.
const DOWN = Vector3i(0, -1, 0);

#desc Forward unit vector. Represents the local direction of forward, and the global direction of north.
const FORWARD = Vector3i(0, 0, -1);

#desc Back unit vector. Represents the local direction of back, and the global direction of south.
const BACK = Vector3i(0, 0, 1);


#desc The vector's X component. Also accessible by using the index position [code][0][/code].
var x: int

#desc The vector's Y component. Also accessible by using the index position [code][1][/code].
var y: int

#desc The vector's Z component. Also accessible by using the index position [code][2][/code].
var z: int


#desc Constructs a default-initialized [Vector3i] with all components set to [code]0[/code].
func Vector3i() -> Vector3i:
	pass;

#desc Constructs a [Vector3i] as a copy of the given [Vector3i].
func Vector3i(from: Vector3i) -> Vector3i:
	pass;

#desc Constructs a new [Vector3i] from the given [Vector3] by truncating components' fractional parts (rounding towards zero). For a different behavior consider passing the result of [method Vector3.ceil], [method Vector3.floor] or [method Vector3.round] to this constructor instead.
func Vector3i(from: Vector3) -> Vector3i:
	pass;

#desc Returns a [Vector3i] with the given components.
func Vector3i(x: int, y: int, z: int) -> Vector3i:
	pass;


#desc Returns a new vector with all components in absolute values (i.e. positive).
func abs() -> Vector3i:
	pass;

#desc Returns a new vector with all components clamped between the components of [param min] and [param max], by running [method @GlobalScope.clamp] on each component.
func clamp(min: Vector3i, max: Vector3i) -> Vector3i:
	pass;

#desc Returns the length (magnitude) of this vector.
func length() -> float:
	pass;

#desc Returns the squared length (squared magnitude) of this vector.
#desc This method runs faster than [method length], so prefer it if you need to compare vectors or need the squared distance for some formula.
func length_squared() -> int:
	pass;

#desc Returns the axis of the vector's highest value. See [code]AXIS_*[/code] constants. If all components are equal, this method returns [constant AXIS_X].
func max_axis_index() -> int:
	pass;

#desc Returns the axis of the vector's lowest value. See [code]AXIS_*[/code] constants. If all components are equal, this method returns [constant AXIS_Z].
func min_axis_index() -> int:
	pass;

#desc Returns a new vector with each component set to [code]1[/code] if it's positive, [code]-1[/code] if it's negative, and [code]0[/code] if it's zero. The result is identical to calling [method @GlobalScope.sign] on each component.
func sign() -> Vector3i:
	pass;

#desc Returns a new vector with each component snapped to the closest multiple of the corresponding component in [param step].
func snapped(step: Vector3i) -> Vector3i:
	pass;



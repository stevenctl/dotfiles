#brief 3D projection (4x4 matrix).
#desc A 4x4 matrix used for 3D projective transformations. It can represent transformations such as translation, rotation, scaling, shearing, and perspective division. It consists of four [Vector4] columns.
#desc For purely linear transformations (translation, rotation, and scale), it is recommended to use [Transform3D], as it is more performant and has a lower memory footprint.
#desc Used internally as [Camera3D]'s projection matrix.
class_name Projection

#desc The index value of the projection's near clipping plane.
const PLANE_NEAR = 0;

#desc The index value of the projection's far clipping plane.
const PLANE_FAR = 1;

#desc The index value of the projection's left clipping plane.
const PLANE_LEFT = 2;

#desc The index value of the projection's top clipping plane.
const PLANE_TOP = 3;

#desc The index value of the projection's right clipping plane.
const PLANE_RIGHT = 4;

#desc The index value of the projection bottom clipping plane.
const PLANE_BOTTOM = 5;

#desc A [Projection] with no transformation defined. When applied to other data structures, no transformation is performed.
const IDENTITY = Projection(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);

#desc A [Projection] with all values initialized to 0. When applied to other data structures, they will be zeroed.
const ZERO = Projection(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);


#desc The projection matrix's W vector (column 3). Equivalent to array index [code]3[/code].
var w: Vector4

#desc The projection matrix's X vector (column 0). Equivalent to array index [code]0[/code].
var x: Vector4

#desc The projection matrix's Y vector (column 1). Equivalent to array index [code]1[/code].
var y: Vector4

#desc The projection matrix's Z vector (column 2). Equivalent to array index [code]2[/code].
var z: Vector4


#desc Constructs a default-initialized [Projection] set to [constant IDENTITY].
func Projection() -> Projection:
	pass;

#desc Constructs a [Projection] as a copy of the given [Projection].
func Projection(from: Projection) -> Projection:
	pass;

#desc Constructs a Projection as a copy of the given [Transform3D].
func Projection(from: Transform3D) -> Projection:
	pass;

#desc Constructs a Projection from four [Vector4] values (matrix columns).
func Projection(x_axis: Vector4, y_axis: Vector4, z_axis: Vector4, w_axis: Vector4) -> Projection:
	pass;


#desc Creates a new [Projection] that projects positions from a depth range of [code]-1[/code] to [code]1[/code] to one that ranges from [code]0[/code] to [code]1[/code], and flips the projected positions vertically, according to [param flip_y].
static func create_depth_correction(flip_y: bool) -> Projection:
	pass;

#desc Creates a new [Projection] that scales a given projection to fit around a given [AABB] in projection space.
static func create_fit_aabb(aabb: AABB) -> Projection:
	pass;

#desc Creates a new [Projection] for projecting positions onto a head-mounted display with the given X:Y aspect ratio, distance between eyes, display width, distance to lens, oversampling factor, and depth clipping planes.
#desc [param eye] creates the projection for the left eye when set to 1, or the right eye when set to 2.
static func create_for_hmd(eye: int, aspect: float, intraocular_dist: float, display_width: float, display_to_lens: float, oversample: float, z_near: float, z_far: float) -> Projection:
	pass;

#desc Creates a new [Projection] that projects positions in a frustum with the given clipping planes.
static func create_frustum(left: float, right: float, bottom: float, top: float, z_near: float, z_far: float) -> Projection:
	pass;

#desc Creates a new [Projection] that projects positions in a frustum with the given size, X:Y aspect ratio, offset, and clipping planes.
#desc [param flip_fov] determines whether the projection's field of view is flipped over its diagonal.
static func create_frustum_aspect(size: float, aspect: float, offset: Vector2, z_near: float, z_far: float, flip_fov: bool = false) -> Projection:
	pass;

#desc Creates a new [Projection] that projects positions into the given [Rect2].
static func create_light_atlas_rect(rect: Rect2) -> Projection:
	pass;

#desc Creates a new [Projection] that projects positions using an orthogonal projection with the given clipping planes.
static func create_orthogonal(left: float, right: float, bottom: float, top: float, z_near: float, z_far: float) -> Projection:
	pass;

#desc Creates a new [Projection] that projects positions using an orthogonal projection with the given size, X:Y aspect ratio, and clipping planes.
#desc [param flip_fov] determines whether the projection's field of view is flipped over its diagonal.
static func create_orthogonal_aspect(size: float, aspect: float, z_near: float, z_far: float, flip_fov: bool = false) -> Projection:
	pass;

#desc Creates a new [Projection] that projects positions using a perspective projection with the given Y-axis field of view (in degrees), X:Y aspect ratio, and clipping planes.
#desc [param flip_fov] determines whether the projection's field of view is flipped over its diagonal.
static func create_perspective(fovy: float, aspect: float, z_near: float, z_far: float, flip_fov: bool = false) -> Projection:
	pass;

#desc Creates a new [Projection] that projects positions using a perspective projection with the given Y-axis field of view (in degrees), X:Y aspect ratio, and clipping distances. The projection is adjusted for a head-mounted display with the given distance between eyes and distance to a point that can be focused on.
#desc [param eye] creates the projection for the left eye when set to 1, or the right eye when set to 2.
#desc [param flip_fov] determines whether the projection's field of view is flipped over its diagonal.
static func create_perspective_hmd(fovy: float, aspect: float, z_near: float, z_far: float, flip_fov: bool, eye: int, intraocular_dist: float, convergence_dist: float) -> Projection:
	pass;

#desc Returns a scalar value that is the signed factor by which areas are scaled by this matrix. If the sign is negative, the matrix flips the orientation of the area.
#desc The determinant can be used to calculate the invertibility of a matrix or solve linear systems of equations involving the matrix, among other applications.
func determinant() -> float:
	pass;

#desc Returns a copy of this [Projection] with the signs of the values of the Y column flipped.
func flipped_y() -> Projection:
	pass;

#desc Returns the X:Y aspect ratio of this [Projection]'s viewport.
func get_aspect() -> float:
	pass;

#desc Returns the dimensions of the far clipping plane of the projection, divided by two.
func get_far_plane_half_extents() -> Vector2:
	pass;

#desc Returns the horizontal field of view of the projection (in degrees).
func get_fov() -> float:
	pass;

#desc Returns the vertical field of view of the projection (in degrees) associated with the given horizontal field of view (in degrees) and aspect ratio.
static func get_fovy(fovx: float, aspect: float) -> float:
	pass;

#desc Returns the factor by which the visible level of detail is scaled by this [Projection].
func get_lod_multiplier() -> float:
	pass;

#desc Returns the number of pixels with the given pixel width displayed per meter, after this [Projection] is applied.
func get_pixels_per_meter(for_pixel_width: int) -> int:
	pass;

#desc Returns the clipping plane of this [Projection] whose index is given by [param plane].
#desc [param plane] should be equal to one of [constant PLANE_NEAR], [constant PLANE_FAR], [constant PLANE_LEFT], [constant PLANE_TOP], [constant PLANE_RIGHT], or [constant PLANE_BOTTOM].
func get_projection_plane(plane: int) -> Plane:
	pass;

#desc Returns the dimensions of the viewport plane that this [Projection] projects positions onto, divided by two.
func get_viewport_half_extents() -> Vector2:
	pass;

#desc Returns the distance for this [Projection] beyond which positions are clipped.
func get_z_far() -> float:
	pass;

#desc Returns the distance for this [Projection] before which positions are clipped.
func get_z_near() -> float:
	pass;

#desc Returns a [Projection] that performs the inverse of this [Projection]'s projective transformation.
func inverse() -> Projection:
	pass;

#desc Returns [code]true[/code] if this [Projection] performs an orthogonal projection.
func is_orthogonal() -> bool:
	pass;

#desc Returns a [Projection] with the X and Y values from the given [Vector2] added to the first and second values of the final column respectively.
func jitter_offseted(offset: Vector2) -> Projection:
	pass;

#desc Returns a [Projection] with the near clipping distance adjusted to be [param new_znear].
#desc [b]Note:[/b] The original [Projection] must be a perspective projection.
func perspective_znear_adjusted(new_znear: float) -> Projection:
	pass;



extends Shape2D
#brief Concave polygon shape resource for 2D physics.
#desc 2D concave polygon shape to be added as a [i]direct[/i] child of a [PhysicsBody2D] or [Area2D] using a [CollisionShape2D] node.
#desc The shape consists of a collection of line segments, and as such it does not include any "inside" that the segments might be enclosing. If the segments do enclose anything, then the shape is [i]hollow[/i], as opposed to a [ConvexPolygonShape2D] which is solid. See also [CollisionPolygon2D].
#desc Being made out of line segments, this shape is the most freely configurable single 2D shape. It can be used to form (hollow) polygons of any nature, convex or concave.
#desc [b]Note:[/b] When used for collision, [b]ConcavePolygonShape2D[/b] is intended to work with static [PhysicsBody2D] nodes like [StaticBody2D] and is not recommended to use with [RigidBody2D] nodes in a mode other than Static. A [CollisionPolygon2D] in convex decomposition mode (solids) or several convex objects are advised for that instead. Otherwise, a concave polygon 2D shape is better suited for static bodies.
#desc [b]Warning:[/b] The nature of this shape makes it extra prone to being tunneled through by (small) fast physics bodies. For example, consider a (small) rigid body [i]Ball[/i] traveling toward a static body [i]Box[/i] at high speed. If the box uses a [b]ConcavePolygonShape2D[/b] consisting of four segments, then the ball might end up inside the box or tunnel all the way through the box, if it goes fast enough. This is (partly) because the ball can only collide against the individual segments of the hollow box. In interactions with rigid bodies tunneling can be avoided by enabling continuous collision detection on the rigid body.
#desc [b]Warning:[/b] Using this shape for an [Area2D] (via a [CollisionShape2D] node) may give unexpected results: the area will only detect collisions with the segments in the [ConcavePolygonShape2D] (and not with any "inside" of the shape, for example).
#desc [b]Performance:[/b] Due to its complexity, [ConcavePolygonShape2D] is the slowest collision shape to check collisions against. Its use should generally be limited to level geometry. For convex geometry, using [ConvexPolygonShape2D] will perform better. For dynamic physics bodies that need concave collision, several [ConvexPolygonShape2D]s can be used to represent its collision by using convex decomposition; see [ConvexPolygonShape2D]'s documentation for instructions. However, consider using primitive collision shapes such as [CircleShape2D] or [RectangleShape2D] first.
class_name ConcavePolygonShape2D


#desc The array of points that make up the [ConcavePolygonShape2D]'s line segments. The array (of length divisible by two) is naturally divided into pairs (one pair for each segment); each pair consists of the starting point of a segment and the endpoint of a segment.
var segments: PackedVector2Array:
	get = get_segments, set = set_segments




func get_segments() -> PackedVector2Array:
	return segments

func set_segments(value: PackedVector2Array) -> void:
	segments = value


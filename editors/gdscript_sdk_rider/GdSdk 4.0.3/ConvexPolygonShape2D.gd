extends Shape2D
#brief Convex polygon shape resource for 2D physics.
#desc 2D convex polygon shape to be added as a [i]direct[/i] child of a [PhysicsBody2D] or [Area2D] using a [CollisionShape2D] node.
#desc The shape is a [i]solid[/i] that includes all the points that it encloses, as opposed to [ConcavePolygonShape2D] which is hollow if it encloses anything. See also [CollisionPolygon2D].
#desc The solid nature of the shape makes it well-suited for both detection and physics; in physics body interactions this allows depenetrating even those shapes which end up (e.g. due to high speed) fully inside the convex shape (similarly to primitive shapes, but unlike [ConcavePolygonShape2D]). The convexity limits the possible geometric shape of a single [ConvexPolygonShape2D]: it cannot be concave.
#desc [b]Convex decomposition:[/b] Concave objects' collisions can be represented accurately using [i]several[/i] convex shapes. This allows dynamic physics bodies to have complex concave collisions (at a performance cost). It can be achieved using several [ConvexPolygonShape2D] nodes or by using the [CollisionPolygon2D] node in Solids build mode. To generate a collision polygon from a sprite, select the [Sprite2D] node, go to the [b]Sprite2D[/b] menu that appears above the viewport, and choose [b]Create Polygon2D Sibling[/b].
#desc [b]Performance:[/b] [ConvexPolygonShape2D] is faster to check collisions against compared to [ConcavePolygonShape2D], but it is slower than primitive collision shapes such as [CircleShape2D] or [RectangleShape2D]. Its use should generally be limited to medium-sized objects that cannot have their collision accurately represented by primitive shapes.
class_name ConvexPolygonShape2D


#desc The polygon's list of vertices that form a convex hull. Can be in either clockwise or counterclockwise order.
#desc [b]Warning:[/b] Only set this property to a list of points that actually form a convex hull. Use [method set_point_cloud] to generate the convex hull of an arbitrary set of points.
var points: PackedVector2Array:
	get = get_points, set = set_points



#desc Based on the set of points provided, this assigns the [member points] property using the convex hull algorithm, removing all unneeded points. See [method Geometry2D.convex_hull] for details.
func set_point_cloud(point_cloud: PackedVector2Array) -> void:
	pass;


func get_points() -> PackedVector2Array:
	return points

func set_points(value: PackedVector2Array) -> void:
	points = value


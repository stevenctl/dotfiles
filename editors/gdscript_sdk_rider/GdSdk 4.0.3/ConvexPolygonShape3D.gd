extends Shape3D
#brief Convex polygon shape resource for 3D physics.
#desc 3D convex polygon shape resource to be added as a [i]direct[/i] child of a [PhysicsBody3D] or [Area3D] using a [CollisionShape3D] node.
#desc The shape is a [i]solid[/i] that includes all the points that it encloses, as opposed to [ConcavePolygonShape3D] which is hollow if it encloses anything. See also [CollisionPolygon3D].
#desc The solid nature of the shape makes it well-suited for both detection and physics; in physics body interactions this allows depenetrating even those shapes which end up (e.g. due to high speed) fully inside the convex shape (similarly to primitive shapes, but unlike [ConcavePolygonShape3D] and [HeightMapShape3D]). The convexity restricts the possible geometric shape of a single [ConvexPolygonShape3D]: it cannot be concave.
#desc [b]Convex decomposition:[/b] Concave objects' collisions can be represented accurately using [i]several[/i] convex shapes. This allows dynamic physics bodies to have complex concave collisions (at a performance cost). It can be achieved by using several [ConvexPolygonShape3D] nodes or by using the [CollisionPolygon3D] node. To generate a collision polygon from a mesh, select the [MeshInstance3D] node, go to the [b]Mesh[/b] menu that appears above the viewport and choose [b]Create Multiple Convex Collision Siblings[/b]. Alternatively, [method MeshInstance3D.create_multiple_convex_collisions] can be called in a script to perform this decomposition at run-time.
#desc [b]Performance:[/b] [ConvexPolygonShape3D] is faster to check collisions against compared to [ConcavePolygonShape3D], but it is slower than primitive collision shapes such as [SphereShape3D] or [BoxShape3D]. Its use should generally be limited to medium-sized objects that cannot have their collision accurately represented by primitive shapes.
#tutorial [3D Physics Tests Demo] https://godotengine.org/asset-library/asset/675
class_name ConvexPolygonShape3D


#desc The list of 3D points forming the convex polygon shape.
var points: PackedVector3Array:
	get = get_points, set = set_points




func get_points() -> PackedVector3Array:
	return points

func set_points(value: PackedVector3Array) -> void:
	points = value


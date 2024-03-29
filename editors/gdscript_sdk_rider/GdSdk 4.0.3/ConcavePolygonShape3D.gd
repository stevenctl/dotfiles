extends Shape3D
#brief Concave polygon shape resource (also called "trimesh") for 3D physics.
#desc 3D concave polygon shape resource (also called "trimesh") to be added as a [i]direct[/i] child of a [PhysicsBody3D] or [Area3D] using a [CollisionShape3D] node.
#desc The shape consists of a collection of triangle faces, and as such it does not include any "inside" that the faces might be enclosing. If the faces enclose anything, then the shape is [i]hollow[/i], as opposed to a [ConvexPolygonShape3D] which is solid. See also [CollisionPolygon3D].
#desc Being made out of triangle faces, this shape is the most freely configurable single 3D shape. Despite its name, it can be used to form (hollow) polyhedra of any nature, convex or concave.
#desc [b]Note:[/b] When used for collision, [b]ConcavePolygonShape3D[/b] is intended to work with static [PhysicsBody3D] nodes like [StaticBody3D] and will not work with [CharacterBody3D] or [RigidBody3D] in a mode other than Static.
#desc [b]Warning:[/b] The nature of this shape makes it extra prone to being tunneled through by (small) fast physics bodies. For example, consider a (small) rigid body [i]Ball[/i] traveling toward a static body [i]Box[/i] at high speed. If the box uses a [b]ConcavePolygonShape3D[/b] consisting of twelve triangle faces (two triangle faces for each of the six sides of the box), then the ball might end up inside the box or tunnel all the way through the box, if it goes fast enough. This is (partly) because the ball can only collide against the individual faces of the hollow box. In interactions with rigid bodies tunneling can be avoided by enabling continuous collision detection on the rigid body.
#desc [b]Warning:[/b] Using this shape for an [Area3D] (via a [CollisionShape3D] node, created e.g. by using the [i]Create Trimesh Collision Sibling[/i] option in the [i]Mesh[/i] menu that appears when selecting a [MeshInstance3D] node) may give unexpected results: the area will only detect collisions with the triangle faces in the [ConcavePolygonShape3D] (and not with any "inside" of the shape, for example); moreover it will only detect all such collisions if [member backface_collision] is [code]true[/code].
#desc [b]Performance:[/b] Due to its complexity, [ConcavePolygonShape3D] is the slowest collision shape to check collisions against. Its use should generally be limited to level geometry. For convex geometry, using [ConvexPolygonShape3D] will perform better. For dynamic physics bodies that need concave collision, several [ConvexPolygonShape3D]s can be used to represent its collision by using convex decomposition; see [ConvexPolygonShape3D]'s documentation for instructions. However, consider using primitive collision shapes such as [SphereShape3D] or [BoxShape3D] first.
#tutorial [3D Physics Tests Demo] https://godotengine.org/asset-library/asset/675
class_name ConcavePolygonShape3D


#desc If set to [code]true[/code], collisions occur on both sides of the concave shape faces. Otherwise they occur only along the face normals.
var backface_collision: bool:
	get = is_backface_collision_enabled, set = set_backface_collision_enabled



#desc Returns the faces of the trimesh shape as an array of vertices. The array (of length divisible by three) is naturally divided into triples; each triple of vertices defines a triangle.
func get_faces() -> PackedVector3Array:
	pass;

#desc Sets the faces of the trimesh shape from an array of vertices. The [param faces] array should be composed of triples such that each triple of vertices defines a triangle.
func set_faces(faces: PackedVector3Array) -> void:
	pass;


func is_backface_collision_enabled() -> bool:
	return backface_collision

func set_backface_collision_enabled(value: bool) -> void:
	backface_collision = value


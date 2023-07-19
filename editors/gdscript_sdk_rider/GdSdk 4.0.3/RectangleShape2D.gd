extends Shape2D
#brief Rectangle shape resource for 2D physics.
#desc 2D rectangle shape to be added as a [i]direct[/i] child of a [PhysicsBody2D] or [Area2D] using a [CollisionShape2D] node. This shape is useful for modeling box-like 2D objects.
#desc [b]Performance:[/b] Being a primitive collision shape, [RectangleShape2D] is fast to check collisions against (though not as fast as [CircleShape2D]).
#tutorial [2D Pong Demo] https://godotengine.org/asset-library/asset/121
#tutorial [2D Kinematic Character Demo] https://godotengine.org/asset-library/asset/113
class_name RectangleShape2D


#desc The rectangle's width and height.
var size: Vector2:
	get = get_size, set = set_size




func get_size() -> Vector2:
	return size

func set_size(value: Vector2) -> void:
	size = value


extends Shape3D
#brief Height map shape resource for 3D physics.
#desc Height map shape resource, which can be added to a [PhysicsBody3D] or [Area3D]. Heightmap collision is typically used for colliding with terrains. However, since heightmaps cannot store overhangs, collisions with other structures (such as buildings) must be done with other collision shapes such as [ConcavePolygonShape3D]. If needed, "holes" can be created in an [HeightMapShape3D] by assigning very low points (like [code]-100000[/code]) in the desired area.
#desc [b]Performance:[/b] [HeightMapShape3D] is faster to check collisions against compared to [ConcavePolygonShape3D], but it is slower than primitive collision shapes such as [SphereShape3D] or [BoxShape3D].
class_name HeightMapShape3D


#desc Height map data, pool array must be of [member map_width] * [member map_depth] size.
var map_data: PackedFloat32Array:
	get = get_map_data, set = set_map_data

#desc Number of vertices in the depth of the height map. Changing this will resize the [member map_data].
var map_depth: int:
	get = get_map_depth, set = set_map_depth

#desc Number of vertices in the width of the height map. Changing this will resize the [member map_data].
var map_width: int:
	get = get_map_width, set = set_map_width




func get_map_data() -> PackedFloat32Array:
	return map_data

func set_map_data(value: PackedFloat32Array) -> void:
	map_data = value

func get_map_depth() -> int:
	return map_depth

func set_map_depth(value: int) -> void:
	map_depth = value

func get_map_width() -> int:
	return map_width

func set_map_width(value: int) -> void:
	map_width = value


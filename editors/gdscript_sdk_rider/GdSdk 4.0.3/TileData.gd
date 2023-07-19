extends Object
#brief Settings for a single tile in a [TileSet].
#desc [TileData] object represents a single tile in a [TileSet]. It is usually edited using the tileset editor, but it can be modified at runtime using [method TileMap._tile_data_runtime_update].
class_name TileData

#desc Emitted when any of the properties are changed.
signal changed

#desc If [code]true[/code], the tile will have its texture flipped horizontally.
var flip_h: bool:
	get = get_flip_h, set = set_flip_h

#desc If [code]true[/code], the tile will have its texture flipped vertically.
var flip_v: bool:
	get = get_flip_v, set = set_flip_v

#desc The [Material] to use for this [TileData]. This can be a [CanvasItemMaterial] to use the default shader, or a [ShaderMaterial] to use a custom shader.
var material: Material:
	get = get_material, set = set_material

#desc Color modulation of the tile.
var modulate: Color:
	get = get_modulate, set = set_modulate

#desc Relative probability of this tile being selected when drawing a pattern of random tiles.
var probability: float:
	get = get_probability, set = set_probability

#desc ID of the terrain from the terrain set that the tile uses.
var terrain: int:
	get = get_terrain, set = set_terrain

#desc ID of the terrain set that the tile uses.
var terrain_set: int:
	get = get_terrain_set, set = set_terrain_set

#desc Offsets the position of where the tile is drawn.
var texture_origin: Vector2i:
	get = get_texture_origin, set = set_texture_origin

#desc If [code]true[/code], the tile will display transposed, i.e. with horizontal and vertical texture UVs swapped.
var transpose: bool:
	get = get_transpose, set = set_transpose

#desc Vertical point of the tile used for determining y-sorted order.
var y_sort_origin: int:
	get = get_y_sort_origin, set = set_y_sort_origin

#desc Ordering index of this tile, relative to [TileMap].
var z_index: int:
	get = get_z_index, set = set_z_index



#desc Adds a collision polygon to the tile on the given TileSet physics layer.
func add_collision_polygon(layer_id: int) -> void:
	pass;

#desc Returns the one-way margin (for one-way platforms) of the polygon at index [param polygon_index] for TileSet physics layer with index [param layer_id].
func get_collision_polygon_one_way_margin(layer_id: int, polygon_index: int) -> float:
	pass;

#desc Returns the points of the polygon at index [param polygon_index] for TileSet physics layer with index [param layer_id].
func get_collision_polygon_points(layer_id: int, polygon_index: int) -> PackedVector2Array:
	pass;

#desc Returns how many polygons the tile has for TileSet physics layer with index [param layer_id].
func get_collision_polygons_count(layer_id: int) -> int:
	pass;

#desc Returns the constant angular velocity applied to objects colliding with this tile.
func get_constant_angular_velocity(layer_id: int) -> float:
	pass;

#desc Returns the constant linear velocity applied to objects colliding with this tile.
func get_constant_linear_velocity(layer_id: int) -> Vector2:
	pass;

#desc Returns the custom data value for custom data layer named [param layer_name].
func get_custom_data(layer_name: String) -> Variant:
	pass;

#desc Returns the custom data value for custom data layer with index [param layer_id].
func get_custom_data_by_layer_id(layer_id: int) -> Variant:
	pass;

#desc Returns the navigation polygon of the tile for the TileSet navigation layer with index [param layer_id].
func get_navigation_polygon(layer_id: int) -> NavigationPolygon:
	pass;

#desc Returns the occluder polygon of the tile for the TileSet occlusion layer with index [param layer_id].
func get_occluder(layer_id: int) -> OccluderPolygon2D:
	pass;

#desc Returns the tile's terrain bit for the given [param peering_bit] direction.
func get_terrain_peering_bit(peering_bit: int) -> int:
	pass;

#desc Returns whether one-way collisions are enabled for the polygon at index [param polygon_index] for TileSet physics layer with index [param layer_id].
func is_collision_polygon_one_way(layer_id: int, polygon_index: int) -> bool:
	pass;

#desc Removes the polygon at index [param polygon_index] for TileSet physics layer with index [param layer_id].
func remove_collision_polygon(layer_id: int, polygon_index: int) -> void:
	pass;

#desc Enables/disables one-way collisions on the polygon at index [param polygon_index] for TileSet physics layer with index [param layer_id].
func set_collision_polygon_one_way(layer_id: int, polygon_index: int, one_way: bool) -> void:
	pass;

#desc Enables/disables one-way collisions on the polygon at index [param polygon_index] for TileSet physics layer with index [param layer_id].
func set_collision_polygon_one_way_margin(layer_id: int, polygon_index: int, one_way_margin: float) -> void:
	pass;

#desc Sets the points of the polygon at index [param polygon_index] for TileSet physics layer with index [param layer_id].
func set_collision_polygon_points(layer_id: int, polygon_index: int, polygon: PackedVector2Array) -> void:
	pass;

#desc Sets the polygons count for TileSet physics layer with index [param layer_id].
func set_collision_polygons_count(layer_id: int, polygons_count: int) -> void:
	pass;

#desc Sets the constant angular velocity. This does not rotate the tile. This angular velocity is applied to objects colliding with this tile.
func set_constant_angular_velocity(layer_id: int, velocity: float) -> void:
	pass;

#desc Sets the constant linear velocity. This does not move the tile. This linear velocity is applied to objects colliding with this tile. This is useful to create conveyor belts.
func set_constant_linear_velocity(layer_id: int, velocity: Vector2) -> void:
	pass;

#desc Sets the tile's custom data value for the TileSet custom data layer with name [param layer_name].
func set_custom_data(layer_name: String, value: Variant) -> void:
	pass;

#desc Sets the tile's custom data value for the TileSet custom data layer with index [param layer_id].
func set_custom_data_by_layer_id(layer_id: int, value: Variant) -> void:
	pass;

#desc Sets the navigation polygon for the TileSet navigation layer with index [param layer_id].
func set_navigation_polygon(layer_id: int, navigation_polygon: NavigationPolygon) -> void:
	pass;

#desc Sets the occluder for the TileSet occlusion layer with index [param layer_id].
func set_occluder(layer_id: int, occluder_polygon: OccluderPolygon2D) -> void:
	pass;

#desc Sets the tile's terrain bit for the given [param peering_bit] direction.
func set_terrain_peering_bit(peering_bit: int, terrain: int) -> void:
	pass;


func get_flip_h() -> bool:
	return flip_h

func set_flip_h(value: bool) -> void:
	flip_h = value

func get_flip_v() -> bool:
	return flip_v

func set_flip_v(value: bool) -> void:
	flip_v = value

func get_material() -> Material:
	return material

func set_material(value: Material) -> void:
	material = value

func get_modulate() -> Color:
	return modulate

func set_modulate(value: Color) -> void:
	modulate = value

func get_probability() -> float:
	return probability

func set_probability(value: float) -> void:
	probability = value

func get_terrain() -> int:
	return terrain

func set_terrain(value: int) -> void:
	terrain = value

func get_terrain_set() -> int:
	return terrain_set

func set_terrain_set(value: int) -> void:
	terrain_set = value

func get_texture_origin() -> Vector2i:
	return texture_origin

func set_texture_origin(value: Vector2i) -> void:
	texture_origin = value

func get_transpose() -> bool:
	return transpose

func set_transpose(value: bool) -> void:
	transpose = value

func get_y_sort_origin() -> int:
	return y_sort_origin

func set_y_sort_origin(value: int) -> void:
	y_sort_origin = value

func get_z_index() -> int:
	return z_index

func set_z_index(value: int) -> void:
	z_index = value


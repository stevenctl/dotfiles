extends Resource
#brief Tile library for tilemaps.
#desc A TileSet is a library of tiles for a [TileMap]. A TileSet handles a list of [TileSetSource], each of them storing a set of tiles.
#desc Tiles can either be from a [TileSetAtlasSource], that render tiles out of a texture with support for physics, navigation, etc... or from a [TileSetScenesCollectionSource] which exposes scene-based tiles.
#desc Tiles are referenced by using three IDs: their source ID, their atlas coordinates ID and their alternative tile ID.
#desc A TileSet can be configured so that its tiles expose more or less properties. To do so, the TileSet resources uses property layers, that you can add or remove depending on your needs.
#desc For example, adding a physics layer allows giving collision shapes to your tiles. Each layer having dedicated properties (physics layer and mask), you may add several TileSet physics layers for each type of collision you need.
#desc See the functions to add new layers for more information.
#tutorial [Using Tilemaps] https://docs.godotengine.org/en/stable/tutorials/2d/using_tilemaps.html
#tutorial [2D Platformer Demo] https://godotengine.org/asset-library/asset/120
#tutorial [2D Isometric Demo] https://godotengine.org/asset-library/asset/112
#tutorial [2D Hexagonal Demo] https://godotengine.org/asset-library/asset/111
#tutorial [2D Navigation Astar Demo] https://godotengine.org/asset-library/asset/519
#tutorial [2D Role Playing Game Demo] https://godotengine.org/asset-library/asset/520
#tutorial [2D Kinematic Character Demo] https://godotengine.org/asset-library/asset/113
class_name TileSet

#desc Rectangular tile shape.
#desc Diamond tile shape (for isometric look).
#desc [b]Note:[/b] Isometric [TileSet] works best if [TileMap] and all its layers have Y-sort enabled.
#desc Rectangular tile shape with one row/column out of two offset by half a tile.
#desc Hexagonal tile shape.
#desc Tile coordinates layout where both axis stay consistent with their respective local horizontal and vertical axis.
#desc Same as [constant TILE_LAYOUT_STACKED], but the first half-offset is negative instead of positive.
#desc Tile coordinates layout where the horizontal axis stay horizontal, and the vertical one goes down-right.
#desc Tile coordinates layout where the vertical axis stay vertical, and the horizontal one goes down-right.
#desc Tile coordinates layout where the horizontal axis goes up-right, and the vertical one goes down-right.
#desc Tile coordinates layout where the horizontal axis goes down-right, and the vertical one goes down-left.
#desc Horizontal half-offset.
#desc Vertical half-offset.
#desc Neighbor on the right side.
#desc Neighbor in the right corner.
#desc Neighbor on the bottom right side.
#desc Neighbor in the bottom right corner.
#desc Neighbor on the bottom side.
#desc Neighbor in the bottom corner.
#desc Neighbor on the bottom left side.
#desc Neighbor in the bottom left corner.
#desc Neighbor on the left side.
#desc Neighbor in the left corner.
#desc Neighbor on the top left side.
#desc Neighbor in the top left corner.
#desc Neighbor on the top side.
#desc Neighbor in the top corner.
#desc Neighbor on the top right side.
#desc Neighbor in the top right corner.
#desc Requires both corners and side to match with neighboring tiles' terrains.
#desc Requires corners to match with neighboring tiles' terrains.
#desc Requires sides to match with neighboring tiles' terrains.

#enum TileShape
enum {
    TILE_SHAPE_SQUARE = 0,
    TILE_SHAPE_ISOMETRIC = 1,
    TILE_SHAPE_HALF_OFFSET_SQUARE = 2,
    TILE_SHAPE_HEXAGON = 3,
}
#enum TileLayout
enum {
    TILE_LAYOUT_STACKED = 0,
    TILE_LAYOUT_STACKED_OFFSET = 1,
    TILE_LAYOUT_STAIRS_RIGHT = 2,
    TILE_LAYOUT_STAIRS_DOWN = 3,
    TILE_LAYOUT_DIAMOND_RIGHT = 4,
    TILE_LAYOUT_DIAMOND_DOWN = 5,
}
#enum TileOffsetAxis
enum {
    TILE_OFFSET_AXIS_HORIZONTAL = 0,
    TILE_OFFSET_AXIS_VERTICAL = 1,
}
#enum CellNeighbor
enum {
    CELL_NEIGHBOR_RIGHT_SIDE = 0,
    CELL_NEIGHBOR_RIGHT_CORNER = 1,
    CELL_NEIGHBOR_BOTTOM_RIGHT_SIDE = 2,
    CELL_NEIGHBOR_BOTTOM_RIGHT_CORNER = 3,
    CELL_NEIGHBOR_BOTTOM_SIDE = 4,
    CELL_NEIGHBOR_BOTTOM_CORNER = 5,
    CELL_NEIGHBOR_BOTTOM_LEFT_SIDE = 6,
    CELL_NEIGHBOR_BOTTOM_LEFT_CORNER = 7,
    CELL_NEIGHBOR_LEFT_SIDE = 8,
    CELL_NEIGHBOR_LEFT_CORNER = 9,
    CELL_NEIGHBOR_TOP_LEFT_SIDE = 10,
    CELL_NEIGHBOR_TOP_LEFT_CORNER = 11,
    CELL_NEIGHBOR_TOP_SIDE = 12,
    CELL_NEIGHBOR_TOP_CORNER = 13,
    CELL_NEIGHBOR_TOP_RIGHT_SIDE = 14,
    CELL_NEIGHBOR_TOP_RIGHT_CORNER = 15,
}
#enum TerrainMode
enum {
    TERRAIN_MODE_MATCH_CORNERS_AND_SIDES = 0,
    TERRAIN_MODE_MATCH_CORNERS = 1,
    TERRAIN_MODE_MATCH_SIDES = 2,
}
#desc For all half-offset shapes (Isometric, Hexagonal and Half-Offset square), changes the way tiles are indexed in the TileMap grid.
var tile_layout: int:
	get = get_tile_layout, set = set_tile_layout

#desc For all half-offset shapes (Isometric, Hexagonal and Half-Offset square), determines the offset axis.
var tile_offset_axis: int:
	get = get_tile_offset_axis, set = set_tile_offset_axis

#desc The tile shape.
var tile_shape: int:
	get = get_tile_shape, set = set_tile_shape

#desc The tile size, in pixels. For all tile shapes, this size corresponds to the encompassing rectangle of the tile shape. This is thus the minimal cell size required in an atlas.
var tile_size: Vector2i:
	get = get_tile_size, set = set_tile_size

#desc Enables/Disable uv clipping when rendering the tiles.
var uv_clipping: bool:
	get = is_uv_clipping, set = set_uv_clipping



#desc Adds a custom data layer to the TileSet at the given position [param to_position] in the array. If [param to_position] is -1, adds it at the end of the array.
#desc Custom data layers allow assigning custom properties to atlas tiles.
func add_custom_data_layer(to_position: int = -1) -> void:
	pass;

#desc Adds a navigation layer to the TileSet at the given position [param to_position] in the array. If [param to_position] is -1, adds it at the end of the array.
#desc Navigation layers allow assigning a navigable area to atlas tiles.
func add_navigation_layer(to_position: int = -1) -> void:
	pass;

#desc Adds an occlusion layer to the TileSet at the given position [param to_position] in the array. If [param to_position] is -1, adds it at the end of the array.
#desc Occlusion layers allow assigning occlusion polygons to atlas tiles.
func add_occlusion_layer(to_position: int = -1) -> void:
	pass;

#desc Adds a [TileMapPattern] to be stored in the TileSet resource. If provided, insert it at the given [param index].
func add_pattern(pattern: TileMapPattern, index: int = -1) -> int:
	pass;

#desc Adds a physics layer to the TileSet at the given position [param to_position] in the array. If [param to_position] is -1, adds it at the end of the array.
#desc Physics layers allow assigning collision polygons to atlas tiles.
func add_physics_layer(to_position: int = -1) -> void:
	pass;

#desc Adds a [TileSetSource] to the TileSet. If [param atlas_source_id_override] is not -1, also set its source ID. Otherwise, a unique identifier is automatically generated.
#desc The function returns the added source ID or -1 if the source could not be added.
func add_source(source: TileSetSource, atlas_source_id_override: int = -1) -> int:
	pass;

#desc Adds a new terrain to the given terrain set [param terrain_set] at the given position [param to_position] in the array. If [param to_position] is -1, adds it at the end of the array.
func add_terrain(terrain_set: int, to_position: int = -1) -> void:
	pass;

#desc Adds a new terrain set at the given position [param to_position] in the array. If [param to_position] is -1, adds it at the end of the array.
func add_terrain_set(to_position: int = -1) -> void:
	pass;

#desc Clears tile proxies pointing to invalid tiles.
func cleanup_invalid_tile_proxies() -> void:
	pass;

#desc Clears all tile proxies.
func clear_tile_proxies() -> void:
	pass;

#desc Returns the alternative-level proxy for the given identifiers. The returned array contains the three proxie's target identifiers (source ID, atlas coords ID and alternative tile ID).
#desc If the TileSet has no proxy for the given identifiers, returns an empty Array.
func get_alternative_level_tile_proxy(source_from: int, coords_from: Vector2i, alternative_from: int) -> Array:
	pass;

#desc Returns the coordinate-level proxy for the given identifiers. The returned array contains the two target identifiers of the proxy (source ID and atlas coordinates ID).
#desc If the TileSet has no proxy for the given identifiers, returns an empty Array.
func get_coords_level_tile_proxy(source_from: int, coords_from: Vector2i) -> Array:
	pass;

#desc Returns the index of the custom data layer identified by the given name.
func get_custom_data_layer_by_name(layer_name: String) -> int:
	pass;

#desc Returns the name of the custom data layer identified by the given index.
func get_custom_data_layer_name(layer_index: int) -> String:
	pass;

#desc Returns the type of the custom data layer identified by the given index.
func get_custom_data_layer_type(layer_index: int) -> int:
	pass;

#desc Returns the custom data layers count.
func get_custom_data_layers_count() -> int:
	pass;

#desc Returns whether or not the specified navigation layer of the TileSet navigation data layer identified by the given [param layer_index] is enabled, given a navigation_layers [param layer_number] between 1 and 32.
func get_navigation_layer_layer_value(layer_index: int, layer_number: int) -> bool:
	pass;

#desc Returns the navigation layers (as in the Navigation server) of the given TileSet navigation layer.
func get_navigation_layer_layers(layer_index: int) -> int:
	pass;

#desc Returns the navigation layers count.
func get_navigation_layers_count() -> int:
	pass;

#desc Returns a new unused source ID. This generated ID is the same that a call to [code]add_source[/code] would return.
func get_next_source_id() -> int:
	pass;

#desc Returns the light mask of the occlusion layer.
func get_occlusion_layer_light_mask(layer_index: int) -> int:
	pass;

#desc Returns if the occluders from this layer use [code]sdf_collision[/code].
func get_occlusion_layer_sdf_collision(layer_index: int) -> bool:
	pass;

#desc Returns the occlusion layers count.
func get_occlusion_layers_count() -> int:
	pass;

#desc Returns the [TileMapPattern] at the given [param index].
func get_pattern(index: int = -1) -> TileMapPattern:
	pass;

#desc Returns the number of [TileMapPattern] this tile set handles.
func get_patterns_count() -> int:
	pass;

#desc Returns the collision layer (as in the physics server) bodies on the given TileSet's physics layer are in.
func get_physics_layer_collision_layer(layer_index: int) -> int:
	pass;

#desc Returns the collision mask of bodies on the given TileSet's physics layer.
func get_physics_layer_collision_mask(layer_index: int) -> int:
	pass;

#desc Returns the physics material of bodies on the given TileSet's physics layer.
func get_physics_layer_physics_material(layer_index: int) -> PhysicsMaterial:
	pass;

#desc Returns the physics layers count.
func get_physics_layers_count() -> int:
	pass;

#desc Returns the [TileSetSource] with ID [param source_id].
func get_source(source_id: int) -> TileSetSource:
	pass;

#desc Returns the number of [TileSetSource] in this TileSet.
func get_source_count() -> int:
	pass;

#desc Returns the source ID for source with index [param index].
func get_source_id(index: int) -> int:
	pass;

#desc Returns the source-level proxy for the given source identifier.
#desc If the TileSet has no proxy for the given identifier, returns -1.
func get_source_level_tile_proxy(source_from: int) -> int:
	pass;

#desc Returns a terrain's color.
func get_terrain_color(terrain_set: int, terrain_index: int) -> Color:
	pass;

#desc Returns a terrain's name.
func get_terrain_name(terrain_set: int, terrain_index: int) -> String:
	pass;

#desc Returns a terrain set mode.
func get_terrain_set_mode(terrain_set: int) -> int:
	pass;

#desc Returns the terrain sets count.
func get_terrain_sets_count() -> int:
	pass;

#desc Returns the number of terrains in the given terrain set.
func get_terrains_count(terrain_set: int) -> int:
	pass;

#desc Returns if there is an alternative-level proxy for the given identifiers.
func has_alternative_level_tile_proxy(source_from: int, coords_from: Vector2i, alternative_from: int) -> bool:
	pass;

#desc Returns if there is a coodinates-level proxy for the given identifiers.
func has_coords_level_tile_proxy(source_from: int, coords_from: Vector2i) -> bool:
	pass;

#desc Returns if this TileSet has a source for the given source ID.
func has_source(source_id: int) -> bool:
	pass;

#desc Returns if there is a source-level proxy for the given source ID.
func has_source_level_tile_proxy(source_from: int) -> bool:
	pass;

#desc According to the configured proxies, maps the provided indentifiers to a new set of identifiers. The source ID, atlas coordinates ID and alternative tile ID are returned as a 3 elements Array.
#desc This function first look for matching alternative-level proxies, then coordinates-level proxies, then source-level proxies.
#desc If no proxy corresponding to provided identifiers are found, returns the same values the ones used as arguments.
func map_tile_proxy(source_from: int, coords_from: Vector2i, alternative_from: int) -> Array:
	pass;

#desc Moves the custom data layer at index [param layer_index] to the given position [param to_position] in the array. Also updates the atlas tiles accordingly.
func move_custom_data_layer(layer_index: int, to_position: int) -> void:
	pass;

#desc Moves the navigation layer at index [param layer_index] to the given position [param to_position] in the array. Also updates the atlas tiles accordingly.
func move_navigation_layer(layer_index: int, to_position: int) -> void:
	pass;

#desc Moves the occlusion layer at index [param layer_index] to the given position [param to_position] in the array. Also updates the atlas tiles accordingly.
func move_occlusion_layer(layer_index: int, to_position: int) -> void:
	pass;

#desc Moves the physics layer at index [param layer_index] to the given position [param to_position] in the array. Also updates the atlas tiles accordingly.
func move_physics_layer(layer_index: int, to_position: int) -> void:
	pass;

#desc Moves the terrain at index [param terrain_index] for terrain set [param terrain_set] to the given position [param to_position] in the array. Also updates the atlas tiles accordingly.
func move_terrain(terrain_set: int, terrain_index: int, to_position: int) -> void:
	pass;

#desc Moves the terrain set at index [param terrain_set] to the given position [param to_position] in the array. Also updates the atlas tiles accordingly.
func move_terrain_set(terrain_set: int, to_position: int) -> void:
	pass;

#desc Removes an alternative-level proxy for the given identifiers.
func remove_alternative_level_tile_proxy(source_from: int, coords_from: Vector2i, alternative_from: int) -> void:
	pass;

#desc Removes a coordinates-level proxy for the given identifiers.
func remove_coords_level_tile_proxy(source_from: int, coords_from: Vector2i) -> void:
	pass;

#desc Removes the custom data layer at index [param layer_index]. Also updates the atlas tiles accordingly.
func remove_custom_data_layer(layer_index: int) -> void:
	pass;

#desc Removes the navigation layer at index [param layer_index]. Also updates the atlas tiles accordingly.
func remove_navigation_layer(layer_index: int) -> void:
	pass;

#desc Removes the occlusion layer at index [param layer_index]. Also updates the atlas tiles accordingly.
func remove_occlusion_layer(layer_index: int) -> void:
	pass;

#desc Remove the [TileMapPattern] at the given index.
func remove_pattern(index: int) -> void:
	pass;

#desc Removes the physics layer at index [param layer_index]. Also updates the atlas tiles accordingly.
func remove_physics_layer(layer_index: int) -> void:
	pass;

#desc Removes the source with the given source ID.
func remove_source(source_id: int) -> void:
	pass;

#desc Removes a source-level tile proxy.
func remove_source_level_tile_proxy(source_from: int) -> void:
	pass;

#desc Removes the terrain at index [param terrain_index] in the given terrain set [param terrain_set]. Also updates the atlas tiles accordingly.
func remove_terrain(terrain_set: int, terrain_index: int) -> void:
	pass;

#desc Removes the terrain set at index [param terrain_set]. Also updates the atlas tiles accordingly.
func remove_terrain_set(terrain_set: int) -> void:
	pass;

#desc Create an alternative-level proxy for the given identifiers. A proxy will map set of tile identifiers to another set of identifiers.
#desc This can be used to replace a tile in all TileMaps using this TileSet, as TileMap nodes will find and use the proxy's target tile when one is available.
#desc Proxied tiles can be automatically replaced in TileMap nodes using the editor.
func set_alternative_level_tile_proxy(source_from: int, coords_from: Vector2i, alternative_from: int, source_to: int, coords_to: Vector2i, alternative_to: int) -> void:
	pass;

#desc Creates a coordinates-level proxy for the given identifiers. A proxy will map set of tile identifiers to another set of identifiers. The alternative tile ID is kept the same when using coordinates-level proxies.
#desc This can be used to replace a tile in all TileMaps using this TileSet, as TileMap nodes will find and use the proxy's target tile when one is available.
#desc Proxied tiles can be automatically replaced in TileMap nodes using the editor.
func set_coords_level_tile_proxy(p_source_from: int, coords_from: Vector2i, source_to: int, coords_to: Vector2i) -> void:
	pass;

#desc Sets the name of the custom data layer identified by the given index. Names are identifiers of the layer therefore if the name is already taken it will fail and raise an error.
func set_custom_data_layer_name(layer_index: int, layer_name: String) -> void:
	pass;

#desc Sets the type of the custom data layer identified by the given index.
func set_custom_data_layer_type(layer_index: int, layer_type: int) -> void:
	pass;

#desc Based on [param value], enables or disables the specified navigation layer of the TileSet navigation data layer identified by the given [param layer_index], given a navigation_layers [param layer_number] between 1 and 32.
func set_navigation_layer_layer_value(layer_index: int, layer_number: int, value: bool) -> void:
	pass;

#desc Sets the navigation layers (as in the navigation server) for navigation regions in the given TileSet navigation layer.
func set_navigation_layer_layers(layer_index: int, layers: int) -> void:
	pass;

#desc Sets the occlusion layer (as in the rendering server) for occluders in the given TileSet occlusion layer.
func set_occlusion_layer_light_mask(layer_index: int, light_mask: int) -> void:
	pass;

#desc Enables or disables SDF collision for occluders in the given TileSet occlusion layer.
func set_occlusion_layer_sdf_collision(layer_index: int, sdf_collision: bool) -> void:
	pass;

#desc Sets the physics layer (as in the physics server) for bodies in the given TileSet physics layer.
func set_physics_layer_collision_layer(layer_index: int, layer: int) -> void:
	pass;

#desc Sets the physics layer (as in the physics server) for bodies in the given TileSet physics layer.
func set_physics_layer_collision_mask(layer_index: int, mask: int) -> void:
	pass;

#desc Sets the physics material for bodies in the given TileSet physics layer.
func set_physics_layer_physics_material(layer_index: int, physics_material: PhysicsMaterial) -> void:
	pass;

#desc Changes a source's ID.
func set_source_id(source_id: int, new_source_id: int) -> void:
	pass;

#desc Creates a source-level proxy for the given source ID. A proxy will map set of tile identifiers to another set of identifiers. Both the atlas coordinates ID and the alternative tile ID are kept the same when using source-level proxies.
#desc This can be used to replace a source in all TileMaps using this TileSet, as TileMap nodes will find and use the proxy's target source when one is available.
#desc Proxied tiles can be automatically replaced in TileMap nodes using the editor.
func set_source_level_tile_proxy(source_from: int, source_to: int) -> void:
	pass;

#desc Sets a terrain's color. This color is used for identifying the different terrains in the TileSet editor.
func set_terrain_color(terrain_set: int, terrain_index: int, color: Color) -> void:
	pass;

#desc Sets a terrain's name.
func set_terrain_name(terrain_set: int, terrain_index: int, name: String) -> void:
	pass;

#desc Sets a terrain mode. Each mode determines which bits of a tile shape is used to match the neighboring tiles' terrains.
func set_terrain_set_mode(terrain_set: int, mode: int) -> void:
	pass;


func get_tile_layout() -> int:
	return tile_layout

func set_tile_layout(value: int) -> void:
	tile_layout = value

func get_tile_offset_axis() -> int:
	return tile_offset_axis

func set_tile_offset_axis(value: int) -> void:
	tile_offset_axis = value

func get_tile_shape() -> int:
	return tile_shape

func set_tile_shape(value: int) -> void:
	tile_shape = value

func get_tile_size() -> Vector2i:
	return tile_size

func set_tile_size(value: Vector2i) -> void:
	tile_size = value

func is_uv_clipping() -> bool:
	return uv_clipping

func set_uv_clipping(value: bool) -> void:
	uv_clipping = value


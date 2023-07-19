extends Node2D
#brief Node for 2D tile-based maps.
#desc Node for 2D tile-based maps. Tilemaps use a [TileSet] which contain a list of tiles which are used to create grid-based maps. A TileMap may have several layers, layouting tiles on top of each other.
#tutorial [Using Tilemaps] https://docs.godotengine.org/en/stable/tutorials/2d/using_tilemaps.html
#tutorial [2D Platformer Demo] https://godotengine.org/asset-library/asset/120
#tutorial [2D Isometric Demo] https://godotengine.org/asset-library/asset/112
#tutorial [2D Hexagonal Demo] https://godotengine.org/asset-library/asset/111
#tutorial [2D Navigation Astar Demo] https://godotengine.org/asset-library/asset/519
#tutorial [2D Role Playing Game Demo] https://godotengine.org/asset-library/asset/520
#tutorial [2D Kinematic Character Demo] https://godotengine.org/asset-library/asset/113
class_name TileMap

#desc Emitted when the [TileSet] of this TileMap changes.
signal changed
#desc Use the debug settings to determine visibility.
#desc Always hide.
#desc Always show.

#enum VisibilityMode
enum {
    VISIBILITY_MODE_DEFAULT = 0,
    VISIBILITY_MODE_FORCE_HIDE = 2,
    VISIBILITY_MODE_FORCE_SHOW = 1,
}
#desc The TileMap's quadrant size. Optimizes drawing by batching, using chunks of this size.
var cell_quadrant_size: int:
	get = get_quadrant_size, set = set_quadrant_size

#desc If enabled, the TileMap will see its collisions synced to the physics tick and change its collision type from static to kinematic. This is required to create TileMap-based moving platform.
#desc [b]Note:[/b] Enabling [code]collision_animatable[/code] may have a small performance impact, only do it if the TileMap is moving and has colliding tiles.
var collision_animatable: bool:
	get = is_collision_animatable, set = set_collision_animatable

#desc Show or hide the TileMap's collision shapes. If set to [constant VISIBILITY_MODE_DEFAULT], this depends on the show collision debug settings.
var collision_visibility_mode: int:
	get = get_collision_visibility_mode, set = set_collision_visibility_mode

#desc Show or hide the TileMap's navigation meshes. If set to [constant VISIBILITY_MODE_DEFAULT], this depends on the show navigation debug settings.
var navigation_visibility_mode: int:
	get = get_navigation_visibility_mode, set = set_navigation_visibility_mode

#desc The assigned [TileSet].
var tile_set: TileSet:
	get = get_tileset, set = set_tileset



#desc Called with a TileData object about to be used internally by the TileMap, allowing its modification at runtime.
#desc This method is only called if [method _use_tile_data_runtime_update] is implemented and returns [code]true[/code] for the given tile [param coords] and [param layer].
#desc [b]Warning:[/b] The [param tile_data] object's sub-resources are the same as the one in the TileSet. Modifying them might impact the whole TileSet. Instead, make sure to duplicate those resources.
#desc [b]Note:[/b] If the properties of [param tile_data] object should change over time, use [method force_update] to trigger a TileMap update.
func _tile_data_runtime_update(layer: int, coords: Vector2i, tile_data: TileData) -> void:
	pass;

#desc Should return [code]true[/code] if the tile at coordinates [param coords] on layer [param layer] requires a runtime update.
#desc [b]Warning:[/b] Make sure this function only return [code]true[/code] when needed. Any tile processed at runtime without a need for it will imply a significant performance penalty.
func _use_tile_data_runtime_update(layer: int, coords: Vector2i) -> bool:
	pass;

#desc Adds a layer at the given position [param to_position] in the array. If [param to_position] is negative, the position is counted from the end, with [code]-1[/code] adding the layer at the end of the array.
func add_layer(to_position: int) -> void:
	pass;

#desc Clears all cells.
func clear() -> void:
	pass;

#desc Clears all cells on the given layer.
func clear_layer(layer: int) -> void:
	pass;

#desc Erases the cell on layer [param layer] at coordinates [param coords].
func erase_cell(layer: int, coords: Vector2i) -> void:
	pass;

#desc Clears cells that do not exist in the tileset.
func fix_invalid_tiles() -> void:
	pass;

#desc Triggers an update of the TileMap. If [param layer] is provided, only updates the given layer.
#desc [b]Note:[/b] The TileMap node updates automatically when one of its properties is modified. A manual update is only needed if runtime modifications (implemented in [method _tile_data_runtime_update]) need to be applied.
#desc [b]Warning:[/b] Updating the TileMap is computationally expensive and may impact performance. Try to limit the number of updates and the tiles they impact (by placing frequently updated tiles in a dedicated layer for example).
func force_update(layer: int = -1) -> void:
	pass;

#desc Returns the tile alternative ID of the cell on layer [param layer] at [param coords]. If [param use_proxies] is [code]false[/code], ignores the [TileSet]'s tile proxies, returning the raw alternative identifier. See [method TileSet.map_tile_proxy].
func get_cell_alternative_tile(layer: int, coords: Vector2i, use_proxies: bool = false) -> int:
	pass;

#desc Returns the tile atlas coordinates ID of the cell on layer [param layer] at coordinates [param coords]. If [param use_proxies] is [code]false[/code], ignores the [TileSet]'s tile proxies, returning the raw alternative identifier. See [method TileSet.map_tile_proxy].
func get_cell_atlas_coords(layer: int, coords: Vector2i, use_proxies: bool = false) -> Vector2i:
	pass;

#desc Returns the tile source ID of the cell on layer [param layer] at coordinates [param coords]. Returns [code]-1[/code] if the cell does not exist.
#desc If [param use_proxies] is [code]false[/code], ignores the [TileSet]'s tile proxies, returning the raw alternative identifier. See [method TileSet.map_tile_proxy].
func get_cell_source_id(layer: int, coords: Vector2i, use_proxies: bool = false) -> int:
	pass;

#desc Returns the [TileData] object associated with the given cell, or [code]null[/code] if the cell does not exist or is not a [TileSetAtlasSource].
#desc If [param use_proxies] is [code]false[/code], ignores the [TileSet]'s tile proxies, returning the raw alternative identifier. See [method TileSet.map_tile_proxy].
#desc [codeblock]
#desc func get_clicked_tile_power():
#desc var clicked_cell = tile_map.local_to_map(tile_map.get_local_mouse_position())
#desc var data = tile_map.get_cell_tile_data(0, clicked_cell)
#desc if data:
#desc return data.get_custom_data("power")
#desc else:
#desc return 0
#desc [/codeblock]
func get_cell_tile_data(layer: int, coords: Vector2i, use_proxies: bool = false) -> TileData:
	pass;

#desc Returns the coordinates of the tile for given physics body RID. Such RID can be retrieved from [method KinematicCollision2D.get_collider_rid], when colliding with a tile.
func get_coords_for_body_rid(body: RID) -> Vector2i:
	pass;

#desc Returns a TileMap layer's modulate.
func get_layer_modulate(layer: int) -> Color:
	pass;

#desc Returns a TileMap layer's name.
func get_layer_name(layer: int) -> String:
	pass;

#desc Returns a TileMap layer's Y sort origin.
func get_layer_y_sort_origin(layer: int) -> int:
	pass;

#desc Returns a TileMap layer's Z-index value.
func get_layer_z_index(layer: int) -> int:
	pass;

#desc Returns the number of layers in the TileMap.
func get_layers_count() -> int:
	pass;

#desc Returns the [NavigationServer2D] navigation map [RID] currently assigned to the specified TileMap [param layer].
#desc By default the TileMap uses the default [World2D] navigation map for the first TileMap layer. For each additional TileMap layer a new navigation map is created for the additional layer.
#desc In order to make [NavigationAgent2D] switch between TileMap layer navigation maps use [method NavigationAgent2D.set_navigation_map] with the navigation map received from [method get_navigation_map].
func get_navigation_map(layer: int) -> RID:
	pass;

#desc Returns the neighboring cell to the one at coordinates [param coords], identified by the [param neighbor] direction. This method takes into account the different layouts a TileMap can take.
func get_neighbor_cell(coords: Vector2i, neighbor: int) -> Vector2i:
	pass;

#desc Creates a new [TileMapPattern] from the given layer and set of cells.
func get_pattern(layer: int, coords_array: Vector2i[]) -> TileMapPattern:
	pass;

#desc Returns the list of all neighbourings cells to the one at [param coords].
func get_surrounding_cells(coords: Vector2i) -> Array[Vector2i]:
	pass;

#desc Returns a [Vector2i] array with the positions of all cells containing a tile in the given layer. A cell is considered empty if its source identifier equals -1, its atlas coordinates identifiers is [code]Vector2(-1, -1)[/code] and its alternative identifier is -1.
func get_used_cells(layer: int) -> Array[Vector2i]:
	pass;

#desc Returns a [Vector2i] array with the positions of all cells containing a tile in the given layer. Tiles may be filtered according to their source ([param source_id]), their atlas coordinates ([param atlas_coords]) or alternative id ([param alternative_tile]).
#desc If a parameter has it's value set to the default one, this parameter is not used to filter a cell. Thus, if all parameters have their respective default value, this method returns the same result as [method get_used_cells].
#desc A cell is considered empty if its source identifier equals -1, its atlas coordinates identifiers is [code]Vector2(-1, -1)[/code] and its alternative identifier is -1.
func get_used_cells_by_id(layer: int, source_id: int = -1, atlas_coords: Vector2i = Vector2i(-1, -1), alternative_tile: int = -1) -> Array[Vector2i]:
	pass;

#desc Returns a rectangle enclosing the used (non-empty) tiles of the map, including all layers.
func get_used_rect() -> Rect2i:
	pass;

#desc Returns if a layer is enabled.
func is_layer_enabled(layer: int) -> bool:
	pass;

#desc Returns if a layer Y-sorts its tiles.
func is_layer_y_sort_enabled(layer: int) -> bool:
	pass;

#desc Returns the map coordinates of the cell containing the given [param local_position]. If [param local_position] is in global coordinates, consider using [method Node2D.to_local] before passing it to this method. See also [method map_to_local].
func local_to_map(local_position: Vector2) -> Vector2i:
	pass;

#desc Returns for the given coordinate [param coords_in_pattern] in a [TileMapPattern] the corresponding cell coordinates if the pattern was pasted at the [param position_in_tilemap] coordinates (see [method set_pattern]). This mapping is required as in half-offset tile shapes, the mapping might not work by calculating [code]position_in_tile_map + coords_in_pattern[/code].
func map_pattern(position_in_tilemap: Vector2i, coords_in_pattern: Vector2i, pattern: TileMapPattern) -> Vector2i:
	pass;

#desc Returns the centered position of a cell in the TileMap's local coordinate space. To convert the returned value into global coordinates, use [method Node2D.to_global]. See also [method local_to_map].
#desc [b]Note:[/b] This may not correspond to the visual position of the tile, i.e. it ignores the [member TileData.texture_origin] property of individual tiles.
func map_to_local(map_position: Vector2i) -> Vector2:
	pass;

#desc Moves the layer at index [param layer] to the given position [param to_position] in the array.
func move_layer(layer: int, to_position: int) -> void:
	pass;

#desc Removes the layer at index [param layer].
func remove_layer(layer: int) -> void:
	pass;

#desc Sets the tile indentifiers for the cell on layer [param layer] at coordinates [param coords]. Each tile of the [TileSet] is identified using three parts:
#desc - The source identifier [param source_id] identifies a [TileSetSource] identifier. See [method TileSet.set_source_id],
#desc - The atlas coordinates identifier [param atlas_coords] identifies a tile coordinates in the atlas (if the source is a [TileSetAtlasSource]). For [TileSetScenesCollectionSource] it should always be [code]Vector2i(0, 0)[/code]),
#desc - The alternative tile identifier [param alternative_tile] identifies a tile alternative in the atlas (if the source is a [TileSetAtlasSource]), and the scene for a [TileSetScenesCollectionSource].
#desc If [param source_id] is set to [code]-1[/code], [param atlas_coords] to [code]Vector2i(-1, -1)[/code] or [param alternative_tile] to [code]-1[/code], the cell will be erased. An erased cell gets [b]all[/b] its identifiers automatically set to their respective invalid values, namely [code]-1[/code], [code]Vector2i(-1, -1)[/code] and [code]-1[/code].
func set_cell(layer: int, coords: Vector2i, source_id: int = -1, atlas_coords: Vector2i = Vector2i(-1, -1), alternative_tile: int = 0) -> void:
	pass;

#desc Update all the cells in the [param cells] coordinates array so that they use the given [param terrain] for the given [param terrain_set]. If an updated cell has the same terrain as one of its neighboring cells, this function tries to join the two. This function might update neighboring tiles if needed to create correct terrain transitions.
#desc If [param ignore_empty_terrains] is true, empty terrains will be ignored when trying to find the best fitting tile for the given terrain constraints.
#desc [b]Note:[/b] To work correctly, [code]set_cells_terrain_connect[/code] requires the TileMap's TileSet to have terrains set up with all required terrain combinations. Otherwise, it may produce unexpected results.
func set_cells_terrain_connect(layer: int, cells: Vector2i[], terrain_set: int, terrain: int, ignore_empty_terrains: bool = true) -> void:
	pass;

#desc Update all the cells in the [param path] coordinates array so that they use the given [param terrain] for the given [param terrain_set]. The function will also connect two successive cell in the path with the same terrain. This function might update neighboring tiles if needed to create correct terrain transitions.
#desc If [param ignore_empty_terrains] is true, empty terrains will be ignored when trying to find the best fitting tile for the given terrain constraints.
#desc [b]Note:[/b] To work correctly, [code]set_cells_terrain_path[/code] requires the TileMap's TileSet to have terrains set up with all required terrain combinations. Otherwise, it may produce unexpected results.
func set_cells_terrain_path(layer: int, path: Vector2i[], terrain_set: int, terrain: int, ignore_empty_terrains: bool = true) -> void:
	pass;

#desc Enables or disables the layer [param layer]. A disabled layer is not processed at all (no rendering, no physics, etc...).
#desc If [param layer] is negative, the layers are accessed from the last one.
func set_layer_enabled(layer: int, enabled: bool) -> void:
	pass;

#desc Sets a layer's color. It will be multiplied by tile's color and TileMap's modulate.
#desc If [code]layer[/code] is negative, the layers are accessed from the last one.
func set_layer_modulate(layer: int, modulate: Color) -> void:
	pass;

#desc Sets a layer's name. This is mostly useful in the editor.
#desc If [code]layer[/code] is negative, the layers are accessed from the last one.
func set_layer_name(layer: int, name: String) -> void:
	pass;

#desc Enables or disables a layer's Y-sorting. If a layer is Y-sorted, the layer will behave as a CanvasItem node where each of its tile gets Y-sorted.
#desc Y-sorted layers should usually be on different Z-index values than not Y-sorted layers, otherwise, each of those layer will be Y-sorted as whole with the Y-sorted one. This is usually an undesired behavior.
#desc If [code]layer[/code] is negative, the layers are accessed from the last one.
func set_layer_y_sort_enabled(layer: int, y_sort_enabled: bool) -> void:
	pass;

#desc Sets a layer's Y-sort origin value. This Y-sort origin value is added to each tile's Y-sort origin value.
#desc This allows, for example, to fake a different height level on each layer. This can be useful for top-down view games.
#desc If [code]layer[/code] is negative, the layers are accessed from the last one.
func set_layer_y_sort_origin(layer: int, y_sort_origin: int) -> void:
	pass;

#desc Sets a layers Z-index value. This Z-index is added to each tile's Z-index value.
#desc If [code]layer[/code] is negative, the layers are accessed from the last one.
func set_layer_z_index(layer: int, z_index: int) -> void:
	pass;

#desc Assigns a [NavigationServer2D] navigation map [RID] to the specified TileMap [param layer].
#desc By default the TileMap uses the default [World2D] navigation map for the first TileMap layer. For each additional TileMap layer a new navigation map is created for the additional layer.
#desc In order to make [NavigationAgent2D] switch between TileMap layer navigation maps use [method NavigationAgent2D.set_navigation_map] with the navigation map received from [method get_navigation_map].
func set_navigation_map(layer: int, map: RID) -> void:
	pass;

#desc Paste the given [TileMapPattern] at the given [param position] and [param layer] in the tile map.
func set_pattern(layer: int, position: Vector2i, pattern: TileMapPattern) -> void:
	pass;


func get_quadrant_size() -> int:
	return cell_quadrant_size

func set_quadrant_size(value: int) -> void:
	cell_quadrant_size = value

func is_collision_animatable() -> bool:
	return collision_animatable

func set_collision_animatable(value: bool) -> void:
	collision_animatable = value

func get_collision_visibility_mode() -> int:
	return collision_visibility_mode

func set_collision_visibility_mode(value: int) -> void:
	collision_visibility_mode = value

func get_navigation_visibility_mode() -> int:
	return navigation_visibility_mode

func set_navigation_visibility_mode(value: int) -> void:
	navigation_visibility_mode = value

func get_tileset() -> TileSet:
	return tile_set

func set_tileset(value: TileSet) -> void:
	tile_set = value


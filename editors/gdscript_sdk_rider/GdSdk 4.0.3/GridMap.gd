extends Node3D
#brief Node for 3D tile-based maps.
#desc GridMap lets you place meshes on a grid interactively. It works both from the editor and from scripts, which can help you create in-game level editors.
#desc GridMaps use a [MeshLibrary] which contains a list of tiles. Each tile is a mesh with materials plus optional collision and navigation shapes.
#desc A GridMap contains a collection of cells. Each grid cell refers to a tile in the [MeshLibrary]. All cells in the map have the same dimensions.
#desc Internally, a GridMap is split into a sparse collection of octants for efficient rendering and physics processing. Every octant has the same dimensions and can contain several cells.
#desc [b]Note:[/b] GridMap doesn't extend [VisualInstance3D] and therefore can't be hidden or cull masked based on [member VisualInstance3D.layers]. If you make a light not affect the first layer, the whole GridMap won't be lit by the light in question.
#tutorial [Using gridmaps] https://docs.godotengine.org/en/stable/tutorials/3d/using_gridmaps.html
#tutorial [3D Platformer Demo] https://godotengine.org/asset-library/asset/125
#tutorial [3D Kinematic Character Demo] https://godotengine.org/asset-library/asset/126
class_name GridMap

#desc Emitted when [member cell_size] changes.
signal cell_size_changed(cell_size: Vector3)
#desc Invalid cell item that can be used in [method set_cell_item] to clear cells (or represent an empty cell in [method get_cell_item]).
const INVALID_CELL_ITEM = -1;


#desc If [code]true[/code], this GridMap creates a navigation region for each cell that uses a [member mesh_library] item with a navigation mesh. The created navigation region will use the navigation layers bitmask assigned to the [MeshLibrary]'s item.
var bake_navigation: bool:
	get = is_baking_navigation, set = set_bake_navigation

#desc If [code]true[/code], grid items are centered on the X axis.
var cell_center_x: bool:
	get = get_center_x, set = set_center_x

#desc If [code]true[/code], grid items are centered on the Y axis.
var cell_center_y: bool:
	get = get_center_y, set = set_center_y

#desc If [code]true[/code], grid items are centered on the Z axis.
var cell_center_z: bool:
	get = get_center_z, set = set_center_z

#desc The size of each octant measured in number of cells. This applies to all three axis.
var cell_octant_size: int:
	get = get_octant_size, set = set_octant_size

#desc The scale of the cell items.
#desc This does not affect the size of the grid cells themselves, only the items in them. This can be used to make cell items overlap their neighbors.
var cell_scale: float:
	get = get_cell_scale, set = set_cell_scale

#desc The dimensions of the grid's cells.
#desc This does not affect the size of the meshes. See [member cell_scale].
var cell_size: Vector3:
	get = get_cell_size, set = set_cell_size

#desc The physics layers this GridMap is in.
#desc GridMaps act as static bodies, meaning they aren't affected by gravity or other forces. They only affect other physics bodies that collide with them.
var collision_layer: int:
	get = get_collision_layer, set = set_collision_layer

#desc The physics layers this GridMap detects collisions in. See [url=$DOCS_URL/tutorials/physics/physics_introduction.html#collision-layers-and-masks]Collision layers and masks[/url] in the documentation for more information.
var collision_mask: int:
	get = get_collision_mask, set = set_collision_mask

#desc The priority used to solve colliding when occurring penetration. The higher the priority is, the lower the penetration into the object will be. This can for example be used to prevent the player from breaking through the boundaries of a level.
var collision_priority: float:
	get = get_collision_priority, set = set_collision_priority

#desc The assigned [MeshLibrary].
var mesh_library: MeshLibrary:
	get = get_mesh_library, set = set_mesh_library

#desc Overrides the default friction and bounce physics properties for the whole [GridMap].
var physics_material: PhysicsMaterial:
	get = get_physics_material, set = set_physics_material



#desc Clear all cells.
func clear() -> void:
	pass;

#desc Clears all baked meshes. See [method make_baked_meshes].
func clear_baked_meshes() -> void:
	pass;

#desc Returns [RID] of a baked mesh with the given [param idx].
func get_bake_mesh_instance(idx: int) -> RID:
	pass;

#desc Returns an array of [ArrayMesh]es and [Transform3D] references of all bake meshes that exist within the current GridMap.
func get_bake_meshes() -> Array:
	pass;

#desc Returns one of 24 possible rotations that lie along the vectors (x,y,z) with each component being either -1, 0, or 1. For further details, refer to the Godot source code.
func get_basis_with_orthogonal_index(index: int) -> Basis:
	pass;

#desc The [MeshLibrary] item index located at the given grid coordinates. If the cell is empty, [constant INVALID_CELL_ITEM] will be returned.
func get_cell_item(position: Vector3i) -> int:
	pass;

#desc Returns the basis that gives the specified cell its orientation.
func get_cell_item_basis(position: Vector3i) -> Basis:
	pass;

#desc The orientation of the cell at the given grid coordinates. [code]-1[/code] is returned if the cell is empty.
func get_cell_item_orientation(position: Vector3i) -> int:
	pass;

#desc Returns whether or not the specified layer of the [member collision_layer] is enabled, given a [code]layer_number[/code] between 1 and 32.
func get_collision_layer_value(layer_number: int) -> bool:
	pass;

#desc Returns whether or not the specified layer of the [member collision_mask] is enabled, given a [code]layer_number[/code] between 1 and 32.
func get_collision_mask_value(layer_number: int) -> bool:
	pass;

#desc Returns an array of [Transform3D] and [Mesh] references corresponding to the non-empty cells in the grid. The transforms are specified in local space.
func get_meshes() -> Array:
	pass;

#desc Returns the [RID] of the navigation map this GridMap node uses for its cell baked navigation meshes.
#desc This function returns always the map set on the GridMap node and not the map on the NavigationServer. If the map is changed directly with the NavigationServer API the GridMap node will not be aware of the map change.
func get_navigation_map() -> RID:
	pass;

#desc This function considers a discretization of rotations into 24 points on unit sphere, lying along the vectors (x,y,z) with each component being either -1, 0, or 1, and returns the index (in the range from 0 to 23) of the point best representing the orientation of the object. For further details, refer to the Godot source code.
func get_orthogonal_index_from_basis(basis: Basis) -> int:
	pass;

#desc Returns an array of [Vector3] with the non-empty cell coordinates in the grid map.
func get_used_cells() -> Array[Vector3i]:
	pass;

#desc Returns an array of all cells with the given item index specified in [code]item[/code].
func get_used_cells_by_item(item: int) -> Array[Vector3i]:
	pass;

#desc Returns the map coordinates of the cell containing the given [param local_position]. If [param local_position] is in global coordinates, consider using [method Node3D.to_local] before passing it to this method. See also [method map_to_local].
func local_to_map(local_position: Vector3) -> Vector3i:
	pass;

#desc Bakes lightmap data for all meshes in the assigned [MeshLibrary].
func make_baked_meshes(gen_lightmap_uv: bool = false, lightmap_uv_texel_size: float = 0.1) -> void:
	pass;

#desc Returns the position of a grid cell in the GridMap's local coordinate space. To convert the returned value into global coordinates, use [method Node3D.to_global]. See also [method map_to_local].
func map_to_local(map_position: Vector3i) -> Vector3:
	pass;

#desc Notifies the [GridMap] about changed resource and recreates octant data.
func resource_changed(resource: Resource) -> void:
	pass;

#desc Sets the mesh index for the cell referenced by its grid coordinates.
#desc A negative item index such as [constant INVALID_CELL_ITEM] will clear the cell.
#desc Optionally, the item's orientation can be passed. For valid orientation values, see [method get_orthogonal_index_from_basis].
func set_cell_item(position: Vector3i, item: int, orientation: int = 0) -> void:
	pass;

#desc Based on [code]value[/code], enables or disables the specified layer in the [member collision_layer], given a [code]layer_number[/code] between 1 and 32.
func set_collision_layer_value(layer_number: int, value: bool) -> void:
	pass;

#desc Based on [code]value[/code], enables or disables the specified layer in the [member collision_mask], given a [code]layer_number[/code] between 1 and 32.
func set_collision_mask_value(layer_number: int, value: bool) -> void:
	pass;

#desc Sets the [RID] of the navigation map this GridMap node should use for its cell baked navigation meshes.
func set_navigation_map(navigation_map: RID) -> void:
	pass;


func is_baking_navigation() -> bool:
	return bake_navigation

func set_bake_navigation(value: bool) -> void:
	bake_navigation = value

func get_center_x() -> bool:
	return cell_center_x

func set_center_x(value: bool) -> void:
	cell_center_x = value

func get_center_y() -> bool:
	return cell_center_y

func set_center_y(value: bool) -> void:
	cell_center_y = value

func get_center_z() -> bool:
	return cell_center_z

func set_center_z(value: bool) -> void:
	cell_center_z = value

func get_octant_size() -> int:
	return cell_octant_size

func set_octant_size(value: int) -> void:
	cell_octant_size = value

func get_cell_scale() -> float:
	return cell_scale

func set_cell_scale(value: float) -> void:
	cell_scale = value

func get_cell_size() -> Vector3:
	return cell_size

func set_cell_size(value: Vector3) -> void:
	cell_size = value

func get_collision_layer() -> int:
	return collision_layer

func set_collision_layer(value: int) -> void:
	collision_layer = value

func get_collision_mask() -> int:
	return collision_mask

func set_collision_mask(value: int) -> void:
	collision_mask = value

func get_collision_priority() -> float:
	return collision_priority

func set_collision_priority(value: float) -> void:
	collision_priority = value

func get_mesh_library() -> MeshLibrary:
	return mesh_library

func set_mesh_library(value: MeshLibrary) -> void:
	mesh_library = value

func get_physics_material() -> PhysicsMaterial:
	return physics_material

func set_physics_material(value: PhysicsMaterial) -> void:
	physics_material = value


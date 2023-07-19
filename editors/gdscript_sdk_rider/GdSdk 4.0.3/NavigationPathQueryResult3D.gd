extends RefCounted
#brief Result from a [NavigationPathQueryParameters3D] navigation path query.
#desc This class contains the result of a navigation path query from [method NavigationServer3D.query_path].
#tutorial [Using NavigationPathQueryObjects] https://docs.godotengine.org/en/stable/tutorials/navigation/navigation_using_navigationpathqueryobjects.html
class_name NavigationPathQueryResult3D

#desc This segment of the path goes through a region.
#desc This segment of the path goes through a link.

#enum PathSegmentType
enum {
    PATH_SEGMENT_TYPE_REGION = 0,
    PATH_SEGMENT_TYPE_LINK = 1,
}
#desc The resulting path array from the navigation query. All path array positions are in global coordinates. Without customized query parameters this is the same path as returned by [method NavigationServer3D.map_get_path].
var path: PackedVector3Array:
	get = get_path, set = set_path

#desc The [code]ObjectID[/code]s of the [Object]s which manage the regions and links each point of the path goes through.
var path_owner_ids: PackedInt64Array:
	get = get_path_owner_ids, set = set_path_owner_ids

#desc The [RID]s of the regions and links that each point of the path goes through.
var path_rids: Array[RID]:
	get = get_path_rids, set = set_path_rids

#desc The type of navigation primitive (region or link) that each point of the path goes through.
var path_types: PackedInt32Array:
	get = get_path_types, set = set_path_types



#desc Reset the result object to its initial state. This is useful to reuse the object across multiple queries.
func reset() -> void:
	pass;


func get_path() -> PackedVector3Array:
	return path

func set_path(value: PackedVector3Array) -> void:
	path = value

func get_path_owner_ids() -> PackedInt64Array:
	return path_owner_ids

func set_path_owner_ids(value: PackedInt64Array) -> void:
	path_owner_ids = value

func get_path_rids() -> Array[RID]:
	return path_rids

func set_path_rids(value: Array[RID]) -> void:
	path_rids = value

func get_path_types() -> PackedInt32Array:
	return path_types

func set_path_types(value: PackedInt32Array) -> void:
	path_types = value


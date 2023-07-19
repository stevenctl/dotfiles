#brief Handle for a [Resource]'s unique ID.
#desc The RID [Variant] type is used to access a low-level resource by its unique ID. RIDs are opaque, which means they do not grant access to the resource by themselves. They are used by the low-level server classes, such as [DisplayServer], [RenderingServer], [TextServer], etc.
#desc A low-level resource may correspond to a high-level [Resource], such as [Texture] or [Mesh].
class_name RID



#desc Constructs an empty [RID] with the invalid ID [code]0[/code].
func RID() -> RID:
	pass;

#desc Constructs a [RID] as a copy of the given [RID].
func RID(from: RID) -> RID:
	pass;


#desc Returns the ID of the referenced low-level resource.
func get_id() -> int:
	pass;

#desc Returns [code]true[/code] if the [RID] is not [code]0[/code].
func is_valid() -> bool:
	pass;



extends Object
#brief Manager for the font and complex text layout servers.
#desc [TextServerManager] is the API backend for loading, enumeration and switching [TextServer]s.
#desc [b]Note:[/b] Switching text server at runtime is possible, but will invalidate all fonts and text buffers. Make sure to unload all controls, fonts, and themes before doing so.
class_name TextServerManager

#desc Emitted when a new interface has been added.
signal interface_added(interface_name: StringName)
#desc Emitted when an interface is removed.
signal interface_removed(interface_name: StringName)



#desc Registers an [TextServer] interface.
func add_interface(interface: TextServer) -> void:
	pass;

#desc Finds an interface by its name.
func find_interface(name: String) -> TextServer:
	pass;

#desc Returns the interface registered at a given index.
func get_interface(idx: int) -> TextServer:
	pass;

#desc Returns the number of interfaces currently registered.
func get_interface_count() -> int:
	pass;

#desc Returns a list of available interfaces the index and name of each interface.
func get_interfaces() -> Array[Dictionary]:
	pass;

#desc Returns the primary [TextServer] interface currently in use.
func get_primary_interface() -> TextServer:
	pass;

#desc Removes interface. All fonts and shaped text caches should be freed before removing interface.
func remove_interface(interface: TextServer) -> void:
	pass;

#desc Sets the primary [TextServer] interface.
func set_primary_interface(index: TextServer) -> void:
	pass;



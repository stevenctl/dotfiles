extends Container
#brief GraphNode is a [Container] control that represents a single data unit in a [GraphEdit] graph. You can customize the number, type, and color of left- and right-side connection ports.
#desc [b]Note:[/b] Please be aware that this node will undergo extensive refactoring in a future 4.x version involving compatibility-breaking API changes.
#desc GraphNode allows to create nodes for a [GraphEdit] graph with customizable content based on its child [Control]s. GraphNode is a [Container] and is responsible for placing its children on screen. This works similar to [VBoxContainer]. Children, in turn, provide GraphNode with so-called slots, each of which can have a connection port on either side. This is similar to how [TabContainer] uses children to create the tabs.
#desc Each GraphNode slot is defined by its index and can provide the node with up to two ports: one on the left, and one on the right. By convention the left port is also referred to as the input port and the right port is referred to as the output port. Each port can be enabled and configured individually, using different type and color. The type is an arbitrary value that you can define using your own considerations. The parent [GraphEdit] will receive this information on each connect and disconnect request.
#desc Slots can be configured in the Inspector dock once you add at least one child [Control]. The properties are grouped by each slot's index in the "Slot" section.
#desc [b]Note:[/b] While GraphNode is set up using slots and slot indices, connections are made between the ports which are enabled. Because of that [GraphEdit] uses port's index and not slot's index. You can use [method get_connection_input_slot] and [method get_connection_output_slot] to get the slot index from the port index.
class_name GraphNode

#desc Emitted when the GraphNode is requested to be closed. Happens on clicking the close button (see [member show_close]).
signal close_request
#desc Emitted when the GraphNode is dragged.
signal dragged(from: Vector2, to: Vector2)
#desc Emitted when the GraphNode is deselected.
signal node_deselected
#desc Emitted when the GraphNode is selected.
signal node_selected
#desc Emitted when the GraphNode is moved.
signal position_offset_changed
#desc Emitted when the GraphNode is requested to be displayed over other ones. Happens on focusing (clicking into) the GraphNode.
signal raise_request
#desc Emitted when the GraphNode is requested to be resized. Happens on dragging the resizer handle (see [member resizable]).
signal resize_request(new_minsize: Vector2)
#desc Emitted when any GraphNode's slot is updated.
signal slot_updated(idx: int)
#desc No overlay is shown.
#desc Show overlay set in the [theme_item breakpoint] theme property.
#desc Show overlay set in the [theme_item position] theme property.

#enum Overlay
enum {
    OVERLAY_DISABLED = 0,
    OVERLAY_BREAKPOINT = 1,
    OVERLAY_POSITION = 2,
}
#desc If [code]true[/code], the GraphNode is a comment node.
var comment: bool:
	get = is_comment, set = set_comment

#desc If [code]true[/code], the user can drag the GraphNode.
var draggable: bool:
	get = is_draggable, set = set_draggable

#desc Language code used for line-breaking and text shaping algorithms, if left empty current locale is used instead.
var language: String:
	get = get_language, set = set_language

var mouse_filter: int:
	get = get_mouse_filter, set = set_mouse_filter

#desc Sets the overlay shown above the GraphNode. See [enum Overlay].
var overlay: int:
	get = get_overlay, set = set_overlay

#desc The offset of the GraphNode, relative to the scroll offset of the [GraphEdit].
#desc [b]Note:[/b] You cannot use position offset directly, as [GraphEdit] is a [Container].
var position_offset: Vector2:
	get = get_position_offset, set = set_position_offset

#desc If [code]true[/code], the user can resize the GraphNode.
#desc [b]Note:[/b] Dragging the handle will only emit the [signal resize_request] signal, the GraphNode needs to be resized manually.
var resizable: bool:
	get = is_resizable, set = set_resizable

#desc If [code]true[/code], the user can select the GraphNode.
var selectable: bool:
	get = is_selectable, set = set_selectable

#desc If [code]true[/code], the GraphNode is selected.
var selected: bool:
	get = is_selected, set = set_selected

#desc If [code]true[/code], the close button will be visible.
#desc [b]Note:[/b] Pressing it will only emit the [signal close_request] signal, the GraphNode needs to be removed manually.
var show_close: bool:
	get = is_close_button_visible, set = set_show_close_button

#desc Base text writing direction.
var text_direction: int:
	get = get_text_direction, set = set_text_direction

#desc The text displayed in the GraphNode's title bar.
var title: String:
	get = get_title, set = set_title



#desc Disables all input and output slots of the GraphNode.
func clear_all_slots() -> void:
	pass;

#desc Disables input and output slot whose index is [param slot_index].
func clear_slot(slot_index: int) -> void:
	pass;

#desc Returns the [Color] of the input connection [param port].
func get_connection_input_color(port: int) -> Color:
	pass;

#desc Returns the number of enabled input slots (connections) to the GraphNode.
func get_connection_input_count() -> int:
	pass;

#desc Returns the height of the input connection [param port].
func get_connection_input_height(port: int) -> int:
	pass;

#desc Returns the position of the input connection [param port].
func get_connection_input_position(port: int) -> Vector2:
	pass;

#desc Returns the corresponding slot index of the input connection [param port].
func get_connection_input_slot(port: int) -> int:
	pass;

#desc Returns the type of the input connection [param port].
func get_connection_input_type(port: int) -> int:
	pass;

#desc Returns the [Color] of the output connection [param port].
func get_connection_output_color(port: int) -> Color:
	pass;

#desc Returns the number of enabled output slots (connections) of the GraphNode.
func get_connection_output_count() -> int:
	pass;

#desc Returns the height of the output connection [param port].
func get_connection_output_height(port: int) -> int:
	pass;

#desc Returns the position of the output connection [param port].
func get_connection_output_position(port: int) -> Vector2:
	pass;

#desc Returns the corresponding slot index of the output connection [param port].
func get_connection_output_slot(port: int) -> int:
	pass;

#desc Returns the type of the output connection [param port].
func get_connection_output_type(port: int) -> int:
	pass;

#desc Returns the left (input) [Color] of the slot [param slot_index].
func get_slot_color_left(slot_index: int) -> Color:
	pass;

#desc Returns the right (output) [Color] of the slot [param slot_index].
func get_slot_color_right(slot_index: int) -> Color:
	pass;

#desc Returns the left (input) type of the slot [param slot_index].
func get_slot_type_left(slot_index: int) -> int:
	pass;

#desc Returns the right (output) type of the slot [param slot_index].
func get_slot_type_right(slot_index: int) -> int:
	pass;

#desc Returns true if the background [StyleBox] of the slot [param slot_index] is drawn.
func is_slot_draw_stylebox(slot_index: int) -> bool:
	pass;

#desc Returns [code]true[/code] if left (input) side of the slot [param slot_index] is enabled.
func is_slot_enabled_left(slot_index: int) -> bool:
	pass;

#desc Returns [code]true[/code] if right (output) side of the slot [param slot_index] is enabled.
func is_slot_enabled_right(slot_index: int) -> bool:
	pass;

#desc Sets properties of the slot with the [param slot_index] index.
#desc If [param enable_left_port]/[param enable_right_port] is [code]true[/code], a port will appear and the slot will be able to be connected from this side.
#desc With [param type_left]/[param type_right] an arbitrary type can be assigned to each port. Two ports can be connected if they share the same type, or if the connection between their types is allowed in the parent [GraphEdit] (see [method GraphEdit.add_valid_connection_type]). Keep in mind that the [GraphEdit] has the final say in accepting the connection. Type compatibility simply allows the [signal GraphEdit.connection_request] signal to be emitted.
#desc Ports can be further customized using [param color_left]/[param color_right] and [param custom_icon_left]/[param custom_icon_right]. The color parameter adds a tint to the icon. The custom icon can be used to override the default port dot.
#desc Additionally, [param draw_stylebox] can be used to enable or disable drawing of the background stylebox for each slot. See [theme_item slot].
#desc Individual properties can also be set using one of the [code]set_slot_*[/code] methods.
#desc [b]Note:[/b] This method only sets properties of the slot. To create the slot itself, add a [Control]-derived child to the GraphNode.
func set_slot(slot_index: int, enable_left_port: bool, type_left: int, color_left: Color, enable_right_port: bool, type_right: int, color_right: Color, custom_icon_left: Texture2D = null, custom_icon_right: Texture2D = null, draw_stylebox: bool = true) -> void:
	pass;

#desc Sets the [Color] of the left (input) side of the slot [param slot_index] to [param color].
func set_slot_color_left(slot_index: int, color: Color) -> void:
	pass;

#desc Sets the [Color] of the right (output) side of the slot [param slot_index] to [param color].
func set_slot_color_right(slot_index: int, color: Color) -> void:
	pass;

#desc Toggles the background [StyleBox] of the slot [param slot_index].
func set_slot_draw_stylebox(slot_index: int, enable: bool) -> void:
	pass;

#desc Toggles the left (input) side of the slot [param slot_index]. If [param enable] is [code]true[/code], a port will appear on the left side and the slot will be able to be connected from this side.
func set_slot_enabled_left(slot_index: int, enable: bool) -> void:
	pass;

#desc Toggles the right (output) side of the slot [param slot_index]. If [param enable] is [code]true[/code], a port will appear on the right side and the slot will be able to be connected from this side.
func set_slot_enabled_right(slot_index: int, enable: bool) -> void:
	pass;

#desc Sets the left (input) type of the slot [param slot_index] to [param type]. If the value is negative, all connections will be disallowed to be created via user inputs.
func set_slot_type_left(slot_index: int, type: int) -> void:
	pass;

#desc Sets the right (output) type of the slot [param slot_index] to [param type]. If the value is negative, all connections will be disallowed to be created via user inputs.
func set_slot_type_right(slot_index: int, type: int) -> void:
	pass;


func is_comment() -> bool:
	return comment

func set_comment(value: bool) -> void:
	comment = value

func is_draggable() -> bool:
	return draggable

func set_draggable(value: bool) -> void:
	draggable = value

func get_language() -> String:
	return language

func set_language(value: String) -> void:
	language = value

func get_mouse_filter() -> int:
	return mouse_filter

func set_mouse_filter(value: int) -> void:
	mouse_filter = value

func get_overlay() -> int:
	return overlay

func set_overlay(value: int) -> void:
	overlay = value

func get_position_offset() -> Vector2:
	return position_offset

func set_position_offset(value: Vector2) -> void:
	position_offset = value

func is_resizable() -> bool:
	return resizable

func set_resizable(value: bool) -> void:
	resizable = value

func is_selectable() -> bool:
	return selectable

func set_selectable(value: bool) -> void:
	selectable = value

func is_selected() -> bool:
	return selected

func set_selected(value: bool) -> void:
	selected = value

func is_close_button_visible() -> bool:
	return show_close

func set_show_close_button(value: bool) -> void:
	show_close = value

func get_text_direction() -> int:
	return text_direction

func set_text_direction(value: int) -> void:
	text_direction = value

func get_title() -> String:
	return title

func set_title(value: String) -> void:
	title = value


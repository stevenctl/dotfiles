extends Range
#brief Numerical input text field.
#desc SpinBox is a numerical input text field. It allows entering integers and floats.
#desc [b]Example:[/b]
#desc [codeblocks]
#desc [gdscript]
#desc var spin_box = SpinBox.new()
#desc add_child(spin_box)
#desc var line_edit = spin_box.get_line_edit()
#desc line_edit.context_menu_enabled = false
#desc spin_box.horizontal_alignment = LineEdit.HORIZONTAL_ALIGNMENT_RIGHT
#desc [/gdscript]
#desc [csharp]
#desc var spinBox = new SpinBox();
#desc AddChild(spinBox);
#desc var lineEdit = spinBox.GetLineEdit();
#desc lineEdit.ContextMenuEnabled = false;
#desc spinBox.AlignHorizontal = LineEdit.HorizontalAlignEnum.Right;
#desc [/csharp]
#desc [/codeblocks]
#desc The above code will create a [SpinBox], disable context menu on it and set the text alignment to right.
#desc See [Range] class for more options over the [SpinBox].
#desc [b]Note:[/b] [SpinBox] relies on an underlying [LineEdit] node. To theme a [SpinBox]'s background, add theme items for [LineEdit] and customize them.
#desc [b]Note:[/b] If you want to implement drag and drop for the underlying [LineEdit], you can use [method Control.set_drag_forwarding] on the node returned by [method get_line_edit].
class_name SpinBox


#desc Changes the alignment of the underlying [LineEdit].
var alignment: int:
	get = get_horizontal_alignment, set = set_horizontal_alignment

#desc If not [code]0[/code], [code]value[/code] will always be rounded to a multiple of [code]custom_arrow_step[/code] when interacting with the arrow buttons of the [SpinBox].
var custom_arrow_step: float:
	get = get_custom_arrow_step, set = set_custom_arrow_step

#desc If [code]true[/code], the [SpinBox] will be editable. Otherwise, it will be read only.
var editable: bool:
	get = is_editable, set = set_editable

#desc Adds the specified [code]prefix[/code] string before the numerical value of the [SpinBox].
var prefix: String:
	get = get_prefix, set = set_prefix

#desc If [code]true[/code], the [SpinBox] will select the whole text when the [LineEdit] gains focus. Clicking the up and down arrows won't trigger this behavior.
var select_all_on_focus: bool:
	get = is_select_all_on_focus, set = set_select_all_on_focus

var size_flags_vertical: int:
	get = get_v_size_flags, set = set_v_size_flags

var step: float:
	get = get_step, set = set_step

#desc Adds the specified [code]suffix[/code] string after the numerical value of the [SpinBox].
var suffix: String:
	get = get_suffix, set = set_suffix

#desc Sets the value of the [Range] for this [SpinBox] when the [LineEdit] text is [i]changed[/i] instead of [i]submitted[/i]. See [signal LineEdit.text_changed] and [signal LineEdit.text_submitted].
var update_on_text_changed: bool:
	get = get_update_on_text_changed, set = set_update_on_text_changed



#desc Applies the current value of this [SpinBox].
func apply() -> void:
	pass;

#desc Returns the [LineEdit] instance from this [SpinBox]. You can use it to access properties and methods of [LineEdit].
#desc [b]Warning:[/b] This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their [member CanvasItem.visible] property.
func get_line_edit() -> LineEdit:
	pass;


func get_horizontal_alignment() -> int:
	return alignment

func set_horizontal_alignment(value: int) -> void:
	alignment = value

func get_custom_arrow_step() -> float:
	return custom_arrow_step

func set_custom_arrow_step(value: float) -> void:
	custom_arrow_step = value

func is_editable() -> bool:
	return editable

func set_editable(value: bool) -> void:
	editable = value

func get_prefix() -> String:
	return prefix

func set_prefix(value: String) -> void:
	prefix = value

func is_select_all_on_focus() -> bool:
	return select_all_on_focus

func set_select_all_on_focus(value: bool) -> void:
	select_all_on_focus = value

func get_v_size_flags() -> int:
	return size_flags_vertical

func set_v_size_flags(value: int) -> void:
	size_flags_vertical = value

func get_step() -> float:
	return step

func set_step(value: float) -> void:
	step = value

func get_suffix() -> String:
	return suffix

func set_suffix(value: String) -> void:
	suffix = value

func get_update_on_text_changed() -> bool:
	return update_on_text_changed

func set_update_on_text_changed(value: bool) -> void:
	update_on_text_changed = value


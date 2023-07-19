extends AcceptDialog
#brief Dialog for confirmation of actions.
#desc Dialog for confirmation of actions. This dialog inherits from [AcceptDialog], but has by default an OK and Cancel button (in host OS order).
#desc To get cancel action, you can use:
#desc [codeblocks]
#desc [gdscript]
#desc get_cancel_button().pressed.connect(self.canceled)
#desc [/gdscript]
#desc [csharp]
#desc GetCancelButton().Pressed += Canceled;
#desc [/csharp]
#desc [/codeblocks]
class_name ConfirmationDialog


#desc The text displayed by the cancel button (see [method get_cancel_button]).
var cancel_button_text: String:
	get = get_cancel_button_text, set = set_cancel_button_text

var min_size: Vector2i:
	get = get_min_size, set = set_min_size

var size: Vector2i:
	get = get_size, set = set_size

var title: String:
	get = get_title, set = set_title



#desc Returns the cancel button.
#desc [b]Warning:[/b] This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their [member CanvasItem.visible] property.
func get_cancel_button() -> Button:
	pass;


func get_cancel_button_text() -> String:
	return cancel_button_text

func set_cancel_button_text(value: String) -> void:
	cancel_button_text = value

func get_min_size() -> Vector2i:
	return min_size

func set_min_size(value: Vector2i) -> void:
	min_size = value

func get_size() -> Vector2i:
	return size

func set_size(value: Vector2i) -> void:
	size = value

func get_title() -> String:
	return title

func set_title(value: String) -> void:
	title = value


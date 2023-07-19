extends VisualShaderNodeResizableBase
#brief A comment node to be placed on visual shader graph.
#desc A resizable rectangular area with changeable [member title] and [member description] used for better organizing of other visual shader nodes.
class_name VisualShaderNodeComment


#desc An additional description which placed below the title.
var description: String:
	get = get_description, set = set_description

#desc A title of the node.
var title: String:
	get = get_title, set = set_title




func get_description() -> String:
	return description

func set_description(value: String) -> void:
	description = value

func get_title() -> String:
	return title

func set_title(value: String) -> void:
	title = value


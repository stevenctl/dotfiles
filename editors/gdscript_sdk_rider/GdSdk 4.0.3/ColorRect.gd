extends Control
#brief Colored rectangle.
#desc Displays a rectangle filled with a solid [member color]. If you need to display the border alone, consider using [ReferenceRect] instead.
#tutorial [2D Dodge The Creeps Demo] https://godotengine.org/asset-library/asset/515
class_name ColorRect


#desc The fill color.
#desc [codeblocks]
#desc [gdscript]
#desc $ColorRect.color = Color(1, 0, 0, 1) # Set ColorRect's color to red.
#desc [/gdscript]
#desc [csharp]
#desc GetNode<ColorRect>("ColorRect").Color = new Color(1, 0, 0, 1); // Set ColorRect's color to red.
#desc [/csharp]
#desc [/codeblocks]
var color: Color:
	get = get_color, set = set_color




func get_color() -> Color:
	return color

func set_color(value: Color) -> void:
	color = value


extends RefCounted
#brief Plugin for adding custom converters from one resource format to another in the editor resource picker context menu; for example, converting a [StandardMaterial3D] to a [ShaderMaterial].
#desc [EditorResourceConversionPlugin] is invoked when the context menu is brought up for a resource in the editor inspector. Relevant conversion plugins will appear as menu options to convert the given resource to a target type.
#desc Below shows an example of a basic plugin that will convert an [ImageTexture] to a [PortableCompressedTexture2D].
#desc [codeblocks]
#desc [gdscript]
#desc extends EditorResourceConversionPlugin
#desc 
#desc func _handles(resource: Resource):
#desc return resource is ImageTexture
#desc 
#desc func _converts_to():
#desc return "PortableCompressedTexture2D"
#desc 
#desc func _convert(itex: Resource):
#desc var ptex = PortableCompressedTexture2D.new()
#desc ptex.create_from_image(itex.get_image(), PortableCompressedTexture2D.COMPRESSION_MODE_LOSSLESS)
#desc return ptex
#desc [/gdscript]
#desc [/codeblocks]
#desc To use an [EditorResourceConversionPlugin], register it using the [method EditorPlugin.add_resource_conversion_plugin] method first.
class_name EditorResourceConversionPlugin




#desc Takes an input [Resource] and converts it to the type given in [method _converts_to]. The returned [Resource] is the result of the conversion, and the input [Resource] remains unchanged.
func _convert(resource: Resource) -> Resource:
	pass;

#desc Returns the class name of the target type of [Resource] that this plugin converts source resources to.
func _converts_to() -> String:
	pass;

#desc Called to determine whether a particular [Resource] can be converted to the target resource type by this plugin.
func _handles(resource: Resource) -> bool:
	pass;



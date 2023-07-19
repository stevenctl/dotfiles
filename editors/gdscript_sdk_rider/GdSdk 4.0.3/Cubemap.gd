extends ImageTextureLayered
#brief 6-sided texture typically used in 3D rendering.
#desc A cubemap is made of 6 textures organized in layers. They are typically used for faking reflections in 3D rendering (see [ReflectionProbe]). It can be used to make an object look as if it's reflecting its surroundings. This usually delivers much better performance than other reflection methods.
#desc This resource is typically used as a uniform in custom shaders. Few core Godot methods make use of [Cubemap] resources.
#desc To create such a texture file yourself, reimport your image files using the Godot Editor import presets.
#desc [b]Note:[/b] Godot doesn't support using cubemaps in a [PanoramaSkyMaterial]. You can use [url=https://danilw.github.io/GLSL-howto/cubemap_to_panorama_js/cubemap_to_panorama.html]this tool[/url] to convert a cubemap to an equirectangular sky map.
class_name Cubemap




#desc Creates a placeholder version of this resource ([PlaceholderCubemap]).
func create_placeholder() -> Resource:
	pass;



extends Node
#brief Base class of anything 2D.
#desc Base class of anything 2D. Canvas items are laid out in a tree; children inherit and extend their parent's transform. [CanvasItem] is extended by [Control] for anything GUI-related, and by [Node2D] for anything related to the 2D engine.
#desc Any [CanvasItem] can draw. For this, [method queue_redraw] is called by the engine, then [constant NOTIFICATION_DRAW] will be received on idle time to request redraw. Because of this, canvas items don't need to be redrawn on every frame, improving the performance significantly. Several functions for drawing on the [CanvasItem] are provided (see [code]draw_*[/code] functions). However, they can only be used inside [method _draw], its corresponding [method Object._notification] or methods connected to the [signal draw] signal.
#desc Canvas items are drawn in tree order. By default, children are on top of their parents so a root [CanvasItem] will be drawn behind everything. This behavior can be changed on a per-item basis.
#desc A [CanvasItem] can also be hidden, which will also hide its children. It provides many ways to change parameters such as modulation (for itself and its children) and self modulation (only for itself), as well as its blend mode.
#desc Ultimately, a transform notification can be requested, which will notify the node that its global position changed in case the parent tree changed.
#desc [b]Note:[/b] Unless otherwise specified, all methods that have angle parameters must have angles specified as [i]radians[/i]. To convert degrees to radians, use [method @GlobalScope.deg_to_rad].
#tutorial [Viewport and canvas transforms] https://docs.godotengine.org/en/stable/tutorials/2d/2d_transforms.html
#tutorial [Custom drawing in 2D] https://docs.godotengine.org/en/stable/tutorials/2d/custom_drawing_in_2d.html
#tutorial [Audio Spectrum Demo] https://godotengine.org/asset-library/asset/528
class_name CanvasItem

#desc Emitted when the [CanvasItem] must redraw, [i]after[/i] the related [constant NOTIFICATION_DRAW] notification, and [i]before[/i] [method _draw] is called.
#desc [b]Note:[/b] Deferred connections do not allow drawing through the [code]draw_*[/code] methods.
signal draw
#desc Emitted when becoming hidden.
signal hidden
#desc Emitted when the item's [Rect2] boundaries (position or size) have changed, or when an action is taking place that may have impacted these boundaries (e.g. changing [member Sprite2D.texture]).
signal item_rect_changed
#desc Emitted when the visibility (hidden/visible) changes.
signal visibility_changed
#desc The [CanvasItem]'s global transform has changed. This notification is only received if enabled by [method set_notify_transform].
const NOTIFICATION_TRANSFORM_CHANGED = 2000;

#desc The [CanvasItem]'s local transform has changed. This notification is only received if enabled by [method set_notify_local_transform].
const NOTIFICATION_LOCAL_TRANSFORM_CHANGED = 35;

#desc The [CanvasItem] is requested to draw (see [method _draw]).
const NOTIFICATION_DRAW = 30;

#desc The [CanvasItem]'s visibility has changed.
const NOTIFICATION_VISIBILITY_CHANGED = 31;

#desc The [CanvasItem] has entered the canvas.
const NOTIFICATION_ENTER_CANVAS = 32;

#desc The [CanvasItem] has exited the canvas.
const NOTIFICATION_EXIT_CANVAS = 33;

#desc The [CanvasItem] will inherit the filter from its parent.
#desc The texture filter reads from the nearest pixel only. The simplest and fastest method of filtering. Useful for pixel art.
#desc The texture filter blends between the nearest four pixels. Use this for most cases where you want to avoid a pixelated style.
#desc The texture filter reads from the nearest pixel in the nearest mipmap. This is the fastest way to read from textures with mipmaps.
#desc The texture filter blends between the nearest 4 pixels and between the nearest 2 mipmaps. Use this for non-pixel art textures that may be viewed at a low scale (e.g. due to [Camera2D] zoom), as mipmaps are important to smooth out pixels that are smaller than on-screen pixels.
#desc The texture filter reads from the nearest pixel, but selects a mipmap based on the angle between the surface and the camera view. This reduces artifacts on surfaces that are almost in line with the camera. The anisotropic filtering level can be changed by adjusting [member ProjectSettings.rendering/textures/default_filters/anisotropic_filtering_level].
#desc [b]Note:[/b] This texture filter is rarely useful in 2D projects. [constant TEXTURE_FILTER_NEAREST_WITH_MIPMAPS] is usually more appropriate.
#desc The texture filter blends between the nearest 4 pixels and selects a mipmap based on the angle between the surface and the camera view. This reduces artifacts on surfaces that are almost in line with the camera. This is the slowest of the filtering options, but results in the highest quality texturing. The anisotropic filtering level can be changed by adjusting [member ProjectSettings.rendering/textures/default_filters/anisotropic_filtering_level].
#desc [b]Note:[/b] This texture filter is rarely useful in 2D projects. [constant TEXTURE_FILTER_LINEAR_WITH_MIPMAPS] is usually more appropriate.
#desc Represents the size of the [enum TextureFilter] enum.
#desc The [CanvasItem] will inherit the filter from its parent.
#desc Texture will not repeat.
#desc Texture will repeat normally.
#desc Texture will repeat in a 2x2 tiled mode, where elements at even positions are mirrored.
#desc Represents the size of the [enum TextureRepeat] enum.
#desc Child draws over parent and is not clipped.
#desc Parent is used for the purposes of clipping only. Child is clipped to the parent's visible area, parent is not drawn.
#desc Parent is used for clipping child, but parent is also drawn underneath child as normal before clipping child to its visible area.
#desc Represents the size of the [enum ClipChildrenMode] enum.

#enum TextureFilter
enum {
    TEXTURE_FILTER_PARENT_NODE = 0,
    TEXTURE_FILTER_NEAREST = 1,
    TEXTURE_FILTER_LINEAR = 2,
    TEXTURE_FILTER_NEAREST_WITH_MIPMAPS = 3,
    TEXTURE_FILTER_LINEAR_WITH_MIPMAPS = 4,
    TEXTURE_FILTER_NEAREST_WITH_MIPMAPS_ANISOTROPIC = 5,
    TEXTURE_FILTER_LINEAR_WITH_MIPMAPS_ANISOTROPIC = 6,
    TEXTURE_FILTER_MAX = 7,
}
#enum TextureRepeat
enum {
    TEXTURE_REPEAT_PARENT_NODE = 0,
    TEXTURE_REPEAT_DISABLED = 1,
    TEXTURE_REPEAT_ENABLED = 2,
    TEXTURE_REPEAT_MIRROR = 3,
    TEXTURE_REPEAT_MAX = 4,
}
#enum ClipChildrenMode
enum {
    CLIP_CHILDREN_DISABLED = 0,
    CLIP_CHILDREN_ONLY = 1,
    CLIP_CHILDREN_AND_DRAW = 2,
    CLIP_CHILDREN_MAX = 3,
}
#desc Allows the current node to clip children nodes, essentially acting as a mask.
var clip_children: int:
	get = get_clip_children_mode, set = set_clip_children_mode

#desc The rendering layers in which this [CanvasItem] responds to [Light2D] nodes.
var light_mask: int:
	get = get_light_mask, set = set_light_mask

#desc The material applied to this [CanvasItem].
var material: Material:
	get = get_material, set = set_material

#desc The color applied to this [CanvasItem]. This property does affect child [CanvasItem]s, unlike [member self_modulate] which only affects the node itself.
var modulate: Color:
	get = get_modulate, set = set_modulate

#desc The color applied to this [CanvasItem]. This property does [b]not[/b] affect child [CanvasItem]s, unlike [member modulate] which affects both the node itself and its children.
#desc [b]Note:[/b] Internal children (e.g. sliders in [ColorPicker] or tab bar in [TabContainer]) are also not affected by this property (see [code]include_internal[/code] parameter of [method Node.get_child] and other similar methods).
var self_modulate: Color:
	get = get_self_modulate, set = set_self_modulate

#desc If [code]true[/code], the object draws behind its parent.
var show_behind_parent: bool:
	get = is_draw_behind_parent_enabled, set = set_draw_behind_parent

#desc The texture filtering mode to use on this [CanvasItem].
var texture_filter: int:
	get = get_texture_filter, set = set_texture_filter

#desc The texture repeating mode to use on this [CanvasItem].
var texture_repeat: int:
	get = get_texture_repeat, set = set_texture_repeat

#desc If [code]true[/code], this [CanvasItem] will [i]not[/i] inherit its transform from parent [CanvasItem]s. Its draw order will also be changed to make it draw on top of other [CanvasItem]s that do not have [member top_level] set to [code]true[/code]. The [CanvasItem] will effectively act as if it was placed as a child of a bare [Node].
var top_level: bool:
	get = is_set_as_top_level, set = set_as_top_level

#desc If [code]true[/code], the parent [CanvasItem]'s [member material] property is used as this one's material.
var use_parent_material: bool:
	get = get_use_parent_material, set = set_use_parent_material

#desc The rendering layer in which this [CanvasItem] is rendered by [Viewport] nodes. A [Viewport] will render a [CanvasItem] if it and all its parents share a layer with the [Viewport]'s canvas cull mask.
var visibility_layer: int:
	get = get_visibility_layer, set = set_visibility_layer

#desc If [code]true[/code], this [CanvasItem] is drawn. The node is only visible if all of its ancestors are visible as well (in other words, [method is_visible_in_tree] must return [code]true[/code]).
#desc [b]Note:[/b] For controls that inherit [Popup], the correct way to make them visible is to call one of the multiple [code]popup*()[/code] functions instead.
var visible: bool:
	get = is_visible, set = set_visible

#desc If [code]true[/code], child nodes with the lowest Y position are drawn before those with a higher Y position. If [code]false[/code], Y-sorting is disabled. Y-sorting only affects children that inherit from [CanvasItem].
#desc You can nest nodes with Y-sorting. Child Y-sorted nodes are sorted in the same space as the parent Y-sort. This feature allows you to organize a scene better or divide it into multiple ones without changing your scene tree.
var y_sort_enabled: bool:
	get = is_y_sort_enabled, set = set_y_sort_enabled

#desc If [code]true[/code], the node's Z index is relative to its parent's Z index. If this node's Z index is 2 and its parent's effective Z index is 3, then this node's effective Z index will be 2 + 3 = 5.
var z_as_relative: bool:
	get = is_z_relative, set = set_z_as_relative

#desc Z index. Controls the order in which the nodes render. A node with a higher Z index will display in front of others. Must be between [constant RenderingServer.CANVAS_ITEM_Z_MIN] and [constant RenderingServer.CANVAS_ITEM_Z_MAX] (inclusive).
#desc [b]Note:[/b] Changing the Z index of a [Control] only affects the drawing order, not the order in which input events are handled. This can be useful to implement certain UI animations, e.g. a menu where hovered items are scaled and should overlap others.
var z_index: int:
	get = get_z_index, set = set_z_index



#desc Called when [CanvasItem] has been requested to redraw (after [method queue_redraw] is called, either manually or by the engine).
#desc Corresponds to the [constant NOTIFICATION_DRAW] notification in [method Object._notification].
func _draw() -> void:
	pass;

#desc Subsequent drawing commands will be ignored unless they fall within the specified animation slice. This is a faster way to implement animations that loop on background rather than redrawing constantly.
func draw_animation_slice(animation_length: float, slice_begin: float, slice_end: float, offset: float = 0.0) -> void:
	pass;

#desc Draws an unfilled arc between the given angles with a uniform [param color] and [param width] and optional antialiasing (supported only for positive [param width]). The larger the value of [param point_count], the smoother the curve. See also [method draw_circle].
#desc If [param width] is negative, then the arc is drawn using [constant RenderingServer.PRIMITIVE_LINE_STRIP]. This means that when the CanvasItem is scaled, the arc will remain thin. If this behavior is not desired, then pass a positive [param width] like [code]1.0[/code].
#desc The arc is drawn from [param start_angle] towards the value of [param end_angle] so in clockwise direction if [code]start_angle < end_angle[/code] and counter-clockwise otherwise. Passing the same angles but in reversed order will produce the same arc. If absolute difference of [param start_angle] and [param end_angle] is greater than [constant @GDScript.TAU] radians, then a full circle arc is drawn (i.e. arc will not overlap itself).
func draw_arc(center: Vector2, radius: float, start_angle: float, end_angle: float, point_count: int, color: Color, width: float = -1.0, antialiased: bool = false) -> void:
	pass;

#desc Draws a string first character using a custom font.
func draw_char(font: Font, pos: Vector2, char: String, font_size: int = 16, modulate: Color = Color(1, 1, 1, 1)) -> void:
	pass;

#desc Draws a string first character outline using a custom font.
func draw_char_outline(font: Font, pos: Vector2, char: String, font_size: int = 16, size: int = -1, modulate: Color = Color(1, 1, 1, 1)) -> void:
	pass;

#desc Draws a colored, filled circle. See also [method draw_arc], [method draw_polyline] and [method draw_polygon].
func draw_circle(position: Vector2, radius: float, color: Color) -> void:
	pass;

#desc Draws a colored polygon of any number of points, convex or concave. Unlike [method draw_polygon], a single color must be specified for the whole polygon.
func draw_colored_polygon(points: PackedVector2Array, color: Color, uvs: PackedVector2Array = PackedVector2Array(), texture: Texture2D = null) -> void:
	pass;

#desc Draws a dashed line from a 2D point to another, with a given color and width. See also [method draw_multiline] and [method draw_polyline].
#desc If [param width] is negative, then a two-point primitives will be drawn instead of a four-point ones. This means that when the CanvasItem is scaled, the line parts will remain thin. If this behavior is not desired, then pass a positive [param width] like [code]1.0[/code].
func draw_dashed_line(from: Vector2, to: Vector2, color: Color, width: float = -1.0, dash: float = 2.0, aligned: bool = true) -> void:
	pass;

#desc After submitting all animations slices via [method draw_animation_slice], this function can be used to revert drawing to its default state (all subsequent drawing commands will be visible). If you don't care about this particular use case, usage of this function after submitting the slices is not required.
func draw_end_animation() -> void:
	pass;

#desc Draws a textured rectangle region of the font texture with LCD subpixel anti-aliasing at a given position, optionally modulated by a color.
#desc Texture is drawn using the following blend operation, blend mode of the [CanvasItemMaterial] is ignored:
#desc [codeblock]
#desc dst.r = texture.r * modulate.r * modulate.a + dst.r * (1.0 - texture.r * modulate.a);
#desc dst.g = texture.g * modulate.g * modulate.a + dst.g * (1.0 - texture.g * modulate.a);
#desc dst.b = texture.b * modulate.b * modulate.a + dst.b * (1.0 - texture.b * modulate.a);
#desc dst.a = modulate.a + dst.a * (1.0 - modulate.a);
#desc [/codeblock]
func draw_lcd_texture_rect_region(texture: Texture2D, rect: Rect2, src_rect: Rect2, modulate: Color = Color(1, 1, 1, 1)) -> void:
	pass;

#desc Draws a line from a 2D point to another, with a given color and width. It can be optionally antialiased. See also [method draw_multiline] and [method draw_polyline].
#desc If [param width] is negative, then a two-point primitive will be drawn instead of a four-point one. This means that when the CanvasItem is scaled, the line will remain thin. If this behavior is not desired, then pass a positive [param width] like [code]1.0[/code].
func draw_line(from: Vector2, to: Vector2, color: Color, width: float = -1.0, antialiased: bool = false) -> void:
	pass;

#desc Draws a [Mesh] in 2D, using the provided texture. See [MeshInstance2D] for related documentation.
func draw_mesh(mesh: Mesh, texture: Texture2D, transform: Transform2D = Transform2D(1, 0, 0, 1, 0, 0), modulate: Color = Color(1, 1, 1, 1)) -> void:
	pass;

#desc Draws a textured rectangle region of the multi-channel signed distance field texture at a given position, optionally modulated by a color. See [member FontFile.multichannel_signed_distance_field] for more information and caveats about MSDF font rendering.
#desc If [param outline] is positive, each alpha channel value of pixel in region is set to maximum value of true distance in the [param outline] radius.
#desc Value of the [param pixel_range] should the same that was used during distance field texture generation.
func draw_msdf_texture_rect_region(texture: Texture2D, rect: Rect2, src_rect: Rect2, modulate: Color = Color(1, 1, 1, 1), outline: float = 0.0, pixel_range: float = 4.0, scale: float = 1.0) -> void:
	pass;

#desc Draws multiple disconnected lines with a uniform [param color]. When drawing large amounts of lines, this is faster than using individual [method draw_line] calls. To draw interconnected lines, use [method draw_polyline] instead.
#desc If [param width] is negative, then two-point primitives will be drawn instead of a four-point ones. This means that when the CanvasItem is scaled, the lines will remain thin. If this behavior is not desired, then pass a positive [param width] like [code]1.0[/code].
func draw_multiline(points: PackedVector2Array, color: Color, width: float = -1.0) -> void:
	pass;

#desc Draws multiple disconnected lines with a uniform [param width] and segment-by-segment coloring. Colors assigned to line segments match by index between [param points] and [param colors]. When drawing large amounts of lines, this is faster than using individual [method draw_line] calls. To draw interconnected lines, use [method draw_polyline_colors] instead.
#desc If [param width] is negative, then two-point primitives will be drawn instead of a four-point ones. This means that when the CanvasItem is scaled, the lines will remain thin. If this behavior is not desired, then pass a positive [param width] like [code]1.0[/code].
func draw_multiline_colors(points: PackedVector2Array, colors: PackedColorArray, width: float = -1.0) -> void:
	pass;

#desc Breaks [param text] into lines and draws it using the specified [param font] at the [param pos] (top-left corner). The text will have its color multiplied by [param modulate]. If [param width] is greater than or equal to 0, the text will be clipped if it exceeds the specified width.
func draw_multiline_string(font: Font, pos: Vector2, text: String, alignment: int = 0, width: float = -1, font_size: int = 16, max_lines: int = -1, modulate: Color = Color(1, 1, 1, 1), brk_flags: int = 3, jst_flags: int = 3, direction: int = 0, orientation: int = 0) -> void:
	pass;

#desc Breaks [param text] to the lines and draws text outline using the specified [param font] at the [param pos] (top-left corner). The text will have its color multiplied by [param modulate]. If [param width] is greater than or equal to 0, the text will be clipped if it exceeds the specified width.
func draw_multiline_string_outline(font: Font, pos: Vector2, text: String, alignment: int = 0, width: float = -1, font_size: int = 16, max_lines: int = -1, size: int = 1, modulate: Color = Color(1, 1, 1, 1), brk_flags: int = 3, jst_flags: int = 3, direction: int = 0, orientation: int = 0) -> void:
	pass;

#desc Draws a [MultiMesh] in 2D with the provided texture. See [MultiMeshInstance2D] for related documentation.
func draw_multimesh(multimesh: MultiMesh, texture: Texture2D) -> void:
	pass;

#desc Draws a solid polygon of any number of points, convex or concave. Unlike [method draw_colored_polygon], each point's color can be changed individually. See also [method draw_polyline] and [method draw_polyline_colors]. If you need more flexibility (such as being able to use bones), use [method RenderingServer.canvas_item_add_triangle_array] instead.
func draw_polygon(points: PackedVector2Array, colors: PackedColorArray, uvs: PackedVector2Array = PackedVector2Array(), texture: Texture2D = null) -> void:
	pass;

#desc Draws interconnected line segments with a uniform [param color] and [param width] and optional antialiasing (supported only for positive [param width]). When drawing large amounts of lines, this is faster than using individual [method draw_line] calls. To draw disconnected lines, use [method draw_multiline] instead. See also [method draw_polygon].
#desc If [param width] is negative, the polyline is drawn using [constant RenderingServer.PRIMITIVE_LINE_STRIP]. This means that when the CanvasItem is scaled, the polyline will remain thin. If this behavior is not desired, then pass a positive [param width] like [code]1.0[/code].
func draw_polyline(points: PackedVector2Array, color: Color, width: float = -1.0, antialiased: bool = false) -> void:
	pass;

#desc Draws interconnected line segments with a uniform [param width] and segment-by-segment coloring, and optional antialiasing (supported only for positive [param width]). Colors assigned to line segments match by index between [param points] and [param colors]. When drawing large amounts of lines, this is faster than using individual [method draw_line] calls. To draw disconnected lines, use [method draw_multiline_colors] instead. See also [method draw_polygon].
#desc If [param width] is negative, then the polyline is drawn using [constant RenderingServer.PRIMITIVE_LINE_STRIP]. This means that when the CanvasItem is scaled, the polyline will remain thin. If this behavior is not desired, then pass a positive [param width] like [code]1.0[/code].
func draw_polyline_colors(points: PackedVector2Array, colors: PackedColorArray, width: float = -1.0, antialiased: bool = false) -> void:
	pass;

#desc Draws a custom primitive. 1 point for a point, 2 points for a line, 3 points for a triangle, and 4 points for a quad. If 0 points or more than 4 points are specified, nothing will be drawn and an error message will be printed. See also [method draw_line], [method draw_polyline], [method draw_polygon], and [method draw_rect].
func draw_primitive(points: PackedVector2Array, colors: PackedColorArray, uvs: PackedVector2Array, texture: Texture2D = null) -> void:
	pass;

#desc Draws a rectangle. If [param filled] is [code]true[/code], the rectangle will be filled with the [param color] specified. If [param filled] is [code]false[/code], the rectangle will be drawn as a stroke with the [param color] and [param width] specified. See also [method draw_texture_rect].
#desc If [param width] is negative, then two-point primitives will be drawn instead of a four-point ones. This means that when the CanvasItem is scaled, the lines will remain thin. If this behavior is not desired, then pass a positive [param width] like [code]1.0[/code].
#desc [b]Note:[/b] [param width] is only effective if [param filled] is [code]false[/code].
#desc [b]Note:[/b] Unfilled rectangles drawn with a negative [param width] may not display perfectly. For example, corners may be missing or brighter due to overlapping lines (for a translucent [param color]).
func draw_rect(rect: Rect2, color: Color, filled: bool = true, width: float = -1.0) -> void:
	pass;

#desc Sets a custom transform for drawing via components. Anything drawn afterwards will be transformed by this.
#desc [b]Note:[/b] [member FontFile.oversampling] does [i]not[/i] take [param scale] into account. This means that scaling up/down will cause bitmap fonts and rasterized (non-MSDF) dynamic fonts to appear blurry or pixelated. To ensure text remains crisp regardless of scale, you can enable MSDF font rendering by enabling [member ProjectSettings.gui/theme/default_font_multichannel_signed_distance_field] (applies to the default project font only), or enabling [b]Multichannel Signed Distance Field[/b] in the import options of a DynamicFont for custom fonts. On system fonts, [member SystemFont.multichannel_signed_distance_field] can be enabled in the inspector.
func draw_set_transform(position: Vector2, rotation: float = 0.0, scale: Vector2 = Vector2(1, 1)) -> void:
	pass;

#desc Sets a custom transform for drawing via matrix. Anything drawn afterwards will be transformed by this.
func draw_set_transform_matrix(xform: Transform2D) -> void:
	pass;

#desc Draws [param text] using the specified [param font] at the [param pos] (bottom-left corner using the baseline of the font). The text will have its color multiplied by [param modulate]. If [param width] is greater than or equal to 0, the text will be clipped if it exceeds the specified width.
#desc [b]Example using the default project font:[/b]
#desc [codeblocks]
#desc [gdscript]
#desc # If using this method in a script that redraws constantly, move the
#desc # `default_font` declaration to a member variable assigned in `_ready()`
#desc # so the Control is only created once.
#desc var default_font = ThemeDB.fallback_font
#desc var default_font_size = ThemeDB.fallback_font_size
#desc draw_string(default_font, Vector2(64, 64), "Hello world", HORIZONTAL_ALIGNMENT_LEFT, -1, default_font_size)
#desc [/gdscript]
#desc [csharp]
#desc // If using this method in a script that redraws constantly, move the
#desc // `default_font` declaration to a member variable assigned in `_Ready()`
#desc // so the Control is only created once.
#desc Font defaultFont = ThemeDB.FallbackFont;
#desc int defaultFontSize = ThemeDB.FallbackFontSize;
#desc DrawString(defaultFont, new Vector2(64, 64), "Hello world", HORIZONTAL_ALIGNMENT_LEFT, -1, defaultFontSize);
#desc [/csharp]
#desc [/codeblocks]
#desc See also [method Font.draw_string].
func draw_string(font: Font, pos: Vector2, text: String, alignment: int = 0, width: float = -1, font_size: int = 16, modulate: Color = Color(1, 1, 1, 1), jst_flags: int = 3, direction: int = 0, orientation: int = 0) -> void:
	pass;

#desc Draws [param text] outline using the specified [param font] at the [param pos] (bottom-left corner using the baseline of the font). The text will have its color multiplied by [param modulate]. If [param width] is greater than or equal to 0, the text will be clipped if it exceeds the specified width.
func draw_string_outline(font: Font, pos: Vector2, text: String, alignment: int = 0, width: float = -1, font_size: int = 16, size: int = 1, modulate: Color = Color(1, 1, 1, 1), jst_flags: int = 3, direction: int = 0, orientation: int = 0) -> void:
	pass;

#desc Draws a styled rectangle.
func draw_style_box(style_box: StyleBox, rect: Rect2) -> void:
	pass;

#desc Draws a texture at a given position.
func draw_texture(texture: Texture2D, position: Vector2, modulate: Color = Color(1, 1, 1, 1)) -> void:
	pass;

#desc Draws a textured rectangle at a given position, optionally modulated by a color. If [param transpose] is [code]true[/code], the texture will have its X and Y coordinates swapped. See also [method draw_rect] and [method draw_texture_rect_region].
func draw_texture_rect(texture: Texture2D, rect: Rect2, tile: bool, modulate: Color = Color(1, 1, 1, 1), transpose: bool = false) -> void:
	pass;

#desc Draws a textured rectangle from a texture's region (specified by [param src_rect]) at a given position, optionally modulated by a color. If [param transpose] is [code]true[/code], the texture will have its X and Y coordinates swapped. See also [method draw_texture_rect].
func draw_texture_rect_region(texture: Texture2D, rect: Rect2, src_rect: Rect2, modulate: Color = Color(1, 1, 1, 1), transpose: bool = false, clip_uv: bool = true) -> void:
	pass;

#desc Forces the transform to update. Transform changes in physics are not instant for performance reasons. Transforms are accumulated and then set. Use this if you need an up-to-date transform when doing physics operations.
func force_update_transform() -> void:
	pass;

#desc Returns the [RID] of the [World2D] canvas where this item is in.
func get_canvas() -> RID:
	pass;

#desc Returns the canvas item RID used by [RenderingServer] for this item.
func get_canvas_item() -> RID:
	pass;

#desc Returns the transform from the coordinate system of the canvas, this item is in, to the [Viewport]s coordinate system.
func get_canvas_transform() -> Transform2D:
	pass;

#desc Returns the mouse's position in the [CanvasLayer] that this [CanvasItem] is in using the coordinate system of the [CanvasLayer].
#desc [b]Note:[/b] For screen-space coordinates (e.g. when using a non-embedded [Popup]), you can use [method DisplayServer.mouse_get_position].
func get_global_mouse_position() -> Vector2:
	pass;

#desc Returns the global transform matrix of this item, i.e. the combined transform up to the topmost [CanvasItem] node. The topmost item is a [CanvasItem] that either has no parent, has non-[CanvasItem] parent or it has [member top_level] enabled.
func get_global_transform() -> Transform2D:
	pass;

#desc Returns the transform from the local coordinate system of this [CanvasItem] to the [Viewport]s coordinate system.
func get_global_transform_with_canvas() -> Transform2D:
	pass;

#desc Returns the mouse's position in this [CanvasItem] using the local coordinate system of this [CanvasItem].
func get_local_mouse_position() -> Vector2:
	pass;

#desc Returns the transform of this [CanvasItem] in global screen coordinates (i.e. taking window position into account). Mostly useful for editor plugins.
#desc Equals to [method get_global_transform] if the window is embedded (see [member Viewport.gui_embed_subwindows]).
func get_screen_transform() -> Transform2D:
	pass;

#desc Returns the transform matrix of this item.
func get_transform() -> Transform2D:
	pass;

#desc Returns the viewport's boundaries as a [Rect2].
func get_viewport_rect() -> Rect2:
	pass;

#desc Returns the transform from the coordinate system of the canvas, this item is in, to the [Viewport]s embedders coordinate system.
func get_viewport_transform() -> Transform2D:
	pass;

#desc Returns an individual bit on the rendering visibility layer.
func get_visibility_layer_bit(layer: int) -> bool:
	pass;

#desc Returns the [World2D] where this item is in.
func get_world_2d() -> World2D:
	pass;

#desc Hide the [CanvasItem] if it's currently visible. This is equivalent to setting [member visible] to [code]false[/code].
func hide() -> void:
	pass;

#desc Returns [code]true[/code] if local transform notifications are communicated to children.
func is_local_transform_notification_enabled() -> bool:
	pass;

#desc Returns [code]true[/code] if global transform notifications are communicated to children.
func is_transform_notification_enabled() -> bool:
	pass;

#desc Returns [code]true[/code] if the node is present in the [SceneTree], its [member visible] property is [code]true[/code] and all its ancestors are also visible. If any ancestor is hidden, this node will not be visible in the scene tree, and is consequently not drawn (see [method _draw]).
func is_visible_in_tree() -> bool:
	pass;

#desc Assigns [param screen_point] as this node's new local transform.
func make_canvas_position_local(screen_point: Vector2) -> Vector2:
	pass;

#desc Transformations issued by [param event]'s inputs are applied in local space instead of global space.
func make_input_local(event: InputEvent) -> InputEvent:
	pass;

#desc Moves this node to display on top of its siblings.
#desc Internally, the node is moved to the bottom of parent's children list. The method has no effect on nodes without a parent.
func move_to_front() -> void:
	pass;

#desc Queues the [CanvasItem] to redraw. During idle time, if [CanvasItem] is visible, [constant NOTIFICATION_DRAW] is sent and [method _draw] is called. This only occurs [b]once[/b] per frame, even if this method has been called multiple times.
func queue_redraw() -> void:
	pass;

#desc If [param enable] is [code]true[/code], this node will receive [constant NOTIFICATION_LOCAL_TRANSFORM_CHANGED] when its local transform changes.
func set_notify_local_transform(enable: bool) -> void:
	pass;

#desc If [param enable] is [code]true[/code], this node will receive [constant NOTIFICATION_TRANSFORM_CHANGED] when its global transform changes.
func set_notify_transform(enable: bool) -> void:
	pass;

#desc Set/clear individual bits on the rendering visibility layer. This simplifies editing this [CanvasItem]'s visibility layer.
func set_visibility_layer_bit(layer: int, enabled: bool) -> void:
	pass;

#desc Show the [CanvasItem] if it's currently hidden. This is equivalent to setting [member visible] to [code]true[/code]. For controls that inherit [Popup], the correct way to make them visible is to call one of the multiple [code]popup*()[/code] functions instead.
func show() -> void:
	pass;


func get_clip_children_mode() -> int:
	return clip_children

func set_clip_children_mode(value: int) -> void:
	clip_children = value

func get_light_mask() -> int:
	return light_mask

func set_light_mask(value: int) -> void:
	light_mask = value

func get_material() -> Material:
	return material

func set_material(value: Material) -> void:
	material = value

func get_modulate() -> Color:
	return modulate

func set_modulate(value: Color) -> void:
	modulate = value

func get_self_modulate() -> Color:
	return self_modulate

func set_self_modulate(value: Color) -> void:
	self_modulate = value

func is_draw_behind_parent_enabled() -> bool:
	return show_behind_parent

func set_draw_behind_parent(value: bool) -> void:
	show_behind_parent = value

func get_texture_filter() -> int:
	return texture_filter

func set_texture_filter(value: int) -> void:
	texture_filter = value

func get_texture_repeat() -> int:
	return texture_repeat

func set_texture_repeat(value: int) -> void:
	texture_repeat = value

func is_set_as_top_level() -> bool:
	return top_level

func set_as_top_level(value: bool) -> void:
	top_level = value

func get_use_parent_material() -> bool:
	return use_parent_material

func set_use_parent_material(value: bool) -> void:
	use_parent_material = value

func get_visibility_layer() -> int:
	return visibility_layer

func set_visibility_layer(value: int) -> void:
	visibility_layer = value

func is_visible() -> bool:
	return visible

func set_visible(value: bool) -> void:
	visible = value

func is_y_sort_enabled() -> bool:
	return y_sort_enabled

func set_y_sort_enabled(value: bool) -> void:
	y_sort_enabled = value

func is_z_relative() -> bool:
	return z_as_relative

func set_z_as_relative(value: bool) -> void:
	z_as_relative = value

func get_z_index() -> int:
	return z_index

func set_z_index(value: int) -> void:
	z_index = value


extends Viewport
#brief Base class for all windows.
#desc A node that creates a window. The window can either be a native system window or embedded inside another [Window] (see [member Viewport.gui_embed_subwindows]).
#desc At runtime, [Window]s will not close automatically when requested. You need to handle it manually using [signal close_requested] (this applies both to clicking close button and clicking outside popup).
class_name Window

#desc Emitted right after [method popup] call, before the [Window] appears or does anything.
signal about_to_popup
#desc Emitted when the [Window]'s close button is pressed or when [member popup_window] is enabled and user clicks outside the window.
#desc This signal can be used to handle window closing, e.g. by connecting it to [method hide].
signal close_requested
#desc Emitted when the [Window]'s DPI changes as a result of OS-level changes (e.g. moving the window from a Retina display to a lower resolution one).
#desc [b]Note:[/b] Only implemented on macOS.
signal dpi_changed
#desc Emitted when files are dragged from the OS file manager and dropped in the game window. The argument is a list of file paths.
#desc Note that this method only works with non-embedded windows, i.e. the main window and [Window]-derived nodes when [member Viewport.gui_embed_subwindows] is disabled in the main viewport.
#desc Example usage:
#desc [codeblock]
#desc func _ready():
#desc get_viewport().files_dropped.connect(on_files_dropped)
#desc 
#desc func on_files_dropped(files):
#desc print(files)
#desc [/codeblock]
signal files_dropped(files: PackedStringArray)
#desc Emitted when the [Window] gains focus.
signal focus_entered
#desc Emitted when the [Window] loses its focus.
signal focus_exited
#desc Emitted when a go back request is sent (e.g. pressing the "Back" button on Android), right after [constant Node.NOTIFICATION_WM_GO_BACK_REQUEST].
signal go_back_requested
#desc Emitted when the mouse cursor enters the [Window]'s area, regardless if it's currently focused or not.
signal mouse_entered
#desc Emitted when the mouse cursor exits the [Window]'s area (including when it's hovered over another window on top of this one).
signal mouse_exited
#desc Emitted when the [constant NOTIFICATION_THEME_CHANGED] notification is sent.
signal theme_changed
#desc Emitted when window title bar decorations are changed, e.g. macOS window enter/exit full screen mode, or extend-to-title flag is changed.
signal titlebar_changed
#desc Emitted when [Window] is made visible or disappears.
signal visibility_changed
#desc Emitted when the [Window] is currently focused and receives any input, passing the received event as an argument. The event's position, if present, is in the embedder's coordinate system.
signal window_input(event: InputEvent)
#desc Emitted when [Window]'s visibility changes, right before [signal visibility_changed].
const NOTIFICATION_VISIBILITY_CHANGED = 30;

#desc Sent when the node needs to refresh its theme items. This happens in one of the following cases:
#desc - The [member theme] property is changed on this node or any of its ancestors.
#desc - The [member theme_type_variation] property is changed on this node.
#desc - The node enters the scene tree.
#desc [b]Note:[/b] As an optimization, this notification won't be sent from changes that occur while this node is outside of the scene tree. Instead, all of the theme item updates can be applied at once when the node enters the scene tree.
const NOTIFICATION_THEME_CHANGED = 32;

#desc Windowed mode, i.e. [Window] doesn't occupy the whole screen (unless set to the size of the screen).
#desc Minimized window mode, i.e. [Window] is not visible and available on window manager's window list. Normally happens when the minimize button is pressed.
#desc Maximized window mode, i.e. [Window] will occupy whole screen area except task bar and still display its borders. Normally happens when the maximize button is pressed.
#desc Full screen window mode. Note that this is not [i]exclusive[/i] full screen. On Windows and Linux, a borderless window is used to emulate full screen. On macOS, a new desktop is used to display the running project.
#desc Regardless of the platform, enabling full screen will change the window size to match the monitor's size. Therefore, make sure your project supports [url=$DOCS_URL/tutorials/rendering/multiple_resolutions.html]multiple resolutions[/url] when enabling full screen mode.
#desc Exclusive full screen window mode. This mode is implemented on Windows only. On other platforms, it is equivalent to [constant MODE_FULLSCREEN].
#desc Only one window in exclusive full screen mode can be visible on a given screen at a time. If multiple windows are in exclusive full screen mode for the same screen, the last one being set to this mode takes precedence.
#desc Regardless of the platform, enabling full screen will change the window size to match the monitor's size. Therefore, make sure your project supports [url=$DOCS_URL/tutorials/rendering/multiple_resolutions.html]multiple resolutions[/url] when enabling full screen mode.
#desc The window can't be resized by dragging its resize grip. It's still possible to resize the window using [member size]. This flag is ignored for full screen windows. Set with [member unresizable].
#desc The window do not have native title bar and other decorations. This flag is ignored for full-screen windows. Set with [member borderless].
#desc The window is floating on top of all other windows. This flag is ignored for full-screen windows. Set with [member always_on_top].
#desc The window background can be transparent.
#desc [b]Note:[/b] This flag has no effect if [member ProjectSettings.display/window/per_pixel_transparency/allowed] is set to [code]false[/code]. Set with [member transparent].
#desc The window can't be focused. No-focus window will ignore all input, except mouse clicks. Set with [member unfocusable].
#desc Window is part of menu or [OptionButton] dropdown. This flag can't be changed when the window is visible. An active popup window will exclusively receive all input, without stealing focus from its parent. Popup windows are automatically closed when uses click outside it, or when an application is switched. Popup window must have transient parent set (see [member transient]).
#desc Window content is expanded to the full size of the window. Unlike borderless window, the frame is left intact and can be used to resize the window, title bar is transparent, but have minimize/maximize/close buttons. Set with [member extend_to_title].
#desc [b]Note:[/b] This flag is implemented on macOS.
#desc All mouse events are passed to the underlying window of the same application.
#desc Max value of the [enum Flags].
#desc The content will not be scaled to match the [Window]'s size.
#desc The content will be rendered at the target size. This is more performance-expensive than [constant CONTENT_SCALE_MODE_VIEWPORT], but provides better results.
#desc The content will be rendered at the base size and then scaled to the target size. More performant than [constant CONTENT_SCALE_MODE_CANVAS_ITEMS], but results in pixelated image.
#desc The aspect will be ignored. Scaling will simply stretch the content to fit the target size.
#desc The content's aspect will be preserved. If the target size has different aspect from the base one, the image will be centered and black bars will appear on left and right sides.
#desc The content can be expanded vertically. Scaling horizontally will result in keeping the width ratio and then black bars on left and right sides.
#desc The content can be expanded horizontally. Scaling vertically will result in keeping the height ratio and then black bars on top and bottom sides.
#desc The content's aspect will be preserved. If the target size has different aspect from the base one, the content will stay in the top-left corner and add an extra visible area in the stretched space.
#desc Automatic layout direction, determined from the parent window layout direction.
#desc Automatic layout direction, determined from the current locale.
#desc Left-to-right layout direction.
#desc Right-to-left layout direction.
#desc Initial window position is determined by [member position].
#desc Initial window position is a center of the primary screen.
#desc Initial window position is a center of the main window screen.
#desc Initial window position is a center of [member current_screen] screen.

#enum Mode
enum {
    MODE_WINDOWED = 0,
    MODE_MINIMIZED = 1,
    MODE_MAXIMIZED = 2,
    MODE_FULLSCREEN = 3,
    MODE_EXCLUSIVE_FULLSCREEN = 4,
}
#enum Flags
enum {
    FLAG_RESIZE_DISABLED = 0,
    FLAG_BORDERLESS = 1,
    FLAG_ALWAYS_ON_TOP = 2,
    FLAG_TRANSPARENT = 3,
    FLAG_NO_FOCUS = 4,
    FLAG_POPUP = 5,
    FLAG_EXTEND_TO_TITLE = 6,
    FLAG_MOUSE_PASSTHROUGH = 7,
    FLAG_MAX = 8,
}
#enum ContentScaleMode
enum {
    CONTENT_SCALE_MODE_DISABLED = 0,
    CONTENT_SCALE_MODE_CANVAS_ITEMS = 1,
    CONTENT_SCALE_MODE_VIEWPORT = 2,
}
#enum ContentScaleAspect
enum {
    CONTENT_SCALE_ASPECT_IGNORE = 0,
    CONTENT_SCALE_ASPECT_KEEP = 1,
    CONTENT_SCALE_ASPECT_KEEP_WIDTH = 2,
    CONTENT_SCALE_ASPECT_KEEP_HEIGHT = 3,
    CONTENT_SCALE_ASPECT_EXPAND = 4,
}
#enum LayoutDirection
enum {
    LAYOUT_DIRECTION_INHERITED = 0,
    LAYOUT_DIRECTION_LOCALE = 1,
    LAYOUT_DIRECTION_LTR = 2,
    LAYOUT_DIRECTION_RTL = 3,
}
#enum WindowInitialPosition
enum {
    WINDOW_INITIAL_POSITION_ABSOLUTE = 0,
    WINDOW_INITIAL_POSITION_CENTER_PRIMARY_SCREEN = 1,
    WINDOW_INITIAL_POSITION_CENTER_MAIN_WINDOW_SCREEN = 2,
    WINDOW_INITIAL_POSITION_CENTER_OTHER_SCREEN = 3,
}
#desc If [code]true[/code], the window will be on top of all other windows. Does not work if [member transient] is enabled.
var always_on_top: bool:
	get = get_flag, set = set_flag

#desc Toggles if any text should automatically change to its translated version depending on the current locale.
var auto_translate: bool:
	get = is_auto_translating, set = set_auto_translate

#desc If [code]true[/code], the window will have no borders.
var borderless: bool:
	get = get_flag, set = set_flag

#desc Specifies how the content's aspect behaves when the [Window] is resized. The base aspect is determined by [member content_scale_size].
var content_scale_aspect: int:
	get = get_content_scale_aspect, set = set_content_scale_aspect

#desc Specifies the base scale of [Window]'s content when its [member size] is equal to [member content_scale_size].
var content_scale_factor: float:
	get = get_content_scale_factor, set = set_content_scale_factor

#desc Specifies how the content is scaled when the [Window] is resized.
var content_scale_mode: int:
	get = get_content_scale_mode, set = set_content_scale_mode

#desc Base size of the content (i.e. nodes that are drawn inside the window). If non-zero, [Window]'s content will be scaled when the window is resized to a different size.
var content_scale_size: Vector2i:
	get = get_content_scale_size, set = set_content_scale_size

#desc The screen the window is currently on.
var current_screen: int:
	get = get_current_screen, set = set_current_screen

#desc If [code]true[/code], the [Window] will be in exclusive mode. Exclusive windows are always on top of their parent and will block all input going to the parent [Window].
#desc Needs [member transient] enabled to work.
var exclusive: bool:
	get = is_exclusive, set = set_exclusive

#desc If [code]true[/code], the [Window] contents is expanded to the full size of the window, window title bar is transparent.
var extend_to_title: bool:
	get = get_flag, set = set_flag

var initial_position: int:
	get = get_initial_position, set = set_initial_position

#desc If non-zero, the [Window] can't be resized to be bigger than this size.
#desc [b]Note:[/b] This property will be ignored if the value is lower than [member min_size].
var max_size: Vector2i:
	get = get_max_size, set = set_max_size

#desc If non-zero, the [Window] can't be resized to be smaller than this size.
#desc [b]Note:[/b] This property will be ignored in favor of [method get_contents_minimum_size] if [member wrap_controls] is enabled and if its size is bigger.
var min_size: Vector2i:
	get = get_min_size, set = set_min_size

#desc Set's the window's current mode.
#desc [b]Note:[/b] Fullscreen mode is not exclusive full screen on Windows and Linux.
var mode: int:
	get = get_mode, set = set_mode

#desc If [code]true[/code], all mouse events will be passed to the underlying window of the same application. See also [member mouse_passthrough_polygon].
#desc [b]Note:[/b] This property is implemented on Linux (X11), macOS and Windows.
var mouse_passthrough: bool:
	get = get_flag, set = set_flag

#desc Sets a polygonal region of the window which accepts mouse events. Mouse events outside the region will be passed through.
#desc Passing an empty array will disable passthrough support (all mouse events will be intercepted by the window, which is the default behavior).
#desc [codeblocks]
#desc [gdscript]
#desc # Set region, using Path2D node.
#desc $Window.mouse_passthrough_polygon = $Path2D.curve.get_baked_points()
#desc 
#desc # Set region, using Polygon2D node.
#desc $Window.mouse_passthrough_polygon = $Polygon2D.polygon
#desc 
#desc # Reset region to default.
#desc $Window.mouse_passthrough_polygon = []
#desc [/gdscript]
#desc [csharp]
#desc // Set region, using Path2D node.
#desc GetNode<Window>("Window").MousePassthrough = GetNode<Path2D>("Path2D").Curve.GetBakedPoints();
#desc 
#desc // Set region, using Polygon2D node.
#desc GetNode<Window>("Window").MousePassthrough = GetNode<Polygon2D>("Polygon2D").Polygon;
#desc 
#desc // Reset region to default.
#desc GetNode<Window>("Window").MousePassthrough = new Vector2[] {};
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] This property is ignored if [member mouse_passthrough] is set to [code]true[/code].
#desc [b]Note:[/b] On Windows, the portion of a window that lies outside the region is not drawn, while on Linux (X11) and macOS it is.
#desc [b]Note:[/b] This property is implemented on Linux (X11), macOS and Windows.
var mouse_passthrough_polygon: PackedVector2Array:
	get = get_mouse_passthrough_polygon, set = set_mouse_passthrough_polygon

#desc If [code]true[/code], the [Window] will be considered a popup. Popups are sub-windows that don't show as separate windows in system's window manager's window list and will send close request when anything is clicked outside of them (unless [member exclusive] is enabled).
var popup_window: bool:
	get = get_flag, set = set_flag

#desc The window's position in pixels.
#desc If [member ProjectSettings.display/window/subwindows/embed_subwindows] is [code]false[/code], the position is in absolute screen coordinates. This typically applies to editor plugins. If the setting is [code]false[/code], the window's position is in the coordinates of its parent [Viewport].
var position: Vector2i:
	get = get_position, set = set_position

#desc The window's size in pixels.
var size: Vector2i:
	get = get_size, set = set_size

#desc The [Theme] resource this node and all its [Control] and [Window] children use. If a child node has its own [Theme] resource set, theme items are merged with child's definitions having higher priority.
#desc [b]Note:[/b] [Window] styles will have no effect unless the window is embedded.
var theme: Theme:
	get = get_theme, set = set_theme

#desc The name of a theme type variation used by this [Window] to look up its own theme items. See [member Control.theme_type_variation] for more details.
var theme_type_variation: StringName:
	get = get_theme_type_variation, set = set_theme_type_variation

#desc The window's title. If the [Window] is non-embedded, title styles set in [Theme] will have no effect.
var title: String:
	get = get_title, set = set_title

#desc If [code]true[/code], the [Window] is transient, i.e. it's considered a child of another [Window]. The transient window will be destroyed with its transient parent and will return focus to their parent when closed. The transient window is displayed on top of a non-exclusive full-screen parent window. Transient windows can't enter full-screen mode.
#desc Note that behavior might be different depending on the platform.
var transient: bool:
	get = is_transient, set = set_transient

#desc If [code]true[/code], the [Window]'s background can be transparent. This is best used with embedded windows.
#desc [b]Note:[/b] For native windows, this flag has no effect if [member ProjectSettings.display/window/per_pixel_transparency/allowed] is set to [code]false[/code].
#desc [b]Note:[/b] Transparency support is implemented on Linux, macOS and Windows, but availability might vary depending on GPU driver, display manager, and compositor capabilities.
var transparent: bool:
	get = get_flag, set = set_flag

#desc If [code]true[/code], the [Window] can't be focused nor interacted with. It can still be visible.
var unfocusable: bool:
	get = get_flag, set = set_flag

#desc If [code]true[/code], the window can't be resized. Minimize and maximize buttons are disabled.
var unresizable: bool:
	get = get_flag, set = set_flag

#desc If [code]true[/code], the window is visible.
var visible: bool:
	get = is_visible, set = set_visible

#desc If [code]true[/code], the window's size will automatically update when a child node is added or removed, ignoring [member min_size] if the new size is bigger.
#desc If [code]false[/code], you need to call [method child_controls_changed] manually.
var wrap_controls: bool:
	get = is_wrapping_controls, set = set_wrap_controls



#desc Creates a local override for a theme [Color] with the specified [param name]. Local overrides always take precedence when fetching theme items for the control. An override can be removed with [method remove_theme_color_override].
#desc See also [method get_theme_color] and [method Control.add_theme_color_override] for more details.
func add_theme_color_override(name: StringName, color: Color) -> void:
	pass;

#desc Creates a local override for a theme constant with the specified [param name]. Local overrides always take precedence when fetching theme items for the control. An override can be removed with [method remove_theme_constant_override].
#desc See also [method get_theme_constant].
func add_theme_constant_override(name: StringName, constant: int) -> void:
	pass;

#desc Creates a local override for a theme [Font] with the specified [param name]. Local overrides always take precedence when fetching theme items for the control. An override can be removed with [method remove_theme_font_override].
#desc See also [method get_theme_font].
func add_theme_font_override(name: StringName, font: Font) -> void:
	pass;

#desc Creates a local override for a theme font size with the specified [param name]. Local overrides always take precedence when fetching theme items for the control. An override can be removed with [method remove_theme_font_size_override].
#desc See also [method get_theme_font_size].
func add_theme_font_size_override(name: StringName, font_size: int) -> void:
	pass;

#desc Creates a local override for a theme icon with the specified [param name]. Local overrides always take precedence when fetching theme items for the control. An override can be removed with [method remove_theme_icon_override].
#desc See also [method get_theme_icon].
func add_theme_icon_override(name: StringName, texture: Texture2D) -> void:
	pass;

#desc Creates a local override for a theme [StyleBox] with the specified [param name]. Local overrides always take precedence when fetching theme items for the control. An override can be removed with [method remove_theme_stylebox_override].
#desc See also [method get_theme_stylebox] and [method Control.add_theme_stylebox_override] for more details.
func add_theme_stylebox_override(name: StringName, stylebox: StyleBox) -> void:
	pass;

#desc Prevents [code]*_theme_*_override[/code] methods from emitting [constant NOTIFICATION_THEME_CHANGED] until [method end_bulk_theme_override] is called.
func begin_bulk_theme_override() -> void:
	pass;

#desc Returns whether the window is being drawn to the screen.
func can_draw() -> bool:
	pass;

#desc Requests an update of the [Window] size to fit underlying [Control] nodes.
func child_controls_changed() -> void:
	pass;

#desc Ends a bulk theme override update. See [method begin_bulk_theme_override].
func end_bulk_theme_override() -> void:
	pass;

#desc Returns the combined minimum size from the child [Control] nodes of the window. Use [method child_controls_changed] to update it when children nodes have changed.
func get_contents_minimum_size() -> Vector2:
	pass;

#desc Returns [code]true[/code] if the [param flag] is set.
func get_flag(flag: int) -> bool:
	pass;

#desc Returns layout direction and text writing direction.
func get_layout_direction() -> int:
	pass;

#desc Returns the window's position including its border.
func get_position_with_decorations() -> Vector2i:
	pass;

#desc Returns the window's size including its border.
func get_size_with_decorations() -> Vector2i:
	pass;

#desc Returns a [Color] from the first matching [Theme] in the tree if that [Theme] has a color item with the specified [param name] and [param theme_type].
#desc See [method Control.get_theme_color] for more details.
func get_theme_color(name: StringName, theme_type: StringName = "") -> Color:
	pass;

#desc Returns a constant from the first matching [Theme] in the tree if that [Theme] has a constant item with the specified [param name] and [param theme_type].
#desc See [method Control.get_theme_color] for more details.
func get_theme_constant(name: StringName, theme_type: StringName = "") -> int:
	pass;

#desc Returns the default base scale value from the first matching [Theme] in the tree if that [Theme] has a valid [member Theme.default_base_scale] value.
#desc See [method Control.get_theme_color] for details.
func get_theme_default_base_scale() -> float:
	pass;

#desc Returns the default font from the first matching [Theme] in the tree if that [Theme] has a valid [member Theme.default_font] value.
#desc See [method Control.get_theme_color] for details.
func get_theme_default_font() -> Font:
	pass;

#desc Returns the default font size value from the first matching [Theme] in the tree if that [Theme] has a valid [member Theme.default_font_size] value.
#desc See [method Control.get_theme_color] for details.
func get_theme_default_font_size() -> int:
	pass;

#desc Returns a [Font] from the first matching [Theme] in the tree if that [Theme] has a font item with the specified [param name] and [param theme_type].
#desc See [method Control.get_theme_color] for details.
func get_theme_font(name: StringName, theme_type: StringName = "") -> Font:
	pass;

#desc Returns a font size from the first matching [Theme] in the tree if that [Theme] has a font size item with the specified [param name] and [param theme_type].
#desc See [method Control.get_theme_color] for details.
func get_theme_font_size(name: StringName, theme_type: StringName = "") -> int:
	pass;

#desc Returns an icon from the first matching [Theme] in the tree if that [Theme] has an icon item with the specified [param name] and [param theme_type].
#desc See [method Control.get_theme_color] for details.
func get_theme_icon(name: StringName, theme_type: StringName = "") -> Texture2D:
	pass;

#desc Returns a [StyleBox] from the first matching [Theme] in the tree if that [Theme] has a stylebox item with the specified [param name] and [param theme_type].
#desc See [method Control.get_theme_color] for details.
func get_theme_stylebox(name: StringName, theme_type: StringName = "") -> StyleBox:
	pass;

#desc Causes the window to grab focus, allowing it to receive user input.
func grab_focus() -> void:
	pass;

#desc Returns [code]true[/code] if the window is focused.
func has_focus() -> bool:
	pass;

#desc Returns [code]true[/code] if there is a matching [Theme] in the tree that has a color item with the specified [param name] and [param theme_type].
#desc See [method Control.get_theme_color] for details.
func has_theme_color(name: StringName, theme_type: StringName = "") -> bool:
	pass;

#desc Returns [code]true[/code] if there is a local override for a theme [Color] with the specified [param name] in this [Control] node.
#desc See [method add_theme_color_override].
func has_theme_color_override(name: StringName) -> bool:
	pass;

#desc Returns [code]true[/code] if there is a matching [Theme] in the tree that has a constant item with the specified [param name] and [param theme_type].
#desc See [method Control.get_theme_color] for details.
func has_theme_constant(name: StringName, theme_type: StringName = "") -> bool:
	pass;

#desc Returns [code]true[/code] if there is a local override for a theme constant with the specified [param name] in this [Control] node.
#desc See [method add_theme_constant_override].
func has_theme_constant_override(name: StringName) -> bool:
	pass;

#desc Returns [code]true[/code] if there is a matching [Theme] in the tree that has a font item with the specified [param name] and [param theme_type].
#desc See [method Control.get_theme_color] for details.
func has_theme_font(name: StringName, theme_type: StringName = "") -> bool:
	pass;

#desc Returns [code]true[/code] if there is a local override for a theme [Font] with the specified [param name] in this [Control] node.
#desc See [method add_theme_font_override].
func has_theme_font_override(name: StringName) -> bool:
	pass;

#desc Returns [code]true[/code] if there is a matching [Theme] in the tree that has a font size item with the specified [param name] and [param theme_type].
#desc See [method Control.get_theme_color] for details.
func has_theme_font_size(name: StringName, theme_type: StringName = "") -> bool:
	pass;

#desc Returns [code]true[/code] if there is a local override for a theme font size with the specified [param name] in this [Control] node.
#desc See [method add_theme_font_size_override].
func has_theme_font_size_override(name: StringName) -> bool:
	pass;

#desc Returns [code]true[/code] if there is a matching [Theme] in the tree that has an icon item with the specified [param name] and [param theme_type].
#desc See [method Control.get_theme_color] for details.
func has_theme_icon(name: StringName, theme_type: StringName = "") -> bool:
	pass;

#desc Returns [code]true[/code] if there is a local override for a theme icon with the specified [param name] in this [Control] node.
#desc See [method add_theme_icon_override].
func has_theme_icon_override(name: StringName) -> bool:
	pass;

#desc Returns [code]true[/code] if there is a matching [Theme] in the tree that has a stylebox item with the specified [param name] and [param theme_type].
#desc See [method Control.get_theme_color] for details.
func has_theme_stylebox(name: StringName, theme_type: StringName = "") -> bool:
	pass;

#desc Returns [code]true[/code] if there is a local override for a theme [StyleBox] with the specified [param name] in this [Control] node.
#desc See [method add_theme_stylebox_override].
func has_theme_stylebox_override(name: StringName) -> bool:
	pass;

#desc Hides the window. This is not the same as minimized state. Hidden window can't be interacted with and needs to be made visible with [method show].
func hide() -> void:
	pass;

#desc Returns [code]true[/code] if the window is currently embedded in another window.
func is_embedded() -> bool:
	pass;

#desc Returns [code]true[/code] if layout is right-to-left.
func is_layout_rtl() -> bool:
	pass;

#desc Returns [code]true[/code] if the window can be maximized (the maximize button is enabled).
func is_maximize_allowed() -> bool:
	pass;

#desc Returns [code]true[/code] if font oversampling is enabled. See [method set_use_font_oversampling].
func is_using_font_oversampling() -> bool:
	pass;

#desc Moves the [Window] on top of other windows and focuses it.
func move_to_foreground() -> void:
	pass;

#desc Shows the [Window] and makes it transient (see [member transient]). If [param rect] is provided, it will be set as the [Window]'s size.
#desc Fails if called on the main window.
func popup(rect: Rect2i = Rect2i(0, 0, 0, 0)) -> void:
	pass;

#desc Popups the [Window] at the center of the current screen, with optionally given minimum size.
#desc If the [Window] is embedded, it will be centered in the parent [Viewport] instead.
#desc [b]Note:[/b] Calling it with the default value of [param minsize] is equivalent to calling it with [member size].
func popup_centered(minsize: Vector2i = Vector2i(0, 0)) -> void:
	pass;

#desc Popups the [Window] centered inside its parent [Window].
#desc [code]fallback_ratio[/code] determines the maximum size of the [Window], in relation to its parent.
#desc [b]Note:[/b] Calling it with the default value of [param minsize] is equivalent to calling it with [member size].
func popup_centered_clamped(minsize: Vector2i = Vector2i(0, 0), fallback_ratio: float = 0.75) -> void:
	pass;

#desc Popups the [Window] centered inside its parent [Window] and sets its size as a [param ratio] of parent's size.
func popup_centered_ratio(ratio: float = 0.8) -> void:
	pass;

#desc Popups the [Window] with a position shifted by parent [Window]'s position.
#desc If the [Window] is embedded, has the same effect as [method popup].
func popup_on_parent(parent_rect: Rect2i) -> void:
	pass;

#desc Removes a local override for a theme [Color] with the specified [param name] previously added by [method add_theme_color_override] or via the Inspector dock.
func remove_theme_color_override(name: StringName) -> void:
	pass;

#desc Removes a local override for a theme constant with the specified [param name] previously added by [method add_theme_constant_override] or via the Inspector dock.
func remove_theme_constant_override(name: StringName) -> void:
	pass;

#desc Removes a local override for a theme [Font] with the specified [param name] previously added by [method add_theme_font_override] or via the Inspector dock.
func remove_theme_font_override(name: StringName) -> void:
	pass;

#desc Removes a local override for a theme font size with the specified [param name] previously added by [method add_theme_font_size_override] or via the Inspector dock.
func remove_theme_font_size_override(name: StringName) -> void:
	pass;

#desc Removes a local override for a theme icon with the specified [param name] previously added by [method add_theme_icon_override] or via the Inspector dock.
func remove_theme_icon_override(name: StringName) -> void:
	pass;

#desc Removes a local override for a theme [StyleBox] with the specified [param name] previously added by [method add_theme_stylebox_override] or via the Inspector dock.
func remove_theme_stylebox_override(name: StringName) -> void:
	pass;

#desc Tells the OS that the [Window] needs an attention. This makes the window stand out in some way depending on the system, e.g. it might blink on the task bar.
func request_attention() -> void:
	pass;

#desc Resets the size to the minimum size, which is the max of [member min_size] and (if [member wrap_controls] is enabled) [method get_contents_minimum_size]. This is equivalent to calling [code]set_size(Vector2i())[/code] (or any size below the minimum).
func reset_size() -> void:
	pass;

#desc Sets a specified window flag.
func set_flag(flag: int, enabled: bool) -> void:
	pass;

#desc If [param active] is [code]true[/code], enables system's native IME (Input Method Editor).
func set_ime_active(active: bool) -> void:
	pass;

#desc Moves IME to the given position.
func set_ime_position(position: Vector2i) -> void:
	pass;

#desc Sets layout direction and text writing direction. Right-to-left layouts are necessary for certain languages (e.g. Arabic and Hebrew).
func set_layout_direction(direction: int) -> void:
	pass;

#desc Enables font oversampling. This makes fonts look better when they are scaled up.
func set_use_font_oversampling(enable: bool) -> void:
	pass;

#desc Makes the [Window] appear. This enables interactions with the [Window] and doesn't change any of its property other than visibility (unlike e.g. [method popup]).
func show() -> void:
	pass;


func get_flag() -> bool:
	return always_on_top

func set_flag(value: bool) -> void:
	always_on_top = value

func is_auto_translating() -> bool:
	return auto_translate

func set_auto_translate(value: bool) -> void:
	auto_translate = value

func get_flag() -> bool:
	return borderless

func set_flag(value: bool) -> void:
	borderless = value

func get_content_scale_aspect() -> int:
	return content_scale_aspect

func set_content_scale_aspect(value: int) -> void:
	content_scale_aspect = value

func get_content_scale_factor() -> float:
	return content_scale_factor

func set_content_scale_factor(value: float) -> void:
	content_scale_factor = value

func get_content_scale_mode() -> int:
	return content_scale_mode

func set_content_scale_mode(value: int) -> void:
	content_scale_mode = value

func get_content_scale_size() -> Vector2i:
	return content_scale_size

func set_content_scale_size(value: Vector2i) -> void:
	content_scale_size = value

func get_current_screen() -> int:
	return current_screen

func set_current_screen(value: int) -> void:
	current_screen = value

func is_exclusive() -> bool:
	return exclusive

func set_exclusive(value: bool) -> void:
	exclusive = value

func get_flag() -> bool:
	return extend_to_title

func set_flag(value: bool) -> void:
	extend_to_title = value

func get_initial_position() -> int:
	return initial_position

func set_initial_position(value: int) -> void:
	initial_position = value

func get_max_size() -> Vector2i:
	return max_size

func set_max_size(value: Vector2i) -> void:
	max_size = value

func get_min_size() -> Vector2i:
	return min_size

func set_min_size(value: Vector2i) -> void:
	min_size = value

func get_mode() -> int:
	return mode

func set_mode(value: int) -> void:
	mode = value

func get_flag() -> bool:
	return mouse_passthrough

func set_flag(value: bool) -> void:
	mouse_passthrough = value

func get_mouse_passthrough_polygon() -> PackedVector2Array:
	return mouse_passthrough_polygon

func set_mouse_passthrough_polygon(value: PackedVector2Array) -> void:
	mouse_passthrough_polygon = value

func get_flag() -> bool:
	return popup_window

func set_flag(value: bool) -> void:
	popup_window = value

func get_position() -> Vector2i:
	return position

func set_position(value: Vector2i) -> void:
	position = value

func get_size() -> Vector2i:
	return size

func set_size(value: Vector2i) -> void:
	size = value

func get_theme() -> Theme:
	return theme

func set_theme(value: Theme) -> void:
	theme = value

func get_theme_type_variation() -> StringName:
	return theme_type_variation

func set_theme_type_variation(value: StringName) -> void:
	theme_type_variation = value

func get_title() -> String:
	return title

func set_title(value: String) -> void:
	title = value

func is_transient() -> bool:
	return transient

func set_transient(value: bool) -> void:
	transient = value

func get_flag() -> bool:
	return transparent

func set_flag(value: bool) -> void:
	transparent = value

func get_flag() -> bool:
	return unfocusable

func set_flag(value: bool) -> void:
	unfocusable = value

func get_flag() -> bool:
	return unresizable

func set_flag(value: bool) -> void:
	unresizable = value

func is_visible() -> bool:
	return visible

func set_visible(value: bool) -> void:
	visible = value

func is_wrapping_controls() -> bool:
	return wrap_controls

func set_wrap_controls(value: bool) -> void:
	wrap_controls = value


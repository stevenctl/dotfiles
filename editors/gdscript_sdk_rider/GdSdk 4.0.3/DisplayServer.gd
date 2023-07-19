extends Object
#brief Singleton for window management functions.
#desc [DisplayServer] handles everything related to window management. This is separated from [OS] as a single operating system may support multiple display servers.
#desc [b]Headless mode:[/b] Starting the engine with the [code]--headless[/code] [url=$DOCS_URL/tutorials/editor/command_line_tutorial.html]command line argument[/url] disables all rendering and window management functions. Most functions from [DisplayServer] will return dummy values in this case.
class_name DisplayServer

#desc Display server supports global menu. This allows the application to display its menu items in the operating system's top bar. [b]macOS[/b]
#desc Display server supports multiple windows that can be moved outside of the main window. [b]Windows, macOS, Linux (X11)[/b]
#desc Display server supports touchscreen input. [b]Windows, Linux (X11), Android, iOS, Web[/b]
#desc Display server supports mouse input. [b]Windows, macOS, Linux (X11), Android, Web[/b]
#desc Display server supports warping mouse coordinates to keep the mouse cursor constrained within an area, but looping when one of the edges is reached. [b]Windows, macOS, Linux (X11)[/b]
#desc Display server supports setting and getting clipboard data. See also [constant FEATURE_CLIPBOARD_PRIMARY]. [b]Windows, macOS, Linux (X11), Android, iOS, Web[/b]
#desc Display server supports popping up a virtual keyboard when requested to input text without a physical keyboard. [b]Android, iOS, Web[/b]
#desc Display server supports setting the mouse cursor shape to be different from the default. [b]Windows, macOS, Linux (X11), Android, Web[/b]
#desc Display server supports setting the mouse cursor shape to a custom image. [b]Windows, macOS, Linux (X11), Web[/b]
#desc Display server supports spawning dialogs using the operating system's native look-and-feel. [b]macOS[/b]
#desc Display server supports [url=https://en.wikipedia.org/wiki/Input_method]Input Method Editor[/url], which is commonly used for inputting Chinese/Japanese/Korean text. This is handled by the operating system, rather than by Godot. [b]Windows, macOS, Linux (X11)[/b]
#desc Display server supports windows can use per-pixel transparency to make windows behind them partially or fully visible. [b]Windows, macOS, Linux (X11)[/b]
#desc Display server supports querying the operating system's display scale factor. This allows for [i]reliable[/i] automatic hiDPI display detection, as opposed to guessing based on the screen resolution and reported display DPI (which can be unreliable due to broken monitor EDID). [b]Windows, macOS[/b]
#desc Display server supports changing the window icon (usually displayed in the top-left corner). [b]Windows, macOS, Linux (X11)[/b]
#desc Display server supports changing the window icon (usually displayed in the top-left corner). [b]Windows, macOS[/b]
#desc Display server supports changing the screen orientation. [b]Android, iOS[/b]
#desc Display server supports V-Sync status can be changed from the default (which is forced to be enabled platforms not supporting this feature). [b]Windows, macOS, Linux (X11)[/b]
#desc Display server supports Primary clipboard can be used. This is a different clipboard from [constant FEATURE_CLIPBOARD]. [b]Linux (X11)[/b]
#desc Display server supports text-to-speech. See [code]tts_*[/code] methods. [b]Windows, macOS, Linux (X11), Android, iOS, Web[/b]
#desc Display server supports expanding window content to the title. See [constant WINDOW_FLAG_EXTEND_TO_TITLE]. [b]macOS[/b]
#desc Makes the mouse cursor visible if it is hidden.
#desc Makes the mouse cursor hidden if it is visible.
#desc Captures the mouse. The mouse will be hidden and its position locked at the center of the window manager's window.
#desc [b]Note:[/b] If you want to process the mouse's movement in this mode, you need to use [member InputEventMouseMotion.relative].
#desc Confines the mouse cursor to the game window, and make it visible.
#desc Confines the mouse cursor to the game window, and make it hidden.
#desc Represents the primary screen.
const SCREEN_PRIMARY = -2;

#desc Represents the screen where the main window is located. This is usually the default value in functions that allow specifying one of several screens.
const SCREEN_OF_MAIN_WINDOW = -1;

#desc The ID of the main window spawned by the engine, which can be passed to methods expecting a [code]window_id[/code].
const MAIN_WINDOW_ID = 0;

#desc The ID that refers to a nonexisting window. This is be returned by some [DisplayServer] methods if no window matches the requested result.
const INVALID_WINDOW_ID = -1;

#desc Default landscape orientation.
#desc Default portrait orientation.
#desc Reverse landscape orientation (upside down).
#desc Reverse portrait orientation (upside down).
#desc Automatic landscape orientation (default or reverse depending on sensor).
#desc Automatic portrait orientation (default or reverse depending on sensor).
#desc Automatic landscape or portrait orientation (default or reverse depending on sensor).
#desc Default text virtual keyboard.
#desc Multiline virtual keyboard.
#desc Virtual number keypad, useful for PIN entry.
#desc Virtual number keypad, useful for entering fractional numbers.
#desc Virtual phone number keypad.
#desc Virtual keyboard with additional keys to assist with typing email addresses.
#desc Virtual keyboard for entering a password. On most platforms, this should disable autocomplete and autocapitalization.
#desc [b]Note:[/b] This is not supported on Web. Instead, this behaves identically to [constant KEYBOARD_TYPE_DEFAULT].
#desc Virtual keyboard with additional keys to assist with typing URLs.
#desc Arrow cursor shape. This is the default when not pointing anything that overrides the mouse cursor, such as a [LineEdit] or [TextEdit].
#desc I-beam cursor shape. This is used by default when hovering a control that accepts text input, such as [LineEdit] or [TextEdit].
#desc Pointing hand cursor shape. This is used by default when hovering a [LinkButton] or an URL tag in a [RichTextLabel].
#desc Crosshair cursor. This is intended to be displayed when the user needs precise aim over an element, such as a rectangle selection tool or a color picker.
#desc Wait cursor. On most cursor themes, this displays a spinning icon [i]besides[/i] the arrow. Intended to be used for non-blocking operations (when the user can do something else at the moment). See also [constant CURSOR_BUSY].
#desc Wait cursor. On most cursor themes, this [i]replaces[/i] the arrow with a spinning icon. Intended to be used for blocking operations (when the user can't do anything else at the moment). See also [constant CURSOR_WAIT].
#desc Dragging hand cursor. This is displayed during drag-and-drop operations. See also [constant CURSOR_CAN_DROP].
#desc "Can drop" cursor. This is displayed during drag-and-drop operations if hovering over a [Control] that can accept the drag-and-drop event. On most cursor themes, this displays a dragging hand with an arrow symbol besides it. See also [constant CURSOR_DRAG].
#desc Forbidden cursor. This is displayed during drag-and-drop operations if the hovered [Control] can't accept the drag-and-drop event.
#desc Vertical resize cursor. Intended to be displayed when the hovered [Control] can be vertically resized using the mouse. See also [constant CURSOR_VSPLIT].
#desc Horizontal resize cursor. Intended to be displayed when the hovered [Control] can be horizontally resized using the mouse. See also [constant CURSOR_HSPLIT].
#desc Secondary diagonal resize cursor (top-right/bottom-left). Intended to be displayed when the hovered [Control] can be resized on both axes at once using the mouse.
#desc Main diagonal resize cursor (top-left/bottom-right). Intended to be displayed when the hovered [Control] can be resized on both axes at once using the mouse.
#desc Move cursor. Intended to be displayed when the hovered [Control] can be moved using the mouse.
#desc Vertical split cursor. This is displayed when hovering a [Control] with splits that can be vertically resized using the mouse, such as [VSplitContainer]. On some cursor themes, this cursor may have the same appearance as [constant CURSOR_VSIZE].
#desc Horizontal split cursor. This is displayed when hovering a [Control] with splits that can be horizontally resized using the mouse, such as [HSplitContainer]. On some cursor themes, this cursor may have the same appearance as [constant CURSOR_HSIZE].
#desc Help cursor. On most cursor themes, this displays a question mark icon instead of the mouse cursor. Intended to be used when the user has requested help on the next element that will be clicked.
#desc Represents the size of the [enum CursorShape] enum.
#desc Windowed mode, i.e. [Window] doesn't occupy the whole screen (unless set to the size of the screen).
#desc Minimized window mode, i.e. [Window] is not visible and available on window manager's window list. Normally happens when the minimize button is pressed.
#desc Maximized window mode, i.e. [Window] will occupy whole screen area except task bar and still display its borders. Normally happens when the maximize button is pressed.
#desc Full screen mode with full multi-window support.
#desc Full screen window cover the entire display area of a screen, have no border or decorations. Display video mode is not changed.
#desc [b]Note:[/b] Regardless of the platform, enabling full screen will change the window size to match the monitor's size. Therefore, make sure your project supports [url=$DOCS_URL/tutorials/rendering/multiple_resolutions.html]multiple resolutions[/url] when enabling full screen mode.
#desc A single window full screen mode. This mode has less overhead, but only one window can be open on a given screen at a time (opening a child window or application switching will trigger a full screen transition).
#desc Full screen window cover the entire display area of a screen, have no border or decorations. Display video mode is not changed.
#desc [b]On Windows:[/b] Depending on video driver, full screen transition might cause screens to go black for a moment.
#desc [b]On macOS:[/b] Exclusive full screen mode prevents Dock and Menu from showing up when the mouse pointer is hovering the edge of the screen.
#desc [b]On Linux (X11):[/b] Exclusive full screen mode bypasses compositor.
#desc [b]Note:[/b] Regardless of the platform, enabling full screen will change the window size to match the monitor's size. Therefore, make sure your project supports [url=$DOCS_URL/tutorials/rendering/multiple_resolutions.html]multiple resolutions[/url] when enabling full screen mode.
#desc The window can't be resized by dragging its resize grip. It's still possible to resize the window using [method window_set_size]. This flag is ignored for full screen windows.
#desc The window do not have native title bar and other decorations. This flag is ignored for full-screen windows.
#desc The window is floating on top of all other windows. This flag is ignored for full-screen windows.
#desc The window background can be transparent.
#desc [b]Note:[/b] This flag has no effect if [member ProjectSettings.display/window/per_pixel_transparency/allowed] is set to [code]false[/code].
#desc [b]Note:[/b] Transparency support is implemented on Linux (X11), macOS and Windows, but availability might vary depending on GPU driver, display manager, and compositor capabilities.
#desc The window can't be focused. No-focus window will ignore all input, except mouse clicks.
#desc Window is part of menu or [OptionButton] dropdown. This flag can't be changed when the window is visible. An active popup window will exclusively receive all input, without stealing focus from its parent. Popup windows are automatically closed when uses click outside it, or when an application is switched. Popup window must have transient parent set (see [method window_set_transient]).
#desc Window content is expanded to the full size of the window. Unlike borderless window, the frame is left intact and can be used to resize the window, title bar is transparent, but have minimize/maximize/close buttons.
#desc Use [method window_set_window_buttons_offset] to adjust minimize/maximize/close buttons offset.
#desc Use [method window_get_safe_title_margins] to determine area under the title bar that is not covered by decorations.
#desc [b]Note:[/b] This flag is implemented on macOS.
#desc All mouse events are passed to the underlying window of the same application.
#desc Max value of the [enum WindowFlags].
#desc Sent when the mouse pointer enters the window, see [method window_set_window_event_callback].
#desc Sent when the mouse pointer exits the window, see [method window_set_window_event_callback].
#desc Sent when the window grabs focus, see [method window_set_window_event_callback].
#desc Sent when the window loses focus, see [method window_set_window_event_callback].
#desc Sent when the user has attempted to close the window (e.g. close button is pressed), see [method window_set_window_event_callback].
#desc Sent when the device "Back" button is pressed, see [method window_set_window_event_callback].
#desc [b]Note:[/b] This event is implemented on Android.
#desc Sent when the window is moved to the display with different DPI, or display DPI is changed, see [method window_set_window_event_callback].
#desc [b]Note:[/b] This flag is implemented on macOS.
#desc Sent when the window title bar decoration is changed (e.g. [constant WINDOW_FLAG_EXTEND_TO_TITLE] is set or window entered/exited full screen mode), see [method window_set_window_event_callback].
#desc [b]Note:[/b] This flag is implemented on macOS.
#desc No vertical synchronization, which means the engine will display frames as fast as possible (tearing may be visible). Framerate is unlimited (nonwithstanding [member Engine.max_fps]).
#desc Default vertical synchronization mode, the image is displayed only on vertical blanking intervals (no tearing is visible). Framerate is limited by the monitor refresh rate (nonwithstanding [member Engine.max_fps]).
#desc Behaves like [constant VSYNC_DISABLED] when the framerate drops below the screen's refresh rate to reduce stuttering (tearing may be visible). Otherwise, vertical synchronization is enabled to avoid tearing. Framerate is limited by the monitor refresh rate (nonwithstanding [member Engine.max_fps]). Behaves like [constant VSYNC_ENABLED] when using the Compatibility rendering method.
#desc Displays the most recent image in the queue on vertical blanking intervals, while rendering to the other images (no tearing is visible). Framerate is unlimited (nonwithstanding [member Engine.max_fps]).
#desc Although not guaranteed, the images can be rendered as fast as possible, which may reduce input lag (also called "Fast" V-Sync mode). [constant VSYNC_MAILBOX] works best when at least twice as many frames as the display refresh rate are rendered. Behaves like [constant VSYNC_ENABLED] when using the Compatibility rendering method.
#desc Display handle:
#desc - Linux (X11): [code]X11::Display*[/code] for the display.
#desc - Android: [code]EGLDisplay[/code] for the display.
#desc Window handle:
#desc - Windows: [code]HWND[/code] for the window.
#desc - Linux (X11): [code]X11::Window*[/code] for the window.
#desc - macOS: [code]NSWindow*[/code] for the window.
#desc - iOS: [code]UIViewController*[/code] for the view controller.
#desc - Android: [code]jObject[/code] for the activity.
#desc Window view:
#desc - Windows: [code]HDC[/code] for the window (only with the GL Compatibility renderer).
#desc - macOS: [code]NSView*[/code] for the window main view.
#desc - iOS: [code]UIView*[/code] for the window main view.
#desc OpenGL context (only with the GL Compatibility renderer):
#desc - Windows: [code]HGLRC[/code] for the window.
#desc - Linux: [code]GLXContext*[/code] for the window.
#desc - MacOS: [code]NSOpenGLContext*[/code] for the window.
#desc - Android: [code]EGLContext[/code] for the window.
#desc Utterance has begun to be spoken.
#desc Utterance was successfully finished.
#desc Utterance was canceled, or TTS service was unable to process it.
#desc Utterance reached a word or sentence boundary.

#enum Feature
enum {
    FEATURE_GLOBAL_MENU = 0,
    FEATURE_SUBWINDOWS = 1,
    FEATURE_TOUCHSCREEN = 2,
    FEATURE_MOUSE = 3,
    FEATURE_MOUSE_WARP = 4,
    FEATURE_CLIPBOARD = 5,
    FEATURE_VIRTUAL_KEYBOARD = 6,
    FEATURE_CURSOR_SHAPE = 7,
    FEATURE_CUSTOM_CURSOR_SHAPE = 8,
    FEATURE_NATIVE_DIALOG = 9,
    FEATURE_IME = 10,
    FEATURE_WINDOW_TRANSPARENCY = 11,
    FEATURE_HIDPI = 12,
    FEATURE_ICON = 13,
    FEATURE_NATIVE_ICON = 14,
    FEATURE_ORIENTATION = 15,
    FEATURE_SWAP_BUFFERS = 16,
    FEATURE_CLIPBOARD_PRIMARY = 18,
    FEATURE_TEXT_TO_SPEECH = 19,
    FEATURE_EXTEND_TO_TITLE = 20,
}
#enum MouseMode
enum {
    MOUSE_MODE_VISIBLE = 0,
    MOUSE_MODE_HIDDEN = 1,
    MOUSE_MODE_CAPTURED = 2,
    MOUSE_MODE_CONFINED = 3,
    MOUSE_MODE_CONFINED_HIDDEN = 4,
}
#enum ScreenOrientation
enum {
    SCREEN_LANDSCAPE = 0,
    SCREEN_PORTRAIT = 1,
    SCREEN_REVERSE_LANDSCAPE = 2,
    SCREEN_REVERSE_PORTRAIT = 3,
    SCREEN_SENSOR_LANDSCAPE = 4,
    SCREEN_SENSOR_PORTRAIT = 5,
    SCREEN_SENSOR = 6,
}
#enum VirtualKeyboardType
enum {
    KEYBOARD_TYPE_DEFAULT = 0,
    KEYBOARD_TYPE_MULTILINE = 1,
    KEYBOARD_TYPE_NUMBER = 2,
    KEYBOARD_TYPE_NUMBER_DECIMAL = 3,
    KEYBOARD_TYPE_PHONE = 4,
    KEYBOARD_TYPE_EMAIL_ADDRESS = 5,
    KEYBOARD_TYPE_PASSWORD = 6,
    KEYBOARD_TYPE_URL = 7,
}
#enum CursorShape
enum {
    CURSOR_ARROW = 0,
    CURSOR_IBEAM = 1,
    CURSOR_POINTING_HAND = 2,
    CURSOR_CROSS = 3,
    CURSOR_WAIT = 4,
    CURSOR_BUSY = 5,
    CURSOR_DRAG = 6,
    CURSOR_CAN_DROP = 7,
    CURSOR_FORBIDDEN = 8,
    CURSOR_VSIZE = 9,
    CURSOR_HSIZE = 10,
    CURSOR_BDIAGSIZE = 11,
    CURSOR_FDIAGSIZE = 12,
    CURSOR_MOVE = 13,
    CURSOR_VSPLIT = 14,
    CURSOR_HSPLIT = 15,
    CURSOR_HELP = 16,
    CURSOR_MAX = 17,
}
#enum WindowMode
enum {
    WINDOW_MODE_WINDOWED = 0,
    WINDOW_MODE_MINIMIZED = 1,
    WINDOW_MODE_MAXIMIZED = 2,
    WINDOW_MODE_FULLSCREEN = 3,
    WINDOW_MODE_EXCLUSIVE_FULLSCREEN = 4,
}
#enum WindowFlags
enum {
    WINDOW_FLAG_RESIZE_DISABLED = 0,
    WINDOW_FLAG_BORDERLESS = 1,
    WINDOW_FLAG_ALWAYS_ON_TOP = 2,
    WINDOW_FLAG_TRANSPARENT = 3,
    WINDOW_FLAG_NO_FOCUS = 4,
    WINDOW_FLAG_POPUP = 5,
    WINDOW_FLAG_EXTEND_TO_TITLE = 6,
    WINDOW_FLAG_MOUSE_PASSTHROUGH = 7,
    WINDOW_FLAG_MAX = 8,
}
#enum WindowEvent
enum {
    WINDOW_EVENT_MOUSE_ENTER = 0,
    WINDOW_EVENT_MOUSE_EXIT = 1,
    WINDOW_EVENT_FOCUS_IN = 2,
    WINDOW_EVENT_FOCUS_OUT = 3,
    WINDOW_EVENT_CLOSE_REQUEST = 4,
    WINDOW_EVENT_GO_BACK_REQUEST = 5,
    WINDOW_EVENT_DPI_CHANGE = 6,
    WINDOW_EVENT_TITLEBAR_CHANGE = 7,
}
#enum VSyncMode
enum {
    VSYNC_DISABLED = 0,
    VSYNC_ENABLED = 1,
    VSYNC_ADAPTIVE = 2,
    VSYNC_MAILBOX = 3,
}
#enum HandleType
enum {
    DISPLAY_HANDLE = 0,
    WINDOW_HANDLE = 1,
    WINDOW_VIEW = 2,
    OPENGL_CONTEXT = 3,
}
#enum TTSUtteranceEvent
enum {
    TTS_UTTERANCE_STARTED = 0,
    TTS_UTTERANCE_ENDED = 1,
    TTS_UTTERANCE_CANCELED = 2,
    TTS_UTTERANCE_BOUNDARY = 3,
}


#desc Returns the user's clipboard as a string if possible.
func clipboard_get() -> String:
	pass;

#desc Returns the user's [url=https://unix.stackexchange.com/questions/139191/whats-the-difference-between-primary-selection-and-clipboard-buffer]primary[/url] clipboard as a string if possible. This is the clipboard that is set when the user selects text in any application, rather than when pressing [kbd]Ctrl + C[/kbd]. The clipboard data can then be pasted by clicking the middle mouse button in any application that supports the primary clipboard mechanism.
#desc [b]Note:[/b] This method is only implemented on Linux (X11).
func clipboard_get_primary() -> String:
	pass;

#desc Returns [code]true[/code] if there is content on the user's clipboard.
func clipboard_has() -> bool:
	pass;

#desc Sets the user's clipboard content to the given string.
func clipboard_set(clipboard: String) -> void:
	pass;

#desc Sets the user's [url=https://unix.stackexchange.com/questions/139191/whats-the-difference-between-primary-selection-and-clipboard-buffer]primary[/url] clipboard content to the given string. This is the clipboard that is set when the user selects text in any application, rather than when pressing [kbd]Ctrl + C[/kbd]. The clipboard data can then be pasted by clicking the middle mouse button in any application that supports the primary clipboard mechanism.
#desc [b]Note:[/b] This method is only implemented on Linux (X11).
func clipboard_set_primary(clipboard_primary: String) -> void:
	pass;

#desc Returns the default mouse cursor shape set by [method cursor_set_shape].
func cursor_get_shape() -> int:
	pass;

#desc Sets a custom mouse cursor image for the defined [param shape]. This means the user's operating system and mouse cursor theme will no longer influence the mouse cursor's appearance. The image must be [code]256x256[/code] or smaller for correct appearance. [param hotspot] can optionally be set to define the area where the cursor will click. By default, [param hotspot] is set to [code]Vector2(0, 0)[/code], which is the top-left corner of the image. See also [method cursor_set_shape].
func cursor_set_custom_image(cursor: Resource, shape: int = 0, hotspot: Vector2 = Vector2(0, 0)) -> void:
	pass;

#desc Sets the default mouse cursor shape. The cursor's appearance will vary depending on the user's operating system and mouse cursor theme. See also [method cursor_get_shape] and [method cursor_set_custom_image].
func cursor_set_shape(shape: int) -> void:
	pass;

#desc Shows a text input dialog which uses the operating system's native look-and-feel. [param callback] will be called with a [String] argument equal to the text field's contents when the dialog is closed for any reason.
#desc [b]Note:[/b] This method is implemented on macOS.
func dialog_input_text(title: String, description: String, existing_text: String, callback: Callable) -> int:
	pass;

#desc Shows a text dialog which uses the operating system's native look-and-feel. [param callback] will be called when the dialog is closed for any reason.
#desc [b]Note:[/b] This method is implemented on macOS.
func dialog_show(title: String, description: String, buttons: PackedStringArray, callback: Callable) -> int:
	pass;

#desc Allows the [param process_id] PID to steal focus from this window. In other words, this disables the operating system's focus stealing protection for the specified PID.
#desc [b]Note:[/b] This method is implemented on Windows.
func enable_for_stealing_focus(process_id: int) -> void:
	pass;

#desc Forces window manager processing while ignoring all [InputEvent]s. See also [method process_events].
#desc [b]Note:[/b] This method is implemented on Windows and macOS.
func force_process_and_drop_events() -> void:
	pass;

#desc Returns OS theme accent color. Returns [code]Color(0, 0, 0, 0)[/code], if accent color is unknown.
#desc [b]Note:[/b] This method is implemented on macOS and Windows.
func get_accent_color() -> Color:
	pass;

#desc Returns an [Array] of [Rect2], each of which is the bounding rectangle for a display cutout or notch. These are non-functional areas on edge-to-edge screens used by cameras and sensors. Returns an empty array if the device does not have cutouts. See also [method get_display_safe_area].
#desc [b]Note:[/b] Currently only implemented on Android. Other platforms will return an empty array even if they do have display cutouts or notches.
func get_display_cutouts() -> Array[Rect2]:
	pass;

#desc Returns the unobscured area of the display where interactive controls should be rendered. See also [method get_display_cutouts].
func get_display_safe_area() -> Rect2i:
	pass;

#desc Returns the name of the [DisplayServer] currently in use. Most operating systems only have a single [DisplayServer], but Linux has access to more than one [DisplayServer] (although only X11 is currently implemented in Godot).
#desc The names of built-in display servers are [code]Windows[/code], [code]macOS[/code], [code]X11[/code] (Linux), [code]Android[/code], [code]iOS[/code], [code]web[/code] (HTML5) and [code]headless[/code] (when started with the [code]--headless[/code] [url=$DOCS_URL/tutorials/editor/command_line_tutorial.html]command line argument[/url]).
func get_name() -> String:
	pass;

#desc Returns index of the primary screen.
func get_primary_screen() -> int:
	pass;

#desc Returns the number of displays available.
func get_screen_count() -> int:
	pass;

#desc Returns index of the screen which contains specified rectangle.
func get_screen_from_rect(rect: Rect2) -> int:
	pass;

#desc Returns [code]true[/code] if positions of [b]OK[/b] and [b]Cancel[/b] buttons are swapped in dialogs. This is enabled by default on Windows and UWP to follow interface conventions, and be toggled by changing [member ProjectSettings.gui/common/swap_cancel_ok].
#desc [b]Note:[/b] This doesn't affect native dialogs such as the ones spawned by [method DisplayServer.dialog_show].
func get_swap_cancel_ok() -> bool:
	pass;

#desc Returns the ID of the window at the specified screen [param position] (in pixels). On multi-monitor setups, the screen position is relative to the virtual desktop area. On multi-monitor setups with different screen resolutions or orientations, the origin may be located outside any display like this:
#desc [codeblock]
#desc * (0, 0)        +-------+
#desc |       |
#desc +-------------+ |       |
#desc |             | |       |
#desc |             | |       |
#desc +-------------+ +-------+
#desc [/codeblock]
func get_window_at_screen_position(position: Vector2i) -> int:
	pass;

#desc Returns the list of Godot window IDs belonging to this process.
#desc [b]Note:[/b] Native dialogs are not included in this list.
func get_window_list() -> PackedInt32Array:
	pass;

#desc Adds a new checkable item with text [param label] to the global menu with ID [param menu_root].
#desc Returns index of the inserted item, it's not guaranteed to be the same as [param index] value.
#desc An [param accelerator] can optionally be defined, which is a keyboard shortcut that can be pressed to trigger the menu button even if it's not currently open. The [param accelerator] is generally a combination of [enum KeyModifierMask]s and [enum Key]s using bitwise OR such as [code]KEY_MASK_CTRL | KEY_A[/code] ([kbd]Ctrl + A[/kbd]).
#desc [b]Note:[/b] The [param callback] and [param key_callback] Callables need to accept exactly one Variant parameter, the parameter passed to the Callables will be the value passed to [param tag].
#desc [b]Note:[/b] This method is implemented on macOS.
#desc [b]Supported system menu IDs:[/b]
#desc [codeblock]
#desc "_main" - Main menu (macOS).
#desc "_dock" - Dock popup menu (macOS).
#desc [/codeblock]
func global_menu_add_check_item(menu_root: String, label: String, callback: Callable, key_callback: Callable, tag: Variant = null, accelerator: int = 0, index: int = -1) -> int:
	pass;

#desc Adds a new checkable item with text [param label] and icon [param icon] to the global menu with ID [param menu_root].
#desc Returns index of the inserted item, it's not guaranteed to be the same as [param index] value.
#desc An [param accelerator] can optionally be defined, which is a keyboard shortcut that can be pressed to trigger the menu button even if it's not currently open. The [param accelerator] is generally a combination of [enum KeyModifierMask]s and [enum Key]s using bitwise OR such as [code]KEY_MASK_CTRL | KEY_A[/code] ([kbd]Ctrl + A[/kbd]).
#desc [b]Note:[/b] The [param callback] and [param key_callback] Callables need to accept exactly one Variant parameter, the parameter passed to the Callables will be the value passed to [param tag].
#desc [b]Note:[/b] This method is implemented on macOS.
#desc [b]Supported system menu IDs:[/b]
#desc [codeblock]
#desc "_main" - Main menu (macOS).
#desc "_dock" - Dock popup menu (macOS).
#desc [/codeblock]
func global_menu_add_icon_check_item(menu_root: String, icon: Texture2D, label: String, callback: Callable, key_callback: Callable, tag: Variant = null, accelerator: int = 0, index: int = -1) -> int:
	pass;

#desc Adds a new item with text [param label] and icon [param icon] to the global menu with ID [param menu_root].
#desc Returns index of the inserted item, it's not guaranteed to be the same as [param index] value.
#desc An [param accelerator] can optionally be defined, which is a keyboard shortcut that can be pressed to trigger the menu button even if it's not currently open. The [param accelerator] is generally a combination of [enum KeyModifierMask]s and [enum Key]s using bitwise OR such as [code]KEY_MASK_CTRL | KEY_A[/code] ([kbd]Ctrl + A[/kbd]).
#desc [b]Note:[/b] The [param callback] and [param key_callback] Callables need to accept exactly one Variant parameter, the parameter passed to the Callables will be the value passed to [param tag].
#desc [b]Note:[/b] This method is implemented on macOS.
#desc [b]Supported system menu IDs:[/b]
#desc [codeblock]
#desc "_main" - Main menu (macOS).
#desc "_dock" - Dock popup menu (macOS).
#desc [/codeblock]
func global_menu_add_icon_item(menu_root: String, icon: Texture2D, label: String, callback: Callable, key_callback: Callable, tag: Variant = null, accelerator: int = 0, index: int = -1) -> int:
	pass;

#desc Adds a new radio-checkable item with text [param label] and icon [param icon] to the global menu with ID [param menu_root].
#desc Returns index of the inserted item, it's not guaranteed to be the same as [param index] value.
#desc An [param accelerator] can optionally be defined, which is a keyboard shortcut that can be pressed to trigger the menu button even if it's not currently open. The [param accelerator] is generally a combination of [enum KeyModifierMask]s and [enum Key]s using bitwise OR such as [code]KEY_MASK_CTRL | KEY_A[/code] ([kbd]Ctrl + A[/kbd]).
#desc [b]Note:[/b] Radio-checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually. See [method global_menu_set_item_checked] for more info on how to control it.
#desc [b]Note:[/b] The [param callback] and [param key_callback] Callables need to accept exactly one Variant parameter, the parameter passed to the Callables will be the value passed to [param tag].
#desc [b]Note:[/b] This method is implemented on macOS.
#desc [b]Supported system menu IDs:[/b]
#desc [codeblock]
#desc "_main" - Main menu (macOS).
#desc "_dock" - Dock popup menu (macOS).
#desc [/codeblock]
func global_menu_add_icon_radio_check_item(menu_root: String, icon: Texture2D, label: String, callback: Callable, key_callback: Callable, tag: Variant = null, accelerator: int = 0, index: int = -1) -> int:
	pass;

#desc Adds a new item with text [param label] to the global menu with ID [param menu_root].
#desc Returns index of the inserted item, it's not guaranteed to be the same as [param index] value.
#desc An [param accelerator] can optionally be defined, which is a keyboard shortcut that can be pressed to trigger the menu button even if it's not currently open. The [param accelerator] is generally a combination of [enum KeyModifierMask]s and [enum Key]s using bitwise OR such as [code]KEY_MASK_CTRL | KEY_A[/code] ([kbd]Ctrl + A[/kbd]).
#desc [b]Note:[/b] The [param callback] and [param key_callback] Callables need to accept exactly one Variant parameter, the parameter passed to the Callables will be the value passed to [param tag].
#desc [b]Note:[/b] This method is implemented on macOS.
#desc [b]Supported system menu IDs:[/b]
#desc [codeblock]
#desc "_main" - Main menu (macOS).
#desc "_dock" - Dock popup menu (macOS).
#desc [/codeblock]
func global_menu_add_item(menu_root: String, label: String, callback: Callable, key_callback: Callable, tag: Variant = null, accelerator: int = 0, index: int = -1) -> int:
	pass;

#desc Adds a new item with text [param label] to the global menu with ID [param menu_root].
#desc Contrarily to normal binary items, multistate items can have more than two states, as defined by [param max_states]. Each press or activate of the item will increase the state by one. The default value is defined by [param default_state].
#desc Returns index of the inserted item, it's not guaranteed to be the same as [param index] value.
#desc An [param accelerator] can optionally be defined, which is a keyboard shortcut that can be pressed to trigger the menu button even if it's not currently open. The [param accelerator] is generally a combination of [enum KeyModifierMask]s and [enum Key]s using bitwise OR such as [code]KEY_MASK_CTRL | KEY_A[/code] ([kbd]Ctrl + A[/kbd]).
#desc [b]Note:[/b] By default, there's no indication of the current item state, it should be changed manually.
#desc [b]Note:[/b] The [param callback] and [param key_callback] Callables need to accept exactly one Variant parameter, the parameter passed to the Callables will be the value passed to [param tag].
#desc [b]Note:[/b] This method is implemented on macOS.
#desc [b]Supported system menu IDs:[/b]
#desc [codeblock]
#desc "_main" - Main menu (macOS).
#desc "_dock" - Dock popup menu (macOS).
#desc [/codeblock]
func global_menu_add_multistate_item(menu_root: String, label: String, max_states: int, default_state: int, callback: Callable, key_callback: Callable, tag: Variant = null, accelerator: int = 0, index: int = -1) -> int:
	pass;

#desc Adds a new radio-checkable item with text [param label] to the global menu with ID [param menu_root].
#desc Returns index of the inserted item, it's not guaranteed to be the same as [param index] value.
#desc An [param accelerator] can optionally be defined, which is a keyboard shortcut that can be pressed to trigger the menu button even if it's not currently open. The [param accelerator] is generally a combination of [enum KeyModifierMask]s and [enum Key]s using bitwise OR such as [code]KEY_MASK_CTRL | KEY_A[/code] ([kbd]Ctrl + A[/kbd]).
#desc [b]Note:[/b] Radio-checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually. See [method global_menu_set_item_checked] for more info on how to control it.
#desc [b]Note:[/b] The [param callback] and [param key_callback] Callables need to accept exactly one Variant parameter, the parameter passed to the Callables will be the value passed to [param tag].
#desc [b]Note:[/b] This method is implemented on macOS.
#desc [b]Supported system menu IDs:[/b]
#desc [codeblock]
#desc "_main" - Main menu (macOS).
#desc "_dock" - Dock popup menu (macOS).
#desc [/codeblock]
func global_menu_add_radio_check_item(menu_root: String, label: String, callback: Callable, key_callback: Callable, tag: Variant = null, accelerator: int = 0, index: int = -1) -> int:
	pass;

#desc Adds a separator between items to the global menu with ID [param menu_root]. Separators also occupy an index.
#desc Returns index of the inserted item, it's not guaranteed to be the same as [param index] value.
#desc [b]Note:[/b] This method is implemented on macOS.
#desc [b]Supported system menu IDs:[/b]
#desc [codeblock]
#desc "_main" - Main menu (macOS).
#desc "_dock" - Dock popup menu (macOS).
#desc [/codeblock]
func global_menu_add_separator(menu_root: String, index: int = -1) -> int:
	pass;

#desc Adds an item that will act as a submenu of the global menu [param menu_root]. The [param submenu] argument is the ID of the global menu root that will be shown when the item is clicked.
#desc Returns index of the inserted item, it's not guaranteed to be the same as [param index] value.
#desc [b]Note:[/b] This method is implemented on macOS.
#desc [b]Supported system menu IDs:[/b]
#desc [codeblock]
#desc "_main" - Main menu (macOS).
#desc "_dock" - Dock popup menu (macOS).
#desc [/codeblock]
func global_menu_add_submenu_item(menu_root: String, label: String, submenu: String, index: int = -1) -> int:
	pass;

#desc Removes all items from the global menu with ID [param menu_root].
#desc [b]Note:[/b] This method is implemented on macOS.
#desc [b]Supported system menu IDs:[/b]
#desc [codeblock]
#desc "_main" - Main menu (macOS).
#desc "_dock" - Dock popup menu (macOS).
#desc [/codeblock]
func global_menu_clear(menu_root: String) -> void:
	pass;

#desc Returns the accelerator of the item at index [param idx]. Accelerators are special combinations of keys that activate the item, no matter which control is focused.
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_get_item_accelerator(menu_root: String, idx: int) -> int:
	pass;

#desc Returns the callback of the item at index [param idx].
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_get_item_callback(menu_root: String, idx: int) -> Callable:
	pass;

#desc Returns number of items in the global menu with ID [param menu_root].
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_get_item_count(menu_root: String) -> int:
	pass;

#desc Returns the icon of the item at index [param idx].
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_get_item_icon(menu_root: String, idx: int) -> Texture2D:
	pass;

#desc Returns the horizontal offset of the item at the given [param idx].
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_get_item_indentation_level(menu_root: String, idx: int) -> int:
	pass;

#desc Returns the index of the item with the specified [param tag]. Index is automatically assigned to each item by the engine. Index can not be set manually.
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_get_item_index_from_tag(menu_root: String, tag: Variant) -> int:
	pass;

#desc Returns the index of the item with the specified [param text]. Index is automatically assigned to each item by the engine. Index can not be set manually.
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_get_item_index_from_text(menu_root: String, text: String) -> int:
	pass;

#desc Returns the callback of the item accelerator at index [param idx].
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_get_item_key_callback(menu_root: String, idx: int) -> Callable:
	pass;

#desc Returns number of states of a multistate item. See [method global_menu_add_multistate_item] for details.
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_get_item_max_states(menu_root: String, idx: int) -> int:
	pass;

#desc Returns the state of a multistate item. See [method global_menu_add_multistate_item] for details.
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_get_item_state(menu_root: String, idx: int) -> int:
	pass;

#desc Returns the submenu ID of the item at index [param idx]. See [method global_menu_add_submenu_item] for more info on how to add a submenu.
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_get_item_submenu(menu_root: String, idx: int) -> String:
	pass;

#desc Returns the metadata of the specified item, which might be of any type. You can set it with [method global_menu_set_item_tag], which provides a simple way of assigning context data to items.
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_get_item_tag(menu_root: String, idx: int) -> Variant:
	pass;

#desc Returns the text of the item at index [param idx].
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_get_item_text(menu_root: String, idx: int) -> String:
	pass;

#desc Returns the tooltip associated with the specified index [param idx].
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_get_item_tooltip(menu_root: String, idx: int) -> String:
	pass;

#desc Returns [code]true[/code] if the item at index [param idx] is checkable in some way, i.e. if it has a checkbox or radio button.
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_is_item_checkable(menu_root: String, idx: int) -> bool:
	pass;

#desc Returns [code]true[/code] if the item at index [param idx] is checked.
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_is_item_checked(menu_root: String, idx: int) -> bool:
	pass;

#desc Returns [code]true[/code] if the item at index [param idx] is disabled. When it is disabled it can't be selected, or its action invoked.
#desc See [method global_menu_set_item_disabled] for more info on how to disable an item.
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_is_item_disabled(menu_root: String, idx: int) -> bool:
	pass;

#desc Returns [code]true[/code] if the item at index [param idx] has radio button-style checkability.
#desc [b]Note:[/b] This is purely cosmetic; you must add the logic for checking/unchecking items in radio groups.
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_is_item_radio_checkable(menu_root: String, idx: int) -> bool:
	pass;

#desc Removes the item at index [param idx] from the global menu [param menu_root].
#desc [b]Note:[/b] The indices of items after the removed item will be shifted by one.
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_remove_item(menu_root: String, idx: int) -> void:
	pass;

#desc Sets the accelerator of the item at index [param idx]. [param keycode] can be a single [enum Key], or a combination of [enum KeyModifierMask]s and [enum Key]s using bitwise OR such as [code]KEY_MASK_CTRL | KEY_A[/code] ([kbd]Ctrl + A[/kbd]).
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_set_item_accelerator(menu_root: String, idx: int, keycode: int) -> void:
	pass;

#desc Sets the callback of the item at index [param idx]. Callback is emitted when an item is pressed.
#desc [b]Note:[/b] The [param callback] Callable needs to accept exactly one Variant parameter, the parameter passed to the Callable will be the value passed to the [code]tag[/code] parameter when the menu item was created.
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_set_item_callback(menu_root: String, idx: int, callback: Callable) -> void:
	pass;

#desc Sets whether the item at index [param idx] has a checkbox. If [code]false[/code], sets the type of the item to plain text.
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_set_item_checkable(menu_root: String, idx: int, checkable: bool) -> void:
	pass;

#desc Sets the checkstate status of the item at index [param idx].
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_set_item_checked(menu_root: String, idx: int, checked: bool) -> void:
	pass;

#desc Enables/disables the item at index [param idx]. When it is disabled, it can't be selected and its action can't be invoked.
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_set_item_disabled(menu_root: String, idx: int, disabled: bool) -> void:
	pass;

#desc Replaces the [Texture2D] icon of the specified [param idx].
#desc [b]Note:[/b] This method is implemented on macOS.
#desc [b]Note:[/b] This method is not supported by macOS "_dock" menu items.
func global_menu_set_item_icon(menu_root: String, idx: int, icon: Texture2D) -> void:
	pass;

#desc Sets the horizontal offset of the item at the given [param idx].
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_set_item_indentation_level(menu_root: String, idx: int, level: int) -> void:
	pass;

#desc Sets the callback of the item at index [param idx]. Callback is emitted when its accelerator is activated.
#desc [b]Note:[/b] The [param key_callback] Callable needs to accept exactly one Variant parameter, the parameter passed to the Callable will be the value passed to the [code]tag[/code] parameter when the menu item was created.
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_set_item_key_callback(menu_root: String, idx: int, key_callback: Callable) -> void:
	pass;

#desc Sets number of state of a multistate item. See [method global_menu_add_multistate_item] for details.
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_set_item_max_states(menu_root: String, idx: int, max_states: int) -> void:
	pass;

#desc Sets the type of the item at the specified index [param idx] to radio button. If [code]false[/code], sets the type of the item to plain text.
#desc [b]Note:[/b] This is purely cosmetic; you must add the logic for checking/unchecking items in radio groups.
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_set_item_radio_checkable(menu_root: String, idx: int, checkable: bool) -> void:
	pass;

#desc Sets the state of a multistate item. See [method global_menu_add_multistate_item] for details.
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_set_item_state(menu_root: String, idx: int, state: int) -> void:
	pass;

#desc Sets the submenu of the item at index [param idx]. The submenu is the ID of a global menu root that would be shown when the item is clicked.
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_set_item_submenu(menu_root: String, idx: int, submenu: String) -> void:
	pass;

#desc Sets the metadata of an item, which may be of any type. You can later get it with [method global_menu_get_item_tag], which provides a simple way of assigning context data to items.
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_set_item_tag(menu_root: String, idx: int, tag: Variant) -> void:
	pass;

#desc Sets the text of the item at index [param idx].
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_set_item_text(menu_root: String, idx: int, text: String) -> void:
	pass;

#desc Sets the [String] tooltip of the item at the specified index [param idx].
#desc [b]Note:[/b] This method is implemented on macOS.
func global_menu_set_item_tooltip(menu_root: String, idx: int, tooltip: String) -> void:
	pass;

#desc Returns [code]true[/code] if the specified [param feature] is supported by the current [DisplayServer], [code]false[/code] otherwise.
func has_feature(feature: int) -> bool:
	pass;

#desc Returns the text selection in the [url=https://en.wikipedia.org/wiki/Input_method]Input Method Editor[/url] composition string, with the [Vector2i]'s [code]x[/code] component being the caret position and [code]y[/code] being the length of the selection.
#desc [b]Note:[/b] This method is implemented on macOS.
func ime_get_selection() -> Vector2i:
	pass;

#desc Returns the composition string contained within the [url=https://en.wikipedia.org/wiki/Input_method]Input Method Editor[/url] window.
#desc [b]Note:[/b] This method is implemented on macOS.
func ime_get_text() -> String:
	pass;

#desc Returns [code]true[/code] if OS is using dark mode.
#desc [b]Note:[/b] This method is implemented on macOS, Windows and Linux (X11).
func is_dark_mode() -> bool:
	pass;

#desc Returns [code]true[/code] if OS supports dark mode.
#desc [b]Note:[/b] This method is implemented on macOS, Windows and Linux (X11).
func is_dark_mode_supported() -> bool:
	pass;

#desc Returns [code]true[/code] if touch events are available (Android or iOS), the capability is detected on the Webplatform or if [member ProjectSettings.input_devices/pointing/emulate_touch_from_mouse] is [code]true[/code].
func is_touchscreen_available() -> bool:
	pass;

#desc Returns active keyboard layout index.
#desc [b]Note:[/b] This method is implemented on Linux (X11), macOS and Windows.
func keyboard_get_current_layout() -> int:
	pass;

#desc Converts a physical (US QWERTY) [param keycode] to one in the active keyboard layout.
#desc [b]Note:[/b] This method is implemented on Linux (X11), macOS and Windows.
func keyboard_get_keycode_from_physical(keycode: int) -> int:
	pass;

#desc Returns the number of keyboard layouts.
#desc [b]Note:[/b] This method is implemented on Linux (X11), macOS and Windows.
func keyboard_get_layout_count() -> int:
	pass;

#desc Returns the ISO-639/BCP-47 language code of the keyboard layout at position [param index].
#desc [b]Note:[/b] This method is implemented on Linux (X11), macOS and Windows.
func keyboard_get_layout_language(index: int) -> String:
	pass;

#desc Returns the localized name of the keyboard layout at position [param index].
#desc [b]Note:[/b] This method is implemented on Linux (X11), macOS and Windows.
func keyboard_get_layout_name(index: int) -> String:
	pass;

#desc Sets the active keyboard layout.
#desc [b]Note:[/b] This method is implemented on Linux (X11), macOS and Windows.
func keyboard_set_current_layout(index: int) -> void:
	pass;

#desc Returns the current state of mouse buttons (whether each button is pressed) as a bitmask. If multiple mouse buttons are pressed at the same time, the bits are added together. Equivalent to [method Input.get_mouse_button_mask].
func mouse_get_button_state() -> int:
	pass;

#desc Returns the current mouse mode. See also [method mouse_set_mode].
func mouse_get_mode() -> int:
	pass;

#desc Returns the mouse cursor's current position in screen coordinates.
func mouse_get_position() -> Vector2i:
	pass;

#desc Sets the current mouse mode. See also [method mouse_get_mode].
func mouse_set_mode(mouse_mode: int) -> void:
	pass;

#desc Perform window manager processing, including input flushing. See also [method force_process_and_drop_events], [method Input.flush_buffered_events] and [member Input.use_accumulated_input].
func process_events() -> void:
	pass;

#desc Returns the dots per inch density of the specified screen. If [param screen] is [constant SCREEN_OF_MAIN_WINDOW] (the default value), a screen with the main window will be used.
#desc [b]Note:[/b] On macOS, returned value is inaccurate if fractional display scaling mode is used.
#desc [b]Note:[/b] On Android devices, the actual screen densities are grouped into six generalized densities:
#desc [codeblock]
#desc ldpi - 120 dpi
#desc mdpi - 160 dpi
#desc hdpi - 240 dpi
#desc xhdpi - 320 dpi
#desc xxhdpi - 480 dpi
#desc xxxhdpi - 640 dpi
#desc [/codeblock]
#desc [b]Note:[/b] This method is implemented on Android, Linux (X11), macOS and Windows. Returns [code]72[/code] on unsupported platforms.
func screen_get_dpi(screen: int = -1) -> int:
	pass;

#desc Returns the greatest scale factor of all screens.
#desc [b]Note:[/b] On macOS returned value is [code]2.0[/code] if there is at least one hiDPI (Retina) screen in the system, and [code]1.0[/code] in all other cases.
#desc [b]Note:[/b] This method is implemented on macOS.
func screen_get_max_scale() -> float:
	pass;

#desc Returns the [param screen]'s current orientation. See also [method screen_set_orientation].
#desc [b]Note:[/b] This method is implemented on Android and iOS.
func screen_get_orientation(screen: int = -1) -> int:
	pass;

#desc Returns the screen's top-left corner position in pixels. On multi-monitor setups, the screen position is relative to the virtual desktop area. On multi-monitor setups with different screen resolutions or orientations, the origin may be located outside any display like this:
#desc [codeblock]
#desc * (0, 0)        +-------+
#desc |       |
#desc +-------------+ |       |
#desc |             | |       |
#desc |             | |       |
#desc +-------------+ +-------+
#desc [/codeblock]
#desc See also [method screen_get_size].
func screen_get_position(screen: int = -1) -> Vector2i:
	pass;

#desc Returns the current refresh rate of the specified screen. If [param screen] is [constant SCREEN_OF_MAIN_WINDOW] (the default value), a screen with the main window will be used.
#desc [b]Note:[/b] Returns [code]-1.0[/code] if the DisplayServer fails to find the refresh rate for the specified screen. On Web, [method screen_get_refresh_rate] will always return [code]-1.0[/code] as there is no way to retrieve the refresh rate on that platform.
#desc To fallback to a default refresh rate if the method fails, try:
#desc [codeblock]
#desc var refresh_rate = DisplayServer.screen_get_refresh_rate()
#desc if refresh_rate < 0:
#desc refresh_rate = 60.0
#desc [/codeblock]
func screen_get_refresh_rate(screen: int = -1) -> float:
	pass;

#desc Returns the scale factor of the specified screen by index.
#desc [b]Note:[/b] On macOS returned value is [code]2.0[/code] for hiDPI (Retina) screen, and [code]1.0[/code] for all other cases.
#desc [b]Note:[/b] This method is implemented on macOS.
func screen_get_scale(screen: int = -1) -> float:
	pass;

#desc Returns the screen's size in pixels. See also [method screen_get_position] and [method screen_get_usable_rect].
func screen_get_size(screen: int = -1) -> Vector2i:
	pass;

#desc Returns the portion of the screen that is not obstructed by a status bar in pixels. See also [method screen_get_size].
func screen_get_usable_rect(screen: int = -1) -> Rect2i:
	pass;

#desc Returns [code]true[/code] if the screen should never be turned off by the operating system's power-saving measures. See also [method screen_set_keep_on].
func screen_is_kept_on() -> bool:
	pass;

#desc Sets whether the screen should never be turned off by the operating system's power-saving measures. See also [method screen_is_kept_on].
func screen_set_keep_on(enable: bool) -> void:
	pass;

#desc Sets the [param screen]'s [param orientation]. See also [method screen_get_orientation].
func screen_set_orientation(orientation: int, screen: int = -1) -> void:
	pass;

#desc Sets the window icon (usually displayed in the top-left corner) with an [Image]. To use icons in the operating system's native format, use [method set_native_icon] instead.
func set_icon(image: Image) -> void:
	pass;

#desc Sets the window icon (usually displayed in the top-left corner) in the operating system's [i]native[/i] format. The file at [param filename] must be in [code].ico[/code] format on Windows or [code].icns[/code] on macOS. By using specially crafted [code].ico[/code] or [code].icns[/code] icons, [method set_native_icon] allows specifying different icons depending on the size the icon is displayed at. This size is determined by the operating system and user preferences (including the display scale factor). To use icons in other formats, use [method set_icon] instead.
func set_native_icon(filename: String) -> void:
	pass;

#desc Returns current active tablet driver name.
#desc [b]Note:[/b] This method is implemented on Windows.
func tablet_get_current_driver() -> String:
	pass;

#desc Returns the total number of available tablet drivers.
#desc [b]Note:[/b] This method is implemented on Windows.
func tablet_get_driver_count() -> int:
	pass;

#desc Returns the tablet driver name for the given index.
#desc [b]Note:[/b] This method is implemented on Windows.
func tablet_get_driver_name(idx: int) -> String:
	pass;

#desc Set active tablet driver name.
#desc [b]Note:[/b] This method is implemented on Windows.
func tablet_set_current_driver(name: String) -> void:
	pass;

#desc Returns an [Array] of voice information dictionaries.
#desc Each [Dictionary] contains two [String] entries:
#desc - [code]name[/code] is voice name.
#desc - [code]id[/code] is voice identifier.
#desc - [code]language[/code] is language code in [code]lang_Variant[/code] format. [code]lang[/code] part is a 2 or 3-letter code based on the ISO-639 standard, in lowercase. And [code]Variant[/code] part is an engine dependent string describing country, region or/and dialect.
#desc Note that Godot depends on system libraries for text-to-speech functionality. These libraries are installed by default on Windows and MacOS, but not on all Linux distributions. If they are not present, this method will return an empty list. This applies to both Godot users on Linux, as well as end-users on Linux running Godot games that use text-to-speech.
#desc [b]Note:[/b] This method is implemented on Android, iOS, Web, Linux (X11), macOS, and Windows.
func tts_get_voices() -> Array[Dictionary]:
	pass;

#desc Returns an [PackedStringArray] of voice identifiers for the [param language].
#desc [b]Note:[/b] This method is implemented on Android, iOS, Web, Linux (X11), macOS, and Windows.
func tts_get_voices_for_language(language: String) -> PackedStringArray:
	pass;

#desc Returns [code]true[/code] if the synthesizer is in a paused state.
#desc [b]Note:[/b] This method is implemented on Android, iOS, Web, Linux (X11), macOS, and Windows.
func tts_is_paused() -> bool:
	pass;

#desc Returns [code]true[/code] if the synthesizer is generating speech, or have utterance waiting in the queue.
#desc [b]Note:[/b] This method is implemented on Android, iOS, Web, Linux (X11), macOS, and Windows.
func tts_is_speaking() -> bool:
	pass;

#desc Puts the synthesizer into a paused state.
#desc [b]Note:[/b] This method is implemented on Android, iOS, Web, Linux (X11), macOS, and Windows.
func tts_pause() -> void:
	pass;

#desc Resumes the synthesizer if it was paused.
#desc [b]Note:[/b] This method is implemented on Android, iOS, Web, Linux (X11), macOS, and Windows.
func tts_resume() -> void:
	pass;

#desc Adds a callback, which is called when the utterance has started, finished, canceled or reached a text boundary.
#desc - [constant TTS_UTTERANCE_STARTED], [constant TTS_UTTERANCE_ENDED], and [constant TTS_UTTERANCE_CANCELED] callable's method should take one [int] parameter, the utterance ID.
#desc - [constant TTS_UTTERANCE_BOUNDARY] callable's method should take two [int] parameters, the index of the character and the utterance ID.
#desc [b]Note:[/b] The granularity of the boundary callbacks is engine dependent.
#desc [b]Note:[/b] This method is implemented on Android, iOS, Web, Linux (X11), macOS, and Windows.
func tts_set_utterance_callback(event: int, callable: Callable) -> void:
	pass;

#desc Adds an utterance to the queue. If [param interrupt] is [code]true[/code], the queue is cleared first.
#desc - [param voice] identifier is one of the [code]"id"[/code] values returned by [method tts_get_voices] or one of the values returned by [method tts_get_voices_for_language].
#desc - [param volume] ranges from [code]0[/code] (lowest) to [code]100[/code] (highest).
#desc - [param pitch] ranges from [code]0.0[/code] (lowest) to [code]2.0[/code] (highest), [code]1.0[/code] is default pitch for the current voice.
#desc - [param rate] ranges from [code]0.1[/code] (lowest) to [code]10.0[/code] (highest), [code]1.0[/code] is a normal speaking rate. Other values act as a percentage relative.
#desc - [param utterance_id] is passed as a parameter to the callback functions.
#desc [b]Note:[/b] On Windows and Linux (X11), utterance [param text] can use SSML markup. SSML support is engine and voice dependent. If the engine does not support SSML, you should strip out all XML markup before calling [method tts_speak].
#desc [b]Note:[/b] The granularity of pitch, rate, and volume is engine and voice dependent. Values may be truncated.
#desc [b]Note:[/b] This method is implemented on Android, iOS, Web, Linux (X11), macOS, and Windows.
func tts_speak(text: String, voice: String, volume: int = 50, pitch: float = 1.0, rate: float = 1.0, utterance_id: int = 0, interrupt: bool = false) -> void:
	pass;

#desc Stops synthesis in progress and removes all utterances from the queue.
#desc [b]Note:[/b] This method is implemented on Android, iOS, Web, Linux (X11), macOS, and Windows.
func tts_stop() -> void:
	pass;

#desc Returns the on-screen keyboard's height in pixels. Returns 0 if there is no keyboard or if it is currently hidden.
func virtual_keyboard_get_height() -> int:
	pass;

#desc Hides the virtual keyboard if it is shown, does nothing otherwise.
func virtual_keyboard_hide() -> void:
	pass;

#desc Shows the virtual keyboard if the platform has one.
#desc [param existing_text] parameter is useful for implementing your own [LineEdit] or [TextEdit], as it tells the virtual keyboard what text has already been typed (the virtual keyboard uses it for auto-correct and predictions).
#desc [param position] parameter is the screen space [Rect2] of the edited text.
#desc [param type] parameter allows configuring which type of virtual keyboard to show.
#desc [param max_length] limits the number of characters that can be entered if different from [code]-1[/code].
#desc [param cursor_start] can optionally define the current text cursor position if [param cursor_end] is not set.
#desc [param cursor_start] and [param cursor_end] can optionally define the current text selection.
#desc [b]Note:[/b] This method is implemented on Android, iOS and Web.
func virtual_keyboard_show(existing_text: String, position: Rect2 = Rect2(0, 0, 0, 0), type: int = 0, max_length: int = -1, cursor_start: int = -1, cursor_end: int = -1) -> void:
	pass;

#desc Sets the mouse cursor position to the given [param position] relative to an origin at the upper left corner of the currently focused game Window Manager window.
#desc [b]Note:[/b] [method warp_mouse] is only supported on Windows, macOS and Linux. It has no effect on Android, iOS and Web.
func warp_mouse(position: Vector2i) -> void:
	pass;

#desc Returns [code]true[/code] if anything can be drawn in the window specified by [param window_id], [code]false[/code] otherwise. Using the [code]--disable-render-loop[/code] command line argument or a headless build will return [code]false[/code].
func window_can_draw(window_id: int = 0) -> bool:
	pass;

#desc Returns ID of the active popup window, or [constant INVALID_WINDOW_ID] if there is none.
func window_get_active_popup() -> int:
	pass;

#desc Returns the [method Object.get_instance_id] of the [Window] the [param window_id] is attached to. also [method window_get_attached_instance_id].
func window_get_attached_instance_id(window_id: int = 0) -> int:
	pass;

#desc Returns the screen the window specified by [param window_id] is currently positioned on. If the screen overlaps multiple displays, the screen where the window's center is located is returned. See also [method window_set_current_screen].
func window_get_current_screen(window_id: int = 0) -> int:
	pass;

#desc Returns the current value of the given window's [param flag].
func window_get_flag(flag: int, window_id: int = 0) -> bool:
	pass;

#desc Returns the window's maximum size (in pixels). See also [method window_set_max_size].
func window_get_max_size(window_id: int = 0) -> Vector2i:
	pass;

#desc Returns the window's minimum size (in pixels). See also [method window_set_min_size].
func window_get_min_size(window_id: int = 0) -> Vector2i:
	pass;

#desc Returns the mode of the given window.
func window_get_mode(window_id: int = 0) -> int:
	pass;

#desc Returns internal structure pointers for use in plugins.
#desc [b]Note:[/b] This method is implemented on Android, Linux (X11), macOS and Windows.
func window_get_native_handle(handle_type: int, window_id: int = 0) -> int:
	pass;

#desc Returns the bounding box of control, or menu item that was used to open the popup window, in the screen coordinate system.
func window_get_popup_safe_rect(window: int) -> Rect2i:
	pass;

#desc Returns the position of the client area of the given window on the screen.
func window_get_position(window_id: int = 0) -> Vector2i:
	pass;

#desc Returns the position of the given window on the screen including the borders drawn by the operating system. See also [method window_get_position].
func window_get_position_with_decorations(window_id: int = 0) -> Vector2i:
	pass;

#desc Returns left margins ([code]x[/code]), right margins ([code]y[/code]) and height ([code]z[/code]) of the title that are safe to use (contains no buttons or other elements) when [constant WINDOW_FLAG_EXTEND_TO_TITLE] flag is set.
func window_get_safe_title_margins(window_id: int = 0) -> Vector3i:
	pass;

#desc Returns the size of the window specified by [param window_id] (in pixels), excluding the borders drawn by the operating system. This is also called the "client area". See also [method window_get_size_with_decorations], [method window_set_size] and [method window_get_position].
func window_get_size(window_id: int = 0) -> Vector2i:
	pass;

#desc Returns the size of the window specified by [param window_id] (in pixels), including the borders drawn by the operating system. See also [method window_get_size].
func window_get_size_with_decorations(window_id: int = 0) -> Vector2i:
	pass;

#desc Returns the V-Sync mode of the given window.
func window_get_vsync_mode(window_id: int = 0) -> int:
	pass;

#desc Returns [code]true[/code] if the given window can be maximized (the maximize button is enabled).
func window_is_maximize_allowed(window_id: int = 0) -> bool:
	pass;

#desc Returns [code]true[/code], if double-click on a window title should maximize it.
#desc [b]Note:[/b] This method is implemented on macOS.
func window_maximize_on_title_dbl_click() -> bool:
	pass;

#desc Returns [code]true[/code], if double-click on a window title should minimize it.
#desc [b]Note:[/b] This method is implemented on macOS.
func window_minimize_on_title_dbl_click() -> bool:
	pass;

#desc Moves the window specified by [param window_id] to the foreground, so that it is visible over other windows.
func window_move_to_foreground(window_id: int = 0) -> void:
	pass;

#desc Makes the window specified by [param window_id] request attention, which is materialized by the window title and taskbar entry blinking until the window is focused. This usually has no visible effect if the window is currently focused. The exact behavior varies depending on the operating system.
func window_request_attention(window_id: int = 0) -> void:
	pass;

#desc Moves the window specified by [param window_id] to the specified [param screen]. See also [method window_get_current_screen].
func window_set_current_screen(screen: int, window_id: int = 0) -> void:
	pass;

#desc Sets the [param callback] that should be called when files are dropped from the operating system's file manager to the window specified by [param window_id].
#desc [b]Note:[/b] This method is implemented on Windows, macOS, Linux (X11) and Web.
func window_set_drop_files_callback(callback: Callable, window_id: int = 0) -> void:
	pass;

#desc If set to [code]true[/code], this window will always stay on top of its parent window, parent window will ignore input while this window is opened.
#desc [b]Note:[/b] On macOS, exclusive windows are confined to the same space (virtual desktop or screen) as the parent window.
#desc [b]Note:[/b] This method is implemented on macOS and Windows.
func window_set_exclusive(window_id: int, exclusive: bool) -> void:
	pass;

#desc Enables or disables the given window's given [param flag]. See [enum WindowFlags] for possible values and their behavior.
func window_set_flag(flag: int, enabled: bool, window_id: int = 0) -> void:
	pass;

#desc Sets whether [url=https://en.wikipedia.org/wiki/Input_method]Input Method Editor[/url] should be enabled for the window specified by [param window_id]. See also [method window_set_ime_position].
func window_set_ime_active(active: bool, window_id: int = 0) -> void:
	pass;

#desc Sets the position of the [url=https://en.wikipedia.org/wiki/Input_method]Input Method Editor[/url] popup for the specified [param window_id]. Only effective if [method window_set_ime_active] was set to [code]true[/code] for the specified [param window_id].
func window_set_ime_position(position: Vector2i, window_id: int = 0) -> void:
	pass;

#desc Sets the [param callback] that should be called when any [InputEvent] is sent to the window specified by [param window_id].
func window_set_input_event_callback(callback: Callable, window_id: int = 0) -> void:
	pass;

#desc Sets the [param callback] that should be called when text is entered using the virtual keyboard to the window specified by [param window_id].
func window_set_input_text_callback(callback: Callable, window_id: int = 0) -> void:
	pass;

#desc Sets the maximum size of the window specified by [param window_id] in pixels. Normally, the user will not be able to drag the window to make it smaller than the specified size. See also [method window_get_max_size].
#desc [b]Note:[/b] It's recommended to change this value using [member Window.max_size] instead.
#desc [b]Note:[/b] Using third-party tools, it is possible for users to disable window geometry restrictions and therefore bypass this limit.
func window_set_max_size(max_size: Vector2i, window_id: int = 0) -> void:
	pass;

#desc Sets the minimum size for the given window to [param min_size] (in pixels). Normally, the user will not be able to drag the window to make it larger than the specified size. See also [method window_get_min_size].
#desc [b]Note:[/b] It's recommended to change this value using [member Window.min_size] instead.
#desc [b]Note:[/b] By default, the main window has a minimum size of [code]Vector2i(64, 64)[/code]. This prevents issues that can arise when the window is resized to a near-zero size.
#desc [b]Note:[/b] Using third-party tools, it is possible for users to disable window geometry restrictions and therefore bypass this limit.
func window_set_min_size(min_size: Vector2i, window_id: int = 0) -> void:
	pass;

#desc Sets window mode for the given window to [param mode]. See [enum WindowMode] for possible values and how each mode behaves.
#desc [b]Note:[/b] Setting the window to full screen forcibly sets the borderless flag to [code]true[/code], so make sure to set it back to [code]false[/code] when not wanted.
func window_set_mode(mode: int, window_id: int = 0) -> void:
	pass;

#desc Sets a polygonal region of the window which accepts mouse events. Mouse events outside the region will be passed through.
#desc Passing an empty array will disable passthrough support (all mouse events will be intercepted by the window, which is the default behavior).
#desc [codeblocks]
#desc [gdscript]
#desc # Set region, using Path2D node.
#desc DisplayServer.window_set_mouse_passthrough($Path2D.curve.get_baked_points())
#desc 
#desc # Set region, using Polygon2D node.
#desc DisplayServer.window_set_mouse_passthrough($Polygon2D.polygon)
#desc 
#desc # Reset region to default.
#desc DisplayServer.window_set_mouse_passthrough([])
#desc [/gdscript]
#desc [csharp]
#desc // Set region, using Path2D node.
#desc DisplayServer.WindowSetMousePassthrough(GetNode<Path2D>("Path2D").Curve.GetBakedPoints());
#desc 
#desc // Set region, using Polygon2D node.
#desc DisplayServer.WindowSetMousePassthrough(GetNode<Polygon2D>("Polygon2D").Polygon);
#desc 
#desc // Reset region to default.
#desc DisplayServer.WindowSetMousePassthrough(new Vector2[] {});
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] On Windows, the portion of a window that lies outside the region is not drawn, while on Linux (X11) and macOS it is.
#desc [b]Note:[/b] This method is implemented on Linux (X11), macOS and Windows.
func window_set_mouse_passthrough(region: PackedVector2Array, window_id: int = 0) -> void:
	pass;

#desc Sets the bounding box of control, or menu item that was used to open the popup window, in the screen coordinate system. Clicking this area will not auto-close this popup.
func window_set_popup_safe_rect(window: int, rect: Rect2i) -> void:
	pass;

#desc Sets the position of the given window to [param position]. On multi-monitor setups, the screen position is relative to the virtual desktop area. On multi-monitor setups with different screen resolutions or orientations, the origin may be located outside any display like this:
#desc [codeblock]
#desc * (0, 0)        +-------+
#desc |       |
#desc +-------------+ |       |
#desc |             | |       |
#desc |             | |       |
#desc +-------------+ +-------+
#desc [/codeblock]
#desc See also [method window_get_position] and [method window_set_size].
#desc [b]Note:[/b] It's recommended to change this value using [member Window.position] instead.
func window_set_position(position: Vector2i, window_id: int = 0) -> void:
	pass;

#desc Sets the [param callback] that will be called when the window specified by [param window_id] is moved or resized.
func window_set_rect_changed_callback(callback: Callable, window_id: int = 0) -> void:
	pass;

#desc Sets the size of the given window to [param size] (in pixels). See also [method window_get_size] and [method window_get_position].
#desc [b]Note:[/b] It's recommended to change this value using [member Window.size] instead.
func window_set_size(size: Vector2i, window_id: int = 0) -> void:
	pass;

#desc Sets the title of the given window to [param title].
#desc [b]Note:[/b] It's recommended to change this value using [member Window.title] instead.
#desc [b]Note:[/b] Avoid changing the window title every frame, as this can cause performance issues on certain window managers. Try to change the window title only a few times per second at most.
func window_set_title(title: String, window_id: int = 0) -> void:
	pass;

#desc Sets window transient parent. Transient window is will be destroyed with its transient parent and will return focus to their parent when closed. The transient window is displayed on top of a non-exclusive full-screen parent window. Transient windows can't enter full-screen mode.
#desc [b]Note:[/b] It's recommended to change this value using [member Window.transient] instead.
#desc [b]Note:[/b] The behavior might be different depending on the platform.
func window_set_transient(window_id: int, parent_window_id: int) -> void:
	pass;

#desc Sets the V-Sync mode of the given window. See also [member ProjectSettings.display/window/vsync/vsync_mode].
#desc See [enum DisplayServer.VSyncMode] for possible values and how they affect the behavior of your application.
#desc Depending on the platform and used renderer, the engine will fall back to [constant VSYNC_ENABLED] if the desired mode is not supported.
#desc [b]Note:[/b] V-Sync modes other than [constant VSYNC_ENABLED] are only supported in the Forward+ and Mobile rendering methods, not Compatibility.
func window_set_vsync_mode(vsync_mode: int, window_id: int = 0) -> void:
	pass;

#desc When [constant WINDOW_FLAG_EXTEND_TO_TITLE] flag is set, set offset to the center of the first titlebar button.
#desc [b]Note:[/b] This flag is implemented on macOS.
func window_set_window_buttons_offset(offset: Vector2i, window_id: int = 0) -> void:
	pass;

#desc Sets the [param callback] that will be called when an event occurs in the window specified by [param window_id].
func window_set_window_event_callback(callback: Callable, window_id: int = 0) -> void:
	pass;



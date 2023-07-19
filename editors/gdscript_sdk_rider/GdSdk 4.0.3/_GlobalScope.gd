#brief Global scope constants and functions.
#desc A list of global scope enumerated constants and built-in functions. This is all that resides in the globals, constants regarding error codes, keycodes, property hints, etc.
#desc Singletons are also documented here, since they can be accessed from anywhere.
#desc For the entries related to GDScript which can be accessed in any script see [@GDScript].
#tutorial [Random number generation] https://docs.godotengine.org/en/stable/tutorials/math/random_number_generation.html
class_name _GlobalScope

#desc Left side, usually used for [Control] or [StyleBox]-derived classes.
#desc Top side, usually used for [Control] or [StyleBox]-derived classes.
#desc Right side, usually used for [Control] or [StyleBox]-derived classes.
#desc Bottom side, usually used for [Control] or [StyleBox]-derived classes.
#desc Top-left corner.
#desc Top-right corner.
#desc Bottom-right corner.
#desc Bottom-left corner.
#desc General vertical alignment, usually used for [Separator], [ScrollBar], [Slider], etc.
#desc General horizontal alignment, usually used for [Separator], [ScrollBar], [Slider], etc.
#desc Clockwise rotation. Used by some methods (e.g. [method Image.rotate_90]).
#desc Counter-clockwise rotation. Used by some methods (e.g. [method Image.rotate_90]).
#desc Horizontal left alignment, usually for text-derived classes.
#desc Horizontal center alignment, usually for text-derived classes.
#desc Horizontal right alignment, usually for text-derived classes.
#desc Expand row to fit width, usually for text-derived classes.
#desc Vertical top alignment, usually for text-derived classes.
#desc Vertical center alignment, usually for text-derived classes.
#desc Vertical bottom alignment, usually for text-derived classes.
#desc Expand rows to fit height, usually for text-derived classes.
#desc Aligns the top of the inline object (e.g. image, table) to the position of the text specified by [code]INLINE_ALIGNMENT_TO_*[/code] constant.
#desc Aligns the center of the inline object (e.g. image, table) to the position of the text specified by [code]INLINE_ALIGNMENT_TO_*[/code] constant.
#desc Aligns the baseline (user defined) of the inline object (e.g. image, table) to the position of the text specified by [code]INLINE_ALIGNMENT_TO_*[/code] constant.
#desc Aligns the bottom of the inline object (e.g. image, table) to the position of the text specified by [code]INLINE_ALIGNMENT_TO_*[/code] constant.
#desc Aligns the position of the inline object (e.g. image, table) specified by [code]INLINE_ALIGNMENT_*_TO[/code] constant to the top of the text.
#desc Aligns the position of the inline object (e.g. image, table) specified by [code]INLINE_ALIGNMENT_*_TO[/code] constant to the center of the text.
#desc Aligns the position of the inline object (e.g. image, table) specified by [code]INLINE_ALIGNMENT_*_TO[/code] constant to the baseline of the text.
#desc Aligns inline object (e.g. image, table) to the bottom of the text.
#desc Aligns top of the inline object (e.g. image, table) to the top of the text. Equivalent to [code]INLINE_ALIGNMENT_TOP_TO | INLINE_ALIGNMENT_TO_TOP[/code].
#desc Aligns center of the inline object (e.g. image, table) to the center of the text. Equivalent to [code]INLINE_ALIGNMENT_CENTER_TO | INLINE_ALIGNMENT_TO_CENTER[/code].
#desc Aligns bottom of the inline object (e.g. image, table) to the bottom of the text. Equivalent to [code]INLINE_ALIGNMENT_BOTTOM_TO | INLINE_ALIGNMENT_TO_BOTTOM[/code].
#desc A bit mask for [code]INLINE_ALIGNMENT_*_TO[/code] alignment constants.
#desc A bit mask for [code]INLINE_ALIGNMENT_TO_*[/code] alignment constants.
#desc Specifies that Euler angles should be in XYZ order. When composing, the order is X, Y, Z. When decomposing, the order is reversed, first Z, then Y, and X last.
#desc Specifies that Euler angles should be in XZY order. When composing, the order is X, Z, Y. When decomposing, the order is reversed, first Y, then Z, and X last.
#desc Specifies that Euler angles should be in YXZ order. When composing, the order is Y, X, Z. When decomposing, the order is reversed, first Z, then X, and Y last.
#desc Specifies that Euler angles should be in YZX order. When composing, the order is Y, Z, X. When decomposing, the order is reversed, first X, then Z, and Y last.
#desc Specifies that Euler angles should be in ZXY order. When composing, the order is Z, X, Y. When decomposing, the order is reversed, first Y, then X, and Z last.
#desc Specifies that Euler angles should be in ZYX order. When composing, the order is Z, Y, X. When decomposing, the order is reversed, first X, then Y, and Z last.
#desc Enum value which doesn't correspond to any key. This is used to initialize [enum Key] properties with a generic state.
#desc Keycodes with this bit applied are non-printable.
#desc Escape key.
#desc Tab key.
#desc Shift + Tab key.
#desc Backspace key.
#desc Return key (on the main keyboard).
#desc Enter key on the numeric keypad.
#desc Insert key.
#desc Delete key.
#desc Pause key.
#desc Print Screen key.
#desc System Request key.
#desc Clear key.
#desc Home key.
#desc End key.
#desc Left arrow key.
#desc Up arrow key.
#desc Right arrow key.
#desc Down arrow key.
#desc Page Up key.
#desc Page Down key.
#desc Shift key.
#desc Control key.
#desc Meta key.
#desc Alt key.
#desc Caps Lock key.
#desc Num Lock key.
#desc Scroll Lock key.
#desc F1 key.
#desc F2 key.
#desc F3 key.
#desc F4 key.
#desc F5 key.
#desc F6 key.
#desc F7 key.
#desc F8 key.
#desc F9 key.
#desc F10 key.
#desc F11 key.
#desc F12 key.
#desc F13 key.
#desc F14 key.
#desc F15 key.
#desc F16 key.
#desc F17 key.
#desc F18 key.
#desc F19 key.
#desc F20 key.
#desc F21 key.
#desc F22 key.
#desc F23 key.
#desc F24 key.
#desc F25 key. Only supported on macOS and Linux due to a Windows limitation.
#desc F26 key. Only supported on macOS and Linux due to a Windows limitation.
#desc F27 key. Only supported on macOS and Linux due to a Windows limitation.
#desc F28 key. Only supported on macOS and Linux due to a Windows limitation.
#desc F29 key. Only supported on macOS and Linux due to a Windows limitation.
#desc F30 key. Only supported on macOS and Linux due to a Windows limitation.
#desc F31 key. Only supported on macOS and Linux due to a Windows limitation.
#desc F32 key. Only supported on macOS and Linux due to a Windows limitation.
#desc F33 key. Only supported on macOS and Linux due to a Windows limitation.
#desc F34 key. Only supported on macOS and Linux due to a Windows limitation.
#desc F35 key. Only supported on macOS and Linux due to a Windows limitation.
#desc Multiply (*) key on the numeric keypad.
#desc Divide (/) key on the numeric keypad.
#desc Subtract (-) key on the numeric keypad.
#desc Period (.) key on the numeric keypad.
#desc Add (+) key on the numeric keypad.
#desc Number 0 on the numeric keypad.
#desc Number 1 on the numeric keypad.
#desc Number 2 on the numeric keypad.
#desc Number 3 on the numeric keypad.
#desc Number 4 on the numeric keypad.
#desc Number 5 on the numeric keypad.
#desc Number 6 on the numeric keypad.
#desc Number 7 on the numeric keypad.
#desc Number 8 on the numeric keypad.
#desc Number 9 on the numeric keypad.
#desc Context menu key.
#desc Hyper key. (On Linux/X11 only).
#desc Help key.
#desc Media back key. Not to be confused with the Back button on an Android device.
#desc Media forward key.
#desc Media stop key.
#desc Media refresh key.
#desc Volume down key.
#desc Mute volume key.
#desc Volume up key.
#desc Media play key.
#desc Media stop key.
#desc Previous song key.
#desc Next song key.
#desc Media record key.
#desc Home page key.
#desc Favorites key.
#desc Search key.
#desc Standby key.
#desc Open URL / Launch Browser key.
#desc Launch Mail key.
#desc Launch Media key.
#desc Launch Shortcut 0 key.
#desc Launch Shortcut 1 key.
#desc Launch Shortcut 2 key.
#desc Launch Shortcut 3 key.
#desc Launch Shortcut 4 key.
#desc Launch Shortcut 5 key.
#desc Launch Shortcut 6 key.
#desc Launch Shortcut 7 key.
#desc Launch Shortcut 8 key.
#desc Launch Shortcut 9 key.
#desc Launch Shortcut A key.
#desc Launch Shortcut B key.
#desc Launch Shortcut C key.
#desc Launch Shortcut D key.
#desc Launch Shortcut E key.
#desc Launch Shortcut F key.
#desc Unknown key.
#desc Space key.
#desc ! key.
#desc " key.
#desc # key.
#desc $ key.
#desc % key.
#desc & key.
#desc ' key.
#desc ( key.
#desc ) key.
#desc * key.
#desc + key.
#desc , key.
#desc - key.
#desc . key.
#desc / key.
#desc Number 0 key.
#desc Number 1 key.
#desc Number 2 key.
#desc Number 3 key.
#desc Number 4 key.
#desc Number 5 key.
#desc Number 6 key.
#desc Number 7 key.
#desc Number 8 key.
#desc Number 9 key.
#desc : key.
#desc ; key.
#desc < key.
#desc = key.
#desc > key.
#desc ? key.
#desc @ key.
#desc A key.
#desc B key.
#desc C key.
#desc D key.
#desc E key.
#desc F key.
#desc G key.
#desc H key.
#desc I key.
#desc J key.
#desc K key.
#desc L key.
#desc M key.
#desc N key.
#desc O key.
#desc P key.
#desc Q key.
#desc R key.
#desc S key.
#desc T key.
#desc U key.
#desc V key.
#desc W key.
#desc X key.
#desc Y key.
#desc Z key.
#desc [ key.
#desc \ key.
#desc ] key.
#desc ^ key.
#desc _ key.
#desc ` key.
#desc { key.
#desc | key.
#desc } key.
#desc ~ key.
#desc ¥ key.
#desc § key.
#desc "Globe" key on Mac / iPad keyboard.
#desc "On-screen keyboard" key iPad keyboard.
#desc 英数 key on Mac keyboard.
#desc かな key on Mac keyboard.
#desc Key Code mask.
#desc Modifier key mask.
#desc Automatically remapped to [constant KEY_META] on macOS and [constant KEY_CTRL] on other platforms, this mask is never set in the actual events, and should be used for key mapping only.
#desc Shift key mask.
#desc Alt or Option (on macOS) key mask.
#desc Command (on macOS) or Meta/Windows key mask.
#desc Control key mask.
#desc Keypad key mask.
#desc Group Switch key mask.
#desc Enum value which doesn't correspond to any mouse button. This is used to initialize [enum MouseButton] properties with a generic state.
#desc Primary mouse button, usually assigned to the left button.
#desc Secondary mouse button, usually assigned to the right button.
#desc Middle mouse button.
#desc Mouse wheel scrolling up.
#desc Mouse wheel scrolling down.
#desc Mouse wheel left button (only present on some mice).
#desc Mouse wheel right button (only present on some mice).
#desc Extra mouse button 1. This is sometimes present, usually to the sides of the mouse.
#desc Extra mouse button 2. This is sometimes present, usually to the sides of the mouse.
#desc Primary mouse button mask, usually for the left button.
#desc Secondary mouse button mask, usually for the right button.
#desc Middle mouse button mask.
#desc Extra mouse button 1 mask.
#desc Extra mouse button 2 mask.
#desc An invalid game controller button.
#desc Game controller SDL button A. Corresponds to the bottom action button: Sony Cross, Xbox A, Nintendo B.
#desc Game controller SDL button B. Corresponds to the right action button: Sony Circle, Xbox B, Nintendo A.
#desc Game controller SDL button X. Corresponds to the left action button: Sony Square, Xbox X, Nintendo Y.
#desc Game controller SDL button Y. Corresponds to the top action button: Sony Triangle, Xbox Y, Nintendo X.
#desc Game controller SDL back button. Corresponds to the Sony Select, Xbox Back, Nintendo - button.
#desc Game controller SDL guide button. Corresponds to the Sony PS, Xbox Home button.
#desc Game controller SDL start button. Corresponds to the Nintendo + button.
#desc Game controller SDL left stick button. Corresponds to the Sony L3, Xbox L/LS button.
#desc Game controller SDL right stick button. Corresponds to the Sony R3, Xbox R/RS button.
#desc Game controller SDL left shoulder button. Corresponds to the Sony L1, Xbox LB button.
#desc Game controller SDL right shoulder button. Corresponds to the Sony R1, Xbox RB button.
#desc Game controller D-pad up button.
#desc Game controller D-pad down button.
#desc Game controller D-pad left button.
#desc Game controller D-pad right button.
#desc Game controller SDL miscellaneous button. Corresponds to Xbox share button, PS5 microphone button, Nintendo Switch capture button.
#desc Game controller SDL paddle 1 button.
#desc Game controller SDL paddle 2 button.
#desc Game controller SDL paddle 3 button.
#desc Game controller SDL paddle 4 button.
#desc Game controller SDL touchpad button.
#desc The number of SDL game controller buttons.
#desc The maximum number of game controller buttons supported by the engine. The actual limit may be lower on specific platforms:
#desc - [b]Android:[/b] Up to 36 buttons.
#desc - [b]Linux:[/b] Up to 80 buttons.
#desc - [b]Windows[/b] and [b]macOS:[/b] Up to 128 buttons.
#desc An invalid game controller axis.
#desc Game controller left joystick x-axis.
#desc Game controller left joystick y-axis.
#desc Game controller right joystick x-axis.
#desc Game controller right joystick y-axis.
#desc Game controller left trigger axis.
#desc Game controller right trigger axis.
#desc The number of SDL game controller axes.
#desc The maximum number of game controller axes: OpenVR supports up to 5 Joysticks making a total of 10 axes.
#desc Enum value which doesn't correspond to any MIDI message. This is used to initialize [enum MIDIMessage] properties with a generic state.
#desc MIDI note OFF message. Not all MIDI devices send this event; some send [constant MIDI_MESSAGE_NOTE_ON] with zero velocity instead. See the documentation of [InputEventMIDI] for information of how to use MIDI inputs.
#desc MIDI note ON message. Some MIDI devices send this event with velocity zero instead of [constant MIDI_MESSAGE_NOTE_OFF], but implementations vary. See the documentation of [InputEventMIDI] for information of how to use MIDI inputs.
#desc MIDI aftertouch message. This message is most often sent by pressing down on the key after it "bottoms out".
#desc MIDI control change message. This message is sent when a controller value changes. Controllers include devices such as pedals and levers.
#desc MIDI program change message. This message sent when the program patch number changes.
#desc MIDI channel pressure message. This message is most often sent by pressing down on the key after it "bottoms out". This message is different from polyphonic after-touch as it indicates the highest pressure across all keys.
#desc MIDI pitch bend message. This message is sent to indicate a change in the pitch bender (wheel or lever, typically).
#desc MIDI system exclusive message. This has behavior exclusive to the device you're receiving input from. Getting this data is not implemented in Godot.
#desc MIDI quarter frame message. Contains timing information that is used to synchronize MIDI devices. Getting this data is not implemented in Godot.
#desc MIDI song position pointer message. Gives the number of 16th notes since the start of the song. Getting this data is not implemented in Godot.
#desc MIDI song select message. Specifies which sequence or song is to be played. Getting this data is not implemented in Godot.
#desc MIDI tune request message. Upon receiving a tune request, all analog synthesizers should tune their oscillators.
#desc MIDI timing clock message. Sent 24 times per quarter note when synchronization is required.
#desc MIDI start message. Start the current sequence playing. This message will be followed with Timing Clocks.
#desc MIDI continue message. Continue at the point the sequence was stopped.
#desc MIDI stop message. Stop the current sequence.
#desc MIDI active sensing message. This message is intended to be sent repeatedly to tell the receiver that a connection is alive.
#desc MIDI system reset message. Reset all receivers in the system to power-up status. It should not be sent on power-up itself.
#desc Methods that return [enum Error] return [constant OK] when no error occurred.
#desc Since [constant OK] has value 0, and all other error constants are positive integers, it can also be used in boolean checks.
#desc [b]Example:[/b]
#desc [codeblock]
#desc var error = method_that_returns_error()
#desc if error != OK:
#desc printerr("Failure!")
#desc 
#desc # Or, alternatively:
#desc if error:
#desc printerr("Still failing!")
#desc [/codeblock]
#desc [b]Note:[/b] Many functions do not return an error code, but will print error messages to standard output.
#desc Generic error.
#desc Unavailable error.
#desc Unconfigured error.
#desc Unauthorized error.
#desc Parameter range error.
#desc Out of memory (OOM) error.
#desc File: Not found error.
#desc File: Bad drive error.
#desc File: Bad path error.
#desc File: No permission error.
#desc File: Already in use error.
#desc File: Can't open error.
#desc File: Can't write error.
#desc File: Can't read error.
#desc File: Unrecognized error.
#desc File: Corrupt error.
#desc File: Missing dependencies error.
#desc File: End of file (EOF) error.
#desc Can't open error.
#desc Can't create error.
#desc Query failed error.
#desc Already in use error.
#desc Locked error.
#desc Timeout error.
#desc Can't connect error.
#desc Can't resolve error.
#desc Connection error.
#desc Can't acquire resource error.
#desc Can't fork process error.
#desc Invalid data error.
#desc Invalid parameter error.
#desc Already exists error.
#desc Does not exist error.
#desc Database: Read error.
#desc Database: Write error.
#desc Compilation failed error.
#desc Method not found error.
#desc Linking failed error.
#desc Script failed error.
#desc Cycling link (import cycle) error.
#desc Invalid declaration error.
#desc Duplicate symbol error.
#desc Parse error.
#desc Busy error.
#desc Skip error.
#desc Help error. Used internally when passing [code]--version[/code] or [code]--help[/code] as executable options.
#desc Bug error, caused by an implementation issue in the method.
#desc [b]Note:[/b] If a built-in method returns this code, please open an issue on [url=https://github.com/godotengine/godot/issues]the GitHub Issue Tracker[/url].
#desc Printer on fire error (This is an easter egg, no built-in methods return this error code).
#desc The property has no hint for the editor.
#desc Hints that an [int] or [float] property should be within a range specified via the hint string [code]"min,max"[/code] or [code]"min,max,step"[/code]. The hint string can optionally include [code]"or_greater"[/code] and/or [code]"or_less"[/code] to allow manual input going respectively above the max or below the min values.
#desc [b]Example:[/b] [code]"-360,360,1,or_greater,or_less"[/code].
#desc Additionally, other keywords can be included: [code]"exp"[/code] for exponential range editing, [code]"radians"[/code] for editing radian angles in degrees, [code]"degrees"[/code] to hint at an angle and [code]"hide_slider"[/code] to hide the slider.
#desc Hints that an [int] or [String] property is an enumerated value to pick in a list specified via a hint string.
#desc The hint string is a comma separated list of names such as [code]"Hello,Something,Else"[/code]. Whitespaces are [b]not[/b] removed from either end of a name. For integer properties, the first name in the list has value 0, the next 1, and so on. Explicit values can also be specified by appending [code]:integer[/code] to the name, e.g. [code]"Zero,One,Three:3,Four,Six:6"[/code].
#desc Hints that a [String] property can be an enumerated value to pick in a list specified via a hint string such as [code]"Hello,Something,Else"[/code].
#desc Unlike [constant PROPERTY_HINT_ENUM], a property with this hint still accepts arbitrary values and can be empty. The list of values serves to suggest possible values.
#desc Hints that a [float] property should be edited via an exponential easing function. The hint string can include [code]"attenuation"[/code] to flip the curve horizontally and/or [code]"positive_only"[/code] to exclude in/out easing and limit values to be greater than or equal to zero.
#desc Hints that a vector property should allow its components to be linked. For example, this allows [member Vector2.x] and [member Vector2.y] to be edited together.
#desc Hints that an [int] property is a bitmask with named bit flags.
#desc The hint string is a comma separated list of names such as [code]"Bit0,Bit1,Bit2,Bit3"[/code]. Whitespaces are [b]not[/b] removed from either end of a name. The first name in the list has value 1, the next 2, then 4, 8, 16 and so on. Explicit values can also be specified by appending [code]:integer[/code] to the name, e.g. [code]"A:4,B:8,C:16"[/code]. You can also combine several flags ([code]"A:4,B:8,AB:12,C:16"[/code]).
#desc [b]Note:[/b] A flag value must be at least [code]1[/code] and at most [code]2 ** 32 - 1[/code].
#desc [b]Note:[/b] Unlike [constant PROPERTY_HINT_ENUM], the previous explicit value is not taken into account. For the hint [code]"A:16,B,C"[/code], A is 16, B is 2, C is 4.
#desc Hints that an [int] property is a bitmask using the optionally named 2D render layers.
#desc Hints that an [int] property is a bitmask using the optionally named 2D physics layers.
#desc Hints that an [int] property is a bitmask using the optionally named 2D navigation layers.
#desc Hints that an [int] property is a bitmask using the optionally named 3D render layers.
#desc Hints that an [int] property is a bitmask using the optionally named 3D physics layers.
#desc Hints that an [int] property is a bitmask using the optionally named 3D navigation layers.
#desc Hints that a [String] property is a path to a file. Editing it will show a file dialog for picking the path. The hint string can be a set of filters with wildcards like [code]"*.png,*.jpg"[/code].
#desc Hints that a [String] property is a path to a directory. Editing it will show a file dialog for picking the path.
#desc Hints that a [String] property is an absolute path to a file outside the project folder. Editing it will show a file dialog for picking the path. The hint string can be a set of filters with wildcards, like [code]"*.png,*.jpg"[/code].
#desc Hints that a [String] property is an absolute path to a directory outside the project folder. Editing it will show a file dialog for picking the path.
#desc Hints that a property is an instance of a [Resource]-derived type, optionally specified via the hint string (e.g. [code]"Texture2D"[/code]). Editing it will show a popup menu of valid resource types to instantiate.
#desc Hints that a [String] property is text with line breaks. Editing it will show a text input field where line breaks can be typed.
#desc Hints that a [String] property is an [Expression].
#desc Hints that a [String] property should show a placeholder text on its input field, if empty. The hint string is the placeholder text to use.
#desc Hints that a [Color] property should be edited without affecting its transparency ([member Color.a] is not editable).
#desc Hint that a property represents a particular type. If a property is [constant TYPE_STRING], allows to set a type from the create dialog. If you need to create an [Array] to contain elements of a specific type, the [code]hint_string[/code] must encode nested types using [code]":"[/code] and [code]"/"[/code] for specifying [Resource] types. For instance:
#desc [codeblock]
#desc hint_string = "%s:" % [TYPE_INT] # Array of integers.
#desc hint_string = "%s:%s:" % [TYPE_ARRAY, TYPE_REAL] # Two-dimensional array of floats.
#desc hint_string = "%s/%s:Resource" % [TYPE_OBJECT, TYPE_OBJECT] # Array of resources.
#desc hint_string = "%s:%s/%s:Resource" % [TYPE_ARRAY, TYPE_OBJECT, TYPE_OBJECT] # Two-dimensional array of resources.
#desc [/codeblock]
#desc [b]Note:[/b] The final colon is required for properly detecting built-in types.
#desc Hints that a string property is a locale code. Editing it will show a locale dialog for picking language and country.
#desc Hints that a dictionary property is string translation map. Dictionary keys are locale codes and, values are translated strings.
#desc Hints that a quaternion property should disable the temporary euler editor.
#desc Hints that a string property is a password, and every character is replaced with the secret character.
#desc Represents the size of the [enum PropertyHint] enum.
#desc The property is not stored, and does not display in the editor. This is the default for non-exported properties.
#desc The property is serialized and saved in the scene file (default).
#desc The property is shown in the [EditorInspector] (default).
#desc The property is excluded from the class reference.
#desc The property can be checked in the [EditorInspector].
#desc The property is checked in the [EditorInspector].
#desc Used to group properties together in the editor. See [EditorInspector].
#desc Used to categorize properties together in the editor.
#desc Used to group properties together in the editor in a subgroup (under a group). See [EditorInspector].
#desc The property does not save its state in [PackedScene].
#desc Editing the property prompts the user for restarting the editor.
#desc The property is a script variable which should be serialized and saved in the scene file.
#desc The property is an array.
#desc When duplicating a resource with [method Resource.duplicate], and this flag is set on a property of that resource, the property should always be duplicated, regardless of the [code]subresources[/code] bool parameter.
#desc When duplicating a resource with [method Resource.duplicate], and this flag is set on a property of that resource, the property should never be duplicated, regardless of the [code]subresources[/code] bool parameter.
#desc The property is only shown in the editor if modern renderers are supported (the Compatibility rendering method is excluded).
#desc The property is read-only in the [EditorInspector].
#desc Default usage (storage and editor).
#desc Default usage but without showing the property in the editor (storage).
#desc Flag for a normal method.
#desc Flag for an editor method.
#desc Flag for a constant method.
#desc Flag for a virtual method.
#desc Flag for a method with a variable number of arguments.
#desc Flag for a static method.
#desc Used internally. Allows to not dump core virtual methods (such as [method Object._notification]) to the JSON API.
#desc Default method flags (normal).
#desc Variable is [code]null[/code].
#desc Variable is of type [bool].
#desc Variable is of type [int].
#desc Variable is of type [float].
#desc Variable is of type [String].
#desc Variable is of type [Vector2].
#desc Variable is of type [Vector2i].
#desc Variable is of type [Rect2].
#desc Variable is of type [Rect2i].
#desc Variable is of type [Vector3].
#desc Variable is of type [Vector3i].
#desc Variable is of type [Transform2D].
#desc Variable is of type [Vector4].
#desc Variable is of type [Vector4i].
#desc Variable is of type [Plane].
#desc Variable is of type [Quaternion].
#desc Variable is of type [AABB].
#desc Variable is of type [Basis].
#desc Variable is of type [Transform3D].
#desc Variable is of type [Projection].
#desc Variable is of type [Color].
#desc Variable is of type [StringName].
#desc Variable is of type [NodePath].
#desc Variable is of type [RID].
#desc Variable is of type [Object].
#desc Variable is of type [Callable].
#desc Variable is of type [Signal].
#desc Variable is of type [Dictionary].
#desc Variable is of type [Array].
#desc Variable is of type [PackedByteArray].
#desc Variable is of type [PackedInt32Array].
#desc Variable is of type [PackedInt64Array].
#desc Variable is of type [PackedFloat32Array].
#desc Variable is of type [PackedFloat64Array].
#desc Variable is of type [PackedStringArray].
#desc Variable is of type [PackedVector2Array].
#desc Variable is of type [PackedVector3Array].
#desc Variable is of type [PackedColorArray].
#desc Represents the size of the [enum Variant.Type] enum.
#desc Equality operator ([code]==[/code]).
#desc Inequality operator ([code]!=[/code]).
#desc Less than operator ([code]<[/code]).
#desc Less than or equal operator ([code]<=[/code]).
#desc Greater than operator ([code]>[/code]).
#desc Greater than or equal operator ([code]>=[/code]).
#desc Addition operator ([code]+[/code]).
#desc Subtraction operator ([code]-[/code]).
#desc Multiplication operator ([code]*[/code]).
#desc Division operator ([code]/[/code]).
#desc Unary negation operator ([code]-[/code]).
#desc Unary plus operator ([code]+[/code]).
#desc Remainder/modulo operator ([code]%[/code]).
#desc Power operator ([code]**[/code]).
#desc Left shift operator ([code]<<[/code]).
#desc Right shift operator ([code]>>[/code]).
#desc Bitwise AND operator ([code]&[/code]).
#desc Bitwise OR operator ([code]|[/code]).
#desc Bitwise XOR operator ([code]^[/code]).
#desc Bitwise NOT operator ([code]~[/code]).
#desc Logical AND operator ([code]and[/code] or [code]&&[/code]).
#desc Logical OR operator ([code]or[/code] or [code]||[/code]).
#desc Logical XOR operator (not implemented in GDScript).
#desc Logical NOT operator ([code]not[/code] or [code]![/code]).
#desc Logical IN operator ([code]in[/code]).
#desc Represents the size of the [enum Variant.Operator] enum.

#enum Side
enum {
    SIDE_LEFT = 0,
    SIDE_TOP = 1,
    SIDE_RIGHT = 2,
    SIDE_BOTTOM = 3,
}
#enum Corner
enum {
    CORNER_TOP_LEFT = 0,
    CORNER_TOP_RIGHT = 1,
    CORNER_BOTTOM_RIGHT = 2,
    CORNER_BOTTOM_LEFT = 3,
}
#enum Orientation
enum {
    VERTICAL = 1,
    HORIZONTAL = 0,
}
#enum ClockDirection
enum {
    CLOCKWISE = 0,
    COUNTERCLOCKWISE = 1,
}
#enum HorizontalAlignment
enum {
    HORIZONTAL_ALIGNMENT_LEFT = 0,
    HORIZONTAL_ALIGNMENT_CENTER = 1,
    HORIZONTAL_ALIGNMENT_RIGHT = 2,
    HORIZONTAL_ALIGNMENT_FILL = 3,
}
#enum VerticalAlignment
enum {
    VERTICAL_ALIGNMENT_TOP = 0,
    VERTICAL_ALIGNMENT_CENTER = 1,
    VERTICAL_ALIGNMENT_BOTTOM = 2,
    VERTICAL_ALIGNMENT_FILL = 3,
}
#enum InlineAlignment
enum {
    INLINE_ALIGNMENT_TOP_TO = 0,
    INLINE_ALIGNMENT_CENTER_TO = 1,
    INLINE_ALIGNMENT_BASELINE_TO = 3,
    INLINE_ALIGNMENT_BOTTOM_TO = 2,
    INLINE_ALIGNMENT_TO_TOP = 0,
    INLINE_ALIGNMENT_TO_CENTER = 4,
    INLINE_ALIGNMENT_TO_BASELINE = 8,
    INLINE_ALIGNMENT_TO_BOTTOM = 12,
    INLINE_ALIGNMENT_TOP = 0,
    INLINE_ALIGNMENT_CENTER = 5,
    INLINE_ALIGNMENT_BOTTOM = 14,
    INLINE_ALIGNMENT_IMAGE_MASK = 3,
    INLINE_ALIGNMENT_TEXT_MASK = 12,
}
#enum EulerOrder
enum {
    EULER_ORDER_XYZ = 0,
    EULER_ORDER_XZY = 1,
    EULER_ORDER_YXZ = 2,
    EULER_ORDER_YZX = 3,
    EULER_ORDER_ZXY = 4,
    EULER_ORDER_ZYX = 5,
}
#enum Key
enum {
    KEY_NONE = 0,
    KEY_SPECIAL = 4194304,
    KEY_ESCAPE = 4194305,
    KEY_TAB = 4194306,
    KEY_BACKTAB = 4194307,
    KEY_BACKSPACE = 4194308,
    KEY_ENTER = 4194309,
    KEY_KP_ENTER = 4194310,
    KEY_INSERT = 4194311,
    KEY_DELETE = 4194312,
    KEY_PAUSE = 4194313,
    KEY_PRINT = 4194314,
    KEY_SYSREQ = 4194315,
    KEY_CLEAR = 4194316,
    KEY_HOME = 4194317,
    KEY_END = 4194318,
    KEY_LEFT = 4194319,
    KEY_UP = 4194320,
    KEY_RIGHT = 4194321,
    KEY_DOWN = 4194322,
    KEY_PAGEUP = 4194323,
    KEY_PAGEDOWN = 4194324,
    KEY_SHIFT = 4194325,
    KEY_CTRL = 4194326,
    KEY_META = 4194327,
    KEY_ALT = 4194328,
    KEY_CAPSLOCK = 4194329,
    KEY_NUMLOCK = 4194330,
    KEY_SCROLLLOCK = 4194331,
    KEY_F1 = 4194332,
    KEY_F2 = 4194333,
    KEY_F3 = 4194334,
    KEY_F4 = 4194335,
    KEY_F5 = 4194336,
    KEY_F6 = 4194337,
    KEY_F7 = 4194338,
    KEY_F8 = 4194339,
    KEY_F9 = 4194340,
    KEY_F10 = 4194341,
    KEY_F11 = 4194342,
    KEY_F12 = 4194343,
    KEY_F13 = 4194344,
    KEY_F14 = 4194345,
    KEY_F15 = 4194346,
    KEY_F16 = 4194347,
    KEY_F17 = 4194348,
    KEY_F18 = 4194349,
    KEY_F19 = 4194350,
    KEY_F20 = 4194351,
    KEY_F21 = 4194352,
    KEY_F22 = 4194353,
    KEY_F23 = 4194354,
    KEY_F24 = 4194355,
    KEY_F25 = 4194356,
    KEY_F26 = 4194357,
    KEY_F27 = 4194358,
    KEY_F28 = 4194359,
    KEY_F29 = 4194360,
    KEY_F30 = 4194361,
    KEY_F31 = 4194362,
    KEY_F32 = 4194363,
    KEY_F33 = 4194364,
    KEY_F34 = 4194365,
    KEY_F35 = 4194366,
    KEY_KP_MULTIPLY = 4194433,
    KEY_KP_DIVIDE = 4194434,
    KEY_KP_SUBTRACT = 4194435,
    KEY_KP_PERIOD = 4194436,
    KEY_KP_ADD = 4194437,
    KEY_KP_0 = 4194438,
    KEY_KP_1 = 4194439,
    KEY_KP_2 = 4194440,
    KEY_KP_3 = 4194441,
    KEY_KP_4 = 4194442,
    KEY_KP_5 = 4194443,
    KEY_KP_6 = 4194444,
    KEY_KP_7 = 4194445,
    KEY_KP_8 = 4194446,
    KEY_KP_9 = 4194447,
    KEY_MENU = 4194370,
    KEY_HYPER = 4194371,
    KEY_HELP = 4194373,
    KEY_BACK = 4194376,
    KEY_FORWARD = 4194377,
    KEY_STOP = 4194378,
    KEY_REFRESH = 4194379,
    KEY_VOLUMEDOWN = 4194380,
    KEY_VOLUMEMUTE = 4194381,
    KEY_VOLUMEUP = 4194382,
    KEY_MEDIAPLAY = 4194388,
    KEY_MEDIASTOP = 4194389,
    KEY_MEDIAPREVIOUS = 4194390,
    KEY_MEDIANEXT = 4194391,
    KEY_MEDIARECORD = 4194392,
    KEY_HOMEPAGE = 4194393,
    KEY_FAVORITES = 4194394,
    KEY_SEARCH = 4194395,
    KEY_STANDBY = 4194396,
    KEY_OPENURL = 4194397,
    KEY_LAUNCHMAIL = 4194398,
    KEY_LAUNCHMEDIA = 4194399,
    KEY_LAUNCH0 = 4194400,
    KEY_LAUNCH1 = 4194401,
    KEY_LAUNCH2 = 4194402,
    KEY_LAUNCH3 = 4194403,
    KEY_LAUNCH4 = 4194404,
    KEY_LAUNCH5 = 4194405,
    KEY_LAUNCH6 = 4194406,
    KEY_LAUNCH7 = 4194407,
    KEY_LAUNCH8 = 4194408,
    KEY_LAUNCH9 = 4194409,
    KEY_LAUNCHA = 4194410,
    KEY_LAUNCHB = 4194411,
    KEY_LAUNCHC = 4194412,
    KEY_LAUNCHD = 4194413,
    KEY_LAUNCHE = 4194414,
    KEY_LAUNCHF = 4194415,
    KEY_UNKNOWN = 8388607,
    KEY_SPACE = 32,
    KEY_EXCLAM = 33,
    KEY_QUOTEDBL = 34,
    KEY_NUMBERSIGN = 35,
    KEY_DOLLAR = 36,
    KEY_PERCENT = 37,
    KEY_AMPERSAND = 38,
    KEY_APOSTROPHE = 39,
    KEY_PARENLEFT = 40,
    KEY_PARENRIGHT = 41,
    KEY_ASTERISK = 42,
    KEY_PLUS = 43,
    KEY_COMMA = 44,
    KEY_MINUS = 45,
    KEY_PERIOD = 46,
    KEY_SLASH = 47,
    KEY_0 = 48,
    KEY_1 = 49,
    KEY_2 = 50,
    KEY_3 = 51,
    KEY_4 = 52,
    KEY_5 = 53,
    KEY_6 = 54,
    KEY_7 = 55,
    KEY_8 = 56,
    KEY_9 = 57,
    KEY_COLON = 58,
    KEY_SEMICOLON = 59,
    KEY_LESS = 60,
    KEY_EQUAL = 61,
    KEY_GREATER = 62,
    KEY_QUESTION = 63,
    KEY_AT = 64,
    KEY_A = 65,
    KEY_B = 66,
    KEY_C = 67,
    KEY_D = 68,
    KEY_E = 69,
    KEY_F = 70,
    KEY_G = 71,
    KEY_H = 72,
    KEY_I = 73,
    KEY_J = 74,
    KEY_K = 75,
    KEY_L = 76,
    KEY_M = 77,
    KEY_N = 78,
    KEY_O = 79,
    KEY_P = 80,
    KEY_Q = 81,
    KEY_R = 82,
    KEY_S = 83,
    KEY_T = 84,
    KEY_U = 85,
    KEY_V = 86,
    KEY_W = 87,
    KEY_X = 88,
    KEY_Y = 89,
    KEY_Z = 90,
    KEY_BRACKETLEFT = 91,
    KEY_BACKSLASH = 92,
    KEY_BRACKETRIGHT = 93,
    KEY_ASCIICIRCUM = 94,
    KEY_UNDERSCORE = 95,
    KEY_QUOTELEFT = 96,
    KEY_BRACELEFT = 123,
    KEY_BAR = 124,
    KEY_BRACERIGHT = 125,
    KEY_ASCIITILDE = 126,
    KEY_YEN = 165,
    KEY_SECTION = 167,
    KEY_GLOBE = 4194416,
    KEY_KEYBOARD = 4194417,
    KEY_JIS_EISU = 4194418,
    KEY_JIS_KANA = 4194419,
}
#enum KeyModifierMask
enum {
    KEY_CODE_MASK = 8388607,
    KEY_MODIFIER_MASK = 532676608,
    KEY_MASK_CMD_OR_CTRL = 16777216,
    KEY_MASK_SHIFT = 33554432,
    KEY_MASK_ALT = 67108864,
    KEY_MASK_META = 134217728,
    KEY_MASK_CTRL = 268435456,
    KEY_MASK_KPAD = 536870912,
    KEY_MASK_GROUP_SWITCH = 1073741824,
}
#enum MouseButton
enum {
    MOUSE_BUTTON_NONE = 0,
    MOUSE_BUTTON_LEFT = 1,
    MOUSE_BUTTON_RIGHT = 2,
    MOUSE_BUTTON_MIDDLE = 3,
    MOUSE_BUTTON_WHEEL_UP = 4,
    MOUSE_BUTTON_WHEEL_DOWN = 5,
    MOUSE_BUTTON_WHEEL_LEFT = 6,
    MOUSE_BUTTON_WHEEL_RIGHT = 7,
    MOUSE_BUTTON_XBUTTON1 = 8,
    MOUSE_BUTTON_XBUTTON2 = 9,
}
#enum MouseButtonMask
enum {
    MOUSE_BUTTON_MASK_LEFT = 1,
    MOUSE_BUTTON_MASK_RIGHT = 2,
    MOUSE_BUTTON_MASK_MIDDLE = 4,
    MOUSE_BUTTON_MASK_MB_XBUTTON1 = 128,
    MOUSE_BUTTON_MASK_MB_XBUTTON2 = 256,
}
#enum JoyButton
enum {
    JOY_BUTTON_INVALID = -1,
    JOY_BUTTON_A = 0,
    JOY_BUTTON_B = 1,
    JOY_BUTTON_X = 2,
    JOY_BUTTON_Y = 3,
    JOY_BUTTON_BACK = 4,
    JOY_BUTTON_GUIDE = 5,
    JOY_BUTTON_START = 6,
    JOY_BUTTON_LEFT_STICK = 7,
    JOY_BUTTON_RIGHT_STICK = 8,
    JOY_BUTTON_LEFT_SHOULDER = 9,
    JOY_BUTTON_RIGHT_SHOULDER = 10,
    JOY_BUTTON_DPAD_UP = 11,
    JOY_BUTTON_DPAD_DOWN = 12,
    JOY_BUTTON_DPAD_LEFT = 13,
    JOY_BUTTON_DPAD_RIGHT = 14,
    JOY_BUTTON_MISC1 = 15,
    JOY_BUTTON_PADDLE1 = 16,
    JOY_BUTTON_PADDLE2 = 17,
    JOY_BUTTON_PADDLE3 = 18,
    JOY_BUTTON_PADDLE4 = 19,
    JOY_BUTTON_TOUCHPAD = 20,
    JOY_BUTTON_SDL_MAX = 21,
    JOY_BUTTON_MAX = 128,
}
#enum JoyAxis
enum {
    JOY_AXIS_INVALID = -1,
    JOY_AXIS_LEFT_X = 0,
    JOY_AXIS_LEFT_Y = 1,
    JOY_AXIS_RIGHT_X = 2,
    JOY_AXIS_RIGHT_Y = 3,
    JOY_AXIS_TRIGGER_LEFT = 4,
    JOY_AXIS_TRIGGER_RIGHT = 5,
    JOY_AXIS_SDL_MAX = 6,
    JOY_AXIS_MAX = 10,
}
#enum MIDIMessage
enum {
    MIDI_MESSAGE_NONE = 0,
    MIDI_MESSAGE_NOTE_OFF = 8,
    MIDI_MESSAGE_NOTE_ON = 9,
    MIDI_MESSAGE_AFTERTOUCH = 10,
    MIDI_MESSAGE_CONTROL_CHANGE = 11,
    MIDI_MESSAGE_PROGRAM_CHANGE = 12,
    MIDI_MESSAGE_CHANNEL_PRESSURE = 13,
    MIDI_MESSAGE_PITCH_BEND = 14,
    MIDI_MESSAGE_SYSTEM_EXCLUSIVE = 240,
    MIDI_MESSAGE_QUARTER_FRAME = 241,
    MIDI_MESSAGE_SONG_POSITION_POINTER = 242,
    MIDI_MESSAGE_SONG_SELECT = 243,
    MIDI_MESSAGE_TUNE_REQUEST = 246,
    MIDI_MESSAGE_TIMING_CLOCK = 248,
    MIDI_MESSAGE_START = 250,
    MIDI_MESSAGE_CONTINUE = 251,
    MIDI_MESSAGE_STOP = 252,
    MIDI_MESSAGE_ACTIVE_SENSING = 254,
    MIDI_MESSAGE_SYSTEM_RESET = 255,
}
#enum Error
enum {
    OK = 0,
    FAILED = 1,
    ERR_UNAVAILABLE = 2,
    ERR_UNCONFIGURED = 3,
    ERR_UNAUTHORIZED = 4,
    ERR_PARAMETER_RANGE_ERROR = 5,
    ERR_OUT_OF_MEMORY = 6,
    ERR_FILE_NOT_FOUND = 7,
    ERR_FILE_BAD_DRIVE = 8,
    ERR_FILE_BAD_PATH = 9,
    ERR_FILE_NO_PERMISSION = 10,
    ERR_FILE_ALREADY_IN_USE = 11,
    ERR_FILE_CANT_OPEN = 12,
    ERR_FILE_CANT_WRITE = 13,
    ERR_FILE_CANT_READ = 14,
    ERR_FILE_UNRECOGNIZED = 15,
    ERR_FILE_CORRUPT = 16,
    ERR_FILE_MISSING_DEPENDENCIES = 17,
    ERR_FILE_EOF = 18,
    ERR_CANT_OPEN = 19,
    ERR_CANT_CREATE = 20,
    ERR_QUERY_FAILED = 21,
    ERR_ALREADY_IN_USE = 22,
    ERR_LOCKED = 23,
    ERR_TIMEOUT = 24,
    ERR_CANT_CONNECT = 25,
    ERR_CANT_RESOLVE = 26,
    ERR_CONNECTION_ERROR = 27,
    ERR_CANT_ACQUIRE_RESOURCE = 28,
    ERR_CANT_FORK = 29,
    ERR_INVALID_DATA = 30,
    ERR_INVALID_PARAMETER = 31,
    ERR_ALREADY_EXISTS = 32,
    ERR_DOES_NOT_EXIST = 33,
    ERR_DATABASE_CANT_READ = 34,
    ERR_DATABASE_CANT_WRITE = 35,
    ERR_COMPILATION_FAILED = 36,
    ERR_METHOD_NOT_FOUND = 37,
    ERR_LINK_FAILED = 38,
    ERR_SCRIPT_FAILED = 39,
    ERR_CYCLIC_LINK = 40,
    ERR_INVALID_DECLARATION = 41,
    ERR_DUPLICATE_SYMBOL = 42,
    ERR_PARSE_ERROR = 43,
    ERR_BUSY = 44,
    ERR_SKIP = 45,
    ERR_HELP = 46,
    ERR_BUG = 47,
    ERR_PRINTER_ON_FIRE = 48,
}
#enum PropertyHint
enum {
    PROPERTY_HINT_NONE = 0,
    PROPERTY_HINT_RANGE = 1,
    PROPERTY_HINT_ENUM = 2,
    PROPERTY_HINT_ENUM_SUGGESTION = 3,
    PROPERTY_HINT_EXP_EASING = 4,
    PROPERTY_HINT_LINK = 5,
    PROPERTY_HINT_FLAGS = 6,
    PROPERTY_HINT_LAYERS_2D_RENDER = 7,
    PROPERTY_HINT_LAYERS_2D_PHYSICS = 8,
    PROPERTY_HINT_LAYERS_2D_NAVIGATION = 9,
    PROPERTY_HINT_LAYERS_3D_RENDER = 10,
    PROPERTY_HINT_LAYERS_3D_PHYSICS = 11,
    PROPERTY_HINT_LAYERS_3D_NAVIGATION = 12,
    PROPERTY_HINT_FILE = 13,
    PROPERTY_HINT_DIR = 14,
    PROPERTY_HINT_GLOBAL_FILE = 15,
    PROPERTY_HINT_GLOBAL_DIR = 16,
    PROPERTY_HINT_RESOURCE_TYPE = 17,
    PROPERTY_HINT_MULTILINE_TEXT = 18,
    PROPERTY_HINT_EXPRESSION = 19,
    PROPERTY_HINT_PLACEHOLDER_TEXT = 20,
    PROPERTY_HINT_COLOR_NO_ALPHA = 21,
    PROPERTY_HINT_OBJECT_ID = 22,
    PROPERTY_HINT_TYPE_STRING = 23,
    PROPERTY_HINT_NODE_PATH_TO_EDITED_NODE = 24,
    PROPERTY_HINT_OBJECT_TOO_BIG = 25,
    PROPERTY_HINT_NODE_PATH_VALID_TYPES = 26,
    PROPERTY_HINT_SAVE_FILE = 27,
    PROPERTY_HINT_GLOBAL_SAVE_FILE = 28,
    PROPERTY_HINT_INT_IS_OBJECTID = 29,
    PROPERTY_HINT_INT_IS_POINTER = 30,
    PROPERTY_HINT_ARRAY_TYPE = 31,
    PROPERTY_HINT_LOCALE_ID = 32,
    PROPERTY_HINT_LOCALIZABLE_STRING = 33,
    PROPERTY_HINT_NODE_TYPE = 34,
    PROPERTY_HINT_HIDE_QUATERNION_EDIT = 35,
    PROPERTY_HINT_PASSWORD = 36,
    PROPERTY_HINT_MAX = 37,
}
#enum PropertyUsageFlags
enum {
    PROPERTY_USAGE_NONE = 0,
    PROPERTY_USAGE_STORAGE = 2,
    PROPERTY_USAGE_EDITOR = 4,
    PROPERTY_USAGE_INTERNAL = 8,
    PROPERTY_USAGE_CHECKABLE = 16,
    PROPERTY_USAGE_CHECKED = 32,
    PROPERTY_USAGE_GROUP = 64,
    PROPERTY_USAGE_CATEGORY = 128,
    PROPERTY_USAGE_SUBGROUP = 256,
    PROPERTY_USAGE_CLASS_IS_BITFIELD = 512,
    PROPERTY_USAGE_NO_INSTANCE_STATE = 1024,
    PROPERTY_USAGE_RESTART_IF_CHANGED = 2048,
    PROPERTY_USAGE_SCRIPT_VARIABLE = 4096,
    PROPERTY_USAGE_STORE_IF_NULL = 8192,
    PROPERTY_USAGE_UPDATE_ALL_IF_MODIFIED = 16384,
    PROPERTY_USAGE_SCRIPT_DEFAULT_VALUE = 32768,
    PROPERTY_USAGE_CLASS_IS_ENUM = 65536,
    PROPERTY_USAGE_NIL_IS_VARIANT = 131072,
    PROPERTY_USAGE_ARRAY = 262144,
    PROPERTY_USAGE_ALWAYS_DUPLICATE = 524288,
    PROPERTY_USAGE_NEVER_DUPLICATE = 1048576,
    PROPERTY_USAGE_HIGH_END_GFX = 2097152,
    PROPERTY_USAGE_NODE_PATH_FROM_SCENE_ROOT = 4194304,
    PROPERTY_USAGE_RESOURCE_NOT_PERSISTENT = 8388608,
    PROPERTY_USAGE_KEYING_INCREMENTS = 16777216,
    PROPERTY_USAGE_DEFERRED_SET_RESOURCE = 33554432,
    PROPERTY_USAGE_EDITOR_INSTANTIATE_OBJECT = 67108864,
    PROPERTY_USAGE_EDITOR_BASIC_SETTING = 134217728,
    PROPERTY_USAGE_READ_ONLY = 268435456,
    PROPERTY_USAGE_DEFAULT = 6,
    PROPERTY_USAGE_NO_EDITOR = 2,
}
#enum MethodFlags
enum {
    METHOD_FLAG_NORMAL = 1,
    METHOD_FLAG_EDITOR = 2,
    METHOD_FLAG_CONST = 4,
    METHOD_FLAG_VIRTUAL = 8,
    METHOD_FLAG_VARARG = 16,
    METHOD_FLAG_STATIC = 32,
    METHOD_FLAG_OBJECT_CORE = 64,
    METHOD_FLAGS_DEFAULT = 1,
}
#enum Variant.Type
enum {
    TYPE_NIL = 0,
    TYPE_BOOL = 1,
    TYPE_INT = 2,
    TYPE_FLOAT = 3,
    TYPE_STRING = 4,
    TYPE_VECTOR2 = 5,
    TYPE_VECTOR2I = 6,
    TYPE_RECT2 = 7,
    TYPE_RECT2I = 8,
    TYPE_VECTOR3 = 9,
    TYPE_VECTOR3I = 10,
    TYPE_TRANSFORM2D = 11,
    TYPE_VECTOR4 = 12,
    TYPE_VECTOR4I = 13,
    TYPE_PLANE = 14,
    TYPE_QUATERNION = 15,
    TYPE_AABB = 16,
    TYPE_BASIS = 17,
    TYPE_TRANSFORM3D = 18,
    TYPE_PROJECTION = 19,
    TYPE_COLOR = 20,
    TYPE_STRING_NAME = 21,
    TYPE_NODE_PATH = 22,
    TYPE_RID = 23,
    TYPE_OBJECT = 24,
    TYPE_CALLABLE = 25,
    TYPE_SIGNAL = 26,
    TYPE_DICTIONARY = 27,
    TYPE_ARRAY = 28,
    TYPE_PACKED_BYTE_ARRAY = 29,
    TYPE_PACKED_INT32_ARRAY = 30,
    TYPE_PACKED_INT64_ARRAY = 31,
    TYPE_PACKED_FLOAT32_ARRAY = 32,
    TYPE_PACKED_FLOAT64_ARRAY = 33,
    TYPE_PACKED_STRING_ARRAY = 34,
    TYPE_PACKED_VECTOR2_ARRAY = 35,
    TYPE_PACKED_VECTOR3_ARRAY = 36,
    TYPE_PACKED_COLOR_ARRAY = 37,
    TYPE_MAX = 38,
}
#enum Variant.Operator
enum {
    OP_EQUAL = 0,
    OP_NOT_EQUAL = 1,
    OP_LESS = 2,
    OP_LESS_EQUAL = 3,
    OP_GREATER = 4,
    OP_GREATER_EQUAL = 5,
    OP_ADD = 6,
    OP_SUBTRACT = 7,
    OP_MULTIPLY = 8,
    OP_DIVIDE = 9,
    OP_NEGATE = 10,
    OP_POSITIVE = 11,
    OP_MODULE = 12,
    OP_POWER = 13,
    OP_SHIFT_LEFT = 14,
    OP_SHIFT_RIGHT = 15,
    OP_BIT_AND = 16,
    OP_BIT_OR = 17,
    OP_BIT_XOR = 18,
    OP_BIT_NEGATE = 19,
    OP_AND = 20,
    OP_OR = 21,
    OP_XOR = 22,
    OP_NOT = 23,
    OP_IN = 24,
    OP_MAX = 25,
}
#desc The [AudioServer] singleton.
var AudioServer: AudioServer

#desc The [CameraServer] singleton.
var CameraServer: CameraServer

#desc The [ClassDB] singleton.
var ClassDB: ClassDB

#desc The [DisplayServer] singleton.
var DisplayServer: DisplayServer

#desc The [Engine] singleton.
var Engine: Engine

#desc The [EngineDebugger] singleton.
var EngineDebugger: EngineDebugger

#desc The [GDExtensionManager] singleton.
var GDExtensionManager: GDExtensionManager

#desc The [Geometry2D] singleton.
var Geometry2D: Geometry2D

#desc The [Geometry3D] singleton.
var Geometry3D: Geometry3D

#desc The [GodotSharp] singleton.
var GodotSharp: GodotSharp

#desc The [IP] singleton.
var IP: IP

#desc The [Input] singleton.
var Input: Input

#desc The [InputMap] singleton.
var InputMap: InputMap

#desc The [JavaClassWrapper] singleton.
#desc [b]Note:[/b] Only implemented on Android.
var JavaClassWrapper: JavaClassWrapper

#desc The [JavaScriptBridge] singleton.
#desc [b]Note:[/b] Only implemented on the Web platform.
var JavaScriptBridge: JavaScriptBridge

#desc The [Marshalls] singleton.
var Marshalls: Marshalls

#desc The [NavigationMeshGenerator] singleton.
var NavigationMeshGenerator: NavigationMeshGenerator

#desc The [NavigationServer2D] singleton.
var NavigationServer2D: NavigationServer2D

#desc The [NavigationServer2D] singleton.
var NavigationServer3D: NavigationServer3D

#desc The [OS] singleton.
var OS: OS

#desc The [Performance] singleton.
var Performance: Performance

#desc The [PhysicsServer2D] singleton.
var PhysicsServer2D: PhysicsServer2D

#desc The [PhysicsServer2DManager] singleton.
var PhysicsServer2DManager: PhysicsServer2DManager

#desc The [PhysicsServer3D] singleton.
var PhysicsServer3D: PhysicsServer3D

#desc The [PhysicsServer3DManager] singleton.
var PhysicsServer3DManager: PhysicsServer3DManager

#desc The [ProjectSettings] singleton.
var ProjectSettings: ProjectSettings

#desc The [RenderingServer] singleton.
var RenderingServer: RenderingServer

#desc The [ResourceLoader] singleton.
var ResourceLoader: ResourceLoader

#desc The [ResourceSaver] singleton.
var ResourceSaver: ResourceSaver

#desc The [ResourceUID] singleton.
var ResourceUID: ResourceUID

#desc The [TextServerManager] singleton.
var TextServerManager: TextServerManager

#desc The [ThemeDB] singleton.
var ThemeDB: ThemeDB

#desc The [Time] singleton.
var Time: Time

#desc The [TranslationServer] singleton.
var TranslationServer: TranslationServer

#desc The [WorkerThreadPool] singleton.
var WorkerThreadPool: WorkerThreadPool

#desc The [XRServer] singleton.
var XRServer: XRServer



#desc Returns the absolute value of a [Variant] parameter [param x] (i.e. non-negative value). Supported types: [int], [float], [Vector2], [Vector2i], [Vector3], [Vector3i], [Vector4], [Vector4i].
#desc [codeblock]
#desc var a = abs(-1)
#desc # a is 1
#desc 
#desc var b = abs(-1.2)
#desc # b is 1.2
#desc 
#desc var c = abs(Vector2(-3.5, -4))
#desc # c is (3.5, 4)
#desc 
#desc var d = abs(Vector2i(-5, -6))
#desc # d is (5, 6)
#desc 
#desc var e = abs(Vector3(-7, 8.5, -3.8))
#desc # e is (7, 8.5, 3.8)
#desc 
#desc var f = abs(Vector3i(-7, -8, -9))
#desc # f is (7, 8, 9)
#desc [/codeblock]
#desc [b]Note:[/b] For better type safety, use [method absf], [method absi], [method Vector2.abs], [method Vector2i.abs], [method Vector3.abs], [method Vector3i.abs], [method Vector4.abs], or [method Vector4i.abs].
func abs(x: Variant) -> Variant:
	pass;

#desc Returns the absolute value of float parameter [param x] (i.e. positive value).
#desc [codeblock]
#desc # a is 1.2
#desc var a = absf(-1.2)
#desc [/codeblock]
func absf(x: float) -> float:
	pass;

#desc Returns the absolute value of int parameter [param x] (i.e. positive value).
#desc [codeblock]
#desc # a is 1
#desc var a = absi(-1)
#desc [/codeblock]
func absi(x: int) -> int:
	pass;

#desc Returns the arc cosine of [param x] in radians. Use to get the angle of cosine [param x]. [param x] will be clamped between [code]-1.0[/code] and [code]1.0[/code] (inclusive), in order to prevent [method acos] from returning [constant @GDScript.NAN].
#desc [codeblock]
#desc # c is 0.523599 or 30 degrees if converted with rad_to_deg(c)
#desc var c = acos(0.866025)
#desc [/codeblock]
func acos(x: float) -> float:
	pass;

#desc Returns the arc sine of [param x] in radians. Use to get the angle of sine [param x]. [param x] will be clamped between [code]-1.0[/code] and [code]1.0[/code] (inclusive), in order to prevent [method asin] from returning [constant @GDScript.NAN].
#desc [codeblock]
#desc # s is 0.523599 or 30 degrees if converted with rad_to_deg(s)
#desc var s = asin(0.5)
#desc [/codeblock]
func asin(x: float) -> float:
	pass;

#desc Returns the arc tangent of [param x] in radians. Use it to get the angle from an angle's tangent in trigonometry.
#desc The method cannot know in which quadrant the angle should fall. See [method atan2] if you have both [code]y[/code] and [code]x[/code].
#desc [codeblock]
#desc var a = atan(0.5) # a is 0.463648
#desc [/codeblock]
#desc If [param x] is between [code]-PI / 2[/code] and [code]PI / 2[/code] (inclusive), [code]atan(tan(x))[/code] is equal to [param x].
func atan(x: float) -> float:
	pass;

#desc Returns the arc tangent of [code]y/x[/code] in radians. Use to get the angle of tangent [code]y/x[/code]. To compute the value, the method takes into account the sign of both arguments in order to determine the quadrant.
#desc Important note: The Y coordinate comes first, by convention.
#desc [codeblock]
#desc var a = atan2(0, -1) # a is 3.141593
#desc [/codeblock]
func atan2(y: float, x: float) -> float:
	pass;

#desc Returns the derivative at the given [param t] on a one-dimensional [url=https://en.wikipedia.org/wiki/B%C3%A9zier_curve]Bézier curve[/url] defined by the given [param control_1], [param control_2], and [param end] points.
func bezier_derivative(start: float, control_1: float, control_2: float, end: float, t: float) -> float:
	pass;

#desc Returns the point at the given [param t] on a one-dimensional [url=https://en.wikipedia.org/wiki/B%C3%A9zier_curve]Bézier curve[/url] defined by the given [param control_1], [param control_2], and [param end] points.
func bezier_interpolate(start: float, control_1: float, control_2: float, end: float, t: float) -> float:
	pass;

#desc Decodes a byte array back to a [Variant] value, without decoding objects.
#desc [b]Note:[/b] If you need object deserialization, see [method bytes_to_var_with_objects].
func bytes_to_var(bytes: PackedByteArray) -> Variant:
	pass;

#desc Decodes a byte array back to a [Variant] value. Decoding objects is allowed.
#desc [b]Warning:[/b] Deserialized object can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats (remote code execution).
func bytes_to_var_with_objects(bytes: PackedByteArray) -> Variant:
	pass;

#desc Rounds [param x] upward (towards positive infinity), returning the smallest whole number that is not less than [param x]. Supported types: [int], [float], [Vector2], [Vector3], [Vector4].
#desc [codeblock]
#desc var i = ceil(1.45) # i is 2.0
#desc i = ceil(1.001)    # i is 2.0
#desc [/codeblock]
#desc See also [method floor], [method round], and [method snapped].
#desc [b]Note:[/b] For better type safety, use [method ceilf], [method ceili], [method Vector2.ceil], [method Vector3.ceil], or [method Vector4.ceil].
func ceil(x: Variant) -> Variant:
	pass;

#desc Rounds [param x] upward (towards positive infinity), returning the smallest whole number that is not less than [param x].
#desc A type-safe version of [method ceil], returning a [float].
func ceilf(x: float) -> float:
	pass;

#desc Rounds [param x] upward (towards positive infinity), returning the smallest whole number that is not less than [param x].
#desc A type-safe version of [method ceil], returning an [int].
func ceili(x: float) -> int:
	pass;

#desc Clamps the [param value], returning a [Variant] not less than [param min] and not more than [param max]. Supported types: [int], [float], [Vector2], [Vector2i], [Vector3], [Vector3i], [Vector4], [Vector4i].
#desc [codeblock]
#desc var a = clamp(-10, -1, 5)
#desc # a is -1
#desc 
#desc var b = clamp(8.1, 0.9, 5.5)
#desc # b is 5.5
#desc 
#desc var c = clamp(Vector2(-3.5, -4), Vector2(-3.2, -2), Vector2(2, 6.5))
#desc # c is (-3.2, -2)
#desc 
#desc var d = clamp(Vector2i(7, 8), Vector2i(-3, -2), Vector2i(2, 6))
#desc # d is (2, 6)
#desc 
#desc var e = clamp(Vector3(-7, 8.5, -3.8), Vector3(-3, -2, 5.4), Vector3(-2, 6, -4.1))
#desc # e is (-3, -2, 5.4)
#desc 
#desc var f = clamp(Vector3i(-7, -8, -9), Vector3i(-1, 2, 3), Vector3i(-4, -5, -6))
#desc # f is (-4, -5, -6)
#desc [/codeblock]
#desc [b]Note:[/b] For better type safety, use [method clampf], [method clampi], [method Vector2.clamp], [method Vector2i.clamp], [method Vector3.clamp], [method Vector3i.clamp], [method Vector4.clamp], or [method Vector4i.clamp].
func clamp(value: Variant, min: Variant, max: Variant) -> Variant:
	pass;

#desc Clamps the [param value], returning a [float] not less than [param min] and not more than [param max].
#desc [codeblock]
#desc var speed = 42.1
#desc var a = clampf(speed, 1.0, 20.5) # a is 20.5
#desc 
#desc speed = -10.0
#desc var b = clampf(speed, -1.0, 1.0) # b is -1.0
#desc [/codeblock]
func clampf(value: float, min: float, max: float) -> float:
	pass;

#desc Clamps the [param value], returning an [int] not less than [param min] and not more than [param max].
#desc [codeblock]
#desc var speed = 42
#desc var a = clampi(speed, 1, 20) # a is 20
#desc 
#desc speed = -10
#desc var b = clampi(speed, -1, 1) # b is -1
#desc [/codeblock]
func clampi(value: int, min: int, max: int) -> int:
	pass;

#desc Returns the cosine of angle [param angle_rad] in radians.
#desc [codeblock]
#desc cos(PI * 2)         # Returns 1.0
#desc cos(PI)             # Returns -1.0
#desc cos(deg_to_rad(90)) # Returns 0.0
#desc [/codeblock]
func cos(angle_rad: float) -> float:
	pass;

#desc Returns the hyperbolic cosine of [param x] in radians.
#desc [codeblock]
#desc print(cosh(1)) # Prints 1.543081
#desc [/codeblock]
func cosh(x: float) -> float:
	pass;

#desc Cubic interpolates between two values by the factor defined in [param weight] with [param pre] and [param post] values.
func cubic_interpolate(from: float, to: float, pre: float, post: float, weight: float) -> float:
	pass;

#desc Cubic interpolates between two rotation values with shortest path by the factor defined in [param weight] with [param pre] and [param post] values. See also [method lerp_angle].
func cubic_interpolate_angle(from: float, to: float, pre: float, post: float, weight: float) -> float:
	pass;

#desc Cubic interpolates between two rotation values with shortest path by the factor defined in [param weight] with [param pre] and [param post] values. See also [method lerp_angle].
#desc It can perform smoother interpolation than [code]cubic_interpolate()[/code] by the time values.
func cubic_interpolate_angle_in_time(from: float, to: float, pre: float, post: float, weight: float, to_t: float, pre_t: float, post_t: float) -> float:
	pass;

#desc Cubic interpolates between two values by the factor defined in [param weight] with [param pre] and [param post] values.
#desc It can perform smoother interpolation than [method cubic_interpolate] by the time values.
func cubic_interpolate_in_time(from: float, to: float, pre: float, post: float, weight: float, to_t: float, pre_t: float, post_t: float) -> float:
	pass;

#desc Converts from decibels to linear energy (audio).
func db_to_linear(db: float) -> float:
	pass;

#desc Converts an angle expressed in degrees to radians.
#desc [codeblock]
#desc var r = deg_to_rad(180) # r is 3.141593
#desc [/codeblock]
func deg_to_rad(deg: float) -> float:
	pass;

#desc Returns an "eased" value of [param x] based on an easing function defined with [param curve]. This easing function is based on an exponent. The [param curve] can be any floating-point number, with specific values leading to the following behaviors:
#desc [codeblock]
#desc - Lower than -1.0 (exclusive): Ease in-out
#desc - 1.0: Linear
#desc - Between -1.0 and 0.0 (exclusive): Ease out-in
#desc - 0.0: Constant
#desc - Between 0.0 to 1.0 (exclusive): Ease out
#desc - 1.0: Linear
#desc - Greater than 1.0 (exclusive): Ease in
#desc [/codeblock]
#desc [url=https://raw.githubusercontent.com/godotengine/godot-docs/master/img/ease_cheatsheet.png]ease() curve values cheatsheet[/url]
#desc See also [method smoothstep]. If you need to perform more advanced transitions, use [method Tween.interpolate_value].
func ease(x: float, curve: float) -> float:
	pass;

#desc Returns a human-readable name for the given [enum Error] code.
#desc [codeblock]
#desc print(OK)                              # Prints 0
#desc print(error_string(OK))                # Prints OK
#desc print(error_string(ERR_BUSY))          # Prints Busy
#desc print(error_string(ERR_OUT_OF_MEMORY)) # Prints Out of memory
#desc [/codeblock]
func error_string(error: int) -> String:
	pass;

#desc The natural exponential function. It raises the mathematical constant [b]e[/b] to the power of [param x] and returns it.
#desc [b]e[/b] has an approximate value of 2.71828, and can be obtained with [code]exp(1)[/code].
#desc For exponents to other bases use the method [method pow].
#desc [codeblock]
#desc var a = exp(2) # Approximately 7.39
#desc [/codeblock]
func exp(x: float) -> float:
	pass;

#desc Rounds [param x] downward (towards negative infinity), returning the largest whole number that is not more than [param x]. Supported types: [int], [float], [Vector2], [Vector3], [Vector4].
#desc [codeblock]
#desc var a = floor(2.99) # a is 2.0
#desc a = floor(-2.99)    # a is -3.0
#desc [/codeblock]
#desc See also [method ceil], [method round], and [method snapped].
#desc [b]Note:[/b] For better type safety, use [method floorf], [method floori], [method Vector2.floor], [method Vector3.floor], or [method Vector4.floor].
func floor(x: Variant) -> Variant:
	pass;

#desc Rounds [param x] downward (towards negative infinity), returning the largest whole number that is not more than [param x].
#desc A type-safe version of [method floor], returning a [float].
func floorf(x: float) -> float:
	pass;

#desc Rounds [param x] downward (towards negative infinity), returning the largest whole number that is not more than [param x].
#desc A type-safe version of [method floor], returning an [int].
#desc [b]Note:[/b] This function is [i]not[/i] the same as [code]int(x)[/code], which rounds towards 0.
func floori(x: float) -> int:
	pass;

#desc Returns the floating-point remainder of [param x] divided by [param y], keeping the sign of [param x].
#desc [codeblock]
#desc var remainder = fmod(7, 5.5) # remainder is 1.5
#desc [/codeblock]
#desc For the integer remainder operation, use the [code]%[/code] operator.
func fmod(x: float, y: float) -> float:
	pass;

#desc Returns the floating-point modulus of [param x] divided by [param y], wrapping equally in positive and negative.
#desc [codeblock]
#desc print(" (x)  (fmod(x, 1.5))   (fposmod(x, 1.5))")
#desc for i in 7:
#desc var x = i * 0.5 - 1.5
#desc print("%4.1f           %4.1f  | %4.1f" % [x, fmod(x, 1.5), fposmod(x, 1.5)])
#desc [/codeblock]
#desc Produces:
#desc [codeblock]
#desc (x)  (fmod(x, 1.5))   (fposmod(x, 1.5))
#desc -1.5           -0.0  |  0.0
#desc -1.0           -1.0  |  0.5
#desc -0.5           -0.5  |  1.0
#desc 0.0            0.0  |  0.0
#desc 0.5            0.5  |  0.5
#desc 1.0            1.0  |  1.0
#desc 1.5            0.0  |  0.0
#desc [/codeblock]
func fposmod(x: float, y: float) -> float:
	pass;

#desc Returns the integer hash of the passed [param variable].
#desc [codeblocks]
#desc [gdscript]
#desc print(hash("a")) # Prints 177670
#desc [/gdscript]
#desc [csharp]
#desc GD.Print(GD.Hash("a")); // Prints 177670
#desc [/csharp]
#desc [/codeblocks]
func hash(variable: Variant) -> int:
	pass;

#desc Returns the [Object] that corresponds to [param instance_id]. All Objects have a unique instance ID. See also [method Object.get_instance_id].
#desc [codeblocks]
#desc [gdscript]
#desc var foo = "bar"
#desc 
#desc func _ready():
#desc var id = get_instance_id()
#desc var inst = instance_from_id(id)
#desc print(inst.foo) # Prints bar
#desc [/gdscript]
#desc [csharp]
#desc public partial class MyNode : Node
#desc {
#desc public string Foo { get; set; } = "bar";
#desc 
#desc public override void _Ready()
#desc {
#desc ulong id = GetInstanceId();
#desc var inst = (MyNode)InstanceFromId(Id);
#desc GD.Print(inst.Foo); // Prints bar
#desc }
#desc }
#desc [/csharp]
#desc [/codeblocks]
func instance_from_id(instance_id: int) -> Object:
	pass;

#desc Returns an interpolation or extrapolation factor considering the range specified in [param from] and [param to], and the interpolated value specified in [param weight]. The returned value will be between [code]0.0[/code] and [code]1.0[/code] if [param weight] is between [param from] and [param to] (inclusive). If [param weight] is located outside this range, then an extrapolation factor will be returned (return value lower than [code]0.0[/code] or greater than [code]1.0[/code]). Use [method clamp] on the result of [method inverse_lerp] if this is not desired.
#desc [codeblock]
#desc # The interpolation ratio in the `lerp()` call below is 0.75.
#desc var middle = lerp(20, 30, 0.75)
#desc # middle is now 27.5.
#desc 
#desc # Now, we pretend to have forgotten the original ratio and want to get it back.
#desc var ratio = inverse_lerp(20, 30, 27.5)
#desc # ratio is now 0.75.
#desc [/codeblock]
#desc See also [method lerp], which performs the reverse of this operation, and [method remap] to map a continuous series of values to another.
func inverse_lerp(from: float, to: float, weight: float) -> float:
	pass;

#desc Returns [code]true[/code] if [param a] and [param b] are approximately equal to each other.
#desc Here, "approximately equal" means that [param a] and [param b] are within a small internal epsilon of each other, which scales with the magnitude of the numbers.
#desc Infinity values of the same sign are considered equal.
func is_equal_approx(a: float, b: float) -> bool:
	pass;

#desc Returns whether [param x] is a finite value, i.e. it is not [constant @GDScript.NAN], positive infinity, or negative infinity.
func is_finite(x: float) -> bool:
	pass;

#desc Returns [code]true[/code] if [param x] is either positive infinity or negative infinity.
func is_inf(x: float) -> bool:
	pass;

#desc Returns [code]true[/code] if the Object that corresponds to [param id] is a valid object (e.g. has not been deleted from memory). All Objects have a unique instance ID.
func is_instance_id_valid(id: int) -> bool:
	pass;

#desc Returns [code]true[/code] if [param instance] is a valid Object (e.g. has not been deleted from memory).
func is_instance_valid(instance: Variant) -> bool:
	pass;

#desc Returns [code]true[/code] if [param x] is a NaN ("Not a Number" or invalid) value.
func is_nan(x: float) -> bool:
	pass;

#desc Returns [code]true[/code], for value types, if [param a] and [param b] share the same value. Returns [code]true[/code], for reference types, if the references of [param a] and [param b] are the same.
#desc [codeblock]
#desc # Vector2 is a value type
#desc var vec2_a = Vector2(0, 0)
#desc var vec2_b = Vector2(0, 0)
#desc var vec2_c = Vector2(1, 1)
#desc is_same(vec2_a, vec2_a)  # true
#desc is_same(vec2_a, vec2_b)  # true
#desc is_same(vec2_a, vec2_c)  # false
#desc 
#desc # Array is a reference type
#desc var arr_a = []
#desc var arr_b = []
#desc is_same(arr_a, arr_a)  # true
#desc is_same(arr_a, arr_b)  # false
#desc [/codeblock]
#desc These are [Variant] value types: [code]null[/code], [bool], [int], [float], [String], [StringName], [Vector2], [Vector2i], [Vector3], [Vector3i], [Vector4], [Vector4i], [Rect2], [Rect2i], [Transform2D], [Transform3D], [Plane], [Quaternion], [AABB], [Basis], [Projection], [Color], [NodePath], [RID], [Callable] and [Signal].
#desc These are [Variant] reference types: [Object], [Dictionary], [Array], [PackedByteArray], [PackedInt32Array], [PackedInt64Array], [PackedFloat32Array], [PackedFloat64Array], [PackedStringArray], [PackedVector2Array], [PackedVector3Array] and [PackedColorArray].
func is_same(a: Variant, b: Variant) -> bool:
	pass;

#desc Returns [code]true[/code] if [param x] is zero or almost zero. The comparison is done using a tolerance calculation with a small internal epsilon.
#desc This function is faster than using [method is_equal_approx] with one value as zero.
func is_zero_approx(x: float) -> bool:
	pass;

#desc Linearly interpolates between two values by the factor defined in [param weight]. To perform interpolation, [param weight] should be between [code]0.0[/code] and [code]1.0[/code] (inclusive). However, values outside this range are allowed and can be used to perform [i]extrapolation[/i]. If this is not desired, use [method clamp] on the result of this function.
#desc Both [param from] and [param to] must be the same type. Supported types: [int], [float], [Vector2], [Vector3], [Vector4], [Color], [Quaternion], [Basis].
#desc [codeblock]
#desc lerp(0, 4, 0.75) # Returns 3.0
#desc [/codeblock]
#desc See also [method inverse_lerp] which performs the reverse of this operation. To perform eased interpolation with [method lerp], combine it with [method ease] or [method smoothstep]. See also [method remap] to map a continuous series of values to another.
#desc [b]Note:[/b] For better type safety, use [method lerpf], [method Vector2.lerp], [method Vector3.lerp], [method Vector4.lerp], [method Color.lerp], [method Quaternion.slerp] or [method Basis.slerp].
func lerp(from: Variant, to: Variant, weight: Variant) -> Variant:
	pass;

#desc Linearly interpolates between two angles (in radians) by a [param weight] value between 0.0 and 1.0.
#desc Similar to [method lerp], but interpolates correctly when the angles wrap around [constant @GDScript.TAU]. To perform eased interpolation with [method lerp_angle], combine it with [method ease] or [method smoothstep].
#desc [codeblock]
#desc extends Sprite
#desc var elapsed = 0.0
#desc func _process(delta):
#desc var min_angle = deg_to_rad(0.0)
#desc var max_angle = deg_to_rad(90.0)
#desc rotation = lerp_angle(min_angle, max_angle, elapsed)
#desc elapsed += delta
#desc [/codeblock]
#desc [b]Note:[/b] This function lerps through the shortest path between [param from] and [param to]. However, when these two angles are approximately [code]PI + k * TAU[/code] apart for any integer [code]k[/code], it's not obvious which way they lerp due to floating-point precision errors. For example, [code]lerp_angle(0, PI, weight)[/code] lerps counter-clockwise, while [code]lerp_angle(0, PI + 5 * TAU, weight)[/code] lerps clockwise.
func lerp_angle(from: float, to: float, weight: float) -> float:
	pass;

#desc Linearly interpolates between two values by the factor defined in [param weight]. To perform interpolation, [param weight] should be between [code]0.0[/code] and [code]1.0[/code] (inclusive). However, values outside this range are allowed and can be used to perform [i]extrapolation[/i]. If this is not desired, use [method clampf] on the result of this function.
#desc [codeblock]
#desc lerpf(0, 4, 0.75) # Returns 3.0
#desc [/codeblock]
#desc See also [method inverse_lerp] which performs the reverse of this operation. To perform eased interpolation with [method lerp], combine it with [method ease] or [method smoothstep].
func lerpf(from: float, to: float, weight: float) -> float:
	pass;

#desc Converts from linear energy to decibels (audio). This can be used to implement volume sliders that behave as expected (since volume isn't linear).
#desc [b]Example:[/b]
#desc [codeblock]
#desc # "Slider" refers to a node that inherits Range such as HSlider or VSlider.
#desc # Its range must be configured to go from 0 to 1.
#desc # Change the bus name if you'd like to change the volume of a specific bus only.
#desc AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db($Slider.value))
#desc [/codeblock]
func linear_to_db(lin: float) -> float:
	pass;

#desc Returns the [url=https://en.wikipedia.org/wiki/Natural_logarithm]natural logarithm[/url] of [param x] (base [url=https://en.wikipedia.org/wiki/E_(mathematical_constant)][i]e[/i][/url], with [i]e[/i] being approximately 2.71828). This is the amount of time needed to reach a certain level of continuous growth.
#desc [b]Note:[/b] This is not the same as the "log" function on most calculators, which uses a base 10 logarithm. To use base 10 logarithm, use [code]log(x) / log(10)[/code].
#desc [codeblock]
#desc log(10) # Returns 2.302585
#desc [/codeblock]
#desc [b]Note:[/b] The logarithm of [code]0[/code] returns [code]-inf[/code], while negative values return [code]-nan[/code].
func log(x: float) -> float:
	pass;

#desc Returns the maximum of the given numeric values. This function can take any number of arguments.
#desc [codeblock]
#desc max(1, 7, 3, -6, 5) # Returns 7
#desc [/codeblock]
vararg func max() -> Variant:
	pass;

#desc Returns the maximum of two [float] values.
#desc [codeblock]
#desc maxf(3.6, 24)   # Returns 24.0
#desc maxf(-3.99, -4) # Returns -3.99
#desc [/codeblock]
func maxf(a: float, b: float) -> float:
	pass;

#desc Returns the maximum of two [int] values.
#desc [codeblock]
#desc maxi(1, 2)   # Returns 2
#desc maxi(-3, -4) # Returns -3
#desc [/codeblock]
func maxi(a: int, b: int) -> int:
	pass;

#desc Returns the minimum of the given numeric values. This function can take any number of arguments.
#desc [codeblock]
#desc min(1, 7, 3, -6, 5) # Returns -6
#desc [/codeblock]
vararg func min() -> Variant:
	pass;

#desc Returns the minimum of two [float] values.
#desc [codeblock]
#desc minf(3.6, 24)   # Returns 3.6
#desc minf(-3.99, -4) # Returns -4.0
#desc [/codeblock]
func minf(a: float, b: float) -> float:
	pass;

#desc Returns the minimum of two [int] values.
#desc [codeblock]
#desc mini(1, 2)   # Returns 1
#desc mini(-3, -4) # Returns -4
#desc [/codeblock]
func mini(a: int, b: int) -> int:
	pass;

#desc Moves [param from] toward [param to] by the [param delta] value.
#desc Use a negative [param delta] value to move away.
#desc [codeblock]
#desc move_toward(5, 10, 4)    # Returns 9
#desc move_toward(10, 5, 4)    # Returns 6
#desc move_toward(10, 5, -1.5) # Returns 11.5
#desc [/codeblock]
func move_toward(from: float, to: float, delta: float) -> float:
	pass;

#desc Returns the nearest equal or larger power of 2 for the integer [param value].
#desc In other words, returns the smallest value [code]a[/code] where [code]a = pow(2, n)[/code] such that [code]value <= a[/code] for some non-negative integer [code]n[/code].
#desc [codeblock]
#desc nearest_po2(3) # Returns 4
#desc nearest_po2(4) # Returns 4
#desc nearest_po2(5) # Returns 8
#desc 
#desc nearest_po2(0)  # Returns 0 (this may not be expected)
#desc nearest_po2(-1) # Returns 0 (this may not be expected)
#desc [/codeblock]
#desc [b]Warning:[/b] Due to the way it is implemented, this function returns [code]0[/code] rather than [code]1[/code] for negative values of [param value] (in reality, 1 is the smallest integer power of 2).
func nearest_po2(value: int) -> int:
	pass;

#desc Wraps [param value] between [code]0[/code] and the [param length]. If the limit is reached, the next value the function returns is decreased to the [code]0[/code] side or increased to the [param length] side (like a triangle wave). If [param length] is less than zero, it becomes positive.
#desc [codeblock]
#desc pingpong(-3.0, 3.0) # Returns 3.0
#desc pingpong(-2.0, 3.0) # Returns 2.0
#desc pingpong(-1.0, 3.0) # Returns 1.0
#desc pingpong(0.0, 3.0)  # Returns 0.0
#desc pingpong(1.0, 3.0)  # Returns 1.0
#desc pingpong(2.0, 3.0)  # Returns 2.0
#desc pingpong(3.0, 3.0)  # Returns 3.0
#desc pingpong(4.0, 3.0)  # Returns 2.0
#desc pingpong(5.0, 3.0)  # Returns 1.0
#desc pingpong(6.0, 3.0)  # Returns 0.0
#desc [/codeblock]
func pingpong(value: float, length: float) -> float:
	pass;

#desc Returns the integer modulus of [param x] divided by [param y] that wraps equally in positive and negative.
#desc [codeblock]
#desc print("#(i)  (i % 3)   (posmod(i, 3))")
#desc for i in range(-3, 4):
#desc print("%2d       %2d  | %2d" % [i, i % 3, posmod(i, 3)])
#desc [/codeblock]
#desc Produces:
#desc [codeblock]
#desc (i)  (i % 3)   (posmod(i, 3))
#desc -3        0  |  0
#desc -2       -2  |  1
#desc -1       -1  |  2
#desc 0        0  |  0
#desc 1        1  |  1
#desc 2        2  |  2
#desc 3        0  |  0
#desc [/codeblock]
func posmod(x: int, y: int) -> int:
	pass;

#desc Returns the result of [param base] raised to the power of [param exp].
#desc In GDScript, this is the equivalent of the [code]**[/code] operator.
#desc [codeblock]
#desc pow(2, 5)   # Returns 32.0
#desc pow(4, 1.5) # Returns 8.0
#desc [/codeblock]
func pow(base: float, exp: float) -> float:
	pass;

#desc Converts one or more arguments of any type to string in the best way possible and prints them to the console.
#desc [codeblocks]
#desc [gdscript]
#desc var a = [1, 2, 3]
#desc print("a", "b", a) # Prints ab[1, 2, 3]
#desc [/gdscript]
#desc [csharp]
#desc var a = new Godot.Collections.Array { 1, 2, 3 };
#desc GD.Print("a", "b", a); // Prints ab[1, 2, 3]
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] Consider using [method push_error] and [method push_warning] to print error and warning messages instead of [method print] or [method print_rich]. This distinguishes them from print messages used for debugging purposes, while also displaying a stack trace when an error or warning is printed.
vararg func print() -> void:
	pass;

#desc Converts one or more arguments of any type to string in the best way possible and prints them to the console.
#desc The following BBCode tags are supported: [code]b[/code], [code]i[/code], [code]u[/code], [code]s[/code], [code]indent[/code], [code]code[/code], [code]url[/code], [code]center[/code], [code]right[/code], [code]color[/code], [code]bgcolor[/code], [code]fgcolor[/code].
#desc Color tags only support the following named colors: [code]black[/code], [code]red[/code], [code]green[/code], [code]yellow[/code], [code]blue[/code], [code]magenta[/code], [code]pink[/code], [code]purple[/code], [code]cyan[/code], [code]white[/code], [code]orange[/code], [code]gray[/code]. Hexadecimal color codes are not supported.
#desc URL tags only support URLs wrapped by an URL tag, not URLs with a different title.
#desc When printing to standard output, the supported subset of BBCode is converted to ANSI escape codes for the terminal emulator to display. Support for ANSI escape codes varies across terminal emulators, especially for italic and strikethrough. In standard output, [code]code[/code] is represented with faint text but without any font change. Unsupported tags are left as-is in standard output.
#desc [codeblocks]
#desc [gdscript]
#desc print_rich("[color=green][b]Hello world![/b][/color]") # Prints out "Hello world!" in green with a bold font
#desc [/gdscript]
#desc [csharp]
#desc GD.PrintRich("[color=green][b]Hello world![/b][/color]"); // Prints out "Hello world!" in green with a bold font
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] Consider using [method push_error] and [method push_warning] to print error and warning messages instead of [method print] or [method print_rich]. This distinguishes them from print messages used for debugging purposes, while also displaying a stack trace when an error or warning is printed.
#desc [b]Note:[/b] On Windows, only Windows 10 and later correctly displays ANSI escape codes in standard output.
vararg func print_rich() -> void:
	pass;

#desc If verbose mode is enabled ([method OS.is_stdout_verbose] returning [code]true[/code]), converts one or more arguments of any type to string in the best way possible and prints them to the console.
vararg func print_verbose() -> void:
	pass;

#desc Prints one or more arguments to strings in the best way possible to standard error line.
#desc [codeblocks]
#desc [gdscript]
#desc printerr("prints to stderr")
#desc [/gdscript]
#desc [csharp]
#desc GD.PrintErr("prints to stderr");
#desc [/csharp]
#desc [/codeblocks]
vararg func printerr() -> void:
	pass;

#desc Prints one or more arguments to strings in the best way possible to the OS terminal. Unlike [method print], no newline is automatically added at the end.
#desc [codeblocks]
#desc [gdscript]
#desc printraw("A")
#desc printraw("B")
#desc printraw("C")
#desc # Prints ABC to terminal
#desc [/gdscript]
#desc [csharp]
#desc GD.PrintRaw("A");
#desc GD.PrintRaw("B");
#desc GD.PrintRaw("C");
#desc // Prints ABC to terminal
#desc [/csharp]
#desc [/codeblocks]
vararg func printraw() -> void:
	pass;

#desc Prints one or more arguments to the console with a space between each argument.
#desc [codeblocks]
#desc [gdscript]
#desc prints("A", "B", "C") # Prints A B C
#desc [/gdscript]
#desc [csharp]
#desc GD.PrintS("A", "B", "C"); // Prints A B C
#desc [/csharp]
#desc [/codeblocks]
vararg func prints() -> void:
	pass;

#desc Prints one or more arguments to the console with a tab between each argument.
#desc [codeblocks]
#desc [gdscript]
#desc printt("A", "B", "C") # Prints A       B       C
#desc [/gdscript]
#desc [csharp]
#desc GD.PrintT("A", "B", "C"); // Prints A       B       C
#desc [/csharp]
#desc [/codeblocks]
vararg func printt() -> void:
	pass;

#desc Pushes an error message to Godot's built-in debugger and to the OS terminal.
#desc [codeblocks]
#desc [gdscript]
#desc push_error("test error") # Prints "test error" to debugger and terminal as error call
#desc [/gdscript]
#desc [csharp]
#desc GD.PushError("test error"); // Prints "test error" to debugger and terminal as error call
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] This function does not pause project execution. To print an error message and pause project execution in debug builds, use [code]assert(false, "test error")[/code] instead.
vararg func push_error() -> void:
	pass;

#desc Pushes a warning message to Godot's built-in debugger and to the OS terminal.
#desc [codeblocks]
#desc [gdscript]
#desc push_warning("test warning") # Prints "test warning" to debugger and terminal as warning call
#desc [/gdscript]
#desc [csharp]
#desc GD.PushWarning("test warning"); // Prints "test warning" to debugger and terminal as warning call
#desc [/csharp]
#desc [/codeblocks]
vararg func push_warning() -> void:
	pass;

#desc Converts an angle expressed in radians to degrees.
#desc [codeblock]
#desc rad_to_deg(0.523599) # Returns 30
#desc rad_to_deg(PI)       # Returns 180
#desc rad_to_deg(PI * 2)   # Returns 360
#desc [/codeblock]
func rad_to_deg(rad: float) -> float:
	pass;

#desc Given a [param seed], returns a [PackedInt64Array] of size [code]2[/code], where its first element is the randomized [int] value, and the second element is the same as [param seed]. Passing the same [param seed] consistently returns the same array.
#desc [b]Note:[/b] "Seed" here refers to the internal state of the pseudo random number generator, currently implemented as a 64 bit integer.
#desc [codeblock]
#desc var a = rand_from_seed(4)
#desc 
#desc print(a[0])	# Prints 2879024997
#desc print(a[1])	# Prints 4
#desc [/codeblock]
func rand_from_seed(seed: int) -> PackedInt64Array:
	pass;

#desc Returns a random floating point value between [code]0.0[/code] and [code]1.0[/code] (inclusive).
#desc [codeblocks]
#desc [gdscript]
#desc randf() # Returns e.g. 0.375671
#desc [/gdscript]
#desc [csharp]
#desc GD.Randf(); // Returns e.g. 0.375671
#desc [/csharp]
#desc [/codeblocks]
func randf() -> float:
	pass;

#desc Returns a random floating point value between [param from] and [param to] (inclusive).
#desc [codeblocks]
#desc [gdscript]
#desc randf_range(0, 20.5) # Returns e.g. 7.45315
#desc randf_range(-10, 10) # Returns e.g. -3.844535
#desc [/gdscript]
#desc [csharp]
#desc GD.RandRange(0.0, 20.5);   // Returns e.g. 7.45315
#desc GD.RandRange(-10.0, 10.0); // Returns e.g. -3.844535
#desc [/csharp]
#desc [/codeblocks]
func randf_range(from: float, to: float) -> float:
	pass;

#desc Returns a normally-distributed pseudo-random floating point value using Box-Muller transform with the specified [param mean] and a standard [param deviation]. This is also called Gaussian distribution.
func randfn(mean: float, deviation: float) -> float:
	pass;

#desc Returns a random unsigned 32-bit integer. Use remainder to obtain a random value in the interval [code][0, N - 1][/code] (where N is smaller than 2^32).
#desc [codeblocks]
#desc [gdscript]
#desc randi()           # Returns random integer between 0 and 2^32 - 1
#desc randi() % 20      # Returns random integer between 0 and 19
#desc randi() % 100     # Returns random integer between 0 and 99
#desc randi() % 100 + 1 # Returns random integer between 1 and 100
#desc [/gdscript]
#desc [csharp]
#desc GD.Randi();           // Returns random integer between 0 and 2^32 - 1
#desc GD.Randi() % 20;      // Returns random integer between 0 and 19
#desc GD.Randi() % 100;     // Returns random integer between 0 and 99
#desc GD.Randi() % 100 + 1; // Returns random integer between 1 and 100
#desc [/csharp]
#desc [/codeblocks]
func randi() -> int:
	pass;

#desc Returns a random signed 32-bit integer between [param from] and [param to] (inclusive). If [param to] is lesser than [param from], they are swapped.
#desc [codeblocks]
#desc [gdscript]
#desc randi_range(0, 1)      # Returns either 0 or 1
#desc randi_range(-10, 1000) # Returns random integer between -10 and 1000
#desc [/gdscript]
#desc [csharp]
#desc GD.RandRange(0, 1);      // Returns either 0 or 1
#desc GD.RandRange(-10, 1000); // Returns random integer between -10 and 1000
#desc [/csharp]
#desc [/codeblocks]
func randi_range(from: int, to: int) -> int:
	pass;

#desc Randomizes the seed (or the internal state) of the random number generator. The current implementation uses a number based on the device's time.
#desc [b]Note:[/b] This function is called automatically when the project is run. If you need to fix the seed to have consistent, reproducible results, use [method seed] to initialize the random number generator.
func randomize() -> void:
	pass;

#desc Maps a [param value] from range [code][istart, istop][/code] to [code][ostart, ostop][/code]. See also [method lerp] and [method inverse_lerp]. If [param value] is outside [code][istart, istop][/code], then the resulting value will also be outside [code][ostart, ostop][/code]. If this is not desired, use [method clamp] on the result of this function.
#desc [codeblock]
#desc remap(75, 0, 100, -1, 1) # Returns 0.5
#desc [/codeblock]
#desc For complex use cases where multiple ranges are needed, consider using [Curve] or [Gradient] instead.
func remap(value: float, istart: float, istop: float, ostart: float, ostop: float) -> float:
	pass;

#desc Allocates a unique ID which can be used by the implementation to construct a RID. This is used mainly from native extensions to implement servers.
func rid_allocate_id() -> int:
	pass;

#desc Creates a RID from a [param base]. This is used mainly from native extensions to build servers.
func rid_from_int64(base: int) -> RID:
	pass;

#desc Rounds [param x] to the nearest whole number, with halfway cases rounded away from 0. Supported types: [int], [float], [Vector2], [Vector3], [Vector4].
#desc [codeblock]
#desc round(2.4) # Returns 2
#desc round(2.5) # Returns 3
#desc round(2.6) # Returns 3
#desc [/codeblock]
#desc See also [method floor], [method ceil], and [method snapped].
#desc [b]Note:[/b] For better type safety, use [method roundf], [method roundi], [method Vector2.round], [method Vector3.round], or [method Vector4.round].
func round(x: Variant) -> Variant:
	pass;

#desc Rounds [param x] to the nearest whole number, with halfway cases rounded away from 0.
#desc A type-safe version of [method round], returning a [float].
func roundf(x: float) -> float:
	pass;

#desc Rounds [param x] to the nearest whole number, with halfway cases rounded away from 0.
#desc A type-safe version of [method round], returning an [int].
func roundi(x: float) -> int:
	pass;

#desc Sets the seed for the random number generator to [param base]. Setting the seed manually can ensure consistent, repeatable results for most random functions.
#desc [codeblocks]
#desc [gdscript]
#desc var my_seed = "Godot Rocks".hash()
#desc seed(my_seed)
#desc var a = randf() + randi()
#desc seed(my_seed)
#desc var b = randf() + randi()
#desc # a and b are now identical
#desc [/gdscript]
#desc [csharp]
#desc ulong mySeed = (ulong)GD.Hash("Godot Rocks");
#desc GD.Seed(mySeed);
#desc var a = GD.Randf() + GD.Randi();
#desc GD.Seed(mySeed);
#desc var b = GD.Randf() + GD.Randi();
#desc // a and b are now identical
#desc [/csharp]
#desc [/codeblocks]
func seed(base: int) -> void:
	pass;

#desc Returns the same type of [Variant] as [param x], with [code]-1[/code] for negative values, [code]1[/code] for positive values, and [code]0[/code] for zeros. Supported types: [int], [float], [Vector2], [Vector2i], [Vector3], [Vector3i], [Vector4], [Vector4i].
#desc [codeblock]
#desc sign(-6.0) # Returns -1
#desc sign(0.0)  # Returns 0
#desc sign(6.0)  # Returns 1
#desc 
#desc sign(Vector3(-6.0, 0.0, 6.0)) # Returns (-1, 0, 1)
#desc [/codeblock]
#desc [b]Note:[/b] For better type safety, use [method signf], [method signi], [method Vector2.sign], [method Vector2i.sign], [method Vector3.sign], [method Vector3i.sign], [method Vector4.sign], or [method Vector4i.sign].
func sign(x: Variant) -> Variant:
	pass;

#desc Returns [code]-1.0[/code] if [param x] is negative, [code]1.0[/code] if [param x] is positive, and [code]0.0[/code] if [param x] is zero.
#desc [codeblock]
#desc signf(-6.5) # Returns -1.0
#desc signf(0.0)  # Returns 0.0
#desc signf(6.5)  # Returns 1.0
#desc [/codeblock]
func signf(x: float) -> float:
	pass;

#desc Returns [code]-1[/code] if [param x] is negative, [code]1[/code] if [param x] is positive, and [code]0[/code] if if [param x] is zero.
#desc [codeblock]
#desc signi(-6) # Returns -1
#desc signi(0)  # Returns 0
#desc signi(6)  # Returns 1
#desc [/codeblock]
func signi(x: int) -> int:
	pass;

#desc Returns the sine of angle [param angle_rad] in radians.
#desc [codeblock]
#desc sin(0.523599)       # Returns 0.5
#desc sin(deg_to_rad(90)) # Returns 1.0
#desc [/codeblock]
func sin(angle_rad: float) -> float:
	pass;

#desc Returns the hyperbolic sine of [param x].
#desc [codeblock]
#desc var a = log(2.0) # Returns 0.693147
#desc sinh(a) # Returns 0.75
#desc [/codeblock]
func sinh(x: float) -> float:
	pass;

#desc Returns the result of smoothly interpolating the value of [param x] between [code]0[/code] and [code]1[/code], based on the where [param x] lies with respect to the edges [param from] and [param to].
#desc The return value is [code]0[/code] if [code]x <= from[/code], and [code]1[/code] if [code]x >= to[/code]. If [param x] lies between [param from] and [param to], the returned value follows an S-shaped curve that maps [param x] between [code]0[/code] and [code]1[/code].
#desc This S-shaped curve is the cubic Hermite interpolator, given by [code]f(y) = 3*y^2 - 2*y^3[/code] where [code]y = (x-from) / (to-from)[/code].
#desc [codeblock]
#desc smoothstep(0, 2, -5.0) # Returns 0.0
#desc smoothstep(0, 2, 0.5) # Returns 0.15625
#desc smoothstep(0, 2, 1.0) # Returns 0.5
#desc smoothstep(0, 2, 2.0) # Returns 1.0
#desc [/codeblock]
#desc Compared to [method ease] with a curve value of [code]-1.6521[/code], [method smoothstep] returns the smoothest possible curve with no sudden changes in the derivative. If you need to perform more advanced transitions, use [Tween] or [AnimationPlayer].
#desc [url=https://raw.githubusercontent.com/godotengine/godot-docs/master/img/smoothstep_ease_comparison.png]Comparison between smoothstep() and ease(x, -1.6521) return values[/url]
func smoothstep(from: float, to: float, x: float) -> float:
	pass;

#desc Returns the multiple of [param step] that is the closest to [param x]. This can also be used to round a floating point number to an arbitrary number of decimals.
#desc The returned value is the same type of [Variant] as [param step]. Supported types: [int], [float], [Vector2], [Vector2i], [Vector3], [Vector3i], [Vector4], [Vector4i].
#desc [codeblock]
#desc snapped(100, 32)  # Returns 96
#desc snapped(3.14159, 0.01)  # Returns 3.14
#desc 
#desc snapped(Vector2(34, 70), Vector2(8, 8))  # Returns (32, 72)
#desc [/codeblock]
#desc See also [method ceil], [method floor], and [method round].
#desc [b]Note:[/b] For better type safety, use [method snappedf], [method snappedi], [method Vector2.snapped], [method Vector2i.snapped], [method Vector3.snapped], [method Vector3i.snapped], [method Vector4.snapped], or [method Vector4i.snapped].
func snapped(x: Variant, step: Variant) -> Variant:
	pass;

#desc Returns the multiple of [param step] that is the closest to [param x]. This can also be used to round a floating point number to an arbitrary number of decimals.
#desc A type-safe version of [method snapped], returning a [float].
#desc [codeblock]
#desc snappedf(32.0, 2.5)  # Returns 32.5
#desc snappedf(3.14159, 0.01)  # Returns 3.14
#desc [/codeblock]
func snappedf(x: float, step: float) -> float:
	pass;

#desc Returns the multiple of [param step] that is the closest to [param x].
#desc A type-safe version of [method snapped], returning an [int].
#desc [codeblock]
#desc snappedi(53, 16)  # Returns 48
#desc snappedi(4096, 100)  # Returns 4100
#desc [/codeblock]
func snappedi(x: float, step: int) -> int:
	pass;

#desc Returns the square root of [param x], where [param x] is a non-negative number.
#desc [codeblock]
#desc sqrt(9)     # Returns 3
#desc sqrt(10.24) # Returns 3.2
#desc sqrt(-1)    # Returns NaN
#desc [/codeblock]
#desc [b]Note:[/b] Negative values of [param x] return NaN ("Not a Number"). in C#, if you need negative inputs, use [code]System.Numerics.Complex[/code].
func sqrt(x: float) -> float:
	pass;

#desc Returns the position of the first non-zero digit, after the decimal point. Note that the maximum return value is 10, which is a design decision in the implementation.
#desc [codeblock]
#desc var n = step_decimals(5)       # n is 0
#desc n = step_decimals(1.0005)      # n is 4
#desc n = step_decimals(0.000000005) # n is 9
#desc [/codeblock]
func step_decimals(x: float) -> int:
	pass;

#desc Converts one or more arguments of any [Variant] type to a [String] in the best way possible.
#desc [codeblock]
#desc var a = [10, 20, 30]
#desc var b = str(a)
#desc print(len(a)) # Prints 3 (the number of elements in the array).
#desc print(len(b)) # Prints 12 (the length of the string "[10, 20, 30]").
#desc [/codeblock]
vararg func str() -> String:
	pass;

#desc Converts a formatted [param string] that was returned by [method var_to_str] to the original [Variant].
#desc [codeblocks]
#desc [gdscript]
#desc var data = '{ "a": 1, "b": 2 }' # data is a String
#desc var dict = str_to_var(data)     # dict is a Dictionary
#desc print(dict["a"])                # Prints 1
#desc [/gdscript]
#desc [csharp]
#desc string data = "{ \"a\": 1, \"b\": 2 }";           // data is a string
#desc var dict = GD.StrToVar(data).AsGodotDictionary(); // dict is a Dictionary
#desc GD.Print(dict["a"]);                              // Prints 1
#desc [/csharp]
#desc [/codeblocks]
func str_to_var(string: String) -> Variant:
	pass;

#desc Returns the tangent of angle [param angle_rad] in radians.
#desc [codeblock]
#desc tan(deg_to_rad(45)) # Returns 1
#desc [/codeblock]
func tan(angle_rad: float) -> float:
	pass;

#desc Returns the hyperbolic tangent of [param x].
#desc [codeblock]
#desc var a = log(2.0) # Returns 0.693147
#desc tanh(a)          # Returns 0.6
#desc [/codeblock]
func tanh(x: float) -> float:
	pass;

#desc Returns the internal type of the given [param variable], using the [enum Variant.Type] values.
#desc [codeblock]
#desc var json = JSON.new()
#desc json.parse('["a", "b", "c"]')
#desc var result = json.get_data()
#desc if typeof(result) == TYPE_ARRAY:
#desc print(result[0]) # Prints a
#desc else:
#desc print("Unexpected result")
#desc [/codeblock]
func typeof(variable: Variant) -> int:
	pass;

#desc Encodes a [Variant] value to a byte array, without encoding objects. Deserialization can be done with [method bytes_to_var].
#desc [b]Note:[/b] If you need object serialization, see [method var_to_bytes_with_objects].
func var_to_bytes(variable: Variant) -> PackedByteArray:
	pass;

#desc Encodes a [Variant] value to a byte array. Encoding objects is allowed (and can potentially include executable code). Deserialization can be done with [method bytes_to_var_with_objects].
func var_to_bytes_with_objects(variable: Variant) -> PackedByteArray:
	pass;

#desc Converts a [Variant] [param variable] to a formatted [String] that can then be parsed using [method str_to_var].
#desc [codeblocks]
#desc [gdscript]
#desc var a = { "a": 1, "b": 2 }
#desc print(var_to_str(a))
#desc [/gdscript]
#desc [csharp]
#desc var a = new Godot.Collections.Dictionary { ["a"] = 1, ["b"] = 2 };
#desc GD.Print(GD.VarToStr(a));
#desc [/csharp]
#desc [/codeblocks]
#desc Prints:
#desc [codeblock]
#desc {
#desc "a": 1,
#desc "b": 2
#desc }
#desc [/codeblock]
func var_to_str(variable: Variant) -> String:
	pass;

#desc Returns a weak reference to an object, or [code]null[/code] if [param obj] is invalid.
#desc A weak reference to an object is not enough to keep the object alive: when the only remaining references to a referent are weak references, garbage collection is free to destroy the referent and reuse its memory for something else. However, until the object is actually destroyed the weak reference may return the object even if there are no strong references to it.
func weakref(obj: Variant) -> Variant:
	pass;

#desc Wraps the [Variant] [param value] between [param min] and [param max]. Can be used for creating loop-alike behavior or infinite surfaces.
#desc Variant types [int] and [float] are supported. If any of the arguments is [float] this function returns a [float], otherwise it returns an [int].
#desc [codeblock]
#desc var a = wrap(4, 5, 10)
#desc # a is 9 (int)
#desc 
#desc var a = wrap(7, 5, 10)
#desc # a is 7 (int)
#desc 
#desc var a = wrap(10.5, 5, 10)
#desc # a is 5.5 (float)
#desc [/codeblock]
func wrap(value: Variant, min: Variant, max: Variant) -> Variant:
	pass;

#desc Wraps the float [param value] between [param min] and [param max]. Can be used for creating loop-alike behavior or infinite surfaces.
#desc [codeblock]
#desc # Infinite loop between 5.0 and 9.9
#desc value = wrapf(value + 0.1, 5.0, 10.0)
#desc [/codeblock]
#desc [codeblock]
#desc # Infinite rotation (in radians)
#desc angle = wrapf(angle + 0.1, 0.0, TAU)
#desc [/codeblock]
#desc [codeblock]
#desc # Infinite rotation (in radians)
#desc angle = wrapf(angle + 0.1, -PI, PI)
#desc [/codeblock]
#desc [b]Note:[/b] If [param min] is [code]0[/code], this is equivalent to [method fposmod], so prefer using that instead.
#desc [code]wrapf[/code] is more flexible than using the [method fposmod] approach by giving the user control over the minimum value.
func wrapf(value: float, min: float, max: float) -> float:
	pass;

#desc Wraps the integer [param value] between [param min] and [param max]. Can be used for creating loop-alike behavior or infinite surfaces.
#desc [codeblock]
#desc # Infinite loop between 5 and 9
#desc frame = wrapi(frame + 1, 5, 10)
#desc [/codeblock]
#desc [codeblock]
#desc # result is -2
#desc var result = wrapi(-6, -5, -1)
#desc [/codeblock]
func wrapi(value: int, min: int, max: int) -> int:
	pass;



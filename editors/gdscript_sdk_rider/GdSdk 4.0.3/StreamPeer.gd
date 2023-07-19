extends RefCounted
#brief Abstraction and base class for stream-based protocols.
#desc StreamPeer is an abstraction and base class for stream-based protocols (such as TCP). It provides an API for sending and receiving data through streams as raw data or strings.
#desc [b]Note:[/b] When exporting to Android, make sure to enable the [code]INTERNET[/code] permission in the Android export preset before exporting the project or using one-click deploy. Otherwise, network communication of any kind will be blocked by Android.
class_name StreamPeer


#desc If [code]true[/code], this [StreamPeer] will using big-endian format for encoding and decoding.
var big_endian: bool:
	get = is_big_endian_enabled, set = set_big_endian



#desc Gets a signed 16-bit value from the stream.
func get_16() -> int:
	pass;

#desc Gets a signed 32-bit value from the stream.
func get_32() -> int:
	pass;

#desc Gets a signed 64-bit value from the stream.
func get_64() -> int:
	pass;

#desc Gets a signed byte from the stream.
func get_8() -> int:
	pass;

#desc Returns the number of bytes this [StreamPeer] has available.
func get_available_bytes() -> int:
	pass;

#desc Returns a chunk data with the received bytes. The number of bytes to be received can be requested in the [param bytes] argument. If not enough bytes are available, the function will block until the desired amount is received. This function returns two values, an [enum Error] code and a data array.
func get_data(bytes: int) -> Array:
	pass;

#desc Gets a double-precision float from the stream.
func get_double() -> float:
	pass;

#desc Gets a single-precision float from the stream.
func get_float() -> float:
	pass;

#desc Returns a chunk data with the received bytes. The number of bytes to be received can be requested in the "bytes" argument. If not enough bytes are available, the function will return how many were actually received. This function returns two values, an [enum Error] code, and a data array.
func get_partial_data(bytes: int) -> Array:
	pass;

#desc Gets an ASCII string with byte-length [param bytes] from the stream. If [param bytes] is negative (default) the length will be read from the stream using the reverse process of [method put_string].
func get_string(bytes: int = -1) -> String:
	pass;

#desc Gets an unsigned 16-bit value from the stream.
func get_u16() -> int:
	pass;

#desc Gets an unsigned 32-bit value from the stream.
func get_u32() -> int:
	pass;

#desc Gets an unsigned 64-bit value from the stream.
func get_u64() -> int:
	pass;

#desc Gets an unsigned byte from the stream.
func get_u8() -> int:
	pass;

#desc Gets an UTF-8 string with byte-length [param bytes] from the stream (this decodes the string sent as UTF-8). If [param bytes] is negative (default) the length will be read from the stream using the reverse process of [method put_utf8_string].
func get_utf8_string(bytes: int = -1) -> String:
	pass;

#desc Gets a Variant from the stream. If [param allow_objects] is [code]true[/code], decoding objects is allowed.
#desc Internally, this uses the same decoding mechanism as the [method @GlobalScope.bytes_to_var] method.
#desc [b]Warning:[/b] Deserialized objects can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats such as remote code execution.
func get_var(allow_objects: bool = false) -> Variant:
	pass;

#desc Puts a signed 16-bit value into the stream.
func put_16(value: int) -> void:
	pass;

#desc Puts a signed 32-bit value into the stream.
func put_32(value: int) -> void:
	pass;

#desc Puts a signed 64-bit value into the stream.
func put_64(value: int) -> void:
	pass;

#desc Puts a signed byte into the stream.
func put_8(value: int) -> void:
	pass;

#desc Sends a chunk of data through the connection, blocking if necessary until the data is done sending. This function returns an [enum Error] code.
func put_data(data: PackedByteArray) -> int:
	pass;

#desc Puts a double-precision float into the stream.
func put_double(value: float) -> void:
	pass;

#desc Puts a single-precision float into the stream.
func put_float(value: float) -> void:
	pass;

#desc Sends a chunk of data through the connection. If all the data could not be sent at once, only part of it will. This function returns two values, an [enum Error] code and an integer, describing how much data was actually sent.
func put_partial_data(data: PackedByteArray) -> Array:
	pass;

#desc Puts a zero-terminated ASCII string into the stream prepended by a 32-bit unsigned integer representing its size.
#desc [b]Note:[/b] To put an ASCII string without prepending its size, you can use [method put_data]:
#desc [codeblocks]
#desc [gdscript]
#desc put_data("Hello world".to_ascii_buffer())
#desc [/gdscript]
#desc [csharp]
#desc PutData("Hello World".ToAsciiBuffer());
#desc [/csharp]
#desc [/codeblocks]
func put_string(value: String) -> void:
	pass;

#desc Puts an unsigned 16-bit value into the stream.
func put_u16(value: int) -> void:
	pass;

#desc Puts an unsigned 32-bit value into the stream.
func put_u32(value: int) -> void:
	pass;

#desc Puts an unsigned 64-bit value into the stream.
func put_u64(value: int) -> void:
	pass;

#desc Puts an unsigned byte into the stream.
func put_u8(value: int) -> void:
	pass;

#desc Puts a zero-terminated UTF-8 string into the stream prepended by a 32 bits unsigned integer representing its size.
#desc [b]Note:[/b] To put an UTF-8 string without prepending its size, you can use [method put_data]:
#desc [codeblocks]
#desc [gdscript]
#desc put_data("Hello world".to_utf8_buffer())
#desc [/gdscript]
#desc [csharp]
#desc PutData("Hello World".ToUtf8Buffer());
#desc [/csharp]
#desc [/codeblocks]
func put_utf8_string(value: String) -> void:
	pass;

#desc Puts a Variant into the stream. If [param full_objects] is [code]true[/code] encoding objects is allowed (and can potentially include code).
#desc Internally, this uses the same encoding mechanism as the [method @GlobalScope.var_to_bytes] method.
func put_var(value: Variant, full_objects: bool = false) -> void:
	pass;


func is_big_endian_enabled() -> bool:
	return big_endian

func set_big_endian(value: bool) -> void:
	big_endian = value


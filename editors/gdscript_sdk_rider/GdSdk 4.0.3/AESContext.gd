extends RefCounted
#brief Interface to low level AES encryption features.
#desc This class provides access to AES encryption/decryption of raw data. Both AES-ECB and AES-CBC mode are supported.
#desc [codeblocks]
#desc [gdscript]
#desc extends Node
#desc 
#desc var aes = AESContext.new()
#desc 
#desc func _ready():
#desc var key = "My secret key!!!" # Key must be either 16 or 32 bytes.
#desc var data = "My secret text!!" # Data size must be multiple of 16 bytes, apply padding if needed.
#desc # Encrypt ECB
#desc aes.start(AESContext.MODE_ECB_ENCRYPT, key.to_utf8_buffer())
#desc var encrypted = aes.update(data.to_utf8_buffer())
#desc aes.finish()
#desc # Decrypt ECB
#desc aes.start(AESContext.MODE_ECB_DECRYPT, key.to_utf8_buffer())
#desc var decrypted = aes.update(encrypted)
#desc aes.finish()
#desc # Check ECB
#desc assert(decrypted == data.to_utf8_buffer())
#desc 
#desc var iv = "My secret iv!!!!" # IV must be of exactly 16 bytes.
#desc # Encrypt CBC
#desc aes.start(AESContext.MODE_CBC_ENCRYPT, key.to_utf8_buffer(), iv.to_utf8_buffer())
#desc encrypted = aes.update(data.to_utf8_buffer())
#desc aes.finish()
#desc # Decrypt CBC
#desc aes.start(AESContext.MODE_CBC_DECRYPT, key.to_utf8_buffer(), iv.to_utf8_buffer())
#desc decrypted = aes.update(encrypted)
#desc aes.finish()
#desc # Check CBC
#desc assert(decrypted == data.to_utf8_buffer())
#desc [/gdscript]
#desc [csharp]
#desc using Godot;
#desc using System.Diagnostics;
#desc 
#desc public partial class MyNode : Node
#desc {
#desc private AesContext _aes = new AesContext();
#desc 
#desc public override void _Ready()
#desc {
#desc string key = "My secret key!!!"; // Key must be either 16 or 32 bytes.
#desc string data = "My secret text!!"; // Data size must be multiple of 16 bytes, apply padding if needed.
#desc // Encrypt ECB
#desc _aes.Start(AesContext.Mode.EcbEncrypt, key.ToUtf8Buffer());
#desc byte[] encrypted = _aes.Update(data.ToUtf8Buffer());
#desc _aes.Finish();
#desc // Decrypt ECB
#desc _aes.Start(AesContext.Mode.EcbDecrypt, key.ToUtf8Buffer());
#desc byte[] decrypted = _aes.Update(encrypted);
#desc _aes.Finish();
#desc // Check ECB
#desc Debug.Assert(decrypted == data.ToUtf8Buffer());
#desc 
#desc string iv = "My secret iv!!!!"; // IV must be of exactly 16 bytes.
#desc // Encrypt CBC
#desc _aes.Start(AesContext.Mode.EcbEncrypt, key.ToUtf8Buffer(), iv.ToUtf8Buffer());
#desc encrypted = _aes.Update(data.ToUtf8Buffer());
#desc _aes.Finish();
#desc // Decrypt CBC
#desc _aes.Start(AesContext.Mode.EcbDecrypt, key.ToUtf8Buffer(), iv.ToUtf8Buffer());
#desc decrypted = _aes.Update(encrypted);
#desc _aes.Finish();
#desc // Check CBC
#desc Debug.Assert(decrypted == data.ToUtf8Buffer());
#desc }
#desc }
#desc [/csharp]
#desc [/codeblocks]
class_name AESContext

#desc AES electronic codebook encryption mode.
#desc AES electronic codebook decryption mode.
#desc AES cipher blocker chaining encryption mode.
#desc AES cipher blocker chaining decryption mode.
#desc Maximum value for the mode enum.

#enum Mode
enum {
    MODE_ECB_ENCRYPT = 0,
    MODE_ECB_DECRYPT = 1,
    MODE_CBC_ENCRYPT = 2,
    MODE_CBC_DECRYPT = 3,
    MODE_MAX = 4,
}


#desc Close this AES context so it can be started again. See [method start].
func finish() -> void:
	pass;

#desc Get the current IV state for this context (IV gets updated when calling [method update]). You normally don't need this function.
#desc [b]Note:[/b] This function only makes sense when the context is started with [constant MODE_CBC_ENCRYPT] or [constant MODE_CBC_DECRYPT].
func get_iv_state() -> PackedByteArray:
	pass;

#desc Start the AES context in the given [param mode]. A [param key] of either 16 or 32 bytes must always be provided, while an [param iv] (initialization vector) of exactly 16 bytes, is only needed when [param mode] is either [constant MODE_CBC_ENCRYPT] or [constant MODE_CBC_DECRYPT].
func start(mode: int, key: PackedByteArray, iv: PackedByteArray = PackedByteArray()) -> int:
	pass;

#desc Run the desired operation for this AES context. Will return a [PackedByteArray] containing the result of encrypting (or decrypting) the given [param src]. See [method start] for mode of operation.
#desc [b]Note:[/b] The size of [param src] must be a multiple of 16. Apply some padding if needed.
func update(src: PackedByteArray) -> PackedByteArray:
	pass;



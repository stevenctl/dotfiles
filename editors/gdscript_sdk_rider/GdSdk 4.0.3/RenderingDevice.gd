extends Object
#brief Abstraction for working with modern low-level graphics APIs.
#desc [RenderingDevice] is an abstraction for working with modern low-level graphics APIs such as Vulkan. Compared to [RenderingServer] (which works with Godot's own rendering subsystems), [RenderingDevice] is much lower-level and allows working more directly with the underlying graphics APIs. [RenderingDevice] is used in Godot to provide support for several modern low-level graphics APIs while reducing the amount of code duplication required. [RenderingDevice] can also be used in your own projects to perform things that are not exposed by [RenderingServer] or high-level nodes, such as using compute shaders.
#desc On startup, Godot creates a global [RenderingDevice] which can be retrieved using [method RenderingServer.get_rendering_device]. This global [RenderingDevice] performs drawing to the screen.
#desc [b]Local RenderingDevices:[/b] Using [method RenderingServer.create_local_rendering_device], you can create "secondary" rendering devices to perform drawing and GPU compute operations on separate threads.
#desc [b]Note:[/b] [RenderingDevice] assumes intermediate knowledge of modern graphics APIs such as Vulkan, Direct3D 12, Metal or WebGPU. These graphics APIs are lower-level than OpenGL or Direct3D 11, requiring you to perform what was previously done by the graphics driver itself. If you have difficulty understanding the concepts used in this class, follow the [url=https://vulkan-tutorial.com/]Vulkan Tutorial[/url] or [url=https://vkguide.dev/]Vulkan Guide[/url]. It's recommended to have existing modern OpenGL or Direct3D 11 knowledge before attempting to learn a low-level graphics API.
#desc [b]Note:[/b] [RenderingDevice] is not available when running in headless mode or when using the Compatibility rendering method.
#tutorial [Using compute shaders] https://docs.godotengine.org/en/latest/tutorials/shaders/compute_shaders.html
class_name RenderingDevice

#desc Rendering device type does not match any of the other enum values or is unknown.
#desc Rendering device is an integrated GPU, which is typically [i](but not always)[/i] slower than dedicated GPUs ([constant DEVICE_TYPE_DISCRETE_GPU]). On Android and iOS, the rendering device type is always considered to be [constant DEVICE_TYPE_INTEGRATED_GPU].
#desc Rendering device is a dedicated GPU, which is typically [i](but not always)[/i] faster than integrated GPUs ([constant DEVICE_TYPE_INTEGRATED_GPU]).
#desc Rendering device is an emulated GPU in a virtual environment. This is typically much slower than the host GPU, which means the expected performance level on a dedicated GPU will be roughly equivalent to [constant DEVICE_TYPE_INTEGRATED_GPU]. Virtual machine GPU passthrough (such as VFIO) will not report the device type as [constant DEVICE_TYPE_VIRTUAL_GPU]. Instead, the host GPU's device type will be reported as if the GPU was not emulated.
#desc Rendering device is provided by software emulation (such as Lavapipe or [url=https://github.com/google/swiftshader]SwiftShader[/url]). This is the slowest kind of rendering device available; it's typically much slower than [constant DEVICE_TYPE_INTEGRATED_GPU].
#desc Represents the size of the [enum DeviceType] enum.
#desc Vulkan device driver resource. This is a "global" resource and ignores the RID passed in
#desc Physical device (graphics card) driver resource.
#desc Vulkan instance driver resource.
#desc Vulkan queue driver resource.
#desc Vulkan queue family index driver resource.
#desc Vulkan image driver resource.
#desc Vulkan image view driver resource.
#desc Vulkan image native texture format driver resource.
#desc Vulkan sampler driver resource.
#desc Vulkan [url=https://vkguide.dev/docs/chapter-4/descriptors/]descriptor set[/url] driver resource.
#desc Vulkan buffer driver resource.
#desc Vulkan compute pipeline driver resource.
#desc Vulkan render pipeline driver resource.
#desc 4-bit-per-channel red/green channel data format, packed into 8 bits. Values are in the [code][0.0, 1.0][/code] range.
#desc [b]Note:[/b] More information on all data formats can be found on the [url=https://registry.khronos.org/vulkan/specs/1.1/html/vkspec.html#_identification_of_formats]Identification of formats[/url] section of the Vulkan specification, as well as the [url=https://registry.khronos.org/vulkan/specs/1.3-extensions/man/html/VkFormat.html]VkFormat[/url] enum.
#desc 4-bit-per-channel red/green/blue/alpha channel data format, packed into 16 bits. Values are in the [code][0.0, 1.0][/code] range.
#desc 4-bit-per-channel blue/green/red/alpha channel data format, packed into 16 bits. Values are in the [code][0.0, 1.0][/code] range.
#desc Red/green/blue channel data format with 5 bits of red, 6 bits of green and 5 bits of blue, packed into 16 bits. Values are in the [code][0.0, 1.0][/code] range.
#desc Blue/green/red channel data format with 5 bits of blue, 6 bits of green and 5 bits of red, packed into 16 bits. Values are in the [code][0.0, 1.0][/code] range.
#desc Red/green/blue/alpha channel data format with 5 bits of red, 6 bits of green, 5 bits of blue and 1 bit of alpha, packed into 16 bits. Values are in the [code][0.0, 1.0][/code] range.
#desc Blue/green/red/alpha channel data format with 5 bits of blue, 6 bits of green, 5 bits of red and 1 bit of alpha, packed into 16 bits. Values are in the [code][0.0, 1.0][/code] range.
#desc Alpha/red/green/blue channel data format with 1 bit of alpha, 5 bits of red, 6 bits of green and 5 bits of blue, packed into 16 bits. Values are in the [code][0.0, 1.0][/code] range.
#desc 8-bit-per-channel unsigned floating-point red channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range.
#desc 8-bit-per-channel signed floating-point red channel data format with normalized value. Values are in the [code][-1.0, 1.0][/code] range.
#desc 8-bit-per-channel unsigned floating-point red channel data format with scaled value (value is converted from integer to float). Values are in the [code][0.0, 255.0][/code] range.
#desc 8-bit-per-channel signed floating-point red channel data format with scaled value (value is converted from integer to float). Values are in the [code][-127.0, 127.0][/code] range.
#desc 8-bit-per-channel unsigned integer red channel data format. Values are in the [code][0, 255][/code] range.
#desc 8-bit-per-channel signed integer red channel data format. Values are in the [code][-127, 127][/code] range.
#desc 8-bit-per-channel unsigned floating-point red channel data format with normalized value and non-linear sRGB encoding. Values are in the [code][0.0, 1.0][/code] range.
#desc 8-bit-per-channel unsigned floating-point red/green channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range.
#desc 8-bit-per-channel signed floating-point red/green channel data format with normalized value. Values are in the [code][-1.0, 1.0][/code] range.
#desc 8-bit-per-channel unsigned floating-point red/green channel data format with scaled value (value is converted from integer to float). Values are in the [code][0.0, 255.0][/code] range.
#desc 8-bit-per-channel signed floating-point red/green channel data format with scaled value (value is converted from integer to float). Values are in the [code][-127.0, 127.0][/code] range.
#desc 8-bit-per-channel unsigned integer red/green channel data format. Values are in the [code][0, 255][/code] range.
#desc 8-bit-per-channel signed integer red/green channel data format. Values are in the [code][-127, 127][/code] range.
#desc 8-bit-per-channel unsigned floating-point red/green channel data format with normalized value and non-linear sRGB encoding. Values are in the [code][0.0, 1.0][/code] range.
#desc 8-bit-per-channel unsigned floating-point red/green/blue channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range.
#desc 8-bit-per-channel signed floating-point red/green/blue channel data format with normalized value. Values are in the [code][-1.0, 1.0][/code] range.
#desc 8-bit-per-channel unsigned floating-point red/green/blue channel data format with scaled value (value is converted from integer to float). Values are in the [code][0.0, 255.0][/code] range.
#desc 8-bit-per-channel signed floating-point red/green/blue channel data format with scaled value (value is converted from integer to float). Values are in the [code][-127.0, 127.0][/code] range.
#desc 8-bit-per-channel unsigned integer red/green/blue channel data format. Values are in the [code][0, 255][/code] range.
#desc 8-bit-per-channel signed integer red/green/blue channel data format. Values are in the [code][-127, 127][/code] range.
#desc 8-bit-per-channel unsigned floating-point red/green/blue/blue channel data format with normalized value and non-linear sRGB encoding. Values are in the [code][0.0, 1.0][/code] range.
#desc 8-bit-per-channel unsigned floating-point blue/green/red channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range.
#desc 8-bit-per-channel signed floating-point blue/green/red channel data format with normalized value. Values are in the [code][-1.0, 1.0][/code] range.
#desc 8-bit-per-channel unsigned floating-point blue/green/red channel data format with scaled value (value is converted from integer to float). Values are in the [code][0.0, 255.0][/code] range.
#desc 8-bit-per-channel signed floating-point blue/green/red channel data format with scaled value (value is converted from integer to float). Values are in the [code][-127.0, 127.0][/code] range.
#desc 8-bit-per-channel unsigned integer blue/green/red channel data format. Values are in the [code][0, 255][/code] range.
#desc 8-bit-per-channel signed integer blue/green/red channel data format. Values are in the [code][-127, 127][/code] range.
#desc 8-bit-per-channel unsigned floating-point blue/green/red data format with normalized value and non-linear sRGB encoding. Values are in the [code][0.0, 1.0][/code] range.
#desc 8-bit-per-channel unsigned floating-point red/green/blue/alpha channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range.
#desc 8-bit-per-channel signed floating-point red/green/blue/alpha channel data format with normalized value. Values are in the [code][-1.0, 1.0][/code] range.
#desc 8-bit-per-channel unsigned floating-point red/green/blue/alpha channel data format with scaled value (value is converted from integer to float). Values are in the [code][0.0, 255.0][/code] range.
#desc 8-bit-per-channel signed floating-point red/green/blue/alpha channel data format with scaled value (value is converted from integer to float). Values are in the [code][-127.0, 127.0][/code] range.
#desc 8-bit-per-channel unsigned integer red/green/blue/alpha channel data format. Values are in the [code][0, 255][/code] range.
#desc 8-bit-per-channel signed integer red/green/blue/alpha channel data format. Values are in the [code][-127, 127][/code] range.
#desc 8-bit-per-channel unsigned floating-point red/green/blue/alpha channel data format with normalized value and non-linear sRGB encoding. Values are in the [code][0.0, 1.0][/code] range.
#desc 8-bit-per-channel unsigned floating-point blue/green/red/alpha channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range.
#desc 8-bit-per-channel signed floating-point blue/green/red/alpha channel data format with normalized value. Values are in the [code][-1.0, 1.0][/code] range.
#desc 8-bit-per-channel unsigned floating-point blue/green/red/alpha channel data format with scaled value (value is converted from integer to float). Values are in the [code][0.0, 255.0][/code] range.
#desc 8-bit-per-channel signed floating-point blue/green/red/alpha channel data format with scaled value (value is converted from integer to float). Values are in the [code][-127.0, 127.0][/code] range.
#desc 8-bit-per-channel unsigned integer blue/green/red/alpha channel data format. Values are in the [code][0, 255][/code] range.
#desc 8-bit-per-channel signed integer blue/green/red/alpha channel data format. Values are in the [code][-127, 127][/code] range.
#desc 8-bit-per-channel unsigned floating-point blue/green/red/alpha channel data format with normalized value and non-linear sRGB encoding. Values are in the [code][0.0, 1.0][/code] range.
#desc 8-bit-per-channel unsigned floating-point alpha/red/green/blue channel data format with normalized value, packed in 32 bits. Values are in the [code][0.0, 1.0][/code] range.
#desc 8-bit-per-channel signed floating-point alpha/red/green/blue channel data format with normalized value, packed in 32 bits. Values are in the [code][-1.0, 1.0][/code] range.
#desc 8-bit-per-channel unsigned floating-point alpha/red/green/blue channel data format with scaled value (value is converted from integer to float), packed in 32 bits. Values are in the [code][0.0, 255.0][/code] range.
#desc 8-bit-per-channel signed floating-point alpha/red/green/blue channel data format with scaled value (value is converted from integer to float), packed in 32 bits. Values are in the [code][-127.0, 127.0][/code] range.
#desc 8-bit-per-channel unsigned integer alpha/red/green/blue channel data format, packed in 32 bits. Values are in the [code][0, 255][/code] range.
#desc 8-bit-per-channel signed integer alpha/red/green/blue channel data format, packed in 32 bits. Values are in the [code][-127, 127][/code] range.
#desc 8-bit-per-channel unsigned floating-point alpha/red/green/blue channel data format with normalized value and non-linear sRGB encoding, packed in 32 bits. Values are in the [code][0.0, 1.0][/code] range.
#desc Unsigned floating-point alpha/red/green/blue channel data format with normalized value, packed in 32 bits. Format contains 2 bits of alpha, 10 bits of red, 10 bits of green and 10 bits of blue. Values are in the [code][0.0, 1.0][/code] range.
#desc Signed floating-point alpha/red/green/blue channel data format with normalized value, packed in 32 bits. Format contains 2 bits of alpha, 10 bits of red, 10 bits of green and 10 bits of blue. Values are in the [code][-1.0, 1.0][/code] range.
#desc Unsigned floating-point alpha/red/green/blue channel data format with normalized value, packed in 32 bits. Format contains 2 bits of alpha, 10 bits of red, 10 bits of green and 10 bits of blue. Values are in the [code][0.0, 1023.0][/code] range for red/green/blue and [code][0.0, 3.0][/code] for alpha.
#desc Signed floating-point alpha/red/green/blue channel data format with normalized value, packed in 32 bits. Format contains 2 bits of alpha, 10 bits of red, 10 bits of green and 10 bits of blue. Values are in the [code][-511.0, 511.0][/code] range for red/green/blue and [code][-1.0, 1.0][/code] for alpha.
#desc Unsigned integer alpha/red/green/blue channel data format with normalized value, packed in 32 bits. Format contains 2 bits of alpha, 10 bits of red, 10 bits of green and 10 bits of blue. Values are in the [code][0, 1023][/code] range for red/green/blue and [code][0, 3][/code] for alpha.
#desc Signed integer alpha/red/green/blue channel data format with normalized value, packed in 32 bits. Format contains 2 bits of alpha, 10 bits of red, 10 bits of green and 10 bits of blue. Values are in the [code][-511, 511][/code] range for red/green/blue and [code][-1, 1][/code] for alpha.
#desc Unsigned floating-point alpha/blue/green/red channel data format with normalized value, packed in 32 bits. Format contains 2 bits of alpha, 10 bits of blue, 10 bits of green and 10 bits of red. Values are in the [code][0.0, 1.0][/code] range.
#desc Signed floating-point alpha/blue/green/red channel data format with normalized value, packed in 32 bits. Format contains 2 bits of alpha, 10 bits of blue, 10 bits of green and 10 bits of red. Values are in the [code][-1.0, 1.0][/code] range.
#desc Unsigned floating-point alpha/blue/green/red channel data format with normalized value, packed in 32 bits. Format contains 2 bits of alpha, 10 bits of blue, 10 bits of green and 10 bits of red. Values are in the [code][0.0, 1023.0][/code] range for blue/green/red and [code][0.0, 3.0][/code] for alpha.
#desc Signed floating-point alpha/blue/green/red channel data format with normalized value, packed in 32 bits. Format contains 2 bits of alpha, 10 bits of blue, 10 bits of green and 10 bits of red. Values are in the [code][-511.0, 511.0][/code] range for blue/green/red and [code][-1.0, 1.0][/code] for alpha.
#desc Unsigned integer alpha/blue/green/red channel data format with normalized value, packed in 32 bits. Format contains 2 bits of alpha, 10 bits of blue, 10 bits of green and 10 bits of red. Values are in the [code][0, 1023][/code] range for blue/green/red and [code][0, 3][/code] for alpha.
#desc Signed integer alpha/blue/green/red channel data format with normalized value, packed in 32 bits. Format contains 2 bits of alpha, 10 bits of blue, 10 bits of green and 10 bits of red. Values are in the [code][-511, 511][/code] range for blue/green/red and [code][-1, 1][/code] for alpha.
#desc 16-bit-per-channel unsigned floating-point red channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range.
#desc 16-bit-per-channel signed floating-point red channel data format with normalized value. Values are in the [code][-1.0, 1.0][/code] range.
#desc 16-bit-per-channel unsigned floating-point red channel data format with scaled value (value is converted from integer to float). Values are in the [code][0.0, 65535.0][/code] range.
#desc 16-bit-per-channel signed floating-point red channel data format with scaled value (value is converted from integer to float). Values are in the [code][-32767.0, 32767.0][/code] range.
#desc 16-bit-per-channel unsigned integer red channel data format. Values are in the [code][0.0, 65535][/code] range.
#desc 16-bit-per-channel signed integer red channel data format. Values are in the [code][-32767, 32767][/code] range.
#desc 16-bit-per-channel signed floating-point red channel data format with the value stored as-is.
#desc 16-bit-per-channel unsigned floating-point red/green channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range.
#desc 16-bit-per-channel signed floating-point red/green channel data format with normalized value. Values are in the [code][-1.0, 1.0][/code] range.
#desc 16-bit-per-channel unsigned floating-point red/green channel data format with scaled value (value is converted from integer to float). Values are in the [code][0.0, 65535.0][/code] range.
#desc 16-bit-per-channel signed floating-point red/green channel data format with scaled value (value is converted from integer to float). Values are in the [code][-32767.0, 32767.0][/code] range.
#desc 16-bit-per-channel unsigned integer red/green channel data format. Values are in the [code][0.0, 65535][/code] range.
#desc 16-bit-per-channel signed integer red/green channel data format. Values are in the [code][-32767, 32767][/code] range.
#desc 16-bit-per-channel signed floating-point red/green channel data format with the value stored as-is.
#desc 16-bit-per-channel unsigned floating-point red/green/blue channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range.
#desc 16-bit-per-channel signed floating-point red/green/blue channel data format with normalized value. Values are in the [code][-1.0, 1.0][/code] range.
#desc 16-bit-per-channel unsigned floating-point red/green/blue channel data format with scaled value (value is converted from integer to float). Values are in the [code][0.0, 65535.0][/code] range.
#desc 16-bit-per-channel signed floating-point red/green/blue channel data format with scaled value (value is converted from integer to float). Values are in the [code][-32767.0, 32767.0][/code] range.
#desc 16-bit-per-channel unsigned integer red/green/blue channel data format. Values are in the [code][0.0, 65535][/code] range.
#desc 16-bit-per-channel signed integer red/green/blue channel data format. Values are in the [code][-32767, 32767][/code] range.
#desc 16-bit-per-channel signed floating-point red/green/blue channel data format with the value stored as-is.
#desc 16-bit-per-channel unsigned floating-point red/green/blue/alpha channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range.
#desc 16-bit-per-channel signed floating-point red/green/blue/alpha channel data format with normalized value. Values are in the [code][-1.0, 1.0][/code] range.
#desc 16-bit-per-channel unsigned floating-point red/green/blue/alpha channel data format with scaled value (value is converted from integer to float). Values are in the [code][0.0, 65535.0][/code] range.
#desc 16-bit-per-channel signed floating-point red/green/blue/alpha channel data format with scaled value (value is converted from integer to float). Values are in the [code][-32767.0, 32767.0][/code] range.
#desc 16-bit-per-channel unsigned integer red/green/blue/alpha channel data format. Values are in the [code][0.0, 65535][/code] range.
#desc 16-bit-per-channel signed integer red/green/blue/alpha channel data format. Values are in the [code][-32767, 32767][/code] range.
#desc 16-bit-per-channel signed floating-point red/green/blue/alpha channel data format with the value stored as-is.
#desc 32-bit-per-channel unsigned integer red channel data format. Values are in the [code][0, 2^32 - 1][/code] range.
#desc 32-bit-per-channel signed integer red channel data format. Values are in the [code][2^31 + 1, 2^31 - 1][/code] range.
#desc 32-bit-per-channel signed floating-point red channel data format with the value stored as-is.
#desc 32-bit-per-channel unsigned integer red/green channel data format. Values are in the [code][0, 2^32 - 1][/code] range.
#desc 32-bit-per-channel signed integer red/green channel data format. Values are in the [code][2^31 + 1, 2^31 - 1][/code] range.
#desc 32-bit-per-channel signed floating-point red/green channel data format with the value stored as-is.
#desc 32-bit-per-channel unsigned integer red/green/blue channel data format. Values are in the [code][0, 2^32 - 1][/code] range.
#desc 32-bit-per-channel signed integer red/green/blue channel data format. Values are in the [code][2^31 + 1, 2^31 - 1][/code] range.
#desc 32-bit-per-channel signed floating-point red/green/blue channel data format with the value stored as-is.
#desc 32-bit-per-channel unsigned integer red/green/blue/alpha channel data format. Values are in the [code][0, 2^32 - 1][/code] range.
#desc 32-bit-per-channel signed integer red/green/blue/alpha channel data format. Values are in the [code][2^31 + 1, 2^31 - 1][/code] range.
#desc 32-bit-per-channel signed floating-point red/green/blue/alpha channel data format with the value stored as-is.
#desc 64-bit-per-channel unsigned integer red channel data format. Values are in the [code][0, 2^64 - 1][/code] range.
#desc 64-bit-per-channel signed integer red channel data format. Values are in the [code][2^63 + 1, 2^63 - 1][/code] range.
#desc 64-bit-per-channel signed floating-point red channel data format with the value stored as-is.
#desc 64-bit-per-channel unsigned integer red/green channel data format. Values are in the [code][0, 2^64 - 1][/code] range.
#desc 64-bit-per-channel signed integer red/green channel data format. Values are in the [code][2^63 + 1, 2^63 - 1][/code] range.
#desc 64-bit-per-channel signed floating-point red/green channel data format with the value stored as-is.
#desc 64-bit-per-channel unsigned integer red/green/blue channel data format. Values are in the [code][0, 2^64 - 1][/code] range.
#desc 64-bit-per-channel signed integer red/green/blue channel data format. Values are in the [code][2^63 + 1, 2^63 - 1][/code] range.
#desc 64-bit-per-channel signed floating-point red/green/blue channel data format with the value stored as-is.
#desc 64-bit-per-channel unsigned integer red/green/blue/alpha channel data format. Values are in the [code][0, 2^64 - 1][/code] range.
#desc 64-bit-per-channel signed integer red/green/blue/alpha channel data format. Values are in the [code][2^63 + 1, 2^63 - 1][/code] range.
#desc 64-bit-per-channel signed floating-point red/green/blue/alpha channel data format with the value stored as-is.
#desc Unsigned floating-point blue/green/red data format with the value stored as-is, packed in 32 bits. The format's precision is 10 bits of blue channel, 11 bits of green channel and 11 bits of red channel.
#desc Unsigned floating-point exposure/blue/green/red data format with the value stored as-is, packed in 32 bits. The format's precision is 5 bits of exposure, 9 bits of blue channel, 9 bits of green channel and 9 bits of red channel.
#desc 16-bit unsigned floating-point depth data format with normalized value. Values are in the [code][0.0, 1.0][/code] range.
#desc 24-bit unsigned floating-point depth data format with normalized value, plus 8 unused bits, packed in 32 bits. Values for depth are in the [code][0.0, 1.0][/code] range.
#desc 32-bit signed floating-point depth data format with the value stored as-is.
#desc 8-bit unsigned integer stencil data format.
#desc 16-bit unsigned floating-point depth data format with normalized value, plus 8 bits of stencil in unsigned integer format. Values for depth are in the [code][0.0, 1.0][/code] range. Values for stencil are in the [code][0, 255][/code] range.
#desc 24-bit unsigned floating-point depth data format with normalized value, plus 8 bits of stencil in unsigned integer format. Values for depth are in the [code][0.0, 1.0][/code] range. Values for stencil are in the [code][0, 255][/code] range.
#desc 32-bit signed floating-point depth data format with the value stored as-is, plus 8 bits of stencil in unsigned integer format. Values for stencil are in the [code][0, 255][/code] range.
#desc VRAM-compressed unsigned red/green/blue channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range. The format's precision is 5 bits of red channel, 6 bits of green channel and 5 bits of blue channel. Using BC1 texture compression (also known as S3TC DXT1).
#desc VRAM-compressed unsigned red/green/blue channel data format with normalized value and non-linear sRGB encoding. Values are in the [code][0.0, 1.0][/code] range. The format's precision is 5 bits of red channel, 6 bits of green channel and 5 bits of blue channel. Using BC1 texture compression (also known as S3TC DXT1).
#desc VRAM-compressed unsigned red/green/blue/alpha channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range. The format's precision is 5 bits of red channel, 6 bits of green channel, 5 bits of blue channel and 1 bit of alpha channel. Using BC1 texture compression (also known as S3TC DXT1).
#desc VRAM-compressed unsigned red/green/blue/alpha channel data format with normalized value and non-linear sRGB encoding. Values are in the [code][0.0, 1.0][/code] range. The format's precision is 5 bits of red channel, 6 bits of green channel, 5 bits of blue channel and 1 bit of alpha channel. Using BC1 texture compression (also known as S3TC DXT1).
#desc VRAM-compressed unsigned red/green/blue/alpha channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range. The format's precision is 5 bits of red channel, 6 bits of green channel, 5 bits of blue channel and 4 bits of alpha channel. Using BC2 texture compression (also known as S3TC DXT3).
#desc VRAM-compressed unsigned red/green/blue/alpha channel data format with normalized value and non-linear sRGB encoding. Values are in the [code][0.0, 1.0][/code] range. The format's precision is 5 bits of red channel, 6 bits of green channel, 5 bits of blue channel and 4 bits of alpha channel. Using BC2 texture compression (also known as S3TC DXT3).
#desc VRAM-compressed unsigned red/green/blue/alpha channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range. The format's precision is 5 bits of red channel, 6 bits of green channel, 5 bits of blue channel and 8 bits of alpha channel. Using BC3 texture compression (also known as S3TC DXT5).
#desc VRAM-compressed unsigned red/green/blue/alpha channel data format with normalized value and non-linear sRGB encoding. Values are in the [code][0.0, 1.0][/code] range. The format's precision is 5 bits of red channel, 6 bits of green channel, 5 bits of blue channel and 8 bits of alpha channel. Using BC3 texture compression (also known as S3TC DXT5).
#desc VRAM-compressed unsigned red channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range. The format's precision is 8 bits of red channel. Using BC4 texture compression.
#desc VRAM-compressed signed red channel data format with normalized value. Values are in the [code][-1.0, 1.0][/code] range. The format's precision is 8 bits of red channel. Using BC4 texture compression.
#desc VRAM-compressed unsigned red/green channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range. The format's precision is 8 bits of red channel and 8 bits of green channel. Using BC5 texture compression (also known as S3TC RGTC).
#desc VRAM-compressed signed red/green channel data format with normalized value. Values are in the [code][-1.0, 1.0][/code] range. The format's precision is 8 bits of red channel and 8 bits of green channel. Using BC5 texture compression (also known as S3TC RGTC).
#desc VRAM-compressed unsigned red/green/blue channel data format with the floating-point value stored as-is. The format's precision is 8 bits of red channel and 8 bits of green channel. Using BC6H texture compression (also known as BPTC HDR).
#desc VRAM-compressed signed red/green/blue channel data format with the floating-point value stored as-is. The format's precision is between 4 and 7 bits for the red/green/blue channels and between 0 and 8 bits for the alpha channel. Using BC7 texture compression (also known as BPTC HDR).
#desc VRAM-compressed unsigned red/green/blue/alpha channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range. The format's precision is between 4 and 7 bits for the red/green/blue channels and between 0 and 8 bits for the alpha channel. Also known as BPTC LDR.
#desc VRAM-compressed unsigned red/green/blue/alpha channel data format with normalized value and non-linear sRGB encoding. Values are in the [code][0.0, 1.0][/code] range. The format's precision is between 4 and 7 bits for the red/green/blue channels and between 0 and 8 bits for the alpha channel. Also known as BPTC LDR.
#desc VRAM-compressed unsigned red/green/blue channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range. Using ETC2 texture compression.
#desc VRAM-compressed unsigned red/green/blue channel data format with normalized value and non-linear sRGB encoding. Values are in the [code][0.0, 1.0][/code] range. Using ETC2 texture compression.
#desc VRAM-compressed unsigned red/green/blue/alpha channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range. Red/green/blue use 8 bit of precision each, with alpha using 1 bit of precision. Using ETC2 texture compression.
#desc VRAM-compressed unsigned red/green/blue/alpha channel data format with normalized value and non-linear sRGB encoding. Values are in the [code][0.0, 1.0][/code] range. Red/green/blue use 8 bit of precision each, with alpha using 1 bit of precision. Using ETC2 texture compression.
#desc VRAM-compressed unsigned red/green/blue/alpha channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range. Red/green/blue use 8 bits of precision each, with alpha using 8 bits of precision. Using ETC2 texture compression.
#desc VRAM-compressed unsigned red/green/blue/alpha channel data format with normalized value and non-linear sRGB encoding. Values are in the [code][0.0, 1.0][/code] range. Red/green/blue use 8 bits of precision each, with alpha using 8 bits of precision. Using ETC2 texture compression.
#desc 11-bit VRAM-compressed unsigned red channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range. Using ETC2 texture compression.
#desc 11-bit VRAM-compressed signed red channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range. Using ETC2 texture compression.
#desc 11-bit VRAM-compressed unsigned red/green channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range. Using ETC2 texture compression.
#desc 11-bit VRAM-compressed signed red/green channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range. Using ETC2 texture compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value, packed in 4×4 blocks (highest quality). Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value and non-linear sRGB encoding, packed in 4×4 blocks (highest quality). Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value, packed in 5×4 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value and non-linear sRGB encoding, packed in 5×4 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value, packed in 5×5 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value and non-linear sRGB encoding, packed in 5×5 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value, packed in 6×5 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value and non-linear sRGB encoding, packed in 6×5 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value, packed in 6×6 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value and non-linear sRGB encoding, packed in 6×6 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value, packed in 8×5 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value and non-linear sRGB encoding, packed in 8×5 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value, packed in 8×6 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value and non-linear sRGB encoding, packed in 8×6 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value, packed in 8×8 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value and non-linear sRGB encoding, packed in 8×8 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value, packed in 10×5 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value and non-linear sRGB encoding, packed in 10×5 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value, packed in 10×6 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value and non-linear sRGB encoding, packed in 10×6 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value, packed in 10×8 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value and non-linear sRGB encoding, packed in 10×8 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value, packed in 10×10 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value and non-linear sRGB encoding, packed in 10×10 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value, packed in 12×10 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value and non-linear sRGB encoding, packed in 12×10 blocks. Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value, packed in 12 blocks (lowest quality). Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc VRAM-compressed unsigned floating-point data format with normalized value and non-linear sRGB encoding, packed in 12 blocks (lowest quality). Values are in the [code][0.0, 1.0][/code] range. Using ASTC compression.
#desc 8-bit-per-channel unsigned floating-point green/blue/red channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal resolution (i.e. 2 horizontally adjacent pixels will share the same value for the blue/red channel).
#desc 8-bit-per-channel unsigned floating-point blue/green/red channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal resolution (i.e. 2 horizontally adjacent pixels will share the same value for the blue/red channel).
#desc 8-bit-per-channel unsigned floating-point green/blue/red channel data with normalized value, stored across 3 separate planes (green + blue + red). Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal and vertical resolution (i.e. 2×2 adjacent pixels will share the same value for the blue/red channel).
#desc 8-bit-per-channel unsigned floating-point green/blue/red channel data with normalized value, stored across 2 separate planes (green + blue/red). Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal and vertical resolution (i.e. 2×2 adjacent pixels will share the same value for the blue/red channel).
#desc 8-bit-per-channel unsigned floating-point green/blue/red channel data with normalized value, stored across 2 separate planes (green + blue + red). Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal resolution (i.e. 2 horizontally adjacent pixels will share the same value for the blue/red channel).
#desc 8-bit-per-channel unsigned floating-point green/blue/red channel data with normalized value, stored across 2 separate planes (green + blue/red). Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal resolution (i.e. 2 horizontally adjacent pixels will share the same value for the blue/red channel).
#desc 8-bit-per-channel unsigned floating-point green/blue/red channel data with normalized value, stored across 3 separate planes. Values are in the [code][0.0, 1.0][/code] range.
#desc 10-bit-per-channel unsigned floating-point red channel data with normalized value, plus 6 unused bits, packed in 16 bits. Values are in the [code][0.0, 1.0][/code] range.
#desc 10-bit-per-channel unsigned floating-point red/green channel data with normalized value, plus 6 unused bits after each channel, packed in 2×16 bits. Values are in the [code][0.0, 1.0][/code] range.
#desc 10-bit-per-channel unsigned floating-point red/green/blue/alpha channel data with normalized value, plus 6 unused bits after each channel, packed in 4×16 bits. Values are in the [code][0.0, 1.0][/code] range.
#desc 10-bit-per-channel unsigned floating-point green/blue/green/red channel data with normalized value, plus 6 unused bits after each channel, packed in 4×16 bits. Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal resolution (i.e. 2 horizontally adjacent pixels will share the same value for the blue/red channel). The green channel is listed twice, but contains different values to allow it to be represented at full resolution.
#desc 10-bit-per-channel unsigned floating-point blue/green/red/green channel data with normalized value, plus 6 unused bits after each channel, packed in 4×16 bits. Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal resolution (i.e. 2 horizontally adjacent pixels will share the same value for the blue/red channel). The green channel is listed twice, but contains different values to allow it to be represented at full resolution.
#desc 10-bit-per-channel unsigned floating-point green/blue/red channel data with normalized value, plus 6 unused bits after each channel. Packed in 3×16 bits and stored across 2 separate planes (green + blue + red). Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal and vertical resolution (i.e. 2×2 adjacent pixels will share the same value for the blue/red channel).
#desc 10-bit-per-channel unsigned floating-point green/blue/red channel data with normalized value, plus 6 unused bits after each channel. Packed in 3×16 bits and stored across 2 separate planes (green + blue/red). Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal and vertical resolution (i.e. 2×2 adjacent pixels will share the same value for the blue/red channel).
#desc 10-bit-per-channel unsigned floating-point green/blue/red channel data with normalized value, plus 6 unused bits after each channel. Packed in 3×16 bits and stored across 3 separate planes (green + blue + red). Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal resolution (i.e. 2 horizontally adjacent pixels will share the same value for the blue/red channel).
#desc 10-bit-per-channel unsigned floating-point green/blue/red channel data with normalized value, plus 6 unused bits after each channel. Packed in 3×16 bits and stored across 3 separate planes (green + blue/red). Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal resolution (i.e. 2 horizontally adjacent pixels will share the same value for the blue/red channel).
#desc 10-bit-per-channel unsigned floating-point green/blue/red channel data with normalized value, plus 6 unused bits after each channel. Packed in 3×16 bits and stored across 3 separate planes (green + blue + red). Values are in the [code][0.0, 1.0][/code] range.
#desc 12-bit-per-channel unsigned floating-point red channel data with normalized value, plus 6 unused bits, packed in 16 bits. Values are in the [code][0.0, 1.0][/code] range.
#desc 12-bit-per-channel unsigned floating-point red/green channel data with normalized value, plus 6 unused bits after each channel, packed in 2×16 bits. Values are in the [code][0.0, 1.0][/code] range.
#desc 12-bit-per-channel unsigned floating-point red/green/blue/alpha channel data with normalized value, plus 6 unused bits after each channel, packed in 4×16 bits. Values are in the [code][0.0, 1.0][/code] range.
#desc 12-bit-per-channel unsigned floating-point green/blue/green/red channel data with normalized value, plus 6 unused bits after each channel, packed in 4×16 bits. Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal resolution (i.e. 2 horizontally adjacent pixels will share the same value for the blue/red channel). The green channel is listed twice, but contains different values to allow it to be represented at full resolution.
#desc 12-bit-per-channel unsigned floating-point blue/green/red/green channel data with normalized value, plus 6 unused bits after each channel, packed in 4×16 bits. Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal resolution (i.e. 2 horizontally adjacent pixels will share the same value for the blue/red channel). The green channel is listed twice, but contains different values to allow it to be represented at full resolution.
#desc 12-bit-per-channel unsigned floating-point green/blue/red channel data with normalized value, plus 6 unused bits after each channel. Packed in 3×16 bits and stored across 2 separate planes (green + blue + red). Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal and vertical resolution (i.e. 2×2 adjacent pixels will share the same value for the blue/red channel).
#desc 12-bit-per-channel unsigned floating-point green/blue/red channel data with normalized value, plus 6 unused bits after each channel. Packed in 3×16 bits and stored across 2 separate planes (green + blue/red). Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal and vertical resolution (i.e. 2×2 adjacent pixels will share the same value for the blue/red channel).
#desc 12-bit-per-channel unsigned floating-point green/blue/red channel data with normalized value, plus 6 unused bits after each channel. Packed in 3×16 bits and stored across 3 separate planes (green + blue + red). Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal resolution (i.e. 2 horizontally adjacent pixels will share the same value for the blue/red channel).
#desc 12-bit-per-channel unsigned floating-point green/blue/red channel data with normalized value, plus 6 unused bits after each channel. Packed in 3×16 bits and stored across 3 separate planes (green + blue/red). Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal resolution (i.e. 2 horizontally adjacent pixels will share the same value for the blue/red channel).
#desc 12-bit-per-channel unsigned floating-point green/blue/red channel data with normalized value, plus 6 unused bits after each channel. Packed in 3×16 bits and stored across 3 separate planes (green + blue + red). Values are in the [code][0.0, 1.0][/code] range.
#desc 16-bit-per-channel unsigned floating-point green/blue/red channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal resolution (i.e. 2 horizontally adjacent pixels will share the same value for the blue/red channel).
#desc 16-bit-per-channel unsigned floating-point blue/green/red channel data format with normalized value. Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal resolution (i.e. 2 horizontally adjacent pixels will share the same value for the blue/red channel).
#desc 16-bit-per-channel unsigned floating-point green/blue/red channel data with normalized value, plus 6 unused bits after each channel. Stored across 2 separate planes (green + blue + red). Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal and vertical resolution (i.e. 2×2 adjacent pixels will share the same value for the blue/red channel).
#desc 16-bit-per-channel unsigned floating-point green/blue/red channel data with normalized value, plus 6 unused bits after each channel. Stored across 2 separate planes (green + blue/red). Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal and vertical resolution (i.e. 2×2 adjacent pixels will share the same value for the blue/red channel).
#desc 16-bit-per-channel unsigned floating-point green/blue/red channel data with normalized value, plus 6 unused bits after each channel. Stored across 3 separate planes (green + blue + red). Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal resolution (i.e. 2 horizontally adjacent pixels will share the same value for the blue/red channel).
#desc 16-bit-per-channel unsigned floating-point green/blue/red channel data with normalized value, plus 6 unused bits after each channel. Stored across 3 separate planes (green + blue/red). Values are in the [code][0.0, 1.0][/code] range. Blue and red channel data is stored at halved horizontal resolution (i.e. 2 horizontally adjacent pixels will share the same value for the blue/red channel).
#desc 16-bit-per-channel unsigned floating-point green/blue/red channel data with normalized value, plus 6 unused bits after each channel. Stored across 3 separate planes (green + blue + red). Values are in the [code][0.0, 1.0][/code] range.
#desc Represents the size of the [enum DataFormat] enum.
#desc Raster barrier mask.
#desc Compute barrier mask.
#desc Transfer barrier mask.
#desc Barrier mask for all types (raster, compute, transfer). Equivalent to [code]BARRIER_MASK_RASTER | BARRIER_MASK_COMPUTE | BARRIER_MASK_TRANSFER[/code].
#desc No barrier for any type.
#desc 1-dimensional texture.
#desc 2-dimensional texture.
#desc 3-dimensional texture.
#desc [Cubemap] texture.
#desc Array of 1-dimensional textures.
#desc Array of 2-dimensional textures.
#desc Array of [Cubemap] textures.
#desc Represents the size of the [enum TextureType] enum.
#desc Perform 1 texture sample (this is the fastest but lowest-quality for antialiasing).
#desc Perform 2 texture samples.
#desc Perform 4 texture samples.
#desc Perform 8 texture samples. Not supported on mobile GPUs (including Apple Silicon).
#desc Perform 16 texture samples. Not supported on mobile GPUs and many desktop GPUs.
#desc Perform 32 texture samples. Not supported on most GPUs.
#desc Perform 64 texture samples (this is the slowest but highest-quality for antialiasing). Not supported on most GPUs.
#desc Represents the size of the [enum TextureSamples] enum.
#desc Texture can be sampled.
#desc Texture can be used as a color attachment in a framebuffer.
#desc Texture can be used as a depth/stencil attachment in a framebuffer.
#desc Texture can be used as a [url=https://registry.khronos.org/vulkan/specs/1.3-extensions/html/vkspec.html#descriptorsets-storageimage]storage image[/url].
#desc Texture can be used as a [url=https://registry.khronos.org/vulkan/specs/1.3-extensions/html/vkspec.html#descriptorsets-storageimage]storage image[/url] with support for atomic operations.
#desc Texture can be read back on the CPU using [method texture_get_data] faster than without this bit, since it is always kept in the system memory.
#desc Texture can be updated using [method texture_update].
#desc Texture can be a source for [method texture_copy].
#desc Texture can be a destination for [method texture_copy].
#desc Texture can be used as a [url=https://registry.khronos.org/vulkan/specs/1.3-extensions/html/vkspec.html#descriptorsets-inputattachment]input attachment[/url] in a framebuffer.
#desc Return the sampled value as-is.
#desc Always return [code]0.0[/code] when sampling.
#desc Always return [code]1.0[/code] when sampling.
#desc Sample the red color channel.
#desc Sample the green color channel.
#desc Sample the blue color channel.
#desc Sample the alpha channel.
#desc Represents the size of the [enum TextureSwizzle] enum.
#desc 2-dimensional texture slice.
#desc Cubemap texture slice.
#desc 3-dimensional texture slice.
#desc Nearest-neighbor sampler filtering. Sampling at higher resolutions than the source will result in a pixelated look.
#desc Bilinear sampler filtering. Sampling at higher resolutions than the source will result in a blurry look.
#desc Sample with repeating enabled.
#desc Sample with mirrored repeating enabled. When sampling outside the [code][0.0, 1.0][/code] range, return a mirrored version of the sampler. This mirrored version is mirrored again if sampling further away, with the pattern repeating indefinitely.
#desc Sample with repeating disabled. When sampling outside the [code][0.0, 1.0][/code] range, return the color of the last pixel on the edge.
#desc Sample with repeating disabled. When sampling outside the [code][0.0, 1.0][/code] range, return the specified [member RDSamplerState.border_color].
#desc Sample with mirrored repeating enabled, but only once. When sampling in the [code][-1.0, 0.0][/code] range, return a mirrored version of the sampler. When sampling outside the [code][-1.0, 1.0][/code] range, return the color of the last pixel on the edge.
#desc Represents the size of the [enum SamplerRepeatMode] enum.
#desc Return a floating-point transparent black color when sampling outside the [code][0.0, 1.0][/code] range. Only effective if the sampler repeat mode is [constant SAMPLER_REPEAT_MODE_CLAMP_TO_BORDER].
#desc Return a integer transparent black color when sampling outside the [code][0.0, 1.0][/code] range. Only effective if the sampler repeat mode is [constant SAMPLER_REPEAT_MODE_CLAMP_TO_BORDER].
#desc Return a floating-point opaque black color when sampling outside the [code][0.0, 1.0][/code] range. Only effective if the sampler repeat mode is [constant SAMPLER_REPEAT_MODE_CLAMP_TO_BORDER].
#desc Return a integer opaque black color when sampling outside the [code][0.0, 1.0][/code] range. Only effective if the sampler repeat mode is [constant SAMPLER_REPEAT_MODE_CLAMP_TO_BORDER].
#desc Return a floating-point opaque white color when sampling outside the [code][0.0, 1.0][/code] range. Only effective if the sampler repeat mode is [constant SAMPLER_REPEAT_MODE_CLAMP_TO_BORDER].
#desc Return a integer opaque white color when sampling outside the [code][0.0, 1.0][/code] range. Only effective if the sampler repeat mode is [constant SAMPLER_REPEAT_MODE_CLAMP_TO_BORDER].
#desc Represents the size of the [enum SamplerBorderColor] enum.
#desc Vertex attribute addressing is a function of the vertex. This is used to specify the rate at which vertex attributes are pulled from buffers.
#desc Vertex attribute addressing is a function of the instance index. This is used to specify the rate at which vertex attributes are pulled from buffers.
#desc Index buffer in 16-bit unsigned integer format. This limits the maximum index that can be specified to [code]65535[/code].
#desc Index buffer in 32-bit unsigned integer format. This limits the maximum index that can be specified to [code]4294967295[/code].
#desc Sampler uniform. TODO: Difference between sampler and texture uniform
#desc Sampler uniform with a texture.
#desc Texture uniform.
#desc Image uniform. TODO: Difference between texture and image uniform
#desc Texture buffer uniform. TODO: Difference between texture and texture buffe uniformr
#desc Sampler uniform with a texture buffer. TODO: Difference between texture and texture buffer uniform
#desc Image buffer uniform. TODO: Difference between texture and image uniforms
#desc Uniform buffer uniform.
#desc [url=https://vkguide.dev/docs/chapter-4/storage_buffers/]Storage buffer[/url] uniform.
#desc Input attachment uniform.
#desc Represents the size of the [enum UniformType] enum.
#desc Point rendering primitive (with constant size, regardless of distance from camera).
#desc Line list rendering primitive. Lines are drawn separated from each other.
#desc [url=https://registry.khronos.org/vulkan/specs/1.3-extensions/html/vkspec.html#drawing-line-lists-with-adjacency]Line list rendering primitive with adjacency.[/url]
#desc [b]Note:[/b] Adjacency is only useful with geometry shaders, which Godot does not expose.
#desc Line strip rendering primitive. Lines drawn are connected to the previous vertex.
#desc [url=https://registry.khronos.org/vulkan/specs/1.3-extensions/html/vkspec.html#drawing-line-strips-with-adjacency]Line strip rendering primitive with adjacency.[/url]
#desc [b]Note:[/b] Adjacency is only useful with geometry shaders, which Godot does not expose.
#desc Triangle list rendering primitive. Triangles are drawn separated from each other.
#desc [url=https://registry.khronos.org/vulkan/specs/1.3-extensions/html/vkspec.html#drawing-triangle-lists-with-adjacency]Triangle list rendering primitive with adjacency.[/url]
#desc [b]Note:[/b] Adjacency is only useful with geometry shaders, which Godot does not expose.
#desc Triangle strip rendering primitive. Triangles drawn are connected to the previous triangle.
#desc [url=https://registry.khronos.org/vulkan/specs/1.3-extensions/html/vkspec.html#drawing-triangle-strips-with-adjacency]Triangle strip rendering primitive with adjacency.[/url]
#desc [b]Note:[/b] Adjacency is only useful with geometry shaders, which Godot does not expose.
#desc Triangle strip rendering primitive with [i]primitive restart[/i] enabled. Triangles drawn are connected to the previous triangle, but a primitive restart index can be specified before drawing to create a second triangle strip after the specified index.
#desc [b]Note:[/b] Only compatible with indexed draws.
#desc Tessellation patch rendering primitive. Only useful with tessellation shaders, which can be used to deform these patches.
#desc Represents the size of the [enum RenderPrimitive] enum.
#desc Do not use polygon front face or backface culling.
#desc Use polygon frontface culling (faces pointing towards the camera are hidden).
#desc Use polygon backface culling (faces pointing away from the camera are hidden).
#desc Clockwise winding order to determine which face of a polygon is its front face.
#desc Counter-clockwise winding order to determine which face of a polygon is its front face.
#desc Keep the current stencil value.
#desc Set the stencil value to [code]0[/code].
#desc Replace the existing stencil value with the new one.
#desc Increment the existing stencil value and clamp to the maximum representable unsigned value if reached. Stencil bits are considered as an unsigned integer.
#desc Decrement the existing stencil value and clamp to the minimum value if reached. Stencil bits are considered as an unsigned integer.
#desc Bitwise-invert the existing stencil value.
#desc Increment the stencil value and wrap around to [code]0[/code] if reaching the maximum representable unsigned. Stencil bits are considered as an unsigned integer.
#desc Decrement the stencil value and wrap around to the maximum representable unsigned if reaching the minimum. Stencil bits are considered as an unsigned integer.
#desc Represents the size of the [enum StencilOperation] enum.
#desc "Never" comparison (opposite of [constant COMPARE_OP_ALWAYS]).
#desc "Less than" comparison.
#desc "Equal" comparison.
#desc "Less than or equal" comparison.
#desc "Greater than" comparison.
#desc "Not equal" comparison.
#desc "Greater than or equal" comparison.
#desc "Always" comparison (opposite of [constant COMPARE_OP_NEVER]).
#desc Represents the size of the [enum CompareOperator] enum.
#desc Clear logic operation (result is always [code]0[/code]). See also [constant LOGIC_OP_SET].
#desc AND logic operation.
#desc AND logic operation with the [i]destination[/i] operand being inverted. See also [constant LOGIC_OP_AND_INVERTED].
#desc Copy logic operation (keeps the [i]source[/i] value as-is). See also [constant LOGIC_OP_COPY_INVERTED] and [constant LOGIC_OP_NO_OP].
#desc AND logic operation with the [i]source[/i] operand being inverted. See also [constant LOGIC_OP_AND_REVERSE].
#desc No-op logic operation (keeps the [i]destination[/i] value as-is). See also [constant LOGIC_OP_COPY].
#desc Exclusive or (XOR) logic operation.
#desc OR logic operation.
#desc Not-OR (NOR) logic operation.
#desc Not-XOR (XNOR) logic operation.
#desc Invert logic operation.
#desc OR logic operation with the [i]destination[/i] operand being inverted. See also [constant LOGIC_OP_OR_REVERSE].
#desc NOT logic operation (inverts the value). See also [constant LOGIC_OP_COPY].
#desc OR logic operation with the [i]source[/i] operand being inverted. See also [constant LOGIC_OP_OR_REVERSE].
#desc Not-AND (NAND) logic operation.
#desc SET logic operation (result is always [code]1[/code]). See also [constant LOGIC_OP_CLEAR].
#desc Represents the size of the [enum LogicOperation] enum.
#desc Constant [code]0.0[/code] blend factor.
#desc Constant [code]1.0[/code] blend factor.
#desc Color blend factor is [code]source color[/code]. Alpha blend factor is [code]source alpha[/code].
#desc Color blend factor is [code]1.0 - source color[/code]. Alpha blend factor is [code]1.0 - source alpha[/code].
#desc Color blend factor is [code]destination color[/code]. Alpha blend factor is [code]destination alpha[/code].
#desc Color blend factor is [code]1.0 - destination color[/code]. Alpha blend factor is [code]1.0 - destination alpha[/code].
#desc Color and alpha blend factor is [code]source alpha[/code].
#desc Color and alpha blend factor is [code]1.0 - source alpha[/code].
#desc Color and alpha blend factor is [code]destination alpha[/code].
#desc Color and alpha blend factor is [code]1.0 - destination alpha[/code].
#desc Color blend factor is [code]blend constant color[/code]. Alpha blend factor is [code]blend constant alpha[/code] (see [method draw_list_set_blend_constants]).
#desc Color blend factor is [code]1.0 - blend constant color[/code]. Alpha blend factor is [code]1.0 - blend constant alpha[/code] (see [method draw_list_set_blend_constants]).
#desc Color and alpha blend factor is [code]blend constant alpha[/code] (see [method draw_list_set_blend_constants]).
#desc Color and alpha blend factor is [code]1.0 - blend constant alpha[/code] (see [method draw_list_set_blend_constants]).
#desc Color blend factor is [code]min(source alpha, 1.0 - destination alpha)[/code]. Alpha blend factor is [code]1.0[/code].
#desc Color blend factor is [code]second source color[/code]. Alpha blend factor is [code]second source alpha[/code]. Only relevant for dual-source blending.
#desc Color blend factor is [code]1.0 - second source color[/code]. Alpha blend factor is [code]1.0 - second source alpha[/code]. Only relevant for dual-source blending.
#desc Color and alpha blend factor is [code]second source alpha[/code]. Only relevant for dual-source blending.
#desc Color and alpha blend factor is [code]1.0 - second source alpha[/code]. Only relevant for dual-source blending.
#desc Represents the size of the [enum BlendFactor] enum.
#desc Additive blending operation ([code]source + destination[/code]).
#desc Subtractive blending operation ([code]source - destination[/code]).
#desc Reverse subtractive blending operation ([code]destination - source[/code]).
#desc Minimum blending operation (keep the lowest value of the two).
#desc Maximum blending operation (keep the highest value of the two).
#desc Represents the size of the [enum BlendOperation] enum.
#desc Represents the size of the [enum InitialAction] enum.
#desc Store the texture for reading and make it read-only if it has the [constant TEXTURE_USAGE_SAMPLING_BIT] bit (only applies to color, depth and stencil attachments).
#desc Discard the texture data and make it read-only if it has the [constant TEXTURE_USAGE_SAMPLING_BIT] bit (only applies to color, depth and stencil attachments).
#desc Store the texture and continue for further processing. Similar to [constant FINAL_ACTION_READ], but does not make the texture read-only if it has the [constant TEXTURE_USAGE_SAMPLING_BIT] bit.
#desc Represents the size of the [enum FinalAction] enum.
#desc Vertex shader stage. This can be used to manipulate vertices from a shader (but not create new vertices).
#desc Fragment shader stage (called "pixel shader" in Direct3D). This can be used to manipulate pixels from a shader.
#desc Tessellation control shader stage. This can be used to create additional geometry from a shader.
#desc Tessellation evaluation shader stage. This can be used to create additional geometry from a shader.
#desc Compute shader stage. This can be used to run arbitrary computing tasks in a shader, performing them on the GPU instead of the CPU.
#desc Represents the size of the [enum ShaderStage] enum.
#desc Vertex shader stage bit (see also [constant SHADER_STAGE_VERTEX]).
#desc Fragment shader stage bit (see also [constant SHADER_STAGE_FRAGMENT]).
#desc Tessellation control shader stage bit (see also [constant SHADER_STAGE_TESSELATION_CONTROL]).
#desc Tessellation evaluation shader stage bit (see also [constant SHADER_STAGE_TESSELATION_EVALUATION]).
#desc Compute shader stage bit (see also [constant SHADER_STAGE_COMPUTE]).
#desc Khronos' GLSL shading language (used natively by OpenGL and Vulkan). This is the language used for core Godot shaders.
#desc Microsoft's High-Level Shading Language (used natively by Direct3D, but can also be used in Vulkan).
#desc Boolean specialization constant.
#desc Integer specialization constant.
#desc Floating-point specialization constant.
#desc Maximum number of uniform sets that can be bound at a given time.
#desc Maximum number of color framebuffer attachments that can be used at a given time.
#desc Maximum number of textures that can be used per uniform set.
#desc Maximum number of samplers that can be used per uniform set.
#desc Maximum number of [url=https://vkguide.dev/docs/chapter-4/storage_buffers/]storage buffers[/url] per uniform set.
#desc Maximum number of storage images per uniform set.
#desc Maximum number of uniform buffers per uniform set.
#desc Maximum index for an indexed draw command.
#desc Maximum height of a framebuffer (in pixels).
#desc Maximum width of a framebuffer (in pixels).
#desc Maximum number of texture array layers.
#desc Maximum supported 1-dimensional texture size (in pixels on a single axis).
#desc Maximum supported 2-dimensional texture size (in pixels on a single axis).
#desc Maximum supported 3-dimensional texture size (in pixels on a single axis).
#desc Maximum supported cubemap texture size (in pixels on a single axis of a single face).
#desc Maximum number of textures per shader stage.
#desc Maximum number of samplers per shader stage.
#desc Maximum number of [url=https://vkguide.dev/docs/chapter-4/storage_buffers/]storage buffers[/url] per shader stage.
#desc Maximum number of storage images per shader stage.
#desc Maximum number of uniform buffers per uniform set.
#desc Maximum size of a push constant. A lot of devices are limited to 128 bytes, so try to avoid exceeding 128 bytes in push constants to ensure compatibility even if your GPU is reporting a higher value.
#desc Maximum size of a uniform buffer.
#desc Maximum vertex input attribute offset.
#desc Maximum number of vertex input attributes.
#desc Maximum number of vertex input bindings.
#desc Maximum vertex input binding stride.
#desc Minimum uniform buffer offset alignment.
#desc Maximum shared memory size for compute shaders.
#desc Maximum number of workgroups for compute shaders on the X axis.
#desc Maximum number of workgroups for compute shaders on the Y axis.
#desc Maximum number of workgroups for compute shaders on the Z axis.
#desc Maximum number of workgroup invocations for compute shaders.
#desc Maximum workgroup size for compute shaders on the X axis.
#desc Maximum workgroup size for compute shaders on the Y axis.
#desc Maximum workgroup size for compute shaders on the Z axis.
#desc Maximum viewport width (in pixels).
#desc Maximum viewport height (in pixels).
#desc Memory taken by textures.
#desc Memory taken by buffers.
#desc Total memory taken. This is greater than the sum of [constant MEMORY_TEXTURES] and [constant MEMORY_BUFFERS], as it also includes miscellaneous memory usage.
#desc Returned by functions that return an ID if a value is invalid.
const INVALID_ID = -1;

#desc Returned by functions that return a format ID if a value is invalid.
const INVALID_FORMAT_ID = -1;


#enum DeviceType
enum {
    DEVICE_TYPE_OTHER = 0,
    DEVICE_TYPE_INTEGRATED_GPU = 1,
    DEVICE_TYPE_DISCRETE_GPU = 2,
    DEVICE_TYPE_VIRTUAL_GPU = 3,
    DEVICE_TYPE_CPU = 4,
    DEVICE_TYPE_MAX = 5,
}
#enum DriverResource
enum {
    DRIVER_RESOURCE_VULKAN_DEVICE = 0,
    DRIVER_RESOURCE_VULKAN_PHYSICAL_DEVICE = 1,
    DRIVER_RESOURCE_VULKAN_INSTANCE = 2,
    DRIVER_RESOURCE_VULKAN_QUEUE = 3,
    DRIVER_RESOURCE_VULKAN_QUEUE_FAMILY_INDEX = 4,
    DRIVER_RESOURCE_VULKAN_IMAGE = 5,
    DRIVER_RESOURCE_VULKAN_IMAGE_VIEW = 6,
    DRIVER_RESOURCE_VULKAN_IMAGE_NATIVE_TEXTURE_FORMAT = 7,
    DRIVER_RESOURCE_VULKAN_SAMPLER = 8,
    DRIVER_RESOURCE_VULKAN_DESCRIPTOR_SET = 9,
    DRIVER_RESOURCE_VULKAN_BUFFER = 10,
    DRIVER_RESOURCE_VULKAN_COMPUTE_PIPELINE = 11,
    DRIVER_RESOURCE_VULKAN_RENDER_PIPELINE = 12,
}
#enum DataFormat
enum {
    DATA_FORMAT_R4G4_UNORM_PACK8 = 0,
    DATA_FORMAT_R4G4B4A4_UNORM_PACK16 = 1,
    DATA_FORMAT_B4G4R4A4_UNORM_PACK16 = 2,
    DATA_FORMAT_R5G6B5_UNORM_PACK16 = 3,
    DATA_FORMAT_B5G6R5_UNORM_PACK16 = 4,
    DATA_FORMAT_R5G5B5A1_UNORM_PACK16 = 5,
    DATA_FORMAT_B5G5R5A1_UNORM_PACK16 = 6,
    DATA_FORMAT_A1R5G5B5_UNORM_PACK16 = 7,
    DATA_FORMAT_R8_UNORM = 8,
    DATA_FORMAT_R8_SNORM = 9,
    DATA_FORMAT_R8_USCALED = 10,
    DATA_FORMAT_R8_SSCALED = 11,
    DATA_FORMAT_R8_UINT = 12,
    DATA_FORMAT_R8_SINT = 13,
    DATA_FORMAT_R8_SRGB = 14,
    DATA_FORMAT_R8G8_UNORM = 15,
    DATA_FORMAT_R8G8_SNORM = 16,
    DATA_FORMAT_R8G8_USCALED = 17,
    DATA_FORMAT_R8G8_SSCALED = 18,
    DATA_FORMAT_R8G8_UINT = 19,
    DATA_FORMAT_R8G8_SINT = 20,
    DATA_FORMAT_R8G8_SRGB = 21,
    DATA_FORMAT_R8G8B8_UNORM = 22,
    DATA_FORMAT_R8G8B8_SNORM = 23,
    DATA_FORMAT_R8G8B8_USCALED = 24,
    DATA_FORMAT_R8G8B8_SSCALED = 25,
    DATA_FORMAT_R8G8B8_UINT = 26,
    DATA_FORMAT_R8G8B8_SINT = 27,
    DATA_FORMAT_R8G8B8_SRGB = 28,
    DATA_FORMAT_B8G8R8_UNORM = 29,
    DATA_FORMAT_B8G8R8_SNORM = 30,
    DATA_FORMAT_B8G8R8_USCALED = 31,
    DATA_FORMAT_B8G8R8_SSCALED = 32,
    DATA_FORMAT_B8G8R8_UINT = 33,
    DATA_FORMAT_B8G8R8_SINT = 34,
    DATA_FORMAT_B8G8R8_SRGB = 35,
    DATA_FORMAT_R8G8B8A8_UNORM = 36,
    DATA_FORMAT_R8G8B8A8_SNORM = 37,
    DATA_FORMAT_R8G8B8A8_USCALED = 38,
    DATA_FORMAT_R8G8B8A8_SSCALED = 39,
    DATA_FORMAT_R8G8B8A8_UINT = 40,
    DATA_FORMAT_R8G8B8A8_SINT = 41,
    DATA_FORMAT_R8G8B8A8_SRGB = 42,
    DATA_FORMAT_B8G8R8A8_UNORM = 43,
    DATA_FORMAT_B8G8R8A8_SNORM = 44,
    DATA_FORMAT_B8G8R8A8_USCALED = 45,
    DATA_FORMAT_B8G8R8A8_SSCALED = 46,
    DATA_FORMAT_B8G8R8A8_UINT = 47,
    DATA_FORMAT_B8G8R8A8_SINT = 48,
    DATA_FORMAT_B8G8R8A8_SRGB = 49,
    DATA_FORMAT_A8B8G8R8_UNORM_PACK32 = 50,
    DATA_FORMAT_A8B8G8R8_SNORM_PACK32 = 51,
    DATA_FORMAT_A8B8G8R8_USCALED_PACK32 = 52,
    DATA_FORMAT_A8B8G8R8_SSCALED_PACK32 = 53,
    DATA_FORMAT_A8B8G8R8_UINT_PACK32 = 54,
    DATA_FORMAT_A8B8G8R8_SINT_PACK32 = 55,
    DATA_FORMAT_A8B8G8R8_SRGB_PACK32 = 56,
    DATA_FORMAT_A2R10G10B10_UNORM_PACK32 = 57,
    DATA_FORMAT_A2R10G10B10_SNORM_PACK32 = 58,
    DATA_FORMAT_A2R10G10B10_USCALED_PACK32 = 59,
    DATA_FORMAT_A2R10G10B10_SSCALED_PACK32 = 60,
    DATA_FORMAT_A2R10G10B10_UINT_PACK32 = 61,
    DATA_FORMAT_A2R10G10B10_SINT_PACK32 = 62,
    DATA_FORMAT_A2B10G10R10_UNORM_PACK32 = 63,
    DATA_FORMAT_A2B10G10R10_SNORM_PACK32 = 64,
    DATA_FORMAT_A2B10G10R10_USCALED_PACK32 = 65,
    DATA_FORMAT_A2B10G10R10_SSCALED_PACK32 = 66,
    DATA_FORMAT_A2B10G10R10_UINT_PACK32 = 67,
    DATA_FORMAT_A2B10G10R10_SINT_PACK32 = 68,
    DATA_FORMAT_R16_UNORM = 69,
    DATA_FORMAT_R16_SNORM = 70,
    DATA_FORMAT_R16_USCALED = 71,
    DATA_FORMAT_R16_SSCALED = 72,
    DATA_FORMAT_R16_UINT = 73,
    DATA_FORMAT_R16_SINT = 74,
    DATA_FORMAT_R16_SFLOAT = 75,
    DATA_FORMAT_R16G16_UNORM = 76,
    DATA_FORMAT_R16G16_SNORM = 77,
    DATA_FORMAT_R16G16_USCALED = 78,
    DATA_FORMAT_R16G16_SSCALED = 79,
    DATA_FORMAT_R16G16_UINT = 80,
    DATA_FORMAT_R16G16_SINT = 81,
    DATA_FORMAT_R16G16_SFLOAT = 82,
    DATA_FORMAT_R16G16B16_UNORM = 83,
    DATA_FORMAT_R16G16B16_SNORM = 84,
    DATA_FORMAT_R16G16B16_USCALED = 85,
    DATA_FORMAT_R16G16B16_SSCALED = 86,
    DATA_FORMAT_R16G16B16_UINT = 87,
    DATA_FORMAT_R16G16B16_SINT = 88,
    DATA_FORMAT_R16G16B16_SFLOAT = 89,
    DATA_FORMAT_R16G16B16A16_UNORM = 90,
    DATA_FORMAT_R16G16B16A16_SNORM = 91,
    DATA_FORMAT_R16G16B16A16_USCALED = 92,
    DATA_FORMAT_R16G16B16A16_SSCALED = 93,
    DATA_FORMAT_R16G16B16A16_UINT = 94,
    DATA_FORMAT_R16G16B16A16_SINT = 95,
    DATA_FORMAT_R16G16B16A16_SFLOAT = 96,
    DATA_FORMAT_R32_UINT = 97,
    DATA_FORMAT_R32_SINT = 98,
    DATA_FORMAT_R32_SFLOAT = 99,
    DATA_FORMAT_R32G32_UINT = 100,
    DATA_FORMAT_R32G32_SINT = 101,
    DATA_FORMAT_R32G32_SFLOAT = 102,
    DATA_FORMAT_R32G32B32_UINT = 103,
    DATA_FORMAT_R32G32B32_SINT = 104,
    DATA_FORMAT_R32G32B32_SFLOAT = 105,
    DATA_FORMAT_R32G32B32A32_UINT = 106,
    DATA_FORMAT_R32G32B32A32_SINT = 107,
    DATA_FORMAT_R32G32B32A32_SFLOAT = 108,
    DATA_FORMAT_R64_UINT = 109,
    DATA_FORMAT_R64_SINT = 110,
    DATA_FORMAT_R64_SFLOAT = 111,
    DATA_FORMAT_R64G64_UINT = 112,
    DATA_FORMAT_R64G64_SINT = 113,
    DATA_FORMAT_R64G64_SFLOAT = 114,
    DATA_FORMAT_R64G64B64_UINT = 115,
    DATA_FORMAT_R64G64B64_SINT = 116,
    DATA_FORMAT_R64G64B64_SFLOAT = 117,
    DATA_FORMAT_R64G64B64A64_UINT = 118,
    DATA_FORMAT_R64G64B64A64_SINT = 119,
    DATA_FORMAT_R64G64B64A64_SFLOAT = 120,
    DATA_FORMAT_B10G11R11_UFLOAT_PACK32 = 121,
    DATA_FORMAT_E5B9G9R9_UFLOAT_PACK32 = 122,
    DATA_FORMAT_D16_UNORM = 123,
    DATA_FORMAT_X8_D24_UNORM_PACK32 = 124,
    DATA_FORMAT_D32_SFLOAT = 125,
    DATA_FORMAT_S8_UINT = 126,
    DATA_FORMAT_D16_UNORM_S8_UINT = 127,
    DATA_FORMAT_D24_UNORM_S8_UINT = 128,
    DATA_FORMAT_D32_SFLOAT_S8_UINT = 129,
    DATA_FORMAT_BC1_RGB_UNORM_BLOCK = 130,
    DATA_FORMAT_BC1_RGB_SRGB_BLOCK = 131,
    DATA_FORMAT_BC1_RGBA_UNORM_BLOCK = 132,
    DATA_FORMAT_BC1_RGBA_SRGB_BLOCK = 133,
    DATA_FORMAT_BC2_UNORM_BLOCK = 134,
    DATA_FORMAT_BC2_SRGB_BLOCK = 135,
    DATA_FORMAT_BC3_UNORM_BLOCK = 136,
    DATA_FORMAT_BC3_SRGB_BLOCK = 137,
    DATA_FORMAT_BC4_UNORM_BLOCK = 138,
    DATA_FORMAT_BC4_SNORM_BLOCK = 139,
    DATA_FORMAT_BC5_UNORM_BLOCK = 140,
    DATA_FORMAT_BC5_SNORM_BLOCK = 141,
    DATA_FORMAT_BC6H_UFLOAT_BLOCK = 142,
    DATA_FORMAT_BC6H_SFLOAT_BLOCK = 143,
    DATA_FORMAT_BC7_UNORM_BLOCK = 144,
    DATA_FORMAT_BC7_SRGB_BLOCK = 145,
    DATA_FORMAT_ETC2_R8G8B8_UNORM_BLOCK = 146,
    DATA_FORMAT_ETC2_R8G8B8_SRGB_BLOCK = 147,
    DATA_FORMAT_ETC2_R8G8B8A1_UNORM_BLOCK = 148,
    DATA_FORMAT_ETC2_R8G8B8A1_SRGB_BLOCK = 149,
    DATA_FORMAT_ETC2_R8G8B8A8_UNORM_BLOCK = 150,
    DATA_FORMAT_ETC2_R8G8B8A8_SRGB_BLOCK = 151,
    DATA_FORMAT_EAC_R11_UNORM_BLOCK = 152,
    DATA_FORMAT_EAC_R11_SNORM_BLOCK = 153,
    DATA_FORMAT_EAC_R11G11_UNORM_BLOCK = 154,
    DATA_FORMAT_EAC_R11G11_SNORM_BLOCK = 155,
    DATA_FORMAT_ASTC_4x4_UNORM_BLOCK = 156,
    DATA_FORMAT_ASTC_4x4_SRGB_BLOCK = 157,
    DATA_FORMAT_ASTC_5x4_UNORM_BLOCK = 158,
    DATA_FORMAT_ASTC_5x4_SRGB_BLOCK = 159,
    DATA_FORMAT_ASTC_5x5_UNORM_BLOCK = 160,
    DATA_FORMAT_ASTC_5x5_SRGB_BLOCK = 161,
    DATA_FORMAT_ASTC_6x5_UNORM_BLOCK = 162,
    DATA_FORMAT_ASTC_6x5_SRGB_BLOCK = 163,
    DATA_FORMAT_ASTC_6x6_UNORM_BLOCK = 164,
    DATA_FORMAT_ASTC_6x6_SRGB_BLOCK = 165,
    DATA_FORMAT_ASTC_8x5_UNORM_BLOCK = 166,
    DATA_FORMAT_ASTC_8x5_SRGB_BLOCK = 167,
    DATA_FORMAT_ASTC_8x6_UNORM_BLOCK = 168,
    DATA_FORMAT_ASTC_8x6_SRGB_BLOCK = 169,
    DATA_FORMAT_ASTC_8x8_UNORM_BLOCK = 170,
    DATA_FORMAT_ASTC_8x8_SRGB_BLOCK = 171,
    DATA_FORMAT_ASTC_10x5_UNORM_BLOCK = 172,
    DATA_FORMAT_ASTC_10x5_SRGB_BLOCK = 173,
    DATA_FORMAT_ASTC_10x6_UNORM_BLOCK = 174,
    DATA_FORMAT_ASTC_10x6_SRGB_BLOCK = 175,
    DATA_FORMAT_ASTC_10x8_UNORM_BLOCK = 176,
    DATA_FORMAT_ASTC_10x8_SRGB_BLOCK = 177,
    DATA_FORMAT_ASTC_10x10_UNORM_BLOCK = 178,
    DATA_FORMAT_ASTC_10x10_SRGB_BLOCK = 179,
    DATA_FORMAT_ASTC_12x10_UNORM_BLOCK = 180,
    DATA_FORMAT_ASTC_12x10_SRGB_BLOCK = 181,
    DATA_FORMAT_ASTC_12x12_UNORM_BLOCK = 182,
    DATA_FORMAT_ASTC_12x12_SRGB_BLOCK = 183,
    DATA_FORMAT_G8B8G8R8_422_UNORM = 184,
    DATA_FORMAT_B8G8R8G8_422_UNORM = 185,
    DATA_FORMAT_G8_B8_R8_3PLANE_420_UNORM = 186,
    DATA_FORMAT_G8_B8R8_2PLANE_420_UNORM = 187,
    DATA_FORMAT_G8_B8_R8_3PLANE_422_UNORM = 188,
    DATA_FORMAT_G8_B8R8_2PLANE_422_UNORM = 189,
    DATA_FORMAT_G8_B8_R8_3PLANE_444_UNORM = 190,
    DATA_FORMAT_R10X6_UNORM_PACK16 = 191,
    DATA_FORMAT_R10X6G10X6_UNORM_2PACK16 = 192,
    DATA_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16 = 193,
    DATA_FORMAT_G10X6B10X6G10X6R10X6_422_UNORM_4PACK16 = 194,
    DATA_FORMAT_B10X6G10X6R10X6G10X6_422_UNORM_4PACK16 = 195,
    DATA_FORMAT_G10X6_B10X6_R10X6_3PLANE_420_UNORM_3PACK16 = 196,
    DATA_FORMAT_G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16 = 197,
    DATA_FORMAT_G10X6_B10X6_R10X6_3PLANE_422_UNORM_3PACK16 = 198,
    DATA_FORMAT_G10X6_B10X6R10X6_2PLANE_422_UNORM_3PACK16 = 199,
    DATA_FORMAT_G10X6_B10X6_R10X6_3PLANE_444_UNORM_3PACK16 = 200,
    DATA_FORMAT_R12X4_UNORM_PACK16 = 201,
    DATA_FORMAT_R12X4G12X4_UNORM_2PACK16 = 202,
    DATA_FORMAT_R12X4G12X4B12X4A12X4_UNORM_4PACK16 = 203,
    DATA_FORMAT_G12X4B12X4G12X4R12X4_422_UNORM_4PACK16 = 204,
    DATA_FORMAT_B12X4G12X4R12X4G12X4_422_UNORM_4PACK16 = 205,
    DATA_FORMAT_G12X4_B12X4_R12X4_3PLANE_420_UNORM_3PACK16 = 206,
    DATA_FORMAT_G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16 = 207,
    DATA_FORMAT_G12X4_B12X4_R12X4_3PLANE_422_UNORM_3PACK16 = 208,
    DATA_FORMAT_G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16 = 209,
    DATA_FORMAT_G12X4_B12X4_R12X4_3PLANE_444_UNORM_3PACK16 = 210,
    DATA_FORMAT_G16B16G16R16_422_UNORM = 211,
    DATA_FORMAT_B16G16R16G16_422_UNORM = 212,
    DATA_FORMAT_G16_B16_R16_3PLANE_420_UNORM = 213,
    DATA_FORMAT_G16_B16R16_2PLANE_420_UNORM = 214,
    DATA_FORMAT_G16_B16_R16_3PLANE_422_UNORM = 215,
    DATA_FORMAT_G16_B16R16_2PLANE_422_UNORM = 216,
    DATA_FORMAT_G16_B16_R16_3PLANE_444_UNORM = 217,
    DATA_FORMAT_MAX = 218,
}
#enum BarrierMask
enum {
    BARRIER_MASK_RASTER = 1,
    BARRIER_MASK_COMPUTE = 2,
    BARRIER_MASK_TRANSFER = 4,
    BARRIER_MASK_ALL_BARRIERS = 7,
    BARRIER_MASK_NO_BARRIER = 8,
}
#enum TextureType
enum {
    TEXTURE_TYPE_1D = 0,
    TEXTURE_TYPE_2D = 1,
    TEXTURE_TYPE_3D = 2,
    TEXTURE_TYPE_CUBE = 3,
    TEXTURE_TYPE_1D_ARRAY = 4,
    TEXTURE_TYPE_2D_ARRAY = 5,
    TEXTURE_TYPE_CUBE_ARRAY = 6,
    TEXTURE_TYPE_MAX = 7,
}
#enum TextureSamples
enum {
    TEXTURE_SAMPLES_1 = 0,
    TEXTURE_SAMPLES_2 = 1,
    TEXTURE_SAMPLES_4 = 2,
    TEXTURE_SAMPLES_8 = 3,
    TEXTURE_SAMPLES_16 = 4,
    TEXTURE_SAMPLES_32 = 5,
    TEXTURE_SAMPLES_64 = 6,
    TEXTURE_SAMPLES_MAX = 7,
}
#enum TextureUsageBits
enum {
    TEXTURE_USAGE_SAMPLING_BIT = 1,
    TEXTURE_USAGE_COLOR_ATTACHMENT_BIT = 2,
    TEXTURE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT = 4,
    TEXTURE_USAGE_STORAGE_BIT = 8,
    TEXTURE_USAGE_STORAGE_ATOMIC_BIT = 16,
    TEXTURE_USAGE_CPU_READ_BIT = 32,
    TEXTURE_USAGE_CAN_UPDATE_BIT = 64,
    TEXTURE_USAGE_CAN_COPY_FROM_BIT = 128,
    TEXTURE_USAGE_CAN_COPY_TO_BIT = 256,
    TEXTURE_USAGE_INPUT_ATTACHMENT_BIT = 512,
}
#enum TextureSwizzle
enum {
    TEXTURE_SWIZZLE_IDENTITY = 0,
    TEXTURE_SWIZZLE_ZERO = 1,
    TEXTURE_SWIZZLE_ONE = 2,
    TEXTURE_SWIZZLE_R = 3,
    TEXTURE_SWIZZLE_G = 4,
    TEXTURE_SWIZZLE_B = 5,
    TEXTURE_SWIZZLE_A = 6,
    TEXTURE_SWIZZLE_MAX = 7,
}
#enum TextureSliceType
enum {
    TEXTURE_SLICE_2D = 0,
    TEXTURE_SLICE_CUBEMAP = 1,
    TEXTURE_SLICE_3D = 2,
}
#enum SamplerFilter
enum {
    SAMPLER_FILTER_NEAREST = 0,
    SAMPLER_FILTER_LINEAR = 1,
}
#enum SamplerRepeatMode
enum {
    SAMPLER_REPEAT_MODE_REPEAT = 0,
    SAMPLER_REPEAT_MODE_MIRRORED_REPEAT = 1,
    SAMPLER_REPEAT_MODE_CLAMP_TO_EDGE = 2,
    SAMPLER_REPEAT_MODE_CLAMP_TO_BORDER = 3,
    SAMPLER_REPEAT_MODE_MIRROR_CLAMP_TO_EDGE = 4,
    SAMPLER_REPEAT_MODE_MAX = 5,
}
#enum SamplerBorderColor
enum {
    SAMPLER_BORDER_COLOR_FLOAT_TRANSPARENT_BLACK = 0,
    SAMPLER_BORDER_COLOR_INT_TRANSPARENT_BLACK = 1,
    SAMPLER_BORDER_COLOR_FLOAT_OPAQUE_BLACK = 2,
    SAMPLER_BORDER_COLOR_INT_OPAQUE_BLACK = 3,
    SAMPLER_BORDER_COLOR_FLOAT_OPAQUE_WHITE = 4,
    SAMPLER_BORDER_COLOR_INT_OPAQUE_WHITE = 5,
    SAMPLER_BORDER_COLOR_MAX = 6,
}
#enum VertexFrequency
enum {
    VERTEX_FREQUENCY_VERTEX = 0,
    VERTEX_FREQUENCY_INSTANCE = 1,
}
#enum IndexBufferFormat
enum {
    INDEX_BUFFER_FORMAT_UINT16 = 0,
    INDEX_BUFFER_FORMAT_UINT32 = 1,
}
#enum StorageBufferUsage
enum {
    STORAGE_BUFFER_USAGE_DISPATCH_INDIRECT = 1,
}
#enum UniformType
enum {
    UNIFORM_TYPE_SAMPLER = 0,
    UNIFORM_TYPE_SAMPLER_WITH_TEXTURE = 1,
    UNIFORM_TYPE_TEXTURE = 2,
    UNIFORM_TYPE_IMAGE = 3,
    UNIFORM_TYPE_TEXTURE_BUFFER = 4,
    UNIFORM_TYPE_SAMPLER_WITH_TEXTURE_BUFFER = 5,
    UNIFORM_TYPE_IMAGE_BUFFER = 6,
    UNIFORM_TYPE_UNIFORM_BUFFER = 7,
    UNIFORM_TYPE_STORAGE_BUFFER = 8,
    UNIFORM_TYPE_INPUT_ATTACHMENT = 9,
    UNIFORM_TYPE_MAX = 10,
}
#enum RenderPrimitive
enum {
    RENDER_PRIMITIVE_POINTS = 0,
    RENDER_PRIMITIVE_LINES = 1,
    RENDER_PRIMITIVE_LINES_WITH_ADJACENCY = 2,
    RENDER_PRIMITIVE_LINESTRIPS = 3,
    RENDER_PRIMITIVE_LINESTRIPS_WITH_ADJACENCY = 4,
    RENDER_PRIMITIVE_TRIANGLES = 5,
    RENDER_PRIMITIVE_TRIANGLES_WITH_ADJACENCY = 6,
    RENDER_PRIMITIVE_TRIANGLE_STRIPS = 7,
    RENDER_PRIMITIVE_TRIANGLE_STRIPS_WITH_AJACENCY = 8,
    RENDER_PRIMITIVE_TRIANGLE_STRIPS_WITH_RESTART_INDEX = 9,
    RENDER_PRIMITIVE_TESSELATION_PATCH = 10,
    RENDER_PRIMITIVE_MAX = 11,
}
#enum PolygonCullMode
enum {
    POLYGON_CULL_DISABLED = 0,
    POLYGON_CULL_FRONT = 1,
    POLYGON_CULL_BACK = 2,
}
#enum PolygonFrontFace
enum {
    POLYGON_FRONT_FACE_CLOCKWISE = 0,
    POLYGON_FRONT_FACE_COUNTER_CLOCKWISE = 1,
}
#enum StencilOperation
enum {
    STENCIL_OP_KEEP = 0,
    STENCIL_OP_ZERO = 1,
    STENCIL_OP_REPLACE = 2,
    STENCIL_OP_INCREMENT_AND_CLAMP = 3,
    STENCIL_OP_DECREMENT_AND_CLAMP = 4,
    STENCIL_OP_INVERT = 5,
    STENCIL_OP_INCREMENT_AND_WRAP = 6,
    STENCIL_OP_DECREMENT_AND_WRAP = 7,
    STENCIL_OP_MAX = 8,
}
#enum CompareOperator
enum {
    COMPARE_OP_NEVER = 0,
    COMPARE_OP_LESS = 1,
    COMPARE_OP_EQUAL = 2,
    COMPARE_OP_LESS_OR_EQUAL = 3,
    COMPARE_OP_GREATER = 4,
    COMPARE_OP_NOT_EQUAL = 5,
    COMPARE_OP_GREATER_OR_EQUAL = 6,
    COMPARE_OP_ALWAYS = 7,
    COMPARE_OP_MAX = 8,
}
#enum LogicOperation
enum {
    LOGIC_OP_CLEAR = 0,
    LOGIC_OP_AND = 1,
    LOGIC_OP_AND_REVERSE = 2,
    LOGIC_OP_COPY = 3,
    LOGIC_OP_AND_INVERTED = 4,
    LOGIC_OP_NO_OP = 5,
    LOGIC_OP_XOR = 6,
    LOGIC_OP_OR = 7,
    LOGIC_OP_NOR = 8,
    LOGIC_OP_EQUIVALENT = 9,
    LOGIC_OP_INVERT = 10,
    LOGIC_OP_OR_REVERSE = 11,
    LOGIC_OP_COPY_INVERTED = 12,
    LOGIC_OP_OR_INVERTED = 13,
    LOGIC_OP_NAND = 14,
    LOGIC_OP_SET = 15,
    LOGIC_OP_MAX = 16,
}
#enum BlendFactor
enum {
    BLEND_FACTOR_ZERO = 0,
    BLEND_FACTOR_ONE = 1,
    BLEND_FACTOR_SRC_COLOR = 2,
    BLEND_FACTOR_ONE_MINUS_SRC_COLOR = 3,
    BLEND_FACTOR_DST_COLOR = 4,
    BLEND_FACTOR_ONE_MINUS_DST_COLOR = 5,
    BLEND_FACTOR_SRC_ALPHA = 6,
    BLEND_FACTOR_ONE_MINUS_SRC_ALPHA = 7,
    BLEND_FACTOR_DST_ALPHA = 8,
    BLEND_FACTOR_ONE_MINUS_DST_ALPHA = 9,
    BLEND_FACTOR_CONSTANT_COLOR = 10,
    BLEND_FACTOR_ONE_MINUS_CONSTANT_COLOR = 11,
    BLEND_FACTOR_CONSTANT_ALPHA = 12,
    BLEND_FACTOR_ONE_MINUS_CONSTANT_ALPHA = 13,
    BLEND_FACTOR_SRC_ALPHA_SATURATE = 14,
    BLEND_FACTOR_SRC1_COLOR = 15,
    BLEND_FACTOR_ONE_MINUS_SRC1_COLOR = 16,
    BLEND_FACTOR_SRC1_ALPHA = 17,
    BLEND_FACTOR_ONE_MINUS_SRC1_ALPHA = 18,
    BLEND_FACTOR_MAX = 19,
}
#enum BlendOperation
enum {
    BLEND_OP_ADD = 0,
    BLEND_OP_SUBTRACT = 1,
    BLEND_OP_REVERSE_SUBTRACT = 2,
    BLEND_OP_MINIMUM = 3,
    BLEND_OP_MAXIMUM = 4,
    BLEND_OP_MAX = 5,
}
#enum PipelineDynamicStateFlags
enum {
    DYNAMIC_STATE_LINE_WIDTH = 1,
    DYNAMIC_STATE_DEPTH_BIAS = 2,
    DYNAMIC_STATE_BLEND_CONSTANTS = 4,
    DYNAMIC_STATE_DEPTH_BOUNDS = 8,
    DYNAMIC_STATE_STENCIL_COMPARE_MASK = 16,
    DYNAMIC_STATE_STENCIL_WRITE_MASK = 32,
    DYNAMIC_STATE_STENCIL_REFERENCE = 64,
}
#enum InitialAction
enum {
    INITIAL_ACTION_CLEAR = 0,
    INITIAL_ACTION_CLEAR_REGION = 1,
    INITIAL_ACTION_CLEAR_REGION_CONTINUE = 2,
    INITIAL_ACTION_KEEP = 3,
    INITIAL_ACTION_DROP = 4,
    INITIAL_ACTION_CONTINUE = 5,
    INITIAL_ACTION_MAX = 6,
}
#enum FinalAction
enum {
    FINAL_ACTION_READ = 0,
    FINAL_ACTION_DISCARD = 1,
    FINAL_ACTION_CONTINUE = 2,
    FINAL_ACTION_MAX = 3,
}
#enum ShaderStage
enum {
    SHADER_STAGE_VERTEX = 0,
    SHADER_STAGE_FRAGMENT = 1,
    SHADER_STAGE_TESSELATION_CONTROL = 2,
    SHADER_STAGE_TESSELATION_EVALUATION = 3,
    SHADER_STAGE_COMPUTE = 4,
    SHADER_STAGE_MAX = 5,
    SHADER_STAGE_VERTEX_BIT = 1,
    SHADER_STAGE_FRAGMENT_BIT = 2,
    SHADER_STAGE_TESSELATION_CONTROL_BIT = 4,
    SHADER_STAGE_TESSELATION_EVALUATION_BIT = 8,
    SHADER_STAGE_COMPUTE_BIT = 16,
}
#enum ShaderLanguage
enum {
    SHADER_LANGUAGE_GLSL = 0,
    SHADER_LANGUAGE_HLSL = 1,
}
#enum PipelineSpecializationConstantType
enum {
    PIPELINE_SPECIALIZATION_CONSTANT_TYPE_BOOL = 0,
    PIPELINE_SPECIALIZATION_CONSTANT_TYPE_INT = 1,
    PIPELINE_SPECIALIZATION_CONSTANT_TYPE_FLOAT = 2,
}
#enum Limit
enum {
    LIMIT_MAX_BOUND_UNIFORM_SETS = 0,
    LIMIT_MAX_FRAMEBUFFER_COLOR_ATTACHMENTS = 1,
    LIMIT_MAX_TEXTURES_PER_UNIFORM_SET = 2,
    LIMIT_MAX_SAMPLERS_PER_UNIFORM_SET = 3,
    LIMIT_MAX_STORAGE_BUFFERS_PER_UNIFORM_SET = 4,
    LIMIT_MAX_STORAGE_IMAGES_PER_UNIFORM_SET = 5,
    LIMIT_MAX_UNIFORM_BUFFERS_PER_UNIFORM_SET = 6,
    LIMIT_MAX_DRAW_INDEXED_INDEX = 7,
    LIMIT_MAX_FRAMEBUFFER_HEIGHT = 8,
    LIMIT_MAX_FRAMEBUFFER_WIDTH = 9,
    LIMIT_MAX_TEXTURE_ARRAY_LAYERS = 10,
    LIMIT_MAX_TEXTURE_SIZE_1D = 11,
    LIMIT_MAX_TEXTURE_SIZE_2D = 12,
    LIMIT_MAX_TEXTURE_SIZE_3D = 13,
    LIMIT_MAX_TEXTURE_SIZE_CUBE = 14,
    LIMIT_MAX_TEXTURES_PER_SHADER_STAGE = 15,
    LIMIT_MAX_SAMPLERS_PER_SHADER_STAGE = 16,
    LIMIT_MAX_STORAGE_BUFFERS_PER_SHADER_STAGE = 17,
    LIMIT_MAX_STORAGE_IMAGES_PER_SHADER_STAGE = 18,
    LIMIT_MAX_UNIFORM_BUFFERS_PER_SHADER_STAGE = 19,
    LIMIT_MAX_PUSH_CONSTANT_SIZE = 20,
    LIMIT_MAX_UNIFORM_BUFFER_SIZE = 21,
    LIMIT_MAX_VERTEX_INPUT_ATTRIBUTE_OFFSET = 22,
    LIMIT_MAX_VERTEX_INPUT_ATTRIBUTES = 23,
    LIMIT_MAX_VERTEX_INPUT_BINDINGS = 24,
    LIMIT_MAX_VERTEX_INPUT_BINDING_STRIDE = 25,
    LIMIT_MIN_UNIFORM_BUFFER_OFFSET_ALIGNMENT = 26,
    LIMIT_MAX_COMPUTE_SHARED_MEMORY_SIZE = 27,
    LIMIT_MAX_COMPUTE_WORKGROUP_COUNT_X = 28,
    LIMIT_MAX_COMPUTE_WORKGROUP_COUNT_Y = 29,
    LIMIT_MAX_COMPUTE_WORKGROUP_COUNT_Z = 30,
    LIMIT_MAX_COMPUTE_WORKGROUP_INVOCATIONS = 31,
    LIMIT_MAX_COMPUTE_WORKGROUP_SIZE_X = 32,
    LIMIT_MAX_COMPUTE_WORKGROUP_SIZE_Y = 33,
    LIMIT_MAX_COMPUTE_WORKGROUP_SIZE_Z = 34,
    LIMIT_MAX_VIEWPORT_DIMENSIONS_X = 35,
    LIMIT_MAX_VIEWPORT_DIMENSIONS_Y = 36,
}
#enum MemoryType
enum {
    MEMORY_TEXTURES = 0,
    MEMORY_BUFFERS = 1,
    MEMORY_TOTAL = 2,
}


#desc Puts a memory barrier in place. This is used for synchronization to avoid data races. See also [method full_barrier], which may be useful for debugging.
func barrier(from: int = 7, to: int = 7) -> void:
	pass;

func buffer_clear(buffer: RID, offset: int, size_bytes: int, post_barrier: int = 7) -> int:
	pass;

#desc Returns a copy of the data of the specified [param buffer], optionally [param offset_bytes] and [param size_bytes] can be set to copy only a portion of the buffer.
func buffer_get_data(buffer: RID, offset_bytes: int = 0, size_bytes: int = 0) -> PackedByteArray:
	pass;

func buffer_update(buffer: RID, offset: int, size_bytes: int, data: PackedByteArray, post_barrier: int = 7) -> int:
	pass;

#desc Creates a timestamp marker with the specified [param name]. This is used for performance reporting with the [method get_captured_timestamp_cpu_time], [method get_captured_timestamp_gpu_time] and [method get_captured_timestamp_name] methods.
func capture_timestamp(name: String) -> void:
	pass;

func compute_list_add_barrier(compute_list: int) -> void:
	pass;

#desc Starts a list of compute commands created with the [code]compute_*[/code] methods. The returned value should be passed to other [code]compute_list_*[/code] functions.
#desc If [code]allow_draw_overlap[/code] is true, you may have one draw list running at the same time as one compute list. Multiple compute lists cannot be created at the same time; you must finish the previous compute list first using [method compute_list_end].
#desc A simple compute operation might look like this (code is not a complete example):
#desc [codeblock]
#desc var rd = RenderingDevice.new()
#desc var compute_list = rd.compute_list_begin()
#desc 
#desc rd.compute_list_bind_compute_pipeline(compute_list, compute_shader_dilate_pipeline)
#desc rd.compute_list_bind_uniform_set(compute_list, compute_base_uniform_set, 0)
#desc rd.compute_list_bind_uniform_set(compute_list, dilate_uniform_set, 1)
#desc 
#desc for i in atlas_slices:
#desc rd.compute_list_set_push_constant(compute_list, push_constant, push_constant.size())
#desc rd.compute_list_dispatch(compute_list, group_size.x, group_size.y, group_size.z)
#desc # No barrier, let them run all together.
#desc 
#desc rd.compute_list_end()
#desc [/codeblock]
func compute_list_begin(allow_draw_overlap: bool = false) -> int:
	pass;

func compute_list_bind_compute_pipeline(compute_list: int, compute_pipeline: RID) -> void:
	pass;

func compute_list_bind_uniform_set(compute_list: int, uniform_set: RID, set_index: int) -> void:
	pass;

#desc Submits the compute list for processing on the GPU. This is the compute equivalent to [method draw_list_draw].
func compute_list_dispatch(compute_list: int, x_groups: int, y_groups: int, z_groups: int) -> void:
	pass;

#desc Finishes a list of compute commands created with the [code]compute_*[/code] methods.
func compute_list_end(post_barrier: int = 7) -> void:
	pass;

#desc Sets the push constant data to [param buffer] for the specified [param compute_list]. The shader determines how this binary data is used. The buffer's size in bytes must also be specified in [param size_bytes] (this can be obtained by calling the [method PackedByteArray.size] method on the passed [param buffer]).
func compute_list_set_push_constant(compute_list: int, buffer: PackedByteArray, size_bytes: int) -> void:
	pass;

#desc Creates a new compute pipeline. It can be accessed with the RID that is returned.
#desc Once finished with your RID, you will want to free the RID using the RenderingDevice's [method free_rid] method.
func compute_pipeline_create(shader: RID, specialization_constants: RDPipelineSpecializationConstant[] = []) -> RID:
	pass;

#desc Returns [code]true[/code] if the compute pipeline specified by the [param compute_pieline] RID is valid, [code]false[/code] otherwise.
#desc [b]Note:[/b] The [param compute_pieline] parameter should be named "compute_pipeline", but this typo was kept in the 4.0.x branch to preserve compatibility for C# and GDExtension.
func compute_pipeline_is_valid(compute_pieline: RID) -> bool:
	pass;

#desc Create a new local [RenderingDevice]. This is most useful for performing compute operations on the GPU independently from the rest of the engine.
func create_local_device() -> RenderingDevice:
	pass;

#desc Create a command buffer debug label region that can be displayed in third-party tools such as [url=https://renderdoc.org/]RenderDoc[/url]. All regions must be ended with a [method draw_command_end_label] call. When viewed from the linear series of submissions to a single queue, calls to [method draw_command_begin_label] and [method draw_command_end_label] must be matched and balanced.
#desc The [code]VK_EXT_DEBUG_UTILS_EXTENSION_NAME[/code] Vulkan extension must be available and enabled for command buffer debug label region to work. See also [method draw_command_insert_label] and [method draw_command_end_label].
func draw_command_begin_label(name: String, color: Color) -> void:
	pass;

#desc Ends the command buffer debug label region started by a [method draw_command_begin_label] call.
func draw_command_end_label() -> void:
	pass;

#desc Inserts a command buffer debug label region in the current command buffer. Unlike [method draw_command_begin_label], this region should not be ended with a [method draw_command_end_label] call.
func draw_command_insert_label(name: String, color: Color) -> void:
	pass;

#desc Starts a list of raster drawing commands created with the [code]draw_*[/code] methods. The returned value should be passed to other [code]draw_list_*[/code] functions.
#desc Multiple draw lists cannot be created at the same time; you must finish the previous draw list first using [method draw_list_end].
#desc A simple drawing operation might look like this (code is not a complete example):
#desc [codeblock]
#desc var rd = RenderingDevice.new()
#desc var clear_colors = PackedColorArray([Color(0, 0, 0, 0), Color(0, 0, 0, 0), Color(0, 0, 0, 0)]
#desc var draw_list = rd.draw_list_begin(framebuffers[i], RenderingDevice.INITIAL_ACTION_CLEAR, RenderingDevice.FINAL_ACTION_READ, RenderingDevice.INITIAL_ACTION_CLEAR, RenderingDevice.FINAL_ACTION_DISCARD, clear_colors)
#desc 
#desc # Draw opaque.
#desc rd.draw_list_bind_render_pipeline(draw_list, raster_pipeline)
#desc rd.draw_list_bind_uniform_set(draw_list, raster_base_uniform, 0)
#desc rd.draw_list_set_push_constant(draw_list, raster_push_constant, raster_push_constant.size())
#desc rd.draw_list_draw(draw_list, false, 1, slice_triangle_count[i] * 3)
#desc # Draw wire.
#desc rd.draw_list_bind_render_pipeline(draw_list, raster_pipeline_wire)
#desc rd.draw_list_bind_uniform_set(draw_list, raster_base_uniform, 0)
#desc rd.draw_list_set_push_constant(draw_list, raster_push_constant, raster_push_constant.size())
#desc rd.draw_list_draw(draw_list, false, 1, slice_triangle_count[i] * 3)
#desc 
#desc rd.draw_list_end()
#desc [/codeblock]
func draw_list_begin(framebuffer: RID, initial_color_action: int, final_color_action: int, initial_depth_action: int, final_depth_action: int, clear_color_values: PackedColorArray = PackedColorArray(), clear_depth: float = 1.0, clear_stencil: int = 0, region: Rect2 = Rect2(0, 0, 0, 0), storage_textures: Array = []) -> int:
	pass;

#desc High-level variant of [method draw_list_begin], with the parameters automtaically being adjusted for drawing onto the window specified by the [param screen] ID.
#desc [b]Note:[/b] Cannot be used with local RenderingDevices, as these don't have a screen. If called on a local RenderingDevice, [method draw_list_begin_for_screen] returns [constant INVALID_ID].
func draw_list_begin_for_screen(screen: int = 0, clear_color: Color = Color(0, 0, 0, 1)) -> int:
	pass;

#desc Variant of [method draw_list_begin] with support for multiple splits. The [param splits] parameter determines how many splits are created.
func draw_list_begin_split(framebuffer: RID, splits: int, initial_color_action: int, final_color_action: int, initial_depth_action: int, final_depth_action: int, clear_color_values: PackedColorArray = PackedColorArray(), clear_depth: float = 1.0, clear_stencil: int = 0, region: Rect2 = Rect2(0, 0, 0, 0), storage_textures: RID[] = []) -> PackedInt64Array:
	pass;

#desc Binds [param index_array] to the specified [param draw_list].
func draw_list_bind_index_array(draw_list: int, index_array: RID) -> void:
	pass;

#desc Binds [param render_pipeline] to the specified [param draw_list].
func draw_list_bind_render_pipeline(draw_list: int, render_pipeline: RID) -> void:
	pass;

#desc Binds [param uniform_set] to the specified [param draw_list]. A [param set_index] must also be specified, which is an identifier starting from [code]0[/code] that must match the one expected by the draw list.
func draw_list_bind_uniform_set(draw_list: int, uniform_set: RID, set_index: int) -> void:
	pass;

#desc Binds [param vertex_array] to the specified [param draw_list].
func draw_list_bind_vertex_array(draw_list: int, vertex_array: RID) -> void:
	pass;

#desc Removes and disables the scissor rectangle for the specified [param draw_list]. See also [method draw_list_enable_scissor].
func draw_list_disable_scissor(draw_list: int) -> void:
	pass;

#desc Submits [param draw_list] for rendering on the GPU. This is the raster equivalent to [method compute_list_dispatch].
func draw_list_draw(draw_list: int, use_indices: bool, instances: int, procedural_vertex_count: int = 0) -> void:
	pass;

#desc Creates a scissor rectangle and enables it for the specified [param draw_list]. Scissor rectangles are used for clipping by discarding fragments that fall outside a specified rectangular portion of the screen. See also [method draw_list_disable_scissor].
#desc [b]Note:[/b] The specified [param rect] is automatically intersected with the screen's dimensions, which means it cannot exceed the screen's dimensions.
func draw_list_enable_scissor(draw_list: int, rect: Rect2 = Rect2(0, 0, 0, 0)) -> void:
	pass;

#desc Finishes a list of raster drawing commands created with the [code]draw_*[/code] methods.
func draw_list_end(post_barrier: int = 7) -> void:
	pass;

#desc Sets blend constants for the specified [param draw_list] to [param color]. Blend constants are used only if the graphics pipeline is created with [constant DYNAMIC_STATE_BLEND_CONSTANTS] flag set.
func draw_list_set_blend_constants(draw_list: int, color: Color) -> void:
	pass;

#desc Sets the push constant data to [param buffer] for the specified [param draw_list]. The shader determines how this binary data is used. The buffer's size in bytes must also be specified in [param size_bytes] (this can be obtained by calling the [method PackedByteArray.size] method on the passed [param buffer]).
func draw_list_set_push_constant(draw_list: int, buffer: PackedByteArray, size_bytes: int) -> void:
	pass;

#desc Switches to the next draw pass and returns the split's ID. Equivalent to [method draw_list_switch_to_next_pass_split] with [code]splits[/code] set to [code]1[/code].
func draw_list_switch_to_next_pass() -> int:
	pass;

#desc Switches to the next draw pass, with the number of splits allocated specified in [param splits]. The return value is an array containing the ID of each split. For single-split usage, see [method draw_list_switch_to_next_pass].
func draw_list_switch_to_next_pass_split(splits: int) -> PackedInt64Array:
	pass;

#desc Creates a new framebuffer. It can be accessed with the RID that is returned.
#desc Once finished with your RID, you will want to free the RID using the RenderingDevice's [method free_rid] method.
func framebuffer_create(textures: RID[], validate_with_format: int = -1, view_count: int = 1) -> RID:
	pass;

#desc Creates a new empty framebuffer. It can be accessed with the RID that is returned.
#desc Once finished with your RID, you will want to free the RID using the RenderingDevice's [method free_rid] method.
func framebuffer_create_empty(size: Vector2i, samples: int = 0, validate_with_format: int = -1) -> RID:
	pass;

#desc Creates a new multipass framebuffer. It can be accessed with the RID that is returned.
#desc Once finished with your RID, you will want to free the RID using the RenderingDevice's [method free_rid] method.
func framebuffer_create_multipass(textures: RID[], passes: RDFramebufferPass[], validate_with_format: int = -1, view_count: int = 1) -> RID:
	pass;

#desc Creates a new framebuffer format with the specified [param attachments] and [param view_count]. Returns the new framebuffer's unique framebuffer format ID.
#desc If [code]view_count[/code] is greater than or equal to [code]2[/code], enables multiview which is used for VR rendering. This requires support for the Vulkan multiview extension.
func framebuffer_format_create(attachments: RDAttachmentFormat[], view_count: int = 1) -> int:
	pass;

#desc Creates a new empty framebuffer format with the specified number of [param samples] and returns its ID.
func framebuffer_format_create_empty(samples: int = 0) -> int:
	pass;

#desc Creates a multipass framebuffer format with the specified [param attachments], [param passes] and [param view_count] and returns its ID. If [code]view_count[/code] is greater than or equal to [code]2[/code], enables multiview which is used for VR rendering. This requires support for the Vulkan multiview extension.
func framebuffer_format_create_multipass(attachments: RDAttachmentFormat[], passes: RDFramebufferPass[], view_count: int = 1) -> int:
	pass;

#desc Returns the number of texture samples used for the given framebuffer [param format] ID (returned by [method framebuffer_get_format]).
func framebuffer_format_get_texture_samples(format: int, render_pass: int = 0) -> int:
	pass;

#desc Returns the format ID of the framebuffer specified by the [param framebuffer] RID. This ID is guaranteed to be unique for the same formats and does not need to be freed.
func framebuffer_get_format(framebuffer: RID) -> int:
	pass;

#desc Returns [code]true[/code] if the framebuffer specified by the [param framebuffer] RID is valid, [code]false[/code] otherwise.
func framebuffer_is_valid(framebuffer: RID) -> bool:
	pass;

#desc Tries to free an object in the RenderingDevice. To avoid memory leaks, this should be called after using an object as memory management does not occur automatically when using RenderingDevice directly.
func free_rid(rid: RID) -> void:
	pass;

#desc Puts a [i]full[/i] memory barrier in place. This is a memory [method barrier] with all flags enabled. [method full_barrier] it should only be used for debugging as it can severely impact performance.
func full_barrier() -> void:
	pass;

#desc Returns the timestamp in CPU time for the rendering step specified by [param index] (in microseconds since the engine started). See also [method get_captured_timestamp_gpu_time] and [method capture_timestamp].
func get_captured_timestamp_cpu_time(index: int) -> int:
	pass;

#desc Returns the timestamp in GPU time for the rendering step specified by [param index] (in microseconds since the engine started). See also [method get_captured_timestamp_cpu_time] and [method capture_timestamp].
func get_captured_timestamp_gpu_time(index: int) -> int:
	pass;

#desc Returns the timestamp's name for the rendering step specified by [param index]. See also [method capture_timestamp].
func get_captured_timestamp_name(index: int) -> String:
	pass;

#desc Returns the total number of timestamps (rendering steps) available for profiling.
func get_captured_timestamps_count() -> int:
	pass;

#desc Returns the index of the last frame rendered that has rendering timestamps available for querying.
func get_captured_timestamps_frame() -> int:
	pass;

#desc Returns the name of the video adapter (e.g. "GeForce GTX 1080/PCIe/SSE2"). Equivalent to [method RenderingServer.get_video_adapter_name]. See also [method get_device_vendor_name].
func get_device_name() -> String:
	pass;

#desc Returns the universally unique identifier for the pipeline cache. This is used to cache shader files on disk, which avoids shader recompilations on subsequent engine runs. This UUID varies depending on the graphics card model, but also the driver version. Therefore, updating graphics drivers will invalidate the shader cache.
func get_device_pipeline_cache_uuid() -> String:
	pass;

#desc Returns the vendor of the video adapter (e.g. "NVIDIA Corporation"). Equivalent to [method RenderingServer.get_video_adapter_vendor]. See also [method get_device_name].
func get_device_vendor_name() -> String:
	pass;

#desc Returns the unique identifier of the driver [param resource] for the specified [param rid]. Some driver resource types ignore the specified [param rid] (see [enum DriverResource] descriptions). [param index] is always ignored but must be specified anyway.
func get_driver_resource(resource: int, rid: RID, index: int) -> int:
	pass;

#desc Returns the frame count kept by the graphics API. Higher values result in higher input lag, but with more consistent throughput. For the main [RenderingDevice], frames are cycled (usually 3 with triple-buffered V-Sync enabled). However, local [RenderingDevice]s only have 1 frame.
func get_frame_delay() -> int:
	pass;

#desc Returns the memory usage in bytes corresponding to the given [param type]. When using Vulkan, these statistics are calculated by [url=https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator]Vulkan Memory Allocator[/url].
func get_memory_usage(type: int) -> int:
	pass;

#desc Creates a new index array. It can be accessed with the RID that is returned.
#desc Once finished with your RID, you will want to free the RID using the RenderingDevice's [method free_rid] method.
func index_array_create(index_buffer: RID, index_offset: int, index_count: int) -> RID:
	pass;

#desc Creates a new index buffer. It can be accessed with the RID that is returned.
#desc Once finished with your RID, you will want to free the RID using the RenderingDevice's [method free_rid] method.
func index_buffer_create(size_indices: int, format: int, data: PackedByteArray = PackedByteArray(), use_restart_indices: bool = false) -> RID:
	pass;

#desc Returns the value of the specified [param limit]. This limit varies depending on the current graphics hardware (and sometimes the driver version). If the given limit is exceeded, rendering errors will occur.
#desc Limits for various graphics hardware can be found in the [url=https://vulkan.gpuinfo.org/]Vulkan Hardware Database[/url].
func limit_get(limit: int) -> int:
	pass;

#desc Creates a new render pipeline. It can be accessed with the RID that is returned.
#desc Once finished with your RID, you will want to free the RID using the RenderingDevice's [method free_rid] method.
func render_pipeline_create(shader: RID, framebuffer_format: int, vertex_format: int, primitive: int, rasterization_state: RDPipelineRasterizationState, multisample_state: RDPipelineMultisampleState, stencil_state: RDPipelineDepthStencilState, color_blend_state: RDPipelineColorBlendState, dynamic_state_flags: int = 0, for_render_pass: int = 0, specialization_constants: RDPipelineSpecializationConstant[] = []) -> RID:
	pass;

#desc Returns [code]true[/code] if the render pipeline specified by the [param render_pipeline] RID is valid, [code]false[/code] otherwise.
func render_pipeline_is_valid(render_pipeline: RID) -> bool:
	pass;

#desc Creates a new sampler. It can be accessed with the RID that is returned.
#desc Once finished with your RID, you will want to free the RID using the RenderingDevice's [method free_rid] method.
func sampler_create(state: RDSamplerState) -> RID:
	pass;

#desc Returns [code]true[/code] if implementation supports using a texture of [param format] with the given [param sampler_filter].
func sampler_is_format_supported_for_filter(format: int, sampler_filter: int) -> bool:
	pass;

#desc Returns the screen's framebuffer format.
#desc [b]Note:[/b] Only the main [RenderingDevice] returned by [method RenderingServer.get_rendering_device] has a format. If called on a local [RenderingDevice], this method prints an error and returns [constant INVALID_ID].
func screen_get_framebuffer_format() -> int:
	pass;

#desc Returns the window height matching the graphics API context for the given window ID (in pixels). Despite the parameter being named [param screen], this returns the [i]window[/i] size. See also [method screen_get_width].
#desc [b]Note:[/b] Only the main [RenderingDevice] returned by [method RenderingServer.get_rendering_device] has a height. If called on a local [RenderingDevice], this method prints an error and returns [constant INVALID_ID].
func screen_get_height(screen: int = 0) -> int:
	pass;

#desc Returns the window width matching the graphics API context for the given window ID (in pixels). Despite the parameter being named [param screen], this returns the [i]window[/i] size. See also [method screen_get_height].
#desc [b]Note:[/b] Only the main [RenderingDevice] returned by [method RenderingServer.get_rendering_device] has a width. If called on a local [RenderingDevice], this method prints an error and returns [constant INVALID_ID].
func screen_get_width(screen: int = 0) -> int:
	pass;

#desc Sets the resource name for [param id] to [param name]. This is used for debugging with third-party tools such as [url=https://renderdoc.org/]RenderDoc[/url].
#desc The following types of resources can be named: texture, sampler, vertex buffer, index buffer, uniform buffer, texture buffer, storage buffer, uniform set buffer, shader, render pipeline and compute pipeline. Framebuffers cannot be named. Attempting to name an incompatible resource type will print an error.
#desc [b]Note:[/b] Resource names are only set when the engine runs in verbose mode ([method OS.is_stdout_verbose] = [code]true[/code]), or when using an engine build compiled with the [code]dev_mode=yes[/code] SCons option. The graphics driver must also support the [code]VK_EXT_DEBUG_UTILS_EXTENSION_NAME[/code] Vulkan extension for named resources to work.
func set_resource_name(id: RID, name: String) -> void:
	pass;

#desc Compiles a binary shader from [param spirv_data] and returns the compiled binary data as a [PackedByteArray]. This compiled shader is specific to the GPU model and driver version used; it will not work on different GPU models or even different driver versions. See also [method shader_compile_spirv_from_source].
#desc [param name] is an optional human-readable name that can be given to the compiled shader for organizational purposes.
func shader_compile_binary_from_spirv(spirv_data: RDShaderSPIRV, name: String = "") -> PackedByteArray:
	pass;

#desc Compiles a SPIR-V from the shader source code in [param shader_source] and returns the SPIR-V as a [RDShaderSPIRV]. This intermediate language shader is portable across different GPU models and driver versions, but cannot be run directly by GPUs until compiled into a binary shader using [method shader_compile_binary_from_spirv].
#desc If [param allow_cache] is [code]true[/code], make use of the shader cache generated by Godot. This avoids a potentially lengthy shader compilation step if the shader is already in cache. If [param allow_cache] is [code]false[/code], Godot's shader cache is ignored and the shader will always be recompiled.
func shader_compile_spirv_from_source(shader_source: RDShaderSource, allow_cache: bool = true) -> RDShaderSPIRV:
	pass;

#desc Creates a new shader instance from a binary compiled shader. It can be accessed with the RID that is returned.
#desc Once finished with your RID, you will want to free the RID using the RenderingDevice's [method free_rid] method. See also [method shader_compile_binary_from_spirv] and [method shader_create_from_spirv].
func shader_create_from_bytecode(binary_data: PackedByteArray) -> RID:
	pass;

#desc Creates a new shader instance from SPIR-V intermediate code. It can be accessed with the RID that is returned.
#desc Once finished with your RID, you will want to free the RID using the RenderingDevice's [method free_rid] method. See also [method shader_compile_spirv_from_source] and [method shader_create_from_bytecode].
func shader_create_from_spirv(spirv_data: RDShaderSPIRV, name: String = "") -> RID:
	pass;

func shader_get_vertex_input_attribute_mask(shader: RID) -> int:
	pass;

#desc Creates a [url=https://vkguide.dev/docs/chapter-4/storage_buffers/]storage buffer[/url] with the specified [param data] and [param usage]. It can be accessed with the RID that is returned.
#desc Once finished with your RID, you will want to free the RID using the RenderingDevice's [method free_rid] method.
func storage_buffer_create(size_bytes: int, data: PackedByteArray = PackedByteArray(), usage: int = 0) -> RID:
	pass;

#desc Pushes the frame setup and draw command buffers then marks the local device as currently processing (which allows calling [method sync]).
#desc [b]Note:[/b] Only available in local RenderingDevices.
func submit() -> void:
	pass;

#desc Forces a synchronization between the CPU and GPU, which may be required in certain cases. Only call this when needed, as CPU-GPU synchronization has a performance cost.
#desc [b]Note:[/b] Only available in local RenderingDevices.
#desc [b]Note:[/b] [method sync] can only be called after a [method submit].
func sync() -> void:
	pass;

#desc Creates a new texture buffer. It can be accessed with the RID that is returned.
#desc Once finished with your RID, you will want to free the RID using the RenderingDevice's [method free_rid] method.
func texture_buffer_create(size_bytes: int, format: int, data: PackedByteArray = PackedByteArray()) -> RID:
	pass;

#desc Clears the specified [param texture] by replacing all of its pixels with the specified [param color]. [param base_mipmap] and [param mipmap_count] determine which mipmaps of the texture are affected by this clear operation, while [param base_layer] and [param layer_count] determine which layers of a 3D texture (or texture array) are affected by this clear operation. For 2D textures (which only have one layer by design), [param base_layer] and [param layer_count] must both be [code]0[/code].
#desc [b]Note:[/b] [param texture] can't be cleared while a draw list that uses it as part of a framebuffer is being created. Ensure the draw list is finalized (and that the color/depth texture using it is not set to [constant FINAL_ACTION_CONTINUE]) to clear this texture.
func texture_clear(texture: RID, color: Color, base_mipmap: int, mipmap_count: int, base_layer: int, layer_count: int, post_barrier: int = 7) -> int:
	pass;

#desc Copies the [param from_texture] to [param to_texture] with the specified [param from_pos], [param to_pos] and [param size] coordinates. The Z axis of the [param from_pos], [param to_pos] and [param size] must be [code]0[/code] for 2-dimensional textures. Source and destination mipmaps/layers must also be specified, with these parameters being [code]0[/code] for textures without mipmaps or single-layer textures. Returns [constant @GlobalScope.OK] if the texture copy was successful or [constant @GlobalScope.ERR_INVALID_PARAMETER] otherwise.
#desc [b]Note:[/b] [param from_texture] texture can't be copied while a draw list that uses it as part of a framebuffer is being created. Ensure the draw list is finalized (and that the color/depth texture using it is not set to [constant FINAL_ACTION_CONTINUE]) to copy this texture.
#desc [b]Note:[/b] [param from_texture] texture requires the [constant TEXTURE_USAGE_CAN_COPY_FROM_BIT] to be retrieved.
#desc [b]Note:[/b] [param to_texture] can't be copied while a draw list that uses it as part of a framebuffer is being created. Ensure the draw list is finalized (and that the color/depth texture using it is not set to [constant FINAL_ACTION_CONTINUE]) to copy this texture.
#desc [b]Note:[/b] [param to_texture] requires the [constant TEXTURE_USAGE_CAN_COPY_TO_BIT] to be retrieved.
#desc [b]Note:[/b] [param from_texture] and [param to_texture] must be of the same type (color or depth).
func texture_copy(from_texture: RID, to_texture: RID, from_pos: Vector3, to_pos: Vector3, size: Vector3, src_mipmap: int, dst_mipmap: int, src_layer: int, dst_layer: int, post_barrier: int = 7) -> int:
	pass;

#desc Creates a new texture. It can be accessed with the RID that is returned.
#desc Once finished with your RID, you will want to free the RID using the RenderingDevice's [method free_rid] method.
#desc [b]Note:[/b] Not to be confused with [method RenderingServer.texture_2d_create], which creates the Godot-specific [Texture2D] resource as opposed to the graphics API's own texture type.
func texture_create(format: RDTextureFormat, view: RDTextureView, data: PackedByteArray[] = []) -> RID:
	pass;

#desc Creates a shared texture using the specified [param view] and the texture information from [param with_texture].
func texture_create_shared(view: RDTextureView, with_texture: RID) -> RID:
	pass;

#desc Creates a shared texture using the specified [param view] and the texture information from [param with_texture]'s [param layer] and [param mipmap]. The number of included mipmaps from the original texture can be controlled using the [param mipmaps] parameter. Only relevant for textures with multiple layers, such as 3D textures, texture arrays and cubemaps. For single-layer textures, use [method texture_create_shared]
#desc For 2D textures (which only have one layer), [param layer] must be [code]0[/code].
#desc [b]Note:[/b] Layer slicing is only supported for 2D texture arrays, not 3D textures or cubemaps.
func texture_create_shared_from_slice(view: RDTextureView, with_texture: RID, layer: int, mipmap: int, mipmaps: int = 1, slice_type: int = 0) -> RID:
	pass;

#desc Returns the [param texture] data for the specified [param layer] as raw binary data. For 2D textures (which only have one layer), [param layer] must be [code]0[/code].
#desc [b]Note:[/b] [param texture] can't be retrieved while a draw list that uses it as part of a framebuffer is being created. Ensure the draw list is finalized (and that the color/depth texture using it is not set to [constant FINAL_ACTION_CONTINUE]) to retrieve this texture. Otherwise, an error is printed and a empty [PackedByteArray] is returned.
#desc [b]Note:[/b] [param texture] requires the [constant TEXTURE_USAGE_CAN_COPY_FROM_BIT] to be retrieved. Otherwise, an error is printed and a empty [PackedByteArray] is returned.
func texture_get_data(texture: RID, layer: int) -> PackedByteArray:
	pass;

#desc Returns [code]true[/code] if the specified [param format] is supported for the given [param usage_flags], [code]false[/code] otherwise.
func texture_is_format_supported_for_usage(format: int, usage_flags: int) -> bool:
	pass;

#desc Returns [code]true[/code] if the [param texture] is shared, [code]false[/code] otherwise. See [RDTextureView].
func texture_is_shared(texture: RID) -> bool:
	pass;

#desc Returns [code]true[/code] if the [param texture] is valid, [code]false[/code] otherwise.
func texture_is_valid(texture: RID) -> bool:
	pass;

#desc Resolves the [param from_texture] texture onto [param to_texture] with multisample antialiasing enabled. This must be used when rendering a framebuffer for MSAA to work. Returns [constant @GlobalScope.OK] if successful, [constant @GlobalScope.ERR_INVALID_PARAMETER] otherwise.
#desc [b]Note:[/b] [param from_texture] and [param to_texture] textures must have the same dimension, format and type (color or depth).
#desc [b]Note:[/b] [param from_texture] can't be copied while a draw list that uses it as part of a framebuffer is being created. Ensure the draw list is finalized (and that the color/depth texture using it is not set to [constant FINAL_ACTION_CONTINUE]) to resolve this texture.
#desc [b]Note:[/b] [param from_texture] requires the [constant TEXTURE_USAGE_CAN_COPY_FROM_BIT] to be retrieved.
#desc [b]Note:[/b] [param from_texture] must be multisampled and must also be 2D (or a slice of a 3D/cubemap texture).
#desc [b]Note:[/b] [param to_texture] can't be copied while a draw list that uses it as part of a framebuffer is being created. Ensure the draw list is finalized (and that the color/depth texture using it is not set to [constant FINAL_ACTION_CONTINUE]) to resolve this texture.
#desc [b]Note:[/b] [param to_texture] texture requires the [constant TEXTURE_USAGE_CAN_COPY_TO_BIT] to be retrieved.
#desc [b]Note:[/b] [param to_texture] texture must [b]not[/b] be multisampled and must also be 2D (or a slice of a 3D/cubemap texture).
func texture_resolve_multisample(from_texture: RID, to_texture: RID, post_barrier: int = 7) -> int:
	pass;

#desc Updates texture data with new data, replacing the previous data in place. The updated texture data must have the same dimensions and format. For 2D textures (which only have one layer), [param layer] must be [code]0[/code]. Returns [constant @GlobalScope.OK] if the update was successful, [constant @GlobalScope.ERR_INVALID_PARAMETER] otherwise.
#desc [b]Note:[/b] Updating textures is forbidden during creation of a draw or compute list.
#desc [b]Note:[/b] The existing [param texture] can't be updated while a draw list that uses it as part of a framebuffer is being created. Ensure the draw list is finalized (and that the color/depth texture using it is not set to [constant FINAL_ACTION_CONTINUE]) to update this texture.
#desc [b]Note:[/b] The existing [param texture] requires the [constant TEXTURE_USAGE_CAN_UPDATE_BIT] to be updatable.
func texture_update(texture: RID, layer: int, data: PackedByteArray, post_barrier: int = 7) -> int:
	pass;

#desc It can be accessed with the RID that is returned.
#desc Once finished with your RID, you will want to free the RID using the RenderingDevice's [method free_rid] method.
func uniform_buffer_create(size_bytes: int, data: PackedByteArray = PackedByteArray()) -> RID:
	pass;

#desc It can be accessed with the RID that is returned.
#desc Once finished with your RID, you will want to free the RID using the RenderingDevice's [method free_rid] method.
func uniform_set_create(uniforms: RDUniform[], shader: RID, shader_set: int) -> RID:
	pass;

func uniform_set_is_valid(uniform_set: RID) -> bool:
	pass;

#desc Creates a vertex array based on the specified buffers. Optionally, [param offsets] (in bytes) may be defined for each buffer.
func vertex_array_create(vertex_count: int, vertex_format: int, src_buffers: RID[], offsets: PackedInt64Array = PackedInt64Array()) -> RID:
	pass;

#desc It can be accessed with the RID that is returned.
#desc Once finished with your RID, you will want to free the RID using the RenderingDevice's [method free_rid] method.
func vertex_buffer_create(size_bytes: int, data: PackedByteArray = PackedByteArray(), use_as_storage: bool = false) -> RID:
	pass;

#desc Creates a new vertex format with the specified [param vertex_descriptions]. Returns a unique vertex format ID corresponding to the newly created vertex format.
func vertex_format_create(vertex_descriptions: RDVertexAttribute[]) -> int:
	pass;



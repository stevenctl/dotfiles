extends RefCounted
#brief Base class to add support for specific image formats.
#desc The engine supports multiple image formats out of the box (PNG, SVG, JPEG, WebP to name a few), but you can choose to implement support for additional image formats by extending [ImageFormatLoaderExtension].
class_name ImageFormatLoader


#enum LoaderFlags
enum {
    FLAG_NONE = 0,
    FLAG_FORCE_LINEAR = 1,
    FLAG_CONVERT_COLORS = 2,
}




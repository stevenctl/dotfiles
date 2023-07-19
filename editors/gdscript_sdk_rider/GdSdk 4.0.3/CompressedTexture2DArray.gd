extends CompressedTextureLayered
#brief Array of 2-dimensional textures, optionally compressed.
#desc A texture array that is loaded from a [code].ctexarray[/code] file. This file format is internal to Godot; it is created by importing other image formats with the import system. [CompressedTexture2DArray] can use one of 4 compresson methods:
#desc - Lossless (WebP or PNG, uncompressed on the GPU)
#desc - Lossy (WebP, uncompressed on the GPU)
#desc - VRAM Compressed (compressed on the GPU)
#desc - VRAM Uncompressed (uncompressed on the GPU)
#desc - Basis Universal (compressed on the GPU. Lower file sizes than VRAM Compressed, but slower to compress and lower quality than VRAM Compressed)
#desc Only [b]VRAM Compressed[/b] actually reduces the memory usage on the GPU. The [b]Lossless[/b] and [b]Lossy[/b] compression methods will reduce the required storage on disk, but they will not reduce memory usage on the GPU as the texture is sent to the GPU uncompressed.
#desc Using [b]VRAM Compressed[/b] also improves loading times, as VRAM-compressed textures are faster to load compared to textures using lossless or lossy compression. VRAM compression can exhibit noticeable artifacts and is intended to be used for 3D rendering, not 2D.
#desc See [Texture2DArray] for a general description of texture arrays.
class_name CompressedTexture2DArray






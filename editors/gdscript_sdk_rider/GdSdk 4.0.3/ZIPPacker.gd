extends RefCounted
#brief Allows the creation of zip files.
#desc This class implements a writer that allows storing the multiple blobs in a zip archive.
#desc [codeblock]
#desc func write_zip_file():
#desc var writer := ZIPPacker.new()
#desc var err := writer.open("user://archive.zip")
#desc if err != OK:
#desc return err
#desc writer.start_file("hello.txt")
#desc writer.write_file("Hello World".to_utf8_buffer())
#desc writer.close_file()
#desc 
#desc writer.close()
#desc return OK
#desc [/codeblock]
class_name ZIPPacker


#enum ZipAppend
enum {
    APPEND_CREATE = 0,
    APPEND_CREATEAFTER = 1,
    APPEND_ADDINZIP = 2,
}


#desc Closes the underlying resources used by this instance.
func close() -> int:
	pass;

#desc Stops writing to a file within the archive.
#desc It will fail if there is no open file.
func close_file() -> int:
	pass;

#desc Opens a zip file for writing at the given path using the specified write mode.
#desc This must be called before everything else.
func open(path: String, append: int = 0) -> int:
	pass;

#desc Starts writing to a file within the archive. Only one file can be written at the same time.
#desc Must be called after [method open].
func start_file(path: String) -> int:
	pass;

#desc Write the given [param data] to the file.
#desc Needs to be called after [method start_file].
func write_file(data: PackedByteArray) -> int:
	pass;



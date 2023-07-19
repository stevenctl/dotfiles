extends RefCounted
#brief Allows reading the content of a zip file.
#desc This class implements a reader that can extract the content of individual files inside a zip archive.
#desc [codeblock]
#desc func read_zip_file():
#desc var reader := ZIPReader.new()
#desc var err := reader.open("user://archive.zip")
#desc if err != OK:
#desc return PackedByteArray()
#desc var res := reader.read_file("hello.txt")
#desc reader.close()
#desc return res
#desc [/codeblock]
class_name ZIPReader




#desc Closes the underlying resources used by this instance.
func close() -> int:
	pass;

#desc Returns the list of names of all files in the loaded archive.
#desc Must be called after [method open].
func get_files() -> PackedStringArray:
	pass;

#desc Opens the zip archive at the given [param path] and reads its file index.
func open(path: String) -> int:
	pass;

#desc Loads the whole content of a file in the loaded zip archive into memory and returns it.
#desc Must be called after [method open].
func read_file(path: String, case_sensitive: bool = true) -> PackedByteArray:
	pass;



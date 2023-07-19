extends EditorSceneFormatImporter
#brief Importer for the [code].fbx[/code] scene file format.
#desc Imports Autodesk FBX 3D scenes by way of converting them to glTF 2.0 using the FBX2glTF command line tool.
#desc The location of the FBX2glTF binary is set via the [code]filesystem/import/fbx/fbx2gltf_path[/code] editor setting.
#desc This importer is only used if [member ProjectSettings.filesystem/import/fbx/enabled] is enabled, otherwise [code].fbx[/code] files present in the project folder are not imported.
class_name EditorSceneFormatImporterFBX






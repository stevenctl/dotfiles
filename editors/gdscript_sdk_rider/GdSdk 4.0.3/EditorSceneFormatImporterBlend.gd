extends EditorSceneFormatImporter
#brief Importer for Blender's [code].blend[/code] scene file format.
#desc Imports Blender scenes in the [code].blend[/code] file format through the glTF 2.0 3D import pipeline. This importer requires Blender to be installed by the user, so that it can be used to export the scene as glTF 2.0.
#desc The location of the Blender binary is set via the [code]filesystem/import/blender/blender3_path[/code] editor setting.
#desc This importer is only used if [member ProjectSettings.filesystem/import/blender/enabled] is enabled, otherwise [code].blend[/code] files present in the project folder are not imported.
#desc Blend import requires Blender 3.0.
#desc Internally, the EditorSceneFormatImporterBlend uses the Blender glTF "Use Original" mode to reference external textures.
class_name EditorSceneFormatImporterBlend






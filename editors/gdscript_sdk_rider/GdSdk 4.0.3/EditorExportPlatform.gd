extends RefCounted
#brief Identifies a supported export platform, and internally provides the functionality of exporting to that platform.
#desc Base resource that provides the functionality of exporting a release build of a project to a platform, from the editor. Stores platform-specific metadata such as the name and supported features of the platform, and performs the exporting of projects, PCK files, and ZIP files. Uses an export template for the platform provided at the time of project exporting.
#desc Used in scripting by [EditorExportPlugin] to configure platform-specific customization of scenes and resources. See [method EditorExportPlugin._begin_customize_scenes] and [method EditorExportPlugin._begin_customize_resources] for more details.
class_name EditorExportPlatform






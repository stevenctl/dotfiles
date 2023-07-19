extends Material
#brief Placeholder class for a material.
#desc This class is used when loading a project that uses a [Material] subclass in 2 conditions:
#desc - When running the project exported in dedicated server mode, only the texture's dimensions are kept (as they may be relied upon for gameplay purposes or positioning of other elements). This allows reducing the exported PCK's size significantly.
#desc - When this subclass is missing due to using a different engine version or build (e.g. modules disabled).
class_name PlaceholderMaterial






extends RefCounted
#brief Base class for the implementation of core resource importers.
#desc This is the base class for the resource importers implemented in core. To implement your own resource importers using editor plugins, see [EditorImportPlugin].
#tutorial [Import plugins] https://docs.godotengine.org/en/stable/tutorials/plugins/editor/import_plugins.html
class_name ResourceImporter

#desc The default import order.
#desc The import order for scenes, which ensures scenes are imported [i]after[/i] all other core resources such as textures. Custom importers should generally have an import order lower than [code]100[/code] to avoid issues when importing scenes that rely on custom resources.

#enum ImportOrder
enum {
    IMPORT_ORDER_DEFAULT = 0,
    IMPORT_ORDER_SCENE = 100,
}




extends Node
#brief Overrides global shader parameters' values in a specific scene.
#desc Similar to how a [WorldEnvironment] node can be used to override the environment while a specific scene is loaded, [ShaderGlobalsOverride] can be used to override global shader parameters temporarily. Once the node is removed, the project-wide values for the global shader parameters are restored. See the [RenderingServer] [code]global_shader_parameter_*[/code] methods for more information.
#desc [b]Note:[/b] Only one [ShaderGlobalsOverride] can be used per scene. If there is more than one [ShaderGlobalsOverride] node in the scene tree, only the first node (in tree order) will be taken into account.
#desc [b]Note:[/b] All [ShaderGlobalsOverride] nodes are made part of a [code]"shader_overrides_group"[/code] group when they are added to the scene tree. The currently active [ShaderGlobalsOverride] node also has a [code]"shader_overrides_group_active"[/code] group added to it. You can use this to check which [ShaderGlobalsOverride] node is currently active.
class_name ShaderGlobalsOverride






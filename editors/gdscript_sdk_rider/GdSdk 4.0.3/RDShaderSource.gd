extends RefCounted
#brief Shader source code (used by [RenderingDevice]).
#desc Shader source code in text form.
#desc See also [RDShaderFile]. [RDShaderSource] is only meant to be used with the [RenderingDevice] API. It should not be confused with Godot's own [Shader] resource, which is what Godot's various nodes use for high-level shader programming.
class_name RDShaderSource


#desc The language the shader is written in.
var language: int:
	get = get_language, set = set_language

#desc Source code for the shader's compute stage.
var source_compute: String:
	get = get_stage_source, set = set_stage_source

#desc Source code for the shader's fragment stage.
var source_fragment: String:
	get = get_stage_source, set = set_stage_source

#desc Source code for the shader's tessellation control stage.
var source_tesselation_control: String:
	get = get_stage_source, set = set_stage_source

#desc Source code for the shader's tessellation evaluation stage.
var source_tesselation_evaluation: String:
	get = get_stage_source, set = set_stage_source

#desc Source code for the shader's vertex stage.
var source_vertex: String:
	get = get_stage_source, set = set_stage_source



#desc Returns source code for the specified shader [param stage]. Equivalent to getting one of [member source_compute], [member source_fragment], [member source_tesselation_control], [member source_tesselation_evaluation] or [member source_vertex].
func get_stage_source(stage: int) -> String:
	pass;

#desc Sets [param source] code for the specified shader [param stage]. Equivalent to setting one of [member source_compute], [member source_fragment], [member source_tesselation_control], [member source_tesselation_evaluation] or [member source_vertex].
func set_stage_source(stage: int, source: String) -> void:
	pass;


func get_language() -> int:
	return language

func set_language(value: int) -> void:
	language = value

func get_stage_source() -> String:
	return source_compute

func set_stage_source(value: String) -> void:
	source_compute = value

func get_stage_source() -> String:
	return source_fragment

func set_stage_source(value: String) -> void:
	source_fragment = value

func get_stage_source() -> String:
	return source_tesselation_control

func set_stage_source(value: String) -> void:
	source_tesselation_control = value

func get_stage_source() -> String:
	return source_tesselation_evaluation

func set_stage_source(value: String) -> void:
	source_tesselation_evaluation = value

func get_stage_source() -> String:
	return source_vertex

func set_stage_source(value: String) -> void:
	source_vertex = value


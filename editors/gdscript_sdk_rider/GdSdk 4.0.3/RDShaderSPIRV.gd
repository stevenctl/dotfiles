extends Resource
#brief SPIR-V intermediate representation as part of a [RDShaderFile] (used by [RenderingDevice]).
#desc [RDShaderSPIRV] represents a [RDShaderFile]'s [url=https://www.khronos.org/spir/]SPIR-V[/url] code for various shader stages, as well as possible compilation error messages. SPIR-V a low-level intermediate shader representation. This intermediate representation is not used directly by GPUs for rendering, but it can be compiled into binary shaders that GPUs can understand. Unlike compiled shaders, SPIR-V is portable across GPU models and driver versions.
#desc This object is used by [RenderingDevice].
class_name RDShaderSPIRV


#desc The SPIR-V bytecode for the compute shader stage.
var bytecode_compute: PackedByteArray:
	get = get_stage_bytecode, set = set_stage_bytecode

#desc The SPIR-V bytecode for the fragment shader stage.
var bytecode_fragment: PackedByteArray:
	get = get_stage_bytecode, set = set_stage_bytecode

#desc The SPIR-V bytecode for the tessellation control shader stage.
var bytecode_tesselation_control: PackedByteArray:
	get = get_stage_bytecode, set = set_stage_bytecode

#desc The SPIR-V bytecode for the tessellation evaluation shader stage.
var bytecode_tesselation_evaluation: PackedByteArray:
	get = get_stage_bytecode, set = set_stage_bytecode

#desc The SPIR-V bytecode for the vertex shader stage.
var bytecode_vertex: PackedByteArray:
	get = get_stage_bytecode, set = set_stage_bytecode

#desc The compilation error message for the compute shader stage (set by the SPIR-V compiler and Godot). If empty, shader compilation was successful.
var compile_error_compute: String:
	get = get_stage_compile_error, set = set_stage_compile_error

#desc The compilation error message for the fragment shader stage (set by the SPIR-V compiler and Godot). If empty, shader compilation was successful.
var compile_error_fragment: String:
	get = get_stage_compile_error, set = set_stage_compile_error

#desc The compilation error message for the tessellation control shader stage (set by the SPIR-V compiler and Godot). If empty, shader compilation was successful.
var compile_error_tesselation_control: String:
	get = get_stage_compile_error, set = set_stage_compile_error

#desc The compilation error message for the tessellation evaluation shader stage (set by the SPIR-V compiler and Godot). If empty, shader compilation was successful.
var compile_error_tesselation_evaluation: String:
	get = get_stage_compile_error, set = set_stage_compile_error

#desc The compilation error message for the vertex shader stage (set by the SPIR-V compiler and Godot). If empty, shader compilation was successful.
var compile_error_vertex: String:
	get = get_stage_compile_error, set = set_stage_compile_error



#desc Equivalent to getting one of [member bytecode_compute], [member bytecode_fragment], [member bytecode_tesselation_control], [member bytecode_tesselation_evaluation], [member bytecode_vertex].
func get_stage_bytecode(stage: int) -> PackedByteArray:
	pass;

#desc Returns the compilation error message for the given shader [param stage]. Equivalent to getting one of [member compile_error_compute], [member compile_error_fragment], [member compile_error_tesselation_control], [member compile_error_tesselation_evaluation], [member compile_error_vertex].
func get_stage_compile_error(stage: int) -> String:
	pass;

#desc Sets the SPIR-V [param bytecode] for the given shader [param stage]. Equivalent to setting one of [member bytecode_compute], [member bytecode_fragment], [member bytecode_tesselation_control], [member bytecode_tesselation_evaluation], [member bytecode_vertex].
func set_stage_bytecode(stage: int, bytecode: PackedByteArray) -> void:
	pass;

#desc Sets the compilation error message for the given shader [param stage] to [param compile_error]. Equivalent to setting one of [member compile_error_compute], [member compile_error_fragment], [member compile_error_tesselation_control], [member compile_error_tesselation_evaluation], [member compile_error_vertex].
func set_stage_compile_error(stage: int, compile_error: String) -> void:
	pass;


func get_stage_bytecode() -> PackedByteArray:
	return bytecode_compute

func set_stage_bytecode(value: PackedByteArray) -> void:
	bytecode_compute = value

func get_stage_bytecode() -> PackedByteArray:
	return bytecode_fragment

func set_stage_bytecode(value: PackedByteArray) -> void:
	bytecode_fragment = value

func get_stage_bytecode() -> PackedByteArray:
	return bytecode_tesselation_control

func set_stage_bytecode(value: PackedByteArray) -> void:
	bytecode_tesselation_control = value

func get_stage_bytecode() -> PackedByteArray:
	return bytecode_tesselation_evaluation

func set_stage_bytecode(value: PackedByteArray) -> void:
	bytecode_tesselation_evaluation = value

func get_stage_bytecode() -> PackedByteArray:
	return bytecode_vertex

func set_stage_bytecode(value: PackedByteArray) -> void:
	bytecode_vertex = value

func get_stage_compile_error() -> String:
	return compile_error_compute

func set_stage_compile_error(value: String) -> void:
	compile_error_compute = value

func get_stage_compile_error() -> String:
	return compile_error_fragment

func set_stage_compile_error(value: String) -> void:
	compile_error_fragment = value

func get_stage_compile_error() -> String:
	return compile_error_tesselation_control

func set_stage_compile_error(value: String) -> void:
	compile_error_tesselation_control = value

func get_stage_compile_error() -> String:
	return compile_error_tesselation_evaluation

func set_stage_compile_error(value: String) -> void:
	compile_error_tesselation_evaluation = value

func get_stage_compile_error() -> String:
	return compile_error_vertex

func set_stage_compile_error(value: String) -> void:
	compile_error_vertex = value


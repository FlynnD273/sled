@tool
class_name Icons extends Object


static var _instance: Icons


static var rename: Texture2D = preload("res://src/assets/icons/rename.png")
static var add_folder: Texture2D = preload("res://src/assets/icons/add_folder.png")
static var add_file: Texture2D = preload("res://src/assets/icons/add_file.png")
static var delete: Texture2D = preload("res://src/assets/icons/delete.png")
static var reset_value: Texture2D = preload("res://src/assets/icons/reset_value.png")
static var open_folder: Texture2D = preload("res://src/assets/icons/open_folder.png")
static var open_file: Texture2D = preload("res://src/assets/icons/open_file.png")
static var open_dir: Texture2D = preload("res://src/assets/icons/open_dir.png")


static var function: Texture2D = preload("res://src/assets/icons/code/function.png")
static var member: Texture2D = preload("res://src/assets/icons/code/member.png")
static var struct: Texture2D = preload("res://src/assets/icons/code/struct.png")
static var type_bool: Texture2D = preload("res://src/assets/icons/code/type_bool.png")
static var type_bvec2: Texture2D = preload("res://src/assets/icons/code/type_bvec2.png")
static var type_bvec3: Texture2D = preload("res://src/assets/icons/code/type_bvec3.png")
static var type_bvec4: Texture2D = preload("res://src/assets/icons/code/type_bvec4.png")
static var type_dmat2x2: Texture2D = preload("res://src/assets/icons/code/type_dmat2x2.png")
static var type_dmat2x3: Texture2D = preload("res://src/assets/icons/code/type_dmat2x3.png")
static var type_dmat2x4: Texture2D = preload("res://src/assets/icons/code/type_dmat2x4.png")
static var type_dmat3x2: Texture2D = preload("res://src/assets/icons/code/type_dmat3x2.png")
static var type_dmat3x3: Texture2D = preload("res://src/assets/icons/code/type_dmat3x3.png")
static var type_dmat3x4: Texture2D = preload("res://src/assets/icons/code/type_dmat3x4.png")
static var type_dmat4x2: Texture2D = preload("res://src/assets/icons/code/type_dmat4x2.png")
static var type_dmat4x3: Texture2D = preload("res://src/assets/icons/code/type_dmat4x3.png")
static var type_dmat4x4: Texture2D = preload("res://src/assets/icons/code/type_dmat4x4.png")
static var type_double: Texture2D = preload("res://src/assets/icons/code/type_double.png")
static var type_dvec2: Texture2D = preload("res://src/assets/icons/code/type_dvec2.png")
static var type_dvec3: Texture2D = preload("res://src/assets/icons/code/type_dvec3.png")
static var type_dvec4: Texture2D = preload("res://src/assets/icons/code/type_dvec4.png")
static var type_float: Texture2D = preload("res://src/assets/icons/code/type_float.png")
static var type_int: Texture2D = preload("res://src/assets/icons/code/type_int.png")
static var type_ivec_2: Texture2D = preload("res://src/assets/icons/code/type_ivec2.png")
static var type_ivec_3: Texture2D = preload("res://src/assets/icons/code/type_ivec3.png")
static var type_ivec_4: Texture2D = preload("res://src/assets/icons/code/type_ivec4.png")
static var type_mat_2x2: Texture2D = preload("res://src/assets/icons/code/type_mat2x2.png")
static var type_mat_2x3: Texture2D = preload("res://src/assets/icons/code/type_mat2x3.png")
static var type_mat_2x4: Texture2D = preload("res://src/assets/icons/code/type_mat2x4.png")
static var type_mat_3x2: Texture2D = preload("res://src/assets/icons/code/type_mat3x2.png")
static var type_mat_3x3: Texture2D = preload("res://src/assets/icons/code/type_mat3x3.png")
static var type_mat_3x4: Texture2D = preload("res://src/assets/icons/code/type_mat3x4.png")
static var type_mat_4x2: Texture2D = preload("res://src/assets/icons/code/type_mat4x2.png")
static var type_mat_4x3: Texture2D = preload("res://src/assets/icons/code/type_mat4x3.png")
static var type_mat_4x4: Texture2D = preload("res://src/assets/icons/code/type_mat4x4.png")
static var type_sampler1d: Texture2D = preload("res://src/assets/icons/code/type_sampler1D.png")
static var type_sampler2d: Texture2D = preload("res://src/assets/icons/code/type_sampler2D.png")
static var type_sampler3d: Texture2D = preload("res://src/assets/icons/code/type_sampler3D.png")
static var type_samplerCube: Texture2D = preload("res://src/assets/icons/code/type_samplerCube.png")
static var type_uint: Texture2D = preload("res://src/assets/icons/code/type_uint.png")
static var type_uvec2: Texture2D = preload("res://src/assets/icons/code/type_uvec2.png")
static var type_uvec3: Texture2D = preload("res://src/assets/icons/code/type_uvec3.png")
static var type_uvec4: Texture2D = preload("res://src/assets/icons/code/type_uvec4.png")
static var type_vec2: Texture2D = preload("res://src/assets/icons/code/type_vec2.png")
static var type_vec3: Texture2D = preload("res://src/assets/icons/code/type_vec3.png")
static var type_vec4: Texture2D = preload("res://src/assets/icons/code/type_vec4.png")
static var variable: Texture2D = preload("res://src/assets/icons/code/var.png")


static func sget(property: StringName) -> Variant:
	if not _instance:
		_instance = Icons.new()
	return _instance.get(property)

extends SkeletonProfile
#brief A humanoid [SkeletonProfile] preset.
#desc A [SkeletonProfile] as a preset that is optimized for the human form. This exists for standardization, so all parameters are read-only.
#tutorial [Retargeting 3D Skeletons] https://docs.godotengine.org/en/stable/tutorials/assets_pipeline/retargeting_3d_skeletons.html
class_name SkeletonProfileHumanoid


var bone_size: int:
	get = get_bone_size, set = set_bone_size

var group_size: int:
	get = get_group_size, set = set_group_size

var root_bone: StringName:
	get = get_root_bone, set = set_root_bone

var scale_base_bone: StringName:
	get = get_scale_base_bone, set = set_scale_base_bone




func get_bone_size() -> int:
	return bone_size

func set_bone_size(value: int) -> void:
	bone_size = value

func get_group_size() -> int:
	return group_size

func set_group_size(value: int) -> void:
	group_size = value

func get_root_bone() -> StringName:
	return root_bone

func set_root_bone(value: StringName) -> void:
	root_bone = value

func get_scale_base_bone() -> StringName:
	return scale_base_bone

func set_scale_base_bone(value: StringName) -> void:
	scale_base_bone = value


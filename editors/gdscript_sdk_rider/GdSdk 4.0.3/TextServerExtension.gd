extends TextServer
#brief Base class for TextServer custom implementations (plugins).
#desc External TextServer implementations should inherit from this class.
class_name TextServerExtension




func _cleanup() -> void:
	pass;

func _create_font() -> RID:
	pass;

func _create_shaped_text(direction: int, orientation: int) -> RID:
	pass;

func _draw_hex_code_box(canvas: RID, size: int, pos: Vector2, index: int, color: Color) -> void:
	pass;

func _font_clear_glyphs(font_rid: RID, size: Vector2i) -> void:
	pass;

func _font_clear_kerning_map(font_rid: RID, size: int) -> void:
	pass;

func _font_clear_size_cache(font_rid: RID) -> void:
	pass;

func _font_clear_textures(font_rid: RID, size: Vector2i) -> void:
	pass;

func _font_draw_glyph(font_rid: RID, canvas: RID, size: int, pos: Vector2, index: int, color: Color) -> void:
	pass;

func _font_draw_glyph_outline(font_rid: RID, canvas: RID, size: int, outline_size: int, pos: Vector2, index: int, color: Color) -> void:
	pass;

func _font_get_antialiasing(font_rid: RID) -> int:
	pass;

func _font_get_ascent(font_rid: RID, size: int) -> float:
	pass;

func _font_get_descent(font_rid: RID, size: int) -> float:
	pass;

func _font_get_embolden(font_rid: RID) -> float:
	pass;

func _font_get_face_count(font_rid: RID) -> int:
	pass;

func _font_get_face_index(font_rid: RID) -> int:
	pass;

func _font_get_fixed_size(font_rid: RID) -> int:
	pass;

func _font_get_generate_mipmaps(font_rid: RID) -> bool:
	pass;

func _font_get_global_oversampling() -> float:
	pass;

func _font_get_glyph_advance(font_rid: RID, size: int, glyph: int) -> Vector2:
	pass;

func _font_get_glyph_contours(font_rid: RID, size: int, index: int) -> Dictionary:
	pass;

func _font_get_glyph_index(font_rid: RID, size: int, char: int, variation_selector: int) -> int:
	pass;

func _font_get_glyph_list(font_rid: RID, size: Vector2i) -> PackedInt32Array:
	pass;

func _font_get_glyph_offset(font_rid: RID, size: Vector2i, glyph: int) -> Vector2:
	pass;

func _font_get_glyph_size(font_rid: RID, size: Vector2i, glyph: int) -> Vector2:
	pass;

func _font_get_glyph_texture_idx(font_rid: RID, size: Vector2i, glyph: int) -> int:
	pass;

func _font_get_glyph_texture_rid(font_rid: RID, size: Vector2i, glyph: int) -> RID:
	pass;

func _font_get_glyph_texture_size(font_rid: RID, size: Vector2i, glyph: int) -> Vector2:
	pass;

func _font_get_glyph_uv_rect(font_rid: RID, size: Vector2i, glyph: int) -> Rect2:
	pass;

func _font_get_hinting(font_rid: RID) -> int:
	pass;

func _font_get_kerning(font_rid: RID, size: int, glyph_pair: Vector2i) -> Vector2:
	pass;

func _font_get_kerning_list(font_rid: RID, size: int) -> Array[Vector2i]:
	pass;

func _font_get_language_support_override(font_rid: RID, language: String) -> bool:
	pass;

func _font_get_language_support_overrides(font_rid: RID) -> PackedStringArray:
	pass;

func _font_get_msdf_pixel_range(font_rid: RID) -> int:
	pass;

func _font_get_msdf_size(font_rid: RID) -> int:
	pass;

func _font_get_name(font_rid: RID) -> String:
	pass;

func _font_get_opentype_feature_overrides(font_rid: RID) -> Dictionary:
	pass;

func _font_get_oversampling(font_rid: RID) -> float:
	pass;

func _font_get_scale(font_rid: RID, size: int) -> float:
	pass;

func _font_get_script_support_override(font_rid: RID, script: String) -> bool:
	pass;

func _font_get_script_support_overrides(font_rid: RID) -> PackedStringArray:
	pass;

func _font_get_size_cache_list(font_rid: RID) -> Array[Vector2i]:
	pass;

func _font_get_stretch(font_rid: RID) -> int:
	pass;

func _font_get_style(font_rid: RID) -> int:
	pass;

func _font_get_style_name(font_rid: RID) -> String:
	pass;

func _font_get_subpixel_positioning(font_rid: RID) -> int:
	pass;

func _font_get_supported_chars(font_rid: RID) -> String:
	pass;

func _font_get_texture_count(font_rid: RID, size: Vector2i) -> int:
	pass;

func _font_get_texture_image(font_rid: RID, size: Vector2i, texture_index: int) -> Image:
	pass;

func _font_get_texture_offsets(font_rid: RID, size: Vector2i, texture_index: int) -> PackedInt32Array:
	pass;

func _font_get_transform(font_rid: RID) -> Transform2D:
	pass;

func _font_get_underline_position(font_rid: RID, size: int) -> float:
	pass;

func _font_get_underline_thickness(font_rid: RID, size: int) -> float:
	pass;

func _font_get_variation_coordinates(font_rid: RID) -> Dictionary:
	pass;

func _font_get_weight(font_rid: RID) -> int:
	pass;

func _font_has_char(font_rid: RID, char: int) -> bool:
	pass;

func _font_is_allow_system_fallback(font_rid: RID) -> bool:
	pass;

func _font_is_force_autohinter(font_rid: RID) -> bool:
	pass;

func _font_is_language_supported(font_rid: RID, language: String) -> bool:
	pass;

func _font_is_multichannel_signed_distance_field(font_rid: RID) -> bool:
	pass;

func _font_is_script_supported(font_rid: RID, script: String) -> bool:
	pass;

func _font_remove_glyph(font_rid: RID, size: Vector2i, glyph: int) -> void:
	pass;

func _font_remove_kerning(font_rid: RID, size: int, glyph_pair: Vector2i) -> void:
	pass;

func _font_remove_language_support_override(font_rid: RID, language: String) -> void:
	pass;

func _font_remove_script_support_override(font_rid: RID, script: String) -> void:
	pass;

func _font_remove_size_cache(font_rid: RID, size: Vector2i) -> void:
	pass;

func _font_remove_texture(font_rid: RID, size: Vector2i, texture_index: int) -> void:
	pass;

func _font_render_glyph(font_rid: RID, size: Vector2i, index: int) -> void:
	pass;

func _font_render_range(font_rid: RID, size: Vector2i, start: int, end: int) -> void:
	pass;

func _font_set_allow_system_fallback(font_rid: RID, allow_system_fallback: bool) -> void:
	pass;

func _font_set_antialiasing(font_rid: RID, antialiasing: int) -> void:
	pass;

func _font_set_ascent(font_rid: RID, size: int, ascent: float) -> void:
	pass;

func _font_set_data(font_rid: RID, data: PackedByteArray) -> void:
	pass;

func _font_set_data_ptr(font_rid: RID, data_ptr: const uint8_t*, data_size: int) -> void:
	pass;

func _font_set_descent(font_rid: RID, size: int, descent: float) -> void:
	pass;

func _font_set_embolden(font_rid: RID, strength: float) -> void:
	pass;

func _font_set_face_index(font_rid: RID, face_index: int) -> void:
	pass;

func _font_set_fixed_size(font_rid: RID, fixed_size: int) -> void:
	pass;

func _font_set_force_autohinter(font_rid: RID, force_autohinter: bool) -> void:
	pass;

func _font_set_generate_mipmaps(font_rid: RID, generate_mipmaps: bool) -> void:
	pass;

func _font_set_global_oversampling(oversampling: float) -> void:
	pass;

func _font_set_glyph_advance(font_rid: RID, size: int, glyph: int, advance: Vector2) -> void:
	pass;

func _font_set_glyph_offset(font_rid: RID, size: Vector2i, glyph: int, offset: Vector2) -> void:
	pass;

func _font_set_glyph_size(font_rid: RID, size: Vector2i, glyph: int, gl_size: Vector2) -> void:
	pass;

func _font_set_glyph_texture_idx(font_rid: RID, size: Vector2i, glyph: int, texture_idx: int) -> void:
	pass;

func _font_set_glyph_uv_rect(font_rid: RID, size: Vector2i, glyph: int, uv_rect: Rect2) -> void:
	pass;

func _font_set_hinting(font_rid: RID, hinting: int) -> void:
	pass;

func _font_set_kerning(font_rid: RID, size: int, glyph_pair: Vector2i, kerning: Vector2) -> void:
	pass;

func _font_set_language_support_override(font_rid: RID, language: String, supported: bool) -> void:
	pass;

func _font_set_msdf_pixel_range(font_rid: RID, msdf_pixel_range: int) -> void:
	pass;

func _font_set_msdf_size(font_rid: RID, msdf_size: int) -> void:
	pass;

func _font_set_multichannel_signed_distance_field(font_rid: RID, msdf: bool) -> void:
	pass;

func _font_set_name(font_rid: RID, name: String) -> void:
	pass;

func _font_set_opentype_feature_overrides(font_rid: RID, overrides: Dictionary) -> void:
	pass;

func _font_set_oversampling(font_rid: RID, oversampling: float) -> void:
	pass;

func _font_set_scale(font_rid: RID, size: int, scale: float) -> void:
	pass;

func _font_set_script_support_override(font_rid: RID, script: String, supported: bool) -> void:
	pass;

func _font_set_stretch(font_rid: RID, stretch: int) -> void:
	pass;

func _font_set_style(font_rid: RID, style: int) -> void:
	pass;

func _font_set_style_name(font_rid: RID, name_style: String) -> void:
	pass;

func _font_set_subpixel_positioning(font_rid: RID, subpixel_positioning: int) -> void:
	pass;

func _font_set_texture_image(font_rid: RID, size: Vector2i, texture_index: int, image: Image) -> void:
	pass;

func _font_set_texture_offsets(font_rid: RID, size: Vector2i, texture_index: int, offset: PackedInt32Array) -> void:
	pass;

func _font_set_transform(font_rid: RID, transform: Transform2D) -> void:
	pass;

func _font_set_underline_position(font_rid: RID, size: int, underline_position: float) -> void:
	pass;

func _font_set_underline_thickness(font_rid: RID, size: int, underline_thickness: float) -> void:
	pass;

func _font_set_variation_coordinates(font_rid: RID, variation_coordinates: Dictionary) -> void:
	pass;

func _font_set_weight(font_rid: RID, weight: int) -> void:
	pass;

func _font_supported_feature_list(font_rid: RID) -> Dictionary:
	pass;

func _font_supported_variation_list(font_rid: RID) -> Dictionary:
	pass;

func _format_number(string: String, language: String) -> String:
	pass;

func _free_rid(rid: RID) -> void:
	pass;

func _get_features() -> int:
	pass;

func _get_hex_code_box_size(size: int, index: int) -> Vector2:
	pass;

func _get_name() -> String:
	pass;

func _get_support_data_filename() -> String:
	pass;

func _get_support_data_info() -> String:
	pass;

func _has(rid: RID) -> bool:
	pass;

func _has_feature(feature: int) -> bool:
	pass;

func _is_confusable(string: String, dict: PackedStringArray) -> int:
	pass;

func _is_locale_right_to_left(locale: String) -> bool:
	pass;

func _is_valid_identifier(string: String) -> bool:
	pass;

func _load_support_data(filename: String) -> bool:
	pass;

func _name_to_tag(name: String) -> int:
	pass;

func _parse_number(string: String, language: String) -> String:
	pass;

func _parse_structured_text(parser_type: int, args: Array, text: String) -> Array[Vector3i]:
	pass;

func _percent_sign(language: String) -> String:
	pass;

func _save_support_data(filename: String) -> bool:
	pass;

func _shaped_get_span_count(shaped: RID) -> int:
	pass;

func _shaped_get_span_meta(shaped: RID, index: int) -> Variant:
	pass;

func _shaped_set_span_update_font(shaped: RID, index: int, fonts: RID[], size: int, opentype_features: Dictionary) -> void:
	pass;

func _shaped_text_add_object(shaped: RID, key: Variant, size: Vector2, inline_align: int, length: int, baseline: float) -> bool:
	pass;

func _shaped_text_add_string(shaped: RID, text: String, fonts: RID[], size: int, opentype_features: Dictionary, language: String, meta: Variant) -> bool:
	pass;

func _shaped_text_clear(shaped: RID) -> void:
	pass;

func _shaped_text_draw(shaped: RID, canvas: RID, pos: Vector2, clip_l: float, clip_r: float, color: Color) -> void:
	pass;

func _shaped_text_draw_outline(shaped: RID, canvas: RID, pos: Vector2, clip_l: float, clip_r: float, outline_size: int, color: Color) -> void:
	pass;

func _shaped_text_fit_to_width(shaped: RID, width: float, jst_flags: int) -> float:
	pass;

func _shaped_text_get_ascent(shaped: RID) -> float:
	pass;

func _shaped_text_get_carets(shaped: RID, position: int, caret: CaretInfo*) -> void:
	pass;

func _shaped_text_get_custom_punctuation(shaped: RID) -> String:
	pass;

func _shaped_text_get_descent(shaped: RID) -> float:
	pass;

func _shaped_text_get_direction(shaped: RID) -> int:
	pass;

func _shaped_text_get_dominant_direction_in_range(shaped: RID, start: int, end: int) -> int:
	pass;

func _shaped_text_get_ellipsis_glyph_count(shaped: RID) -> int:
	pass;

func _shaped_text_get_ellipsis_glyphs(shaped: RID) -> const Glyph*:
	pass;

func _shaped_text_get_ellipsis_pos(shaped: RID) -> int:
	pass;

func _shaped_text_get_glyph_count(shaped: RID) -> int:
	pass;

func _shaped_text_get_glyphs(shaped: RID) -> const Glyph*:
	pass;

func _shaped_text_get_grapheme_bounds(shaped: RID, pos: int) -> Vector2:
	pass;

func _shaped_text_get_inferred_direction(shaped: RID) -> int:
	pass;

func _shaped_text_get_line_breaks(shaped: RID, width: float, start: int, break_flags: int) -> PackedInt32Array:
	pass;

func _shaped_text_get_line_breaks_adv(shaped: RID, width: PackedFloat32Array, start: int, once: bool, break_flags: int) -> PackedInt32Array:
	pass;

func _shaped_text_get_object_rect(shaped: RID, key: Variant) -> Rect2:
	pass;

func _shaped_text_get_objects(shaped: RID) -> Array:
	pass;

func _shaped_text_get_orientation(shaped: RID) -> int:
	pass;

func _shaped_text_get_parent(shaped: RID) -> RID:
	pass;

func _shaped_text_get_preserve_control(shaped: RID) -> bool:
	pass;

func _shaped_text_get_preserve_invalid(shaped: RID) -> bool:
	pass;

func _shaped_text_get_range(shaped: RID) -> Vector2i:
	pass;

func _shaped_text_get_selection(shaped: RID, start: int, end: int) -> PackedVector2Array:
	pass;

func _shaped_text_get_size(shaped: RID) -> Vector2:
	pass;

func _shaped_text_get_spacing(shaped: RID, spacing: int) -> int:
	pass;

func _shaped_text_get_trim_pos(shaped: RID) -> int:
	pass;

func _shaped_text_get_underline_position(shaped: RID) -> float:
	pass;

func _shaped_text_get_underline_thickness(shaped: RID) -> float:
	pass;

func _shaped_text_get_width(shaped: RID) -> float:
	pass;

func _shaped_text_get_word_breaks(shaped: RID, grapheme_flags: int) -> PackedInt32Array:
	pass;

func _shaped_text_hit_test_grapheme(shaped: RID, coord: float) -> int:
	pass;

func _shaped_text_hit_test_position(shaped: RID, coord: float) -> int:
	pass;

func _shaped_text_is_ready(shaped: RID) -> bool:
	pass;

func _shaped_text_next_grapheme_pos(shaped: RID, pos: int) -> int:
	pass;

func _shaped_text_overrun_trim_to_width(shaped: RID, width: float, trim_flags: int) -> void:
	pass;

func _shaped_text_prev_grapheme_pos(shaped: RID, pos: int) -> int:
	pass;

func _shaped_text_resize_object(shaped: RID, key: Variant, size: Vector2, inline_align: int, baseline: float) -> bool:
	pass;

func _shaped_text_set_bidi_override(shaped: RID, override: Array) -> void:
	pass;

func _shaped_text_set_custom_punctuation(shaped: RID, punct: String) -> void:
	pass;

func _shaped_text_set_direction(shaped: RID, direction: int) -> void:
	pass;

func _shaped_text_set_orientation(shaped: RID, orientation: int) -> void:
	pass;

func _shaped_text_set_preserve_control(shaped: RID, enabled: bool) -> void:
	pass;

func _shaped_text_set_preserve_invalid(shaped: RID, enabled: bool) -> void:
	pass;

func _shaped_text_set_spacing(shaped: RID, spacing: int, value: int) -> void:
	pass;

func _shaped_text_shape(shaped: RID) -> bool:
	pass;

func _shaped_text_sort_logical(shaped: RID) -> const Glyph*:
	pass;

func _shaped_text_substr(shaped: RID, start: int, length: int) -> RID:
	pass;

func _shaped_text_tab_align(shaped: RID, tab_stops: PackedFloat32Array) -> float:
	pass;

func _shaped_text_update_breaks(shaped: RID) -> bool:
	pass;

func _shaped_text_update_justification_ops(shaped: RID) -> bool:
	pass;

func _spoof_check(string: String) -> bool:
	pass;

func _string_get_word_breaks(string: String, language: String, chars_per_line: int) -> PackedInt32Array:
	pass;

func _string_to_lower(string: String, language: String) -> String:
	pass;

func _string_to_upper(string: String, language: String) -> String:
	pass;

func _strip_diacritics(string: String) -> String:
	pass;

func _tag_to_name(tag: int) -> String:
	pass;



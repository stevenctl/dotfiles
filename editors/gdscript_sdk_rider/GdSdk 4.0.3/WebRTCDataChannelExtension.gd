extends WebRTCDataChannel
class_name WebRTCDataChannelExtension




func _close() -> void:
	pass;

func _get_available_packet_count() -> int:
	pass;

func _get_buffered_amount() -> int:
	pass;

func _get_id() -> int:
	pass;

func _get_label() -> String:
	pass;

func _get_max_packet_life_time() -> int:
	pass;

func _get_max_packet_size() -> int:
	pass;

func _get_max_retransmits() -> int:
	pass;

func _get_packet(r_buffer: const uint8_t **, r_buffer_size: int32_t*) -> int:
	pass;

func _get_protocol() -> String:
	pass;

func _get_ready_state() -> int:
	pass;

func _get_write_mode() -> int:
	pass;

func _is_negotiated() -> bool:
	pass;

func _is_ordered() -> bool:
	pass;

func _poll() -> int:
	pass;

func _put_packet(p_buffer: const uint8_t*, p_buffer_size: int) -> int:
	pass;

func _set_write_mode(p_write_mode: int) -> void:
	pass;

func _was_string_packet() -> bool:
	pass;



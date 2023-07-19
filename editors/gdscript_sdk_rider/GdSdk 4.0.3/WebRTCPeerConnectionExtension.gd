extends WebRTCPeerConnection
class_name WebRTCPeerConnectionExtension




func _add_ice_candidate(p_sdp_mid_name: String, p_sdp_mline_index: int, p_sdp_name: String) -> int:
	pass;

func _close() -> void:
	pass;

func _create_data_channel(p_label: String, p_config: Dictionary) -> Object:
	pass;

func _create_offer() -> int:
	pass;

func _get_connection_state() -> int:
	pass;

func _get_gathering_state() -> int:
	pass;

func _get_signaling_state() -> int:
	pass;

func _initialize(p_config: Dictionary) -> int:
	pass;

func _poll() -> int:
	pass;

func _set_local_description(p_type: String, p_sdp: String) -> int:
	pass;

func _set_remote_description(p_type: String, p_sdp: String) -> int:
	pass;



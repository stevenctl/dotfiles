extends XRInterface
#brief Generic mobile VR implementation.
#desc This is a generic mobile VR implementation where you need to provide details about the phone and HMD used. It does not rely on any existing framework. This is the most basic interface we have. For the best effect, you need a mobile phone with a gyroscope and accelerometer.
#desc Note that even though there is no positional tracking, the camera will assume the headset is at a height of 1.85 meters. You can change this by setting [member eye_height].
#desc You can initialize this interface as follows:
#desc [codeblock]
#desc var interface = XRServer.find_interface("Native mobile")
#desc if interface and interface.initialize():
#desc get_viewport().xr = true
#desc [/codeblock]
class_name MobileVRInterface


#desc The distance between the display and the lenses inside of the device in centimeters.
var display_to_lens: float:
	get = get_display_to_lens, set = set_display_to_lens

#desc The width of the display in centimeters.
var display_width: float:
	get = get_display_width, set = set_display_width

#desc The height at which the camera is placed in relation to the ground (i.e. [XROrigin3D] node).
var eye_height: float:
	get = get_eye_height, set = set_eye_height

#desc The interocular distance, also known as the interpupillary distance. The distance between the pupils of the left and right eye.
var iod: float:
	get = get_iod, set = set_iod

#desc The k1 lens factor is one of the two constants that define the strength of the lens used and directly influences the lens distortion effect.
var k1: float:
	get = get_k1, set = set_k1

#desc The k2 lens factor, see k1.
var k2: float:
	get = get_k2, set = set_k2

#desc The oversample setting. Because of the lens distortion we have to render our buffers at a higher resolution then the screen can natively handle. A value between 1.5 and 2.0 often provides good results but at the cost of performance.
var oversample: float:
	get = get_oversample, set = set_oversample

var xr_play_area_mode: int:
	get = get_play_area_mode, set = set_play_area_mode




func get_display_to_lens() -> float:
	return display_to_lens

func set_display_to_lens(value: float) -> void:
	display_to_lens = value

func get_display_width() -> float:
	return display_width

func set_display_width(value: float) -> void:
	display_width = value

func get_eye_height() -> float:
	return eye_height

func set_eye_height(value: float) -> void:
	eye_height = value

func get_iod() -> float:
	return iod

func set_iod(value: float) -> void:
	iod = value

func get_k1() -> float:
	return k1

func set_k1(value: float) -> void:
	k1 = value

func get_k2() -> float:
	return k2

func set_k2(value: float) -> void:
	k2 = value

func get_oversample() -> float:
	return oversample

func set_oversample(value: float) -> void:
	oversample = value

func get_play_area_mode() -> int:
	return xr_play_area_mode

func set_play_area_mode(value: int) -> void:
	xr_play_area_mode = value


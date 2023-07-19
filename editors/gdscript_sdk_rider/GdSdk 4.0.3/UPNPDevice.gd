extends RefCounted
#brief Universal Plug and Play (UPnP) device.
#desc Universal Plug and Play (UPnP) device. See [UPNP] for UPnP discovery and utility functions. Provides low-level access to UPNP control commands. Allows to manage port mappings (port forwarding) and to query network information of the device (like local and external IP address and status). Note that methods on this class are synchronous and block the calling thread.
class_name UPNPDevice

#desc OK.
#desc HTTP error.
#desc Empty HTTP response.
#desc Returned response contained no URLs.
#desc Not a valid IGD.
#desc Disconnected.
#desc Unknown device.
#desc Invalid control.
#desc Memory allocation error.
#desc Unknown error.

#enum IGDStatus
enum {
    IGD_STATUS_OK = 0,
    IGD_STATUS_HTTP_ERROR = 1,
    IGD_STATUS_HTTP_EMPTY = 2,
    IGD_STATUS_NO_URLS = 3,
    IGD_STATUS_NO_IGD = 4,
    IGD_STATUS_DISCONNECTED = 5,
    IGD_STATUS_UNKNOWN_DEVICE = 6,
    IGD_STATUS_INVALID_CONTROL = 7,
    IGD_STATUS_MALLOC_ERROR = 8,
    IGD_STATUS_UNKNOWN_ERROR = 9,
}
#desc URL to the device description.
var description_url: String:
	get = get_description_url, set = set_description_url

#desc IDG control URL.
var igd_control_url: String:
	get = get_igd_control_url, set = set_igd_control_url

#desc Address of the local machine in the network connecting it to this [UPNPDevice].
var igd_our_addr: String:
	get = get_igd_our_addr, set = set_igd_our_addr

#desc IGD service type.
var igd_service_type: String:
	get = get_igd_service_type, set = set_igd_service_type

#desc IGD status. See [enum IGDStatus].
var igd_status: int:
	get = get_igd_status, set = set_igd_status

#desc Service type.
var service_type: String:
	get = get_service_type, set = set_service_type



#desc Adds a port mapping to forward the given external port on this [UPNPDevice] for the given protocol to the local machine. See [method UPNP.add_port_mapping].
func add_port_mapping(port: int, port_internal: int = 0, desc: String = "", proto: String = "UDP", duration: int = 0) -> int:
	pass;

#desc Deletes the port mapping identified by the given port and protocol combination on this device. See [method UPNP.delete_port_mapping].
func delete_port_mapping(port: int, proto: String = "UDP") -> int:
	pass;

#desc Returns [code]true[/code] if this is a valid IGD (InternetGatewayDevice) which potentially supports port forwarding.
func is_valid_gateway() -> bool:
	pass;

#desc Returns the external IP address of this [UPNPDevice] or an empty string.
func query_external_address() -> String:
	pass;


func get_description_url() -> String:
	return description_url

func set_description_url(value: String) -> void:
	description_url = value

func get_igd_control_url() -> String:
	return igd_control_url

func set_igd_control_url(value: String) -> void:
	igd_control_url = value

func get_igd_our_addr() -> String:
	return igd_our_addr

func set_igd_our_addr(value: String) -> void:
	igd_our_addr = value

func get_igd_service_type() -> String:
	return igd_service_type

func set_igd_service_type(value: String) -> void:
	igd_service_type = value

func get_igd_status() -> int:
	return igd_status

func set_igd_status(value: int) -> void:
	igd_status = value

func get_service_type() -> String:
	return service_type

func set_service_type(value: String) -> void:
	service_type = value


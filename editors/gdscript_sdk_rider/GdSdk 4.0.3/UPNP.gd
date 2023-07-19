extends RefCounted
#brief Universal Plug and Play (UPnP) functions for network device discovery, querying and port forwarding.
#desc This class can be used to discover compatible [UPNPDevice]s on the local network and execute commands on them, like managing port mappings (for port forwarding/NAT traversal) and querying the local and remote network IP address. Note that methods on this class are synchronous and block the calling thread.
#desc To forward a specific port (here [code]7777[/code], note both [method discover] and [method add_port_mapping] can return errors that should be checked):
#desc [codeblock]
#desc var upnp = UPNP.new()
#desc upnp.discover()
#desc upnp.add_port_mapping(7777)
#desc [/codeblock]
#desc To close a specific port (e.g. after you have finished using it):
#desc [codeblock]
#desc upnp.delete_port_mapping(port)
#desc [/codeblock]
#desc [b]Note:[/b] UPnP discovery blocks the current thread. To perform discovery without blocking the main thread, use [Thread]s like this:
#desc [codeblock]
#desc # Emitted when UPnP port mapping setup is completed (regardless of success or failure).
#desc signal upnp_completed(error)
#desc 
#desc # Replace this with your own server port number between 1024 and 65535.
#desc const SERVER_PORT = 3928
#desc var thread = null
#desc 
#desc func _upnp_setup(server_port):
#desc # UPNP queries take some time.
#desc var upnp = UPNP.new()
#desc var err = upnp.discover()
#desc 
#desc if err != OK:
#desc push_error(str(err))
#desc emit_signal("upnp_completed", err)
#desc return
#desc 
#desc if upnp.get_gateway() and upnp.get_gateway().is_valid_gateway():
#desc upnp.add_port_mapping(server_port, server_port, ProjectSettings.get_setting("application/config/name"), "UDP")
#desc upnp.add_port_mapping(server_port, server_port, ProjectSettings.get_setting("application/config/name"), "TCP")
#desc emit_signal("upnp_completed", OK)
#desc 
#desc func _ready():
#desc thread = Thread.new()
#desc thread.start(_upnp_setup.bind(SERVER_PORT))
#desc 
#desc func _exit_tree():
#desc # Wait for thread finish here to handle game exit while the thread is running.
#desc thread.wait_to_finish()
#desc [/codeblock]
#desc [b]Terminology:[/b] In the context of UPnP networking, "gateway" (or "internet gateway device", short IGD) refers to network devices that allow computers in the local network to access the internet ("wide area network", WAN). These gateways are often also called "routers".
#desc [b]Pitfalls:[/b]
#desc - As explained above, these calls are blocking and shouldn't be run on the main thread, especially as they can block for multiple seconds at a time. Use threading!
#desc - Networking is physical and messy. Packets get lost in transit or get filtered, addresses, free ports and assigned mappings change, and devices may leave or join the network at any time. Be mindful of this, be diligent when checking and handling errors, and handle these gracefully if you can: add clear error UI, timeouts and re-try handling.
#desc - Port mappings may change (and be removed) at any time, and the remote/external IP address of the gateway can change likewise. You should consider re-querying the external IP and try to update/refresh the port mapping periodically (for example, every 5 minutes and on networking failures).
#desc - Not all devices support UPnP, and some users disable UPnP support. You need to handle this (e.g. documenting and requiring the user to manually forward ports, or adding alternative methods of NAT traversal, like a relay/mirror server, or NAT hole punching, STUN/TURN, etc.).
#desc - Consider what happens on mapping conflicts. Maybe multiple users on the same network would like to play your game at the same time, or maybe another application uses the same port. Make the port configurable, and optimally choose a port automatically (re-trying with a different port on failure).
#desc [b]Further reading:[/b] If you want to know more about UPnP (and the Internet Gateway Device (IGD) and Port Control Protocol (PCP) specifically), [url=https://en.wikipedia.org/wiki/Universal_Plug_and_Play]Wikipedia[/url] is a good first stop, the specification can be found at the [url=https://openconnectivity.org/developer/specifications/upnp-resources/upnp/]Open Connectivity Foundation[/url] and Godot's implementation is based on the [url=https://github.com/miniupnp/miniupnp]MiniUPnP client[/url].
class_name UPNP

#desc UPNP command or discovery was successful.
#desc Not authorized to use the command on the [UPNPDevice]. May be returned when the user disabled UPNP on their router.
#desc No port mapping was found for the given port, protocol combination on the given [UPNPDevice].
#desc Inconsistent parameters.
#desc No such entry in array. May be returned if a given port, protocol combination is not found on an [UPNPDevice].
#desc The action failed.
#desc The [UPNPDevice] does not allow wildcard values for the source IP address.
#desc The [UPNPDevice] does not allow wildcard values for the external port.
#desc The [UPNPDevice] does not allow wildcard values for the internal port.
#desc The remote host value must be a wildcard.
#desc The external port value must be a wildcard.
#desc No port maps are available. May also be returned if port mapping functionality is not available.
#desc Conflict with other mechanism. May be returned instead of [constant UPNP_RESULT_CONFLICT_WITH_OTHER_MAPPING] if a port mapping conflicts with an existing one.
#desc Conflict with an existing port mapping.
#desc External and internal port values must be the same.
#desc Only permanent leases are supported. Do not use the [code]duration[/code] parameter when adding port mappings.
#desc Invalid gateway.
#desc Invalid port.
#desc Invalid protocol.
#desc Invalid duration.
#desc Invalid arguments.
#desc Invalid response.
#desc Invalid parameter.
#desc HTTP error.
#desc Socket error.
#desc Error allocating memory.
#desc No gateway available. You may need to call [method discover] first, or discovery didn't detect any valid IGDs (InternetGatewayDevices).
#desc No devices available. You may need to call [method discover] first, or discovery didn't detect any valid [UPNPDevice]s.
#desc Unknown error.

#enum UPNPResult
enum {
    UPNP_RESULT_SUCCESS = 0,
    UPNP_RESULT_NOT_AUTHORIZED = 1,
    UPNP_RESULT_PORT_MAPPING_NOT_FOUND = 2,
    UPNP_RESULT_INCONSISTENT_PARAMETERS = 3,
    UPNP_RESULT_NO_SUCH_ENTRY_IN_ARRAY = 4,
    UPNP_RESULT_ACTION_FAILED = 5,
    UPNP_RESULT_SRC_IP_WILDCARD_NOT_PERMITTED = 6,
    UPNP_RESULT_EXT_PORT_WILDCARD_NOT_PERMITTED = 7,
    UPNP_RESULT_INT_PORT_WILDCARD_NOT_PERMITTED = 8,
    UPNP_RESULT_REMOTE_HOST_MUST_BE_WILDCARD = 9,
    UPNP_RESULT_EXT_PORT_MUST_BE_WILDCARD = 10,
    UPNP_RESULT_NO_PORT_MAPS_AVAILABLE = 11,
    UPNP_RESULT_CONFLICT_WITH_OTHER_MECHANISM = 12,
    UPNP_RESULT_CONFLICT_WITH_OTHER_MAPPING = 13,
    UPNP_RESULT_SAME_PORT_VALUES_REQUIRED = 14,
    UPNP_RESULT_ONLY_PERMANENT_LEASE_SUPPORTED = 15,
    UPNP_RESULT_INVALID_GATEWAY = 16,
    UPNP_RESULT_INVALID_PORT = 17,
    UPNP_RESULT_INVALID_PROTOCOL = 18,
    UPNP_RESULT_INVALID_DURATION = 19,
    UPNP_RESULT_INVALID_ARGS = 20,
    UPNP_RESULT_INVALID_RESPONSE = 21,
    UPNP_RESULT_INVALID_PARAM = 22,
    UPNP_RESULT_HTTP_ERROR = 23,
    UPNP_RESULT_SOCKET_ERROR = 24,
    UPNP_RESULT_MEM_ALLOC_ERROR = 25,
    UPNP_RESULT_NO_GATEWAY = 26,
    UPNP_RESULT_NO_DEVICES = 27,
    UPNP_RESULT_UNKNOWN_ERROR = 28,
}
#desc If [code]true[/code], IPv6 is used for [UPNPDevice] discovery.
var discover_ipv6: bool:
	get = is_discover_ipv6, set = set_discover_ipv6

#desc If [code]0[/code], the local port to use for discovery is chosen automatically by the system. If [code]1[/code], discovery will be done from the source port 1900 (same as destination port). Otherwise, the value will be used as the port.
var discover_local_port: int:
	get = get_discover_local_port, set = set_discover_local_port

#desc Multicast interface to use for discovery. Uses the default multicast interface if empty.
var discover_multicast_if: String:
	get = get_discover_multicast_if, set = set_discover_multicast_if



#desc Adds the given [UPNPDevice] to the list of discovered devices.
func add_device(device: UPNPDevice) -> void:
	pass;

#desc Adds a mapping to forward the external [code]port[/code] (between 1 and 65535, although recommended to use port 1024 or above) on the default gateway (see [method get_gateway]) to the [code]internal_port[/code] on the local machine for the given protocol [code]proto[/code] (either [code]"TCP"[/code] or [code]"UDP"[/code], with UDP being the default). If a port mapping for the given port and protocol combination already exists on that gateway device, this method tries to overwrite it. If that is not desired, you can retrieve the gateway manually with [method get_gateway] and call [method add_port_mapping] on it, if any. Note that forwarding a well-known port (below 1024) with UPnP may fail depending on the device.
#desc Depending on the gateway device, if a mapping for that port already exists, it will either be updated or it will refuse this command due to that conflict, especially if the existing mapping for that port wasn't created via UPnP or points to a different network address (or device) than this one.
#desc If [code]internal_port[/code] is [code]0[/code] (the default), the same port number is used for both the external and the internal port (the [code]port[/code] value).
#desc The description ([code]desc[/code]) is shown in some routers management UIs and can be used to point out which application added the mapping.
#desc The mapping's lease [code]duration[/code] can be limited by specifying a duration in seconds. The default of [code]0[/code] means no duration, i.e. a permanent lease and notably some devices only support these permanent leases. Note that whether permanent or not, this is only a request and the gateway may still decide at any point to remove the mapping (which usually happens on a reboot of the gateway, when its external IP address changes, or on some models when it detects a port mapping has become inactive, i.e. had no traffic for multiple minutes). If not [code]0[/code] (permanent), the allowed range according to spec is between [code]120[/code] (2 minutes) and [code]86400[/code] seconds (24 hours).
#desc See [enum UPNPResult] for possible return values.
func add_port_mapping(port: int, port_internal: int = 0, desc: String = "", proto: String = "UDP", duration: int = 0) -> int:
	pass;

#desc Clears the list of discovered devices.
func clear_devices() -> void:
	pass;

#desc Deletes the port mapping for the given port and protocol combination on the default gateway (see [method get_gateway]) if one exists. [code]port[/code] must be a valid port between 1 and 65535, [code]proto[/code] can be either [code]"TCP"[/code] or [code]"UDP"[/code]. May be refused for mappings pointing to addresses other than this one, for well-known ports (below 1024), or for mappings not added via UPnP. See [enum UPNPResult] for possible return values.
func delete_port_mapping(port: int, proto: String = "UDP") -> int:
	pass;

#desc Discovers local [UPNPDevice]s. Clears the list of previously discovered devices.
#desc Filters for IGD (InternetGatewayDevice) type devices by default, as those manage port forwarding. [code]timeout[/code] is the time to wait for responses in milliseconds. [code]ttl[/code] is the time-to-live; only touch this if you know what you're doing.
#desc See [enum UPNPResult] for possible return values.
func discover(timeout: int = 2000, ttl: int = 2, device_filter: String = "InternetGatewayDevice") -> int:
	pass;

#desc Returns the [UPNPDevice] at the given [code]index[/code].
func get_device(index: int) -> UPNPDevice:
	pass;

#desc Returns the number of discovered [UPNPDevice]s.
func get_device_count() -> int:
	pass;

#desc Returns the default gateway. That is the first discovered [UPNPDevice] that is also a valid IGD (InternetGatewayDevice).
func get_gateway() -> UPNPDevice:
	pass;

#desc Returns the external [IP] address of the default gateway (see [method get_gateway]) as string. Returns an empty string on error.
func query_external_address() -> String:
	pass;

#desc Removes the device at [code]index[/code] from the list of discovered devices.
func remove_device(index: int) -> void:
	pass;

#desc Sets the device at [code]index[/code] from the list of discovered devices to [code]device[/code].
func set_device(index: int, device: UPNPDevice) -> void:
	pass;


func is_discover_ipv6() -> bool:
	return discover_ipv6

func set_discover_ipv6(value: bool) -> void:
	discover_ipv6 = value

func get_discover_local_port() -> int:
	return discover_local_port

func set_discover_local_port(value: int) -> void:
	discover_local_port = value

func get_discover_multicast_if() -> String:
	return discover_multicast_if

func set_discover_multicast_if(value: String) -> void:
	discover_multicast_if = value


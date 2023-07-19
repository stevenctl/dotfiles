extends Object
#brief Internet protocol (IP) support functions such as DNS resolution.
#desc IP contains support functions for the Internet Protocol (IP). TCP/IP support is in different classes (see [StreamPeerTCP] and [TCPServer]). IP provides DNS hostname resolution support, both blocking and threaded.
class_name IP

#desc DNS hostname resolver status: No status.
#desc DNS hostname resolver status: Waiting.
#desc DNS hostname resolver status: Done.
#desc DNS hostname resolver status: Error.
#desc Maximum number of concurrent DNS resolver queries allowed, [constant RESOLVER_INVALID_ID] is returned if exceeded.
const RESOLVER_MAX_QUERIES = 256;

#desc Invalid ID constant. Returned if [constant RESOLVER_MAX_QUERIES] is exceeded.
const RESOLVER_INVALID_ID = -1;

#desc Address type: None.
#desc Address type: Internet protocol version 4 (IPv4).
#desc Address type: Internet protocol version 6 (IPv6).
#desc Address type: Any.

#enum ResolverStatus
enum {
    RESOLVER_STATUS_NONE = 0,
    RESOLVER_STATUS_WAITING = 1,
    RESOLVER_STATUS_DONE = 2,
    RESOLVER_STATUS_ERROR = 3,
}
#enum Type
enum {
    TYPE_NONE = 0,
    TYPE_IPV4 = 1,
    TYPE_IPV6 = 2,
    TYPE_ANY = 3,
}


#desc Removes all of a [param hostname]'s cached references. If no [param hostname] is given, all cached IP addresses are removed.
func clear_cache(hostname: String = "") -> void:
	pass;

#desc Removes a given item [param id] from the queue. This should be used to free a queue after it has completed to enable more queries to happen.
func erase_resolve_item(id: int) -> void:
	pass;

#desc Returns all the user's current IPv4 and IPv6 addresses as an array.
func get_local_addresses() -> PackedStringArray:
	pass;

#desc Returns all network adapters as an array.
#desc Each adapter is a dictionary of the form:
#desc [codeblock]
#desc {
#desc "index": "1", # Interface index.
#desc "name": "eth0", # Interface name.
#desc "friendly": "Ethernet One", # A friendly name (might be empty).
#desc "addresses": ["192.168.1.101"], # An array of IP addresses associated to this interface.
#desc }
#desc [/codeblock]
func get_local_interfaces() -> Array[Dictionary]:
	pass;

#desc Returns a queued hostname's IP address, given its queue [param id]. Returns an empty string on error or if resolution hasn't happened yet (see [method get_resolve_item_status]).
func get_resolve_item_address(id: int) -> String:
	pass;

#desc Returns resolved addresses, or an empty array if an error happened or resolution didn't happen yet (see [method get_resolve_item_status]).
func get_resolve_item_addresses(id: int) -> Array:
	pass;

#desc Returns a queued hostname's status as a [enum ResolverStatus] constant, given its queue [param id].
func get_resolve_item_status(id: int) -> int:
	pass;

#desc Returns a given hostname's IPv4 or IPv6 address when resolved (blocking-type method). The address type returned depends on the [enum Type] constant given as [param ip_type].
func resolve_hostname(host: String, ip_type: int = 3) -> String:
	pass;

#desc Resolves a given hostname in a blocking way. Addresses are returned as an [Array] of IPv4 or IPv6 addresses depending on [param ip_type].
func resolve_hostname_addresses(host: String, ip_type: int = 3) -> PackedStringArray:
	pass;

#desc Creates a queue item to resolve a hostname to an IPv4 or IPv6 address depending on the [enum Type] constant given as [param ip_type]. Returns the queue ID if successful, or [constant RESOLVER_INVALID_ID] on error.
func resolve_hostname_queue_item(host: String, ip_type: int = 3) -> int:
	pass;



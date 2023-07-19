extends RefCounted
#brief TLS configuration for clients and servers.
#desc TLSOptions abstracts the configuration options for the [StreamPeerTLS] and [PacketPeerDTLS] classes.
#desc Objects of this class cannot be instantiated directly, and one of the static methods [method client], [method client_unsafe], or [method server] should be used instead.
#desc [codeblocks]
#desc [gdscript]
#desc # Create a TLS client configuration which uses our custom trusted CA chain.
#desc var client_trusted_cas = load("res://my_trusted_cas.crt")
#desc var client_tls_options = TLSOptions.client(client_trusted_cas)
#desc 
#desc # Create a TLS server configuration.
#desc var server_certs = load("res://my_server_cas.crt")
#desc var server_key = load("res://my_server_key.key")
#desc var server_tls_options = TLSOptions.server(server_certs, server_key)
#desc [/gdscript]
#desc [/codeblocks]
class_name TLSOptions




#desc Creates a TLS client configuration which validates certificates and their common names (fully qualified domain names).
#desc You can specify a custom [param trusted_chain] of certification authorities (the default CA list will be used if [code]null[/code]), and optionally provide a [param common_name_override] if you expect the certificate to have a common name other then the server FQDN.
#desc Note: On the Web plafrom, TLS verification is always enforced against the CA list of the web browser. This is considered a security feature.
static func client(trusted_chain: X509Certificate = null, common_name_override: String = "") -> TLSOptions:
	pass;

#desc Creates an [b]unsafe[/b] TLS client configuration where certificate validation is optional. You can optionally provide a valid [param trusted_chain], but the common name of the certififcates will never be checked. Using this configuration for purposes other than testing [b]is not recommended[/b].
#desc Note: On the Web plafrom, TLS verification is always enforced against the CA list of the web browser. This is considered a security feature.
static func client_unsafe(trusted_chain: X509Certificate = null) -> TLSOptions:
	pass;

#desc Creates a TLS server configuration using the provided [param key] and [param certificate].
#desc Note: The [param certificate] should include the full certificate chain up to the signing CA (certificates file can be concatenated using a general purpose text editor).
static func server(key: CryptoKey, certificate: X509Certificate) -> TLSOptions:
	pass;



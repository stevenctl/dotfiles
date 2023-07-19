extends MultiplayerPeer
#brief A [MultiplayerPeer] which is always connected and acts as a server.
#desc This is the default [member MultiplayerAPI.multiplayer_peer] for the [member Node.multiplayer]. It mimics the behavior of a server with no peers connected.
#desc This means that the [SceneTree] will act as the multiplayer authority by default. Calls to [method MultiplayerAPI.is_server] will return [code]true[/code], and calls to [method MultiplayerAPI.get_unique_id] will return [constant MultiplayerPeer.TARGET_PEER_SERVER].
class_name OfflineMultiplayerPeer






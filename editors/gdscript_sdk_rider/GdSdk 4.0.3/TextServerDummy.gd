extends TextServerExtension
#brief A dummy text server that can't render text or manage fonts.
#desc A dummy [TextServer] interface that doesn't do anything. Useful for freeing up memory when rendering text is not needed, as text servers are resource-intensive. It can also be used for performance comparisons in complex GUIs to check the impact of text rendering.
#desc A dummy text server is always available at the start of a project. Here's how to access it:
#desc [codeblock]
#desc var dummy_text_server = TextServerManager.find_interface("Dummy")
#desc if dummy_text_server != null:
#desc TextServerManager.set_primary_interface(dummy_text_server)
#desc # If the other text servers are unneeded, they can be removed:
#desc for i in TextServerManager.get_interface_count():
#desc var text_server = TextServerManager.get_interface(i)
#desc if text_server != dummy_text_server:
#desc TextServerManager.remove_interface(text_server)
#desc [/codeblock]
#desc The command line argument [code]--text-driver Dummy[/code] (case-sensitive) can be used to force the "Dummy" [TextServer] on any project.
class_name TextServerDummy






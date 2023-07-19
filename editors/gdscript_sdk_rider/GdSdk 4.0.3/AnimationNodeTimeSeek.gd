extends AnimationNode
#brief A time-seeking animation node to be used with [AnimationTree].
#desc This node can be used to cause a seek command to happen to any sub-children of the animation graph. Use this node type to play an [Animation] from the start or a certain playback position inside the [AnimationNodeBlendTree].
#desc After setting the time and changing the animation playback, the time seek node automatically goes into sleep mode on the next process frame by setting its [code]seek_request[/code] value to [code]-1.0[/code].
#desc [codeblocks]
#desc [gdscript]
#desc # Play child animation from the start.
#desc animation_tree.set("parameters/TimeSeek/seek_request", 0.0)
#desc # Alternative syntax (same result as above).
#desc animation_tree["parameters/TimeSeek/seek_request"] = 0.0
#desc 
#desc # Play child animation from 12 second timestamp.
#desc animation_tree.set("parameters/TimeSeek/seek_request", 12.0)
#desc # Alternative syntax (same result as above).
#desc animation_tree["parameters/TimeSeek/seek_request"] = 12.0
#desc [/gdscript]
#desc [csharp]
#desc // Play child animation from the start.
#desc animationTree.Set("parameters/TimeSeek/seek_request", 0.0);
#desc 
#desc // Play child animation from 12 second timestamp.
#desc animationTree.Set("parameters/TimeSeek/seek_request", 12.0);
#desc [/csharp]
#desc [/codeblocks]
#tutorial [AnimationTree] https://docs.godotengine.org/en/stable/tutorials/animation/animation_tree.html
class_name AnimationNodeTimeSeek






extends RefCounted
#brief One-shot timer.
#desc A one-shot timer managed by the scene tree, which emits [signal timeout] on completion. See also [method SceneTree.create_timer].
#desc As opposed to [Timer], it does not require the instantiation of a node. Commonly used to create a one-shot delay timer as in the following example:
#desc [codeblocks]
#desc [gdscript]
#desc func some_function():
#desc print("Timer started.")
#desc await get_tree().create_timer(1.0).timeout
#desc print("Timer ended.")
#desc [/gdscript]
#desc [csharp]
#desc public async Task SomeFunction()
#desc {
#desc GD.Print("Timer started.");
#desc await ToSignal(GetTree().CreateTimer(1.0f), SceneTreeTimer.SignalName.Timeout);
#desc GD.Print("Timer ended.");
#desc }
#desc [/csharp]
#desc [/codeblocks]
#desc The timer will be dereferenced after its time elapses. To preserve the timer, you can keep a reference to it. See [RefCounted].
class_name SceneTreeTimer

#desc Emitted when the timer reaches 0.
signal timeout

#desc The time remaining (in seconds).
var time_left: float:
	get = get_time_left, set = set_time_left




func get_time_left() -> float:
	return time_left

func set_time_left(value: float) -> void:
	time_left = value


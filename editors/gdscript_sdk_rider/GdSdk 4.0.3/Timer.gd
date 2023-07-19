extends Node
#brief A countdown timer.
#desc Counts down a specified interval and emits a signal on reaching 0. Can be set to repeat or "one-shot" mode.
#desc [b]Note:[/b] Timers are affected by [member Engine.time_scale], a higher scale means quicker timeouts, and vice versa.
#desc [b]Note:[/b] To create a one-shot timer without instantiating a node, use [method SceneTree.create_timer].
#tutorial [2D Dodge The Creeps Demo] https://godotengine.org/asset-library/asset/515
class_name Timer

#desc Emitted when the timer reaches 0.
signal timeout
#desc Update the timer during the physics step at each frame (fixed framerate processing).
#desc Update the timer during the idle time at each frame.

#enum TimerProcessCallback
enum {
    TIMER_PROCESS_PHYSICS = 0,
    TIMER_PROCESS_IDLE = 1,
}
#desc If [code]true[/code], the timer will automatically start when entering the scene tree.
#desc [b]Note:[/b] This property is automatically set to [code]false[/code] after the timer enters the scene tree and starts.
var autostart: bool:
	get = has_autostart, set = set_autostart

#desc If [code]true[/code], the timer will stop when reaching 0. If [code]false[/code], it will restart.
var one_shot: bool:
	get = is_one_shot, set = set_one_shot

#desc If [code]true[/code], the timer is paused and will not process until it is unpaused again, even if [method start] is called.
var paused: bool:
	get = is_paused, set = set_paused

#desc Processing callback. See [enum TimerProcessCallback].
var process_callback: int:
	get = get_timer_process_callback, set = set_timer_process_callback

#desc The timer's remaining time in seconds. Returns 0 if the timer is inactive.
#desc [b]Note:[/b] This value is read-only and cannot be set. It is based on [member wait_time], which can be set using [method start].
var time_left: float:
	get = get_time_left

#desc The wait time in seconds.
#desc [b]Note:[/b] Timers can only emit once per rendered frame at most (or once per physics frame if [member process_callback] is [constant TIMER_PROCESS_PHYSICS]). This means very low wait times (lower than 0.05 seconds) will behave in significantly different ways depending on the rendered framerate. For very low wait times, it is recommended to use a process loop in a script instead of using a Timer node. Timers are affected by [member Engine.time_scale], a higher scale means quicker timeouts, and vice versa.
var wait_time: float:
	get = get_wait_time, set = set_wait_time



#desc Returns [code]true[/code] if the timer is stopped.
func is_stopped() -> bool:
	pass;

#desc Starts the timer. Sets [member wait_time] to [param time_sec] if [code]time_sec > 0[/code]. This also resets the remaining time to [member wait_time].
#desc [b]Note:[/b] This method will not resume a paused timer. See [member paused].
func start(time_sec: float = -1) -> void:
	pass;

#desc Stops the timer.
func stop() -> void:
	pass;


func has_autostart() -> bool:
	return autostart

func set_autostart(value: bool) -> void:
	autostart = value

func is_one_shot() -> bool:
	return one_shot

func set_one_shot(value: bool) -> void:
	one_shot = value

func is_paused() -> bool:
	return paused

func set_paused(value: bool) -> void:
	paused = value

func get_timer_process_callback() -> int:
	return process_callback

func set_timer_process_callback(value: int) -> void:
	process_callback = value

func get_time_left() -> float:
	return time_left

func get_wait_time() -> float:
	return wait_time

func set_wait_time(value: float) -> void:
	wait_time = value


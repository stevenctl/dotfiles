extends RefCounted
#brief A unit of execution in a process.
#desc A unit of execution in a process. Can run methods on [Object]s simultaneously. The use of synchronization via [Mutex] or [Semaphore] is advised if working with shared objects.
#desc [b]Note:[/b] Breakpoints won't break on code if it's running in a thread. This is a current limitation of the GDScript debugger.
#tutorial [Using multiple threads] https://docs.godotengine.org/en/stable/tutorials/performance/using_multiple_threads.html
#tutorial [Thread-safe APIs] https://docs.godotengine.org/en/stable/tutorials/performance/thread_safe_apis.html
#tutorial [3D Voxel Demo] https://godotengine.org/asset-library/asset/676
class_name Thread

#desc A thread running with lower priority than normally.
#desc A thread with a standard priority.
#desc A thread running with higher priority than normally.

#enum Priority
enum {
    PRIORITY_LOW = 0,
    PRIORITY_NORMAL = 1,
    PRIORITY_HIGH = 2,
}


#desc Returns the current [Thread]'s ID, uniquely identifying it among all threads. If the [Thread] has not started running or if [method wait_to_finish] has been called, this returns an empty string.
func get_id() -> String:
	pass;

#desc Returns [code]true[/code] if this [Thread] is currently running the provided function. This is useful for determining if [method wait_to_finish] can be called without blocking the calling thread.
#desc To check if a [Thread] is joinable, use [method is_started].
func is_alive() -> bool:
	pass;

#desc Returns [code]true[/code] if this [Thread] has been started. Once started, this will return [code]true[/code] until it is joined using [method wait_to_finish]. For checking if a [Thread] is still executing its task, use [method is_alive].
func is_started() -> bool:
	pass;

#desc Starts a new [Thread] that calls [param callable].
#desc If the method takes some arguments, you can pass them using [method Callable.bind].
#desc The [param priority] of the [Thread] can be changed by passing a value from the [enum Priority] enum.
#desc Returns [constant OK] on success, or [constant ERR_CANT_CREATE] on failure.
func start(callable: Callable, priority: int = 1) -> int:
	pass;

#desc Joins the [Thread] and waits for it to finish. Returns the output of the [Callable] passed to [method start].
#desc Should either be used when you want to retrieve the value returned from the method called by the [Thread] or before freeing the instance that contains the [Thread].
#desc To determine if this can be called without blocking the calling thread, check if [method is_alive] is [code]false[/code].
#desc [b]Note:[/b] After the [Thread] finishes joining it will be disposed. If you want to use it again you will have to create a new instance of it.
func wait_to_finish() -> Variant:
	pass;



extends RefCounted
#brief A synchronization semaphore.
#desc A synchronization semaphore which can be used to synchronize multiple [Thread]s. Initialized to zero on creation. Be careful to avoid deadlocks. For a binary version, see [Mutex].
#tutorial [Using multiple threads] https://docs.godotengine.org/en/stable/tutorials/performance/using_multiple_threads.html
class_name Semaphore




#desc Lowers the [Semaphore], allowing one more thread in.
func post() -> void:
	pass;

#desc Like [method wait], but won't block, so if the value is zero, fails immediately and returns [code]false[/code]. If non-zero, it returns [code]true[/code] to report success.
func try_wait() -> bool:
	pass;

#desc Waits for the [Semaphore], if its value is zero, blocks until non-zero.
func wait() -> void:
	pass;



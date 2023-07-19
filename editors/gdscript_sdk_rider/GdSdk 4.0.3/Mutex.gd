extends RefCounted
#brief A synchronization mutex (mutual exclusion).
#desc A synchronization mutex (mutual exclusion). This is used to synchronize multiple [Thread]s, and is equivalent to a binary [Semaphore]. It guarantees that only one thread can ever acquire the lock at a time. A mutex can be used to protect a critical section; however, be careful to avoid deadlocks.
#tutorial [Using multiple threads] https://docs.godotengine.org/en/stable/tutorials/performance/using_multiple_threads.html
class_name Mutex




#desc Locks this [Mutex], blocks until it is unlocked by the current owner.
#desc [b]Note:[/b] This function returns without blocking if the thread already has ownership of the mutex.
func lock() -> void:
	pass;

#desc Tries locking this [Mutex], but does not block. Returns [code]true[/code] on success, [code]false[/code] otherwise.
#desc [b]Note:[/b] This function returns [constant OK] if the thread already has ownership of the mutex.
func try_lock() -> bool:
	pass;

#desc Unlocks this [Mutex], leaving it to other threads.
#desc [b]Note:[/b] If a thread called [method lock] or [method try_lock] multiple times while already having ownership of the mutex, it must also call [method unlock] the same number of times in order to unlock it correctly.
func unlock() -> void:
	pass;



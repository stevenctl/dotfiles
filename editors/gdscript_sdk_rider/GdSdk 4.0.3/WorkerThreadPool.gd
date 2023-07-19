extends Object
#brief A singleton that allocates some [Thread]s on startup, used to offload tasks to these threads.
#desc The [WorkerThreadPool] singleton allocates a set of [Thread]s (called worker threads) on project startup and provides methods for offloading tasks to them. This can be used for simple multithreading without having to create [Thread]s.
#desc Tasks hold the [Callable] to be run by the threads. [WorkerThreadPool] can be used to create regular tasks, which will be taken by one worker thread, or group tasks, which can be distributed between multiple worker threads. Group tasks execute the [Callable] multiple times, which makes them useful for iterating over a lot of elements, such as the enemies in an arena.
#desc Here's a sample on how to offload an expensive function to worker threads:
#desc [codeblocks]
#desc [gdscript]
#desc var enemies = [] # An array to be filled with enemies.
#desc 
#desc func process_enemy_ai(enemy_index):
#desc var processed_enemy = enemies[enemy_index]
#desc # Expensive logic...
#desc 
#desc func _process(delta):
#desc var task_id = WorkerThreadPool.add_group_task(process_enemy_ai, enemies.size())
#desc # Other code...
#desc WorkerThreadPool.wait_for_group_task_completion(task_id)
#desc # Other code that depends on the enemy AI already being processed.
#desc [/gdscript]
#desc [csharp]
#desc private List<Node> _enemies = new List<Node>(); // A list to be filled with enemies.
#desc 
#desc private void ProcessEnemyAI(int enemyIndex)
#desc {
#desc Node processedEnemy = _enemies[enemyIndex];
#desc // Expensive logic here.
#desc }
#desc 
#desc public override void _Process(double delta)
#desc {
#desc long taskId = WorkerThreadPool.AddGroupTask(Callable.From<int>(ProcessEnemyAI), _enemies.Count);
#desc // Other code...
#desc WorkerThreadPool.WaitForGroupTaskCompletion(taskId);
#desc // Other code that depends on the enemy AI already being processed.
#desc }
#desc [/csharp]
#desc [/codeblocks]
#desc The above code relies on the number of elements in the [code]enemies[/code] array remaining constant during the multithreaded part.
#desc [b]Note:[/b] Using this singleton could affect performance negatively if the task being distributed between threads is not computationally expensive.
#tutorial [Using multiple threads] https://docs.godotengine.org/en/stable/tutorials/performance/using_multiple_threads.html
#tutorial [Thread-safe APIs] https://docs.godotengine.org/en/stable/tutorials/performance/thread_safe_apis.html
class_name WorkerThreadPool




#desc Adds [param action] as a group task to be executed by the worker threads. The [Callable] will be called a number of times based on [param elements], with the first thread calling it with the value [code]0[/code] as a parameter, and each consecutive execution incrementing this value by 1 until it reaches [code]element - 1[/code].
#desc The number of threads the task is distributed to is defined by [param tasks_needed], where the default value [code]-1[/code] means it is distributed to all worker threads. [param high_priority] determines if the task has a high priority or a low priority (default). You can optionally provide a [param description] to help with debugging.
#desc Returns a group task ID that can be used by other methods.
func add_group_task(action: Callable, elements: int, tasks_needed: int = -1, high_priority: bool = false, description: String = "") -> int:
	pass;

#desc Adds [param action] as a task to be executed by a worker thread. [param high_priority] determines if the task has a high priority or a low priority (default). You can optionally provide a [param description] to help with debugging.
#desc Returns a task ID that can be used by other methods.
func add_task(action: Callable, high_priority: bool = false, description: String = "") -> int:
	pass;

#desc Returns how many times the [Callable] of the group task with the given ID has already been executed by the worker threads.
#desc [b]Note:[/b] If a thread has started executing the [Callable] but is yet to finish, it won't be counted.
func get_group_processed_element_count(group_id: int) -> int:
	pass;

#desc Returns [code]true[/code] if the group task with the given ID is completed.
func is_group_task_completed(group_id: int) -> bool:
	pass;

#desc Returns [code]true[/code] if the task with the given ID is completed.
func is_task_completed(task_id: int) -> bool:
	pass;

#desc Pauses the thread that calls this method until the group task with the given ID is completed.
func wait_for_group_task_completion(group_id: int) -> void:
	pass;

#desc Pauses the thread that calls this method until the task with the given ID is completed.
func wait_for_task_completion(task_id: int) -> void:
	pass;



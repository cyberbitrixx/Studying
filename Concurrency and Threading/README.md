# 🪢 Concurrency and Threading in iOS Apps
Concurrency is doing mulriple tasks at the same time, which we can do thanks to multi-core proccessors.
**The more cores proccessor has, the more tasks we can perform at the same time.**

## Threads
Threads are like tracks or lanes on a highway, through which app execution (so tasks execution) runs.
There are 2 types tasks queues that run on these threads:
- serial;
- concurrent.

**An App ALWAYS begins with 1 Serial Main queue, and 4 Concurrent Background queues**
  
## Serial Queue (Main Thread)
A serial thread is where a strict sequence of tasks execution followed.
Example: task 2 won't begin until taks 1 was completed.
* An app always begins with a serial thread that it will always have by default - Main thread.
* UI operations and handling always should run on the Main thread, because if we will wait for other tasks to complete before we can update UI, it might look like th app is frozen.
  
## Concurrent Queue (Background Threads)
Concurrent thread is a thread where different tasks can be performed or started at the same time.
**Example:** task 1 (download a heavy 3d object) will start executing first, but if it's a heavier task than task 3 (just fetch some String), it will most likely complete executing later, than task 3.
* concurrent tasks execution can be good for some background threads, where the sequence of tasks execution is not important;
* concurrent tasks execution is **faster** than serial;
* it has it's own disadvantages if you have code dependant on some of the tasks that are being performed concurrently.

## Serial vs Concurrent Queues: Pros & Cons
### Serial 

| Pros | Cons |
|-|-|
| Predictable Execution Order | Slower |
| Prevents Race Conditions |  |




### Concurrent
| Pros | Cons |
|-|-|
| faster than Serial | Execution Order is Unpredictable, leading to Race Conditions (task 4 can complete earlier than task 1, and can cause problems if we have code that relies on task 1 being executed and finished first)


## Switching between the Queues
**Example (moving to the Main queue):** we were fetching and decoding some JSON data and populating a table view with it. Such tasks happen on the background thread, so after it we need to switch to the main thread to refresh the table view (since it's UI) and show the data.
*A very common piece of code:
```swift
DispatchQueue.main.async {
  self.tableView.reloadData()
}
```

**Example (moving to the background queue manually):**
```swift
DispatchQueue.global(qos: .background).async {
  // Code to run on background queue
}
```

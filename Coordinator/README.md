# 🪢 Coordinator

## What is Coordinator?
**<ins>Coordinator</ins>** is a design pattern in iOS apps, that **manages navigation flow** of the app.

## Why should I use Coordinator?
Because with raw SwiftUI navigation tools, View Controllers (further VC's) have too much responsibility. That creates unclean cluttered code, loads View Controllers with unnecessary work and can even slow down the app or create barriers for smooth app navigation and user experience.
 <br><br>
### Here's an example 👇🏻

#### View Controllers without Coordinator:
- manage the view lifecycle (viewDidLoad, viewWillAppear etc.)
- handle UI elements and layout
- know about existence of other VC's
- have to process and respond to user's interactions AND make a decision on what to do next
- initialize other VC's (and manage navigation to other screens)
- passing data between screens
- have a lot of unneeded (there) business logic

### View Controllers with Coordinator:
- manage the view lifecycle
- handle it's own UI elements setup and layout
- after handling user's interaction/response passing information about event to Coordinator, so Coordinator hadnles everything further and makes all the necessary decisions

### By separating the navigation flow logic like this, it's easier to:
- maintain
- control
- test
- resuse the code
- scale (you can create subcoordinators that will create whole hierarchies withing the navigation flow, organizing it into the tree structure, that simplifies scaling)
- promotes modularity

## Summary
Coordinator solves the issues that Navigation Stacks in SwiftUI cause, specifically:
- hard to manage deep navigation paths
- difficult to programmatically pop to specific screens
- complex to handle navigation state across multiple screens.
  
Coordinator pattern provides us with a powerful tool for managing navigation flow, which means full control over the navigation flow through the app.

# Implementation

## Components:
* CoordinatorFinishDelegate Protocol (defininf a functionality for a child coordinator to communicate to parent coordinator once it's work is done and it can be deleted from parent's coordinator list)
* Coordinator Protocol (conforms to CoordinatorFinishDelegate and defines start() and finish() methods)
* Parent Coordinator (conforms to coordinator protocol --> as a result to CoordinatorFinishDelegate as well, has an array of child coordinators, initializes a new child coordinator through start() method, keeps track of the new child coordinator by adding it to array of coordinators, defines childCoordinator as finishDelegate, calls the start() method on it inside it's own start() method, when all the previous setup is finished and the new navigation flow is ready to be started)
* Child coordinator (conforms to coordinator protocol --> as a result to CoordinatorFinishDelegate as well, has the finish() method in it, which uses CoordinatorFinishDelegate to communicate to the parent coordinator once it's finished it's work and ready to be wrapped up)

### 1. Defining the CoordinatorFinishDelegate protocol
A piece of functionality to conform our Coordinator to further, to allow the Child Coordinator to communicate to it's Parent Coordinator once it's finished it's work and navigation flow, so that Parent Coordinator can remove the Child Coordinator from it's list (array of child coordinators instances). No any additional knowledge about the Parent Coordinator is required.
```swift
protocol CoordinatorFinishDelegate: AnyObject {
func coordintorDidFinish(_ coordinator: Coordinator)
}
```
The AnyObject type alias allows any type to conform to this protocol.
 <br><br>

### 2. Defining the Coordinator protocol
Coordinator protocol conforms to the CoordinatorFinishDelegate protocol and inherits it's functionality constructor.
It also implements 2 crucial methods:

 ``` swift
protocol Coordinator: CoordinatorFinishDelegate {
func start()
func finish()

var finishDelegate: CoordinatorFinishDelegate? { get set }
}
 ```

### ```func start()```
method starts the Coordinator flow. Provides flexibility to create Coordinator, but to start the flow only once we're ready and only if we need it. By implementing that method we separate Coordinator initialization from it's activation.
Here's why:
- **separation of concerns** - object initialization  and execution are sonceptually diferent (initialization creates the object, while start triggers the flow) --> separation makes code easier to understand and maintain
-  **deffered execution** - allows  deffered execution of the navigation flow when it's not desired immediately
-  **dependency injection** - Coordinator might require additional dependencies (services, data or other Coordinator) before starting it's flow. ```start()``` method provides flexibility to inject these dependencies before navigation begins
-  **multiple entry points** - coordinatoors might have multiple entry points in somce scenarios. Using this method we don't overcomplicate initialization and provide more clean and straightforward hadnling of different use cases.

### ``` func finish()```
is being implemented within the Child Coordinator to do any neccessary cleanup after it's done with it's navigation flow, and to communicate to it's Parent Coordinator that it can be now removed from Parent's child coordinators list (array) by utilising the finishDelegate stored property.

### ``` var finishDelegate: CoordinatorFinishDelegate? { get set }```
specifically notifies the Parent Coordinator (within the Child Coordinator finish() method) that it now can be removed from it's list.

### Here's what it looks like in a real implementation:
```swift
protocol CoordinatorFinishDelegate: AnyObject {
 func coordinatorDidFinish(_ coordinator: Coordinator)
}

protocol Coordinator: CoordinatorFinishDelegate {
 func start()
 func finish()

 var finishDelegate: CoordinatorFinishDelegate? { get set }
}

class AppCoordinator: Coordinator {
 // List of child coordinators instances
 var childCoordinators: [Coordinator] = []

 func start() {
  // Create a Child Coordinator instance
  let authCoordinator = AuthCoordinator()
  // Sets up the cummunication channel between parent and child (like a parent saying "I (AppCoordinator), want to know when you (AuthCoordinator) finish your work"). Specifically, it's assigning the current instance of AppCoordinator (self) to be the finishDelegate of the authCoordinator. Since AppCoordinator conforms to CoordinatorFinishDelegate (via the Coordinator protocol), it can receive these notifications.
  authCoordinator.finishDelegate = self
  // Add the Child Coordinator to the list
  childCoordinators.append(authCoordinator)
  // Start the Child Coordinator navigation flow
  authCoordinator.start()
 }
}

class AuthCoordinator: Coordinator {
 var finishDelegate: CoordinatorFinishDelegate?

 func finish() {
  // Tell the parent (AppCoordinator) that auth is done 
  finishDelegate?.coordinatorDidFinish(self)
 }
}
```

### Confusing (for me) moments:
```swift
// In the start() method of AppCoordinator
authCoordinator.finishDelegate = self
```
Setting up the communication channel between parent and child, like the parent saying "I (AppCoordinator) want to know when you (AuthCoordinator) is done with your work".
Specifically, it's assigning the current instance of AppCoordinator (self) to be the finishDelegate of the authCoordinator. Since AppCoordinator conforms to CoordinatorFinishDelegate (via the Coordinator protocol), it can receive these notifications.
 <br><br>

```swift
// In the AuthCoordinator class
var finishDelegate: CoordinatorFinishDelegate?
```
This is a stored property in the AuthCoordinator that holds a reference to whoever wants to be notified when this coordinator completes its work (in this case, the AppCoordinator). It's optional because when the AuthCoordinator is first created, it doesn't yet know who its parent is.
 <br><br>

```swift
// In the finish() method of AuthCoordinator
finishDelegate?.coordinatorDidFinish(self)
```
This line is the actual notification being sent back to the parent. It's calling the coordinatorDidFinish method on the finishDelegate (which is the AppCoordinator) and passing itself (self) as the argument. This tells the parent "Hey, I'm done with my work."

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
### 1. Defining the Coordinator type. Protocol:
 ``` swift
protocol Coordinator: CoordinatorFinishDelegate {
func start()
func finish()
}
 ```
### ```func start()```
method starts the Coordinator flow. Provides flexibility to create Coordinator, but to start the flow only once we're ready and only if we need it. By implementin gthat method we separate Coordinator initialization from it's activation.
Here's why:
- **separation of concerns** - object initialization  and execution are sonceptually diferent (initialization creates the object, while start triggers the flow) --> separation makes code easier to understand and maintain
-  **deffered execution** - allows  deffered execution of the navigation flow when it's not desired immediately
-  **dependency injection** - Coordinator might require additional dependencies (services, data or other Coordinator) before starting it's flow. ```start()``` method provides flexibility to inject these dependencies before navigation begins
-  **multiple entry points** - coordinatoors might have multiple entry points in somce scenarios. Using this method we don't overcomplicate initialization and provide more clean and straightforward hadnling of different use cases

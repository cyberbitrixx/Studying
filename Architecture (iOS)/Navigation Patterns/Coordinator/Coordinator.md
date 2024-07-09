# Coordinator

Coordinator is a design pattern in iOS apps development that solves the problem of navigation between different views (screens) and manages navigation flow and dependencies between View Controllers to not cluster each View Controller with deeper logic about the view it's transitioning to that it doesn't need.
<br><br>

I used Coordinator pattern in Dictionary app I developed and here's the [tutorial](https://www.youtube.com/watch?v=B0EfQhYKEz4) that helped me with understanding and implementing that concept within my app.

## What is Coordinator and how it's used?
Coordinator is technically an object that is only responsible for handling navigation.

**Note:** Sometimes people also include in Coordinator logic that is needed before the View Controller we're transitioning to launches, such as instantiating a ViewModel for particular ViewController, but Idk how I feel about it.
<br><br>

## Coordinator hierarchy

### Main Coordinator
An object that represent main flow of the app and is a root Coordinator. All the further navigation will be delegated by this root Coordinator.
When app is being launched, root Coordinator runs a method, that evaluates if user is logged in (or any other crucial variables before launching the app and deciding which flow to show to the user).
From there main Coordinator navigates to other sub Coordinators such as Auth Flow, Dashboard Flow etc.

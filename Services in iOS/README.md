# Services in iOS
A few notes I learned about implementing services in iOS apps, their purpose and strong sides.

### What are services?
In iOS apps services are whole separate components that encapsulate specific business logic or functionality (conforms to OOP). You can think of services just as of Coordinators, Data Models, or even Structures and Classes - independent functionality components, main purpose of which is **separation of concerns**.
It also makes it conform to SOLID code principle, making the services code "Open for extension and closed to modification", since it's protocol-based approach. 

### Why services are commonly used in iOS?
* **Separation of concerns**: each service is responsible for a specific domain or functionality
* **Testability**: easy to mock services for **unit testing**
* **Scalability**: new team members canwork on isolated services, changes to a implementation don't affect consumers
* **Reusability**: can be used across different parts of the app

### Common use cases for services
* **NetworkService** - handle API calls and responses
* **AuthService** - handle user authentication
* **NotificationsService** - implement and manage push-notifications
* **DataPersistenceService** - handle data persistence and fetching (CoreData, UserDefaults)
* **PurchaseService** - handle in-app purchases and etc.

## Common Service Structure
1. **Protocol-Based Interface**: Define what the service does through protocol
2. **Implementation Class**: Concrete implementation conforming to the protocol
3. **Single Responsibility**: Each service handles one area of functionality
4. **Dependency Injection**: Services are passed to components that need them

### Example
``` swift
protocol UserServiceProtocol {
  func fetchUser(id: String) -> User?
  func saveUser(_ user: User?)
}

class UserService: UserServiceProtocol {
  // Service implementation
}
 ```

## When it is a sign to create a new service?
1. The functionality is needed in multiple places of the app
2. The implementation can change in the future (API service, authentication provide)
3. The functionality is complex enough to warrant isolation
4. You want to abstract platform-specific implementations
5. The functionality requires special permissions or system resources

When you're designing your app and come across functionality that doesn't clearly fit into the other components, that's often a sign you need a service.

### How Services Fit with MVVM-C
In MVVM-C, services typically:

- Are injected into ViewModels or Coordinators
- Allow ViewModels to focus on presentation logic
- Help Coordinators make navigation decisions
- Keep Models clean of implementation details


<br></br>
Created by Sophie Shchukina, April 2025.

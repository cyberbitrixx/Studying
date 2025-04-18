# Objective-C Fundamentals
* is OOP - conforms to all 4 OOP principles
* Inheritant from C language and uses same data types

## Methods
### Declaration
```objc
		-(void)doSomethingWithName:(NSString *)name age:(NSInteger)age;
```

### Usage/Calling
```objc
		[object doSomethingWithName]
```

| Objective-C Syntax | Meaning / Use | 	Swift Equivalent / Analogy |
|-|-|-|
| @interface | Class declaration (like a blueprint) | class or struct declaration |
| @implementation | Actual class implementation | The class body { ... } after the declaration |
| @end | Closes an @interface or @implementation block | Implicit in Swift – no @end needed |
| @property | Declares a property with getter/setter | var or let (with/without private(set)) |
| @synthesize | Generates getter/setter (usually auto in modern Obj-C) | Automatically done by Swift's var/let |
| @protocol | Declares a protocol |  protocol |
| @class | Forward declare another class to avoid circular imports	No direct equivalent – |  Swift handles this automatically |
| @selector(...) | Refers to a method by name |  #selector(methodName) |
| @required / @optional | Used in protocols to declare method requirements |  Swift protocols are required by default; no @optional unless using @objc |
| @try, @catch, @finally | Exception handling | blocks	do, catch, try |
| @throw | Throws an exception | throw |
| @autoreleasepool | Memory management block) | 	Swift uses ARC automatically – no need |
| @available(...) | Availability check | 		@available(...) – same in Swift |
| @synchronized(...) | Thread-safety (mutex-style) | No direct equivalent – use GCD/locks |

	 
		
		
		
		

	
		
		
		
	 
	
	
		

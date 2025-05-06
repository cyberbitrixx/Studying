# Objective-C Fundamentals
* is OOP - conforms to all 4 OOP principles
* Inheritant from C language and uses same data types

## XCode Files with Objective-C explained
Any Class file in Objective-C project will have two file types with two different extensions:
* AppDelegate.h (Header file)
* AppDelegate.m (iMplementations file)

With View files, a .xib extension is usually used:
* ViewController.xib

![](https://github.com/cyberbitrixx/Studying/blob/d50cc6c96570d40ad74c3423586b1115a852cf6b/Objective-C/image.png)
<br></br>

| Swift | Objective-C |
|-|-|
| Class declaration | .h file |
| Class implementation | .m file |
| Access control (public) | Included in .h file |
| Private/internal stuff | Only in .m file |

## Data types
### BOOL vs bool

### short Data Type
For smaller integer values "short" data type can be used instead. It has a limit of 16 bits size (in bits), and value size limits are -32,768 to 32767.
**If value size exceeds the limits:**
1) value is being transformed into binary format;
2) truncated to 16 bits and interpreted as a signed short.

**For example:**
```objc
short shortValue = 6000;
```
This value when truncated to 16 bits and interpreted as a signed short wraps around and becomes -5536.

**Note:** there are specifics to formats when trying to print out a value using NSLog, and if used incorrect format (like %d) to print out this value, it will actually have a different, much larger number. That's because depending on what format specifier we use in NSLog statement, compiler will decide how to treat the value data format. There are different format specifiers and they will make the compiler treat different data types differently, but it's a topic I'm not covering in depth this time.


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

	 
		
		
		
		

	
		
		
		
	 
	
	
		

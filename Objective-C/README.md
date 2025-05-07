# Objective-C Fundamentals
* is OOP - conforms to all 4 OOP principles
* Inheritant from C language and uses same data types
<br></br>

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

<br></br>

# Data types
## BOOL vs bool
*will add notes later*

## short Data Type
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

### Format Specifier Cheat Sheet (Objective-C / C):

| Type                | Format | Notes                       |
| ------------------- | ------ | --------------------------- |
| `int`               | `%d`   | Signed int                  |
| `unsigned int`      | `%u`   | Unsigned int                |
| `short`             | `%hd`  | Signed short                |
| `unsigned short`    | `%hu`  | Unsigned short              |
| `long`              | `%ld`  | Signed long                 |
| `unsigned long`     | `%lu`  | Unsigned long               |
| `long long`         | `%lld` | Signed long long            |
| `BOOL`              | `%d`   | Treated as int (0 or 1)     |
| `char *` (C-String) | `%s`   | Use for C strings           |
| `NSString *`        | `%@`   | Use for Objective-C strings |
| `float, double, CGFloat`        | `%f`   | Use for any decimal numbers data types |
| `float, double, CGFloat`        | `%.2f`, `%.10f`, etc.   | Use for a specified amount of digits displayed in a decimal number |

<br></br>

### Decimal types cheat sheet
**1.✔️ Precision depends on the data type's limits**
* float, double, and CGFloat all store decimal values, and they differ mainly in how many digits of precision they 	can handle and how much memory they use. This affects calculations and rounding.

2.✔️ Float < Double, CGFloat = platform alias
Perfect understanding. CGFloat is not a new type — it’s a type alias:

* On 32-bit systems, it's a float.

* On 64-bit systems (like iPhones today), it’s a double.
So on modern iOS development, you can usually treat CGFloat like double, especially when working with UI/layout (CoreGraphics, UIKit, etc.).

3.✔️ Displayed precision depends on NSLog formatting too
* Yes. %f is always for decimal values (float, double, or CGFloat). You can control how many digits to show with %.2f, %.10f, etc. The data stored and the data displayed aren’t always the same!

4.✔️ Use double unless otherwise needed
This is a great rule of thumb. Use double when:

* You want higher precision

* You’re doing calculations (esp. chained or scientific)

* You don’t specifically need to save memory

* Use CGFloat in iOS whenever an API or layout method expects it — it’s the standard for most UI geometry.

5.✔️ Manual casting is fine, deep internals can wait
* Yes! Manual casting like (CGFloat)myDouble is absolutely fine for now.
Understanding how bits are stored or how floating-point math works behind the scenes is useful later, but not essential right now. You’re making a good judgment: prioritize readability, fluency, and building things. The deep internals can come gradually.
<br></br>




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

	 
		
		
		
		

	
		
		
		
	 
	
	
		

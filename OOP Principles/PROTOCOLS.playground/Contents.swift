import UIKit

// PROTOCOLS
// Protocol - is a disription of the way some type (class, struct, enum) should be implemented.

// CAN REQIRE:
// - instance properties / type properties (are being defined as var only);
// - instance methods / type methods;
// - mutating methods (for struct and enum):
// - initializers
// to be implemented inside the type.

// SYNTAX:
protocol SomeProtocol {
//    here goes the protocol code...
}

// to define that a type should be corresponding to specific protocol:
class SomeClass: SomeProtocol {
//    class body...
}

// if the type, which should be corresponding to some protocol, is a subClass - separate the superClass name and protocols names with ",":
class superClass {
//    superClass body...
}

class subClass: superClass, SomeProtocol {
//    subClass body...
}


// REQUIRED PROPERTIES
// - protocol defines, of what name and type the property should be;
// - defines if the property should be GET-ONLY or GET+SET.

// MARK: it DOES NOT define how the property should be implemented and if it's STORED or COMPUTED property.

protocol someProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

// example:
protocol FullyNamed {
    var FullName: String { get }
}

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var FullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var rk6333 = Starship(name: "AI", prefix: "542")
print(rk6333.FullName)

// REQUIRED TYPE PROPERTIES
protocol TypePropertyProtocol {
//    static do indicate the type property (even with "class" in classes)
    static var typeProperty: String { get }
}


// REQUIRED METHODS
// - protocol can require to implement instance method or type method;
// - implemented as any usual method inside the type BUT CAN NOT have curly brackets or METHOD BODY itself;

// TYPE METHODS
protocol methodProtocol {
//    same thing with static and class
    static func someTypeMethod()
}

// example:

// this protocol requires every corresponding to it type implement a "random()" method which will return Double
// it doesn't point how exactly random number should be found, it only requires the type to implement the method
protocol RandomNumberGenerator {
    func random() -> Double
}

// this class corresponds the protocols requirements
// the random number here is being found using LINEAR CONGRUENTIAL GENERATOR ALGORYTHM (алгоритм линейного конгруэнтного генератора)
class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
print("Random number: \(generator.random())")
print("Random number: \(generator.random())")


// REQUIRED MUTATAING METHODS
// - is being implemented by writing "mutating" keyword before "func" in case the method SHOULD MODIFY TYPE OR INSTANCE/PROPERTY;
// - if we want the protocol to be posiible being implemented by any type, we write "mutating" because struct and enum won't be able to modify it if we won't (OOP LESSONS).

// MARK: if you wrote "mutsting" prefix for the method inside the protocol for required method, there's no need to write "mutating" while implementing the method inside the class since only enums and structures need it.
// this method switche or inverts a state of any type:
protocol Togglable {
    mutating func toggle()
}

// if we implement this protocol method inside the enum or struct, "mutating" prefix should be written again
enum OnOffSwitch {
    case on, off
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}

var lightSwitch = OnOffSwitch.on
lightSwitch.toggle()
lightSwitch.toggle()
lightSwitch.toggle()


// REQUIRED INITIALIZERS
// syntax:
protocol InitProtocol {
//    is written withour curly brackets and initializer body
    init(someParameter: Int)
}

// MARK: it's possible to implement the required initializer as DESIGNATED or CONVENIENCE inside the class corresponding to the protocol, which requires the initializer. Anyways, the REQUIRED INITIALIZER BY THE PROTOCOL, should be marked with prefix "required" when being implemented inside the class.

// "required" prefix guarantees, that you provide the explicit or INHERITED IMPLEMENTATION OF THE REQUIRED INITIALIZER on all the SUBCLASSES of the corresponding to the protocol class, so that subclasees also conform to the protocol
class someClass: InitProtocol {
    required init(someParameter: Int) {
//        initializer implementation...
    }
}

// MARK: you don't have to provide "required" modifier in classes, where the "final" modifier is present, because FINAL CLASSES CAN'T HAVE SUBCLASSES.

// if subclass overrides some designated init of the superclass and also implements the init corresponding to the protocol - write both REQUIRED and OVERRIDE

class SuperClass {
    init() {
        <#statements#>
    }
}

class SubClass: SuperClass, InitProtocol {
    required init(someParameter: Int) {
        <#code#>
    }
    
    required override init() {
        
    }
}

// PROTOCOLS AS TYPES
// - as parameter type or returning type of a function, method, initializer;
// - as let type, variable or property type;
// - as type of array elements, dictionsry or any ither containers.

// MARK: since protocols are NEW TYPES, they are being named in uppercase such like other types (Int, String etc.)

// example:

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}


// PROTOCOLS DELEGATION
// - Delegation - is a template which allows a structure or a class to pass (delegate) some responsebility to the instance of other type.

// survaillance protocol
protocol RouterDelegate {
    var nameID: [String] { get set }
    func saveName(name: String, text: String)
}

// user behavior description
protocol Users {
    var name: String { get set }
    var age: Int { get set }
    
    var delegate: RouterDelegate? { get set }
    
    init(name: String, age: Int, delegate: RouterDelegate?)
}


class Router: RouterDelegate {
    var nameID: [String] = []
    func saveName(name: String, text: String) {
        nameID.append(name)
        nameID.append(text)
    }
}

class User: Users {
    var name: String
    var age: Int
    
    var delegate: RouterDelegate?
    
    func sendMail(name: String, text: String) -> Bool {
        delegate?.saveName(name: name, text: text)
        return true
    }
    
//    "required" because the implementation of this initializer is required by the protocol
    required init(name: String, age: Int, delegate: RouterDelegate?) {
        self.name = name
        self.age = age
        self.delegate = delegate
    }
}

let routerDelegate = Router()

let user = User(name: "Andre", age: 22, delegate: routerDelegate)
user.sendMail(name: "Sonya", text: "love you my angel.")

routerDelegate.nameID


// ADIING PROTOCOL IMPLEMENTATION THROUGH THE EXTENSION

// MARK: existing type instances automatically accept and correspond to the protocol requirements, when options which are neccessary for matching to the protocol, are added to the type via extension.

protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "игральная кость с \(sides) гранями"
    }
}

let d16 = Dice(sides: 16, generator: LinearCongruentialGenerator())
print(d16.textualDescription)

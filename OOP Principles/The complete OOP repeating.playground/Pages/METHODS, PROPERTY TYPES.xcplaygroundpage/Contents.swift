//: [Previous](@previous)

import Foundation
import UIKit

var countries: [String] = ["Uruguay", "Uganda", "Guatemala"]

enum Countries
{
    case Ukraine
    case USA
    
//    COMPUTED PROPERTY
//    var newCountry: String?
//    {
//        get
//        {
//            return countries.randomElement()
//        }
//    }
}

//var country = Countries.self
//print(country.newCountry)


class Human
{
    // STORED PROPERTIES (var/let) *cannot be contained in Enums
    var name: String
    var age: Int
    var height: Double
    var weight: Double
    
//     COMPUTED PROPERTIES *can be created in any data structure (GET-only/GET+SET)
//    SHOULD ALWAYS RETURN A VALUE
    var iq: Double
    {
//        getter - to get a random value calculated in the moment
        get
        {
            print("your iq is:")
            return Double.random(in: 100...200)
        }
        
//        setter (which kinda looks like a function), to be able to set a value
        set(newValue)
        {
            self.iq = newValue
        }
    }
    
//     PROPERTY OBSERVERS (willSet/didSet)
//    ARE NOT BEING CALLED DURING INITIALIZATION
    var iqObserve: Double
    {
//        means "will be set right now"
        willSet(newValue)
        {
            print("will set: \(newValue)")
        }
        
//        "did set just now"
        didSet(oldValue)
        {
            print("did set: \(oldValue)")
        }
    }
    
//     LAZY PROPERTIES (for heavy objects, can be stored in any construct)
//    doesn't exiist in the memory until called directly
    lazy var heavyObject: String = "3D object"
    
//     TYPE PROPERTIES (static var/let) *work by the principals of lazy properties (won't be executed until called directly)
//    exists ON THE TYPE (Human), not on the object in the memory
    static var species: String = "mammal"
    
//    LAZY COMPUTED PROPERTY (in case if we want a lazy property to be calculated in the moment)
    lazy var lazyVarComputed: Double =
    {
        Double.random(in: 10...15)
    }() // () IS NECCESSARY HERE TO BE ABLE TO USE COMPUTED PROPERTY AS LAZY
//    computed property above is a shortcut syntax where "return" and "get" are hidden but still exist by default since Swift is a smart language
    
//    describing initializers for properties
    init(name: String, age: Int, height: Double, weight: Double, iqObserve: Double)
    {
        self.name = name
        self.age = age
        self.height = height
        self.weight = weight
        self.iqObserve = iqObserve
    }
    
//     TYPE METHODS (class func, also can static but it's bad to use it)
    class func printSpecies()
    {
        print("mammal species")
    }
    
}




// created an object in the memory to be able to use Human properties
var Sophie = Human(name: "Sofia", age: 20, height: 160, weight: 46, iqObserve: 150)

print(Sophie.iq)

print(Sophie.iqObserve)
Sophie.iqObserve = 155
print(Sophie.iqObserve)


// PROPERTY OBSERVERS ARE ALWAYS BEING CALLED AT THE END OF THE FUNCTION EXECUTION WHERE WE PASS A PROPERTY WITH OBSERVERS AS INOUT PARAMETER AND VALUES WILL BE REWRITTEN INTO THE PROPERTY
func foo(f: inout Double)
{
    print("function is called")
}

// OBSERVERS TRAP #2
// passing a property with observers into a function as inout parameter
foo(f: &Sophie.iqObserve)
print(Sophie.iqObserve)

// CALLING A LAZY PROPERTY
// since this moment lazy property exists in the memory
Sophie.heavyObject
print(Sophie.heavyObject)

// CALLING A TYPE PROPERTY
// this property will be the same FOR ALL THE OBJECTS of type HUMAN
print(Human.species)

// CALLING A TYPE METHOD
// since this moment this method exists in the memory
Human.printSpecies()

// CALLING LAZY COMPUTED PROPERTY
// since this moment the value of the property was created in the memory and calculated in the moment
print(Sophie.lazyVarComputed)


//: [Previous](@previous)

import Foundation
// INHERITANCE
// * is a fundamental behavior which differentiates Classes from any other types
// * a class which inherits another class is called a superClass
// * a class from which was inherited is called superClass
// * a class which has no parent classes (superClasses) is also called a base class
// * inheriting class inherits all the characteristics of it's superClass (methods, properties, subscripts)
// * to custom some characteristics of the superClass inside the subClass "override" keyword is used
// * to access parent's class characteristics use super.someMethod(), super.someProperty, super[someSubscript]
// * you can redefine a property in subClass and add getter (and setter if needed) no matter was it defined as stored or computed property in the superClass. Everything subcluss knows about inherited property is it's name and type.
// * STORED PROPERTIES CAN'T BE COMPUTED PROPERTIES IN SUPER (BASE) CLASS, BUT CAN HAVE OBSERVERS

// creating a base class (a class without superClasses)
class Vehicle {
    var currentSpeed: Double = 0.0
    var description: String {
        return "движется на скорости \(currentSpeed)km/h"
    }
    
    func makeNoise() {
//        will be used in subsclasses later
    }
}

// creating a subClass of Vehicle
class Bicycle: Vehicle {
//    creating additional proprty for Bicycle
    var hasBasket: Bool = false
}


var bicycle = Bicycle()
bicycle.currentSpeed = 15.0
bicycle.hasBasket = true
print(bicycle.description)

// creating a subClass of the subClass Bicycle
class Tandem: Bicycle {
//    adding another property for this subClass
    var amountOfPassengers = 0
    
//    overriding computed property description which was inherited from the parent class (Vehicle)
//    super.description means that we access this property's implementation in the parent class (Vehicle) and adding some other functionality already inside the subclass
    override var description: String {
        return "Tandem: " + super.description
    }
}

var tandem = Tandem()
tandem.currentSpeed = 15.0
tandem.hasBasket = true
print(tandem.description)

class Train: Vehicle {
    override func makeNoise() {
        print("choochoo")
    }
}

var train = Train()
train.makeNoise()


// PROPERTY OVERRIDING
class Car: Vehicle {
//    creating a property: передача
//    * final before a property prevents the property from overriding it in other classes and tries to do that will cause a compilation error
    final var gear = 1
    
//    overriding inherited property
    override var description: String {
        return "Машина: " + super.description + " на передаче \(gear)"
    }
}

var car = Car()
car.currentSpeed = 200
car.gear = 4
print(car.description)


// GETTER AND SETTER OVERRIDING
// * you can NOT provide observers for let properties and get-only computed properies since those can't be modifyed so providing observers doesn't make sence in that case
// * "final" before class means this Class can't be inherited and tries to do that will cause a compilation error
final class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10) + 1
        }
    }
}

var automaticCar = AutomaticCar()
automaticCar.currentSpeed = 30
print(automaticCar.description)

//: [Next](@next)

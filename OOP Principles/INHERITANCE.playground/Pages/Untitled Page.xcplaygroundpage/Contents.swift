import UIKit

// INHERITANCE

// creating a base class with some properties and methods
class Human {
    var name: String = ""
    var lastname: String = ""
    
    var fullName: String {
        return lastname + "" + name
    }
    
    func greeting() {
        print("Hello")
    }
}

var me = Human()
me.name = "Sofia"
me.lastname = "Shchukina"
me.greeting()

// creating a subclass of superclass Human
class Student: Human {
    var uniYear: Int = 0
    var degree: String = ""
    
//    override is a prefix for changing and customising a superClass inherited characteristic
    override func greeting() {
        print("Hi, I'm student on my \(uniYear) year of \(degree) degree and my name is \(name)")
    }
}

var CSstudent = Student()
CSstudent.uniYear = 3
CSstudent.degree = "bachelor"
CSstudent.name = "random computer science student"
CSstudent.greeting()

// creating another base class
class Vehicle {
    var currentSpeed: Double = 0.0
    var description: String {
        return "movement speed: \(currentSpeed) km/h"
    }
    
    func makeNoise() {
        
    }
}

// againg, defining a subclass
class Car: Vehicle {
    var wheelsAmount: Int = 4
    
    override func makeNoise() {
        print("Noise: so loud.")
    }
    
    override var description: String {
        return "Lamborghini: movement speed: \(currentSpeed) km/h. Wheels amount: \(wheelsAmount)."
    }
}

var Lamborghini = Car()
Lamborghini.currentSpeed = 300
Lamborghini.description


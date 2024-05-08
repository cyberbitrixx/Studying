//: [Previous](@previous)

import Foundation

// TT #0:
// class Artist
// name/lastname property
// performance/action - method
// artist(painter) should change his name no matter what we would like to assign

class Artist {
    var name: String {
        get {
            return "Caleb"
        }
    }
    
    
    func action() {
//        will be used by subclasses later
    }
}

class Dancer: Artist {
    override var name: String {
        get {
            return "Brandon"
        }
    }
        
        
    override func action() {
        print("*dancing*")
    }
}

class Photographer: Artist {
    override var name: String {
        get {
            return "Brandon"
        }
    }
    
    override func action() {
        print("*makes a photo*")
    }
}

class Painter: Artist {
    var names = ["Caleb", "Joe", "Luke", "Suzan"]
    override var name: String {
        get {
            return names.randomElement() ?? ""
        }
    }

    override func action() {
        print("*is painting*")
    }
}

var dancer = Dancer()
print(dancer.name)
dancer.action()

var photographer = Photographer()
print(photographer.name)
photographer.action()

var painter = Painter()
print(painter.name)
painter.action()

// polimorphysm
var artists = [dancer, photographer, painter]
artists[0].action()




// TT #1:
// base class Vehicle:
// computed capacity
// computed speed
// computed cost per transportation per passenger

// subClasses: plane, ship, helicopter, car, train: one instance of each with defined values for it
// method (probably in the base class):
// which transports specific amount of people from point A to point B, computes how much time is needed for each vehicle, how much money will cost to transport this amount of people by each vehicle


class Vehicle {
    var speed: Double
    var costPerPassanger: Int
    
    
    init(speed: Double, capacity: Int, costPerPassenger: Int) {
        self.speed = speed
        self.costPerPassanger = costPerPassenger
    }
    
    func transportPassengersDescription(destiny: Double, capacity: Int) -> String {
        var costPerTransportation = self.costPerPassanger * capacity
        var timeOfTransportation = destiny / self.speed
        return "cost of transportation for \(capacity) people: \(costPerTransportation)$. Time of transposrtation will take: \(timeOfTransportation) hours."
    }
    
    
}

class Plane: Vehicle {
    
}

var plane = Plane(speed: 880.0, capacity: 100, costPerPassenger: 300)
print(plane.transportPassengersDescription(destiny: 1000, capacity: 100))






//: [Next](@next)

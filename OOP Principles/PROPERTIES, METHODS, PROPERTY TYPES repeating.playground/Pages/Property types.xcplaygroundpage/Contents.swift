import UIKit

class Human
{
//    STORED PROPERTY
    var height: Double
    
//    LAZY PROPERTY
//    won't be created as an object in the memory when an object of this Class type initialized outside of the class
//    it's being called ONLY in case if we call it directly
//    P.S. made for heavy objects such as 3D models or an image to not use memory if it's not needed
    lazy var human: String = "3D model for example"
    
//    PROPERTY OBSERVERS
    var weight: Double   // property observers are NOT being called during the INITIALIZATION (important trap on the interview!)
    {
        willSet  // будет установлено прямо сейчас
        {
            print("will set \(newValue)")  // newValue это переменная доступная по дефолту для обозначения нового значения, которое будет присвоено
        }
        didSet  // было установлено только что
        {
            print("did set \(oldValue)")  // oldValue - аналогично newValue
        }
    }
    
//    var weight
    
//    COMPUTED PROPERTY (get-only)
//    var iq: Double
//    {
//        print("your IQ:")
//        return Double.random(in: 20...200)
//    }
    
//    FULL COMPUTED PROPERTY (get + set)
    var iq: Double    // this property also can be optional (?)  here means that this property is optional and for some reasons if I can't read the value stored in the property it will return nil
    {
        get
        {
            print("your IQ is:")
            return Double.random(in: 20...200)
        }
        set (newIQvalue)
        {
            print("your IQ is:\(newIQvalue)")
        }
    }
    
    
//    TO INITIALIZE
//    option 1:                    assigning a default value
//    var height: Double = 0.0
//    var weight: Double = 0.0

//    option 2:                    initializing the class inside the class
    init(height: Double, weight: Double)
    {
        self.height = height
        self.weight = weight
    }
    
//    method, which shows how many waight Human lost
    func loose(weight: Double)    // weight here is external parameter name as a Swift syntax
    {
        self.weight -= weight
    }
    
}
 
// to use stored properties we need to creare object in the memory:
var me = Human(height: 1.60, weight: 46.0)

// to access object's properties - dot syntax:
me.weight
me.height

// using computed property:
print(me.iq)
me.iq = 200
print(me.iq)

// CALLING A LAZY PROPERTY
print(me.human)
// only after this line of code me.human is a real object in the memory

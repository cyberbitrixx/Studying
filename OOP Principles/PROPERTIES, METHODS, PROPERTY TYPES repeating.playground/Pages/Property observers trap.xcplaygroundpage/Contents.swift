//: [Previous](@previous)

import Foundation

class Human
{
    var height: Double
//    PROPERTY OBSERVERS
//    are NOT being called during the initialization
    var weight: Double
    {
        willSet
        {
            height += 1
            print("will set \(newValue)")
        }
//        one more trap on the interview: height value will be changed by every calling of the observers, that's why it's changed from 160 to 161, because after calling the inout function, observers were called
        didSet
        {
            print("did set \(oldValue)")
        }
    }
    
    init(weight: Double, height: Double)
    {
        self.weight = weight
        self.height = height
    }
    // property observers are not being called if we don't use it anywhere else than in init
}
 
func f(oof: inout Double)
{
    print("call function")
}

var me = Human(weight: 46, height: 160)
print(me.weight)

f(oof: &me.weight) // & is required because of passing an argument of type Double to an inout parameter

print(me.height)

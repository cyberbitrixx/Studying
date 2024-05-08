import UIKit

// CLASS, STRUCT, ENUM

// value type
// can't contain stored properies ("case" keyword is used instead)
enum Countries
{
    case Ukraine
    case USA
    case otherCountry
    
//    to modify enum we also will have to make a func mutating
    mutating func myFunc()
    {
        self = .Ukraine
    }
}

// contains stored properties
// value type
struct UserStruct
{
    var name: String
    var age: Int
    var weight: Double
    
//    HERE WE MODIFY THE STRUCT ITSELF (indefferent from modifying an object outside of the type/struct/class as we will do down below)
//    to modify a property inside the structure function should be mutating (indifferent from the Class)
    mutating func changeStructName(_ name: String)
    {
        self.name = name
    }
}

// contains stored properties
// reference type
// lays in the part of memory which is called heap
// HAS INHERITANCE
class UserClass
{
    var name: String
    var age: Int
    var weight: Double
//    HAS NO INITIALIZERS BY DEFAULT
//    ways to initialize a property:
//    a) set a default value
//    b) describe an initializer inside the class
    
    init(name: String, age: Int, weight: Double)
    {
        self.name = name
        self.age = age
        self.weight = weight
    }
    
    func printName()
    {
        print(self.name)
    }
    
    //    to modify a class's property we can use a usual function and access the property by any reference created
    func changeClassName(_ name: String)
    {
        self.name = name
    }
}


// ALL FUNCTIONS HERE - ARE MODIFICATIONS OF THE OBJECTS OUTSIDE OF THE CLASS

// creating an object of type UserStruct (value type, is the whole new object)
var userStructObject = UserStruct(name: "Liza", age: 10, weight: 25.0)
var userStructObject1 = userStructObject    // since this moment we have to identical objects in the memory, in that line userStructObject was just copied
userStructObject1.name = "new name"

// calling mutating inside the struct method to change the name property of userStructObject
userStructObject.changeStructName("Yelizaveta")
print(userStructObject.name)
print(userStructObject1.name)

// creating an object (reference) of type UserClass
var userClassObject = UserClass(name: "Sofia", age: 20, weight: 46.0)


// modifying the UserClass throught the function just accessing it by any reference
func changeUser(user: UserClass)
{
    user.name = "444"
}

var userClassObject1 = userClassObject
userClassObject1.name = "Sofiia"

print(userClassObject.name)
// in this line userClassObject property name will still store the value "Sofiia" since we created another reference to this object (userClassObject1) and assigned it a new value "Sofiia"

print(userClassObject1.name)

// here value of the property of all the previous references to the userClassObject will be changed to "444"
changeUser(user: userClassObject1)
print(userClassObject1.name)
print(userClassObject.name)

// to do the same modofication with the object of type Struct we will have to use inout parameters
func changeUserStruct(user: inout UserStruct)
{
    user.name = "555"
}

changeUserStruct(user: &userStructObject) // also & is required here since we use inout parameter
print(userStructObject.name)


 


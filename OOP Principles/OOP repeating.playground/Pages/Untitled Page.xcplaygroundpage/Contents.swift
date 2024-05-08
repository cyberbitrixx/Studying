import UIKit

// Main goal of enums, structures and classes is to unite objects and functionality in one code construction
// all these data constructs create the whole new data type in the project

enum Countries
{
    case Ukraine
    case USA
    case Korea
}
// defining properties of the enum using "case" keyword
// VALUE TYPE
 
struct User
{
    var name: String  // определение свойства
    var age: Int
    var gender: String
    
    func printName()
    {
        print(self.name)
    }
//     self. is used to access properties inside the struct, also in general such function would call a property through the self. by defult, so writing it isn't neccessary
}
// has initializers by default
// VALUE TYPE

class UserInfo
{
    var name: String = "" // set default value because no default initializers in here
    
    func printName()
    {
        print(self.name)  // same shit with self.
    }
    
    
    
}
// has no intializers by default
// REFERENCE TYPE


var userStruct = User(name: "Summer", age: 17, gender: "female")  // () here - initializer
userStruct.printName()

func modifyClassName(user: UserInfo)
{
    user.name = "changed"
}

let changedUserName = UserInfo()
modifyClassName(user: changedUserName)

print(changedUserName.name)


func modifyStructName(structProp: inout User)
{
    structProp.name = "changed struct.name"
}

  

modifyStructName(structProp: &changedStructName)

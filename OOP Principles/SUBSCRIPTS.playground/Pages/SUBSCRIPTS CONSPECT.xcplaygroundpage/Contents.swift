//: [Previous](@previous)

import Foundation

// SUBSRIPTS
// are used to access the element of the collection (array, dictionary, list), also can be used to rewrite another value to the element of the collection
// *CAN BE CREATED IN ANY DATA CONSTRUCT
// *SIMILAR TO FUNCTION BUT CAN'T USE INOUT PARMETERS
// *ANY NEEDED AMOUNT OF SUBSCRIPTS CAN BE CREATED INSIDE THE DATA CONSTRUCT, MULTIPLE AMOUNT OF SUBSCRIPTS IS CALLED SUBSCRIPTS OVERLOADING

var arrayOfInts = [12, 324, 54, 5643, 6]

// accessing the array element using a subscript
// [3] here is an index of the cell inside the array
print(arrayOfInts[3])

// works the same way with dictionaries
var dictionary = ["key": "value", "key 2": "value 2"]
print(dictionary["key"] as Any)


// subscripts in collections already exist so we can call them whenever we need
// CREATING CUSTOM SUBSCRIPTS IN DATA CONSTRUCTS

struct multiplyTable {
    var multiplyer: Int
    
    subscript(n: Int) -> Int {
        
            return n * multiplyer
    }
}

// creating an object in the memory
var threeTimesTable = multiplyTable(multiplyer: 3)

// calling a subscripts passing to it an index/argument (n: Int)
print(threeTimesTable[2])

struct Grid {
    
//    array, which represents 2 dimensioanl matrix
    var grid = [
    [1, 1, 1],
    [2, 2, 2],
    [3, 3, 3]
    ]
    
//    subscript here accepts two parmeters which represent coordinates of the cell in the matrix/grid to access or rewrite the value into it
    subscript(row: Int, column: Int) -> Int? {
//        getting a value from coordinates in the grid
        get {
            //        before writing a subscript logic itself, we write which terms input values (arguments) should meet, if it doesn't the guard code will just return nil so that the program wouldn't crash
                    let maxColumns = grid.count
                    guard column < maxColumns, column >= 0 else {
                        return nil
                    }
                    
            //        doing the same thing with rows
                    let maxRows = grid.count
                    guard row >= 0, row < maxRows else {
                        return nil
                    }
                    
            //        subscript logic to return the value in the cell
                    let number = grid[row][column]
                    return number
                }
        
//        setting a value by the coordinates in the grid
        set(newValue) {
            grid[row][column] = newValue!
        }
    }
    
 

}

// creating an object in the memory
var grid1 = Grid()

// getter
print(grid1[2, 1] as Any)

// setter
grid1[2, 1] = 4
print(grid1[2, 1] as Any)

//: [Next](@next)

import UIKit

// SUBSCRIPTS are used as a shortcut to get access to an object inside the collection or to reassign a new value to it
// without subscripts syntax of accessing a value woluld be longer
// SUBSCRIPTS CAN'T USE INOUT PARMETERS
// can be created in any data construct
// YOU CAN CREATE AS MANY SUBSCRIPTS FOR ONE OBJECT AS YOU NEED, IT'S CALLED SUBSCRIPTS OVERLOADING

struct Matrix
{
    let rows: Int, columns: Int
    var grid: [Double]
    
//    initializer here accepts parameters rows and columns, and CREATES AN ARRAY OF SIZE rows * columns, storing in each cell a default value 0.0
    init(rows: Int, columns: Int, grid: [Double])
    {
        self.rows = rows
        self.columns = columns
        self.grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    
    
    
}

// BUILDING A CUSTOM SUBSCRIPT

extension Array
{
    // subscript here returns an element from collection and it's optional for the case where we can get not right value
//    safe external parameter name here needed to not get a fatal error (?)
    subscript(safe index: Int) -> Element?
    {
    //    next we want to filter if the value is between the size of the array (range filter)
    //    GUARD here is a convenient option to check if value is valid (fits terms we need to be executed), and in case if it doesn't, code just returns nil
//        to read about GUARDS: https://medium.com/@SwiftBook.ru/%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%82%D0%BE%D1%80-guard-e2f7536aa90e
        guard index >= startIndex, index <= endIndex
        else {
            print("Fatal error: Index is out of range")
            return nil
        }
        
        return self[index]
    }
}

var planets = ["Earth", "Mercury", "Venus", "Uranus", "Neptune", "Mars", "Saturn", "Jupiter", "Pluto"]

planets[2]

// Creating a subscript in custom types
// <T> here is called generic type so that our struct was supported by any kind of type


// ALSO THIS SHIT DOESN'T WORK FOR SOME REASON
//struct Grid
//{
//    var data = [[Int]]()
//
//    subscript(row: Int, column: Int) -> Int
//    {
//        get {
//            return data[row][column]
//        }
//
//        set {
//            data[row][column] = newValue
//        }
//    }
//}
//
//var matrix = Grid(
//    data:
//    [2, 5],
//    [3, 56],
//    [23, 6])
//
//print(matrix[1, 4])

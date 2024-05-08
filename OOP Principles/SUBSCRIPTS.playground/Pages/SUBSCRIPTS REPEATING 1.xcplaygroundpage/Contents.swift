//: [Previous](@previous)

import Foundation

// SUBSCRIPTS
// can be created in any data construct
// used to access elements inside collections or can be created custom subscripts in other data constructs
// possible to create any amount of subscripts as needed (subscripts overloading)
// similar with functions but can not use inout parameters

struct Matrix {
    var matrix = [
    [123, 351, 7],
    [14, 7, 35],
    [234, 53, 245]
    ]
    
    subscript(row: Int, column: Int) -> Int? {
        get {
            let maxRows = matrix[row][column]
            guard row >= 0, row <= maxRows else {
                return nil
            }
            
            let maxColumns = matrix[row][column]
            guard column >= 0, column <= maxColumns else {
                return nil
            }
            
            return matrix[row][column]
        }
        
        set(newValue) {
            matrix[row][column] = newValue!
        }
    }
    }

var matrix0 = Matrix()
print(matrix0[2, 1])

//: [Next](@next)

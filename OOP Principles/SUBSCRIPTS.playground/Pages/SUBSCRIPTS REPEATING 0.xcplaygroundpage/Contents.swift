//: [Previous](@previous)

import Foundation


// create a random struct
struct Matrix {
//    creating a two-dimentional matrix
    var matrix = [
    [13, 34, 5],
    [24, 6, 53],
    [3, 24, 45]
    ]
    
    subscript(row: Int, column: Int) -> Int? {
        
        get {
            let maxRows = matrix.count
            guard row >= 0, row < maxRows else {
                return nil
            }
            
            let maxColumns = matrix[row][column]
            guard column >= 0, column < maxColumns else {
                return nil
            }
            
            return matrix[row][column]
        }
        
        set (newValue) {
            matrix[row][column] = newValue!
        }
    }
}

var matrix2D = Matrix()
print(matrix2D[0, 1] as Any)

matrix2D[2, 1] = 3
print(matrix2D[2, 1] as Any)


//: [Next](@next)

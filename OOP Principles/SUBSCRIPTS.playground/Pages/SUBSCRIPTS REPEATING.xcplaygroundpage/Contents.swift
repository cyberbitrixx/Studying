//: [Previous](@previous)

import Foundation

// SUBSCRIPTS:
// * used to access and modify a value inside the collection or data construct
// * can be created in any data construct
// * so similar to functions but can't use inout parameters
// * it's posiible to create any amount of subscripts as needed inside the data construct. It's called subscripts overloading

struct Grid {
    
//    creating a two-dimensional matrix
    var grid = [
        [12, 43, 13],
        [46, 65, 2],
        [3, 56, 6]
    ]
    
//    creating a subscript
    subscript(row: Int, column: Int) -> Int? {
        get {
            //        creating a guard to check if values passed as arguments to the parameters are valid
                    let maxRows = grid.count
                    guard row >= 0, row < maxRows else {
                        return nil
                    }
                    
                    let maxColumns = grid[row][column]
                    guard column >= 0, column < maxColumns else {
                        return nil
                    }
            
//            subscript logic to return a value
            let number = grid[row][column]
            return number
        }
        
//        subscript logic to set a new value
        set(newValue) {
            grid[row][column] = newValue!
        }
        
    }
}

//: [Next](@next)

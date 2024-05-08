import UIKit

class TilesClass
{
    var brand: String
    var price: Int
    
    static let width: Int = 40
    static let heighth: Int = 40
    
    init(brand: String, price: Int)
    {
        self.brand = brand
        self.price = price
    }
    
    func square(width: Int, heighth: Int)
    {
        let S = width * heighth
        print(S)
    }
    
    
}

var tileSquareClass = TilesClass(brand: "ceramics", price: 30)

tileSquareClass.square(width: 40, heighth: 40)

print(TilesClass.width)
print(TilesClass.heighth)




struct TilesStruct
{
    var brand: String
    var price: Int
    
    static let width: Int = 40
    static let heighth: Int = 40
    
    func square(width: Int, height: Int)
    {
        let S = width * height
        print(S)
    }
}

var tilesSquareStruct = TilesStruct(brand: "wet floors", price: 40)

tilesSquareStruct.square(width: 50, height: 50)

print(TilesStruct.width)
print(TilesStruct.heighth)

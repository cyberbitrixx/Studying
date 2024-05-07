//: [Previous](@previous)

import Foundation

// JSON (JavaScript Object Notation) is a data format used to implement data transfer between the server and the client.
// Consists of "key": "value" (like dictionary)
// Swift doesn't "know" of what data type values stored within the specific JSON object are, so for implementing the JSON data in the app, it firstly shouls be converted into Swift data model

// 1. Store JSON object
let recipesJSON = """

[
    {
        "title": "Apple pie",
        "views": "3847",
        "rating": 4.5
    },
    {
        "title": "Boiled egg",
        "views": "10584",
        "rating": 4.9
    },
    {
        "title": "Bacon roll",
        "views": "5847",
        "rating": 3.2
    }
]
"""

// 2. Create Swift data model
struct Recipes: Decodable {
    let title: String
    let rating: Double
}

// 3. Convert JSON object into data
let JSONdata = Data(recipesJSON.utf8)

// 4. Convert JSON data into Swift model
let recipes = try! JSONDecoder().decode([Recipes].self, from: JSONdata)
recipes.forEach {
    print("\($0.title) with a rating of \($0.rating)")
}


//: [Next](@next)

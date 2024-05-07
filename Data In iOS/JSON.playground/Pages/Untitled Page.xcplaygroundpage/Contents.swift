import Foundation

// JSON decoding

// 1. Defining a custom object (struct) ad make it implement the Decodable protocol:
struct Recipe: Decodable {
    let title: String
    let views: Int
}

// 2. Converting the JSON string into Data:

let JSON = """
{
    "title": "Little Lemon Apple pie",
    "views": 42984
}
"""

let jsonData = JSON.data(using: .utf8)!

// 3. Using JSONDecoder to decode the JSON data into the model I created earlier:
let recipe = try! JSONDecoder().decode(Recipe.self, from: jsonData)


// JSON as an Array

let JSONArray = """
[
    {
        "title": "Little Lemon Apple Pie",
        "views": 42984
    },
    {
        "title": "Little Lemon scrambled egg",
        "views": 7324
    }
]
"""

let jsonArrayData = JSONArray.data(using: .utf8)!
let recipes = try! JSONDecoder().decode([Recipe].self, from: jsonArrayData)


// Using CodingKeys protocol to map custom property names to JSON keys names

let JSON2 = """
{
    "title": "Little Lemon Apple Pie",
    "views": 4253,
    "url": "www.littlelemon.com/recipes/298/image.png"
}
"""

struct Recipe1: Decodable {
//    to use Coding keys, a nested enum should be created inside the Swift data model:
    enum CodingKeys: String, CodingKey {
        case title, views,
//             line below is needed to map imageLink to key name "url" of the JSON
             imageLink = "url"
    }
    
    let title: String
    let views: Int
    let imageLink: String
}
// the cases of the CodingKeys become names of the properties to mapped in the model after that

let jsonData1 = JSON2.data(using: .utf8)!
let recipe1 = try! JSONDecoder().decode(Recipe1.self, from: jsonData1)
print(recipe1.imageLink)

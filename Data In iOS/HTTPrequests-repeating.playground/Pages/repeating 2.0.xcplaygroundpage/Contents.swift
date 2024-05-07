//: [Previous](@previous)

import Foundation

// 1. Create the constant to hold the resource address as String
let menuString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/littleLemonSimpleMenu.json"

// 2. Convert String into URL object
let menuURL = URL(string: menuString)

// 3. Unwrap the URL object since it's optional value by default
guard let menuURL = menuURL else {
    throw NSError()
}

// 4. Create a new URL session to send the request
let menuRequest = try! URLSession.shared.dataTask(with: menuURL) { data, response, error in
    if let data = data,
       let responseString = String(data: data, encoding: .utf8) {
        print(responseString)
    }
}

// 5. Run the request
menuRequest.resume()
//: [Next](@next)

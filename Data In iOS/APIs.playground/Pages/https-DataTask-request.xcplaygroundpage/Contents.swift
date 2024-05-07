import UIKit

// imported Foundation to get access to the URL Loading System and it's classes
import Foundation

// defining the resource address as String
let menuAddress = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/littleLemonSimpleMenu.json"

// converting resource String address into URL by initializing it as URL instnce passing a String to it's initializer
let menuURL = URL(string: menuAddress)

// URL instance is an optional value in it's definition, so it should be unwrapped first before making an actual URL request object
// initializing the menuURL with guard prefix and since we're sure that the URL address is correct - throwing NSError object to not get warnings from Swift
guard let menuURL = menuURL else {
    throw NSError()
}

// creating a URL request OBJECT
let dataTaskRequest = URLRequest(url: menuURL)

// performing the request
let task = URLSession.shared.dataTask(with: menuURL) { data, response, error in
//    converting the output data into string to see the response in the terminal
    if let data = data,
        let responseString = String(data: data, encoding: .utf8) {
        print(responseString)
    }
}

// executing the created task
task.resume()

//: [Previous](@previous)

import Foundation

// to implement networking in Swift, URLLoadingSystem is used:
// - URLSession (a class used to coordinate data transfer tasks, one session can perform few data tasks);
// - URLRequest (an object to make an HTTP request);
// - URLSessionTask (URLSessionDataTask, URLSessionDownloadTask, URLSessionUploadTask);
// - .shared (a method to create a new URLSession, called on URLSessionTask instance);
// - .resume (a method to make an HTTP request, called on URLSessionTask instance).


// Making a URL data task request:
// 1. Create a constant to store the String url in it.
// 2. Convert String url into URL object.
// 3. Unwrap the URL object using "guard" statement, since URL object is optional value in it's definition.
// 4. Creating a URLRequest instance with previously created URL.
// 5. Performing the request (creating the data task with completion handler, converting the output inside the completion handler into String).
// 6. Executing the request with .resume method.

let menuString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/littleLemonSimpleMenu.json"
let menuURL = URL(string: menuString)
guard let menuURL = menuURL else {
    throw NSError()
}

let dataTaskRequest = URLRequest(url: menuURL)
let menuRequest = try! URLSession.shared.dataTask(with: menuURL) { data, response, error in
    if let data = data,
       let responseString = String(data: data, encoding: .utf8) {
        print(responseString)
    }
}

menuRequest.resume()

//: [Next](@next)

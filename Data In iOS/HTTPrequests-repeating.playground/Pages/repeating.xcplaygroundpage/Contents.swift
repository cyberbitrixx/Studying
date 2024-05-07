import UIKit

// URL Loading System in Swift/iOS is used to implement networking between servers and apps
// URLSession is a class which is used to create URL Sesssion which will perform a certain amount of URLSessionTasks (URLSession subclasses)
// URLRequest is a class to create URL request

// 1. Create a String URL
let menuAddress = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/littleLemonSimpleMenu.json"

// 2. Convert the String into URL object
let menuURL = URL(string: menuAddress)

// 3. Unwrap the URL address object since URL objects are OPTIONAL VALUES
guard let menuURL = menuURL else {
    throw NSError()
}

// 4. Create URLRequest object, passing a menuURL address as it's argument
//let dataRequest = URLRequest(url: menuURL)

// 4. Implement the URLRequest ana perform the URLDataTask (create a URLSession, create a URLDataTask on it with completoin handler); CONVERT the output into String within completion handler
let menuRequest = try! URLSession.shared.dataTask(with: menuURL) { data, response, error in
    if let data = data,
       let responseString = String(data: data, encoding: .utf8) {
        print(responseString)
    }
}

// 5. Send the request
menuRequest.resume()

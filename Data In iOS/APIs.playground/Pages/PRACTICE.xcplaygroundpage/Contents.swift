//: [Previous](@previous)

import Foundation

let littleLemonAddress = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/littleLemonSimpleMenu.json"
let url = URL(string: littleLemonAddress)

// unwrapping the optional String from URL
guard let url = url else { throw NSError() }

let request = URLRequest(url: url)
let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
    //    converting the output data into string to see the response in the terminal
        if let data = data,
            let responseString = String(data: data, encoding: .utf8) {
            print(responseString)
        }}
dataTask.resume()


//: [Next](@next)

//: [Previous](@previous)

import Foundation

// using a URLComponents class to assemble a URL from it's separate components
var components = URLComponents()
components.scheme = "https"
components.host = "google.com"
components.path = "/images"
let url = components.url

//: [Next](@next)

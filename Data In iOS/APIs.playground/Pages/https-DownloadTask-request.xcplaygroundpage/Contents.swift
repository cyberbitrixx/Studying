//: [Previous](@previous)

import Foundation

// URLRequest - argument of the first parameter;
// completionHandler - second parameter (URL pointing to the downloaded file, the response object describes the response details of the server, the error object contains the task failure description if the downloading fails)

func downloadTask(
    with request: URLRequest,
    completionHandler: @escaping @Sendable (URL?, URLResponse?, Error?) -> Void
) -> URLSessionDownloadTask { return downloadTask }
    
    // downloading the text file from the server
    let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/littleLemonSimpleMenu.json")
    let request = URLRequest(url: url!)
    let downloadTask = URLSession.shared.downloadTask(with: request) {
        url, response, error in print(url)
        }
    
downloadTask.resume()

// cancelling the download data task (for example if downloading data is no longer needed):
downloadTask.cancel()

//: [Next](@next)

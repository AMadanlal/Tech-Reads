//
//  ChickenCoopAPI.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/02/18.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation

class ChickenCoopAPI {
//  this is a struct to store the individual game data
  struct Game: Decodable {
    var title: String
    var releaseDate: String
    var description: String
    var genre = [String]()
    var image: String
    var score: Int
    var developer: String
    var publisher: String
    var rating: String
    var alsoAvailableOn = [String]()
  }
//  class variables
  var searchItem: String = ""
  var gamePlatform: String = ""
//  this is the headers that include the host and the unique key given to a user to access the api
  let headers = ["x-rapidapi-host": "chicken-coop.p.rapidapi.com",
                  "x-rapidapi-key": "20e0c6a126msh31a394fe35837d8p1d97f3jsn9bf6099a1b56"]
  init(searched: String, platform: String) {
    searchItem = searched
    gamePlatform = platform
  }
//  this gets the individual game information
  func getGameInfo() {
//    create the initial request for the data using API documentation
    let request = NSMutableURLRequest(url: NSURL(
      string: "https://chicken-coop.p.rapidapi.com/games/\(searchItem)?platform=\(gamePlatform)")! as URL,
                                      cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
//    create the session
    let session = URLSession.shared
//    make the call an get the data
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
    if error != nil {
      print(error as Any)
    } else {
      let httpResponse = response as? HTTPURLResponse
//      print the optained data
      print(httpResponse as Any)
      if let data = data, let dataString = String(data: data, encoding: .utf8) {
//        dataString contains the raw content of the response in JSON format
       print(dataString)
        }
      }
    })
    dataTask.resume()
  }
//  this function gets the list of games
  func getGameList() {
//    check api documentation for this function
  }

}

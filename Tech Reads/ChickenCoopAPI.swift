//
//  ChickenCoopAPI.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/02/18.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation

class ChickenCoopAPI {
// enum for errors
  enum Gameinfoerror: Error {
    case noDataAvailable
    case canNotProcessData
  }
  struct Gameresponse: Decodable {
  var query: String
  var executionTime: Double
  var result: Game
  }
//  to try and do: find a way for this class to create an instance of the gameview class
//  with details and show it to the user
//  this is a struct to store the individual game data
  struct Game: Decodable {
  var title: String
  var releaseDate: String
  var description: String
  var genre = [String]()
  var image: String
  var score: Int
  var developer: String
  var publisher = [String]()
  var rating: String
  var alsoAvailableOn = [String]()
}

//  class variables
  var searchItem: String = ""
  var gamePlatform: String = ""

  var gamedetails = Game(title: "", releaseDate: "", description: "",
                         genre: [""], image: "", score: 0, developer: "", publisher: [""], rating: "",
                         alsoAvailableOn: [""])
//  this is the headers that include the host and the unique key given to a user to access the api
  let headers = ["x-rapidapi-host": "chicken-coop.p.rapidapi.com",
                  "x-rapidapi-key": "20e0c6a126msh31a394fe35837d8p1d97f3jsn9bf6099a1b56"]

  init(searched: String, platform: String) {
    searchItem = searched
    gamePlatform = platform
  }

//  this gets the individual game information
  func getGameInfo(completionHandler: @escaping(Result<Game, Gameinfoerror>) -> Void) {
//    create the initial request for the data using API documentation
    let request = NSMutableURLRequest(url: NSURL(
      string: "https://chicken-coop.p.rapidapi.com/games/\(searchItem)?platform=\(gamePlatform)")! as URL,
                                      cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
//    create the session
    let session = URLSession.shared
//    make the call an get the data
    let dataTask = session.dataTask(with: request as URLRequest) { data, _, _ in
      guard let jsonData = data else {
        completionHandler(.failure(.noDataAvailable))
        return
      }
      do {
        let decoder = JSONDecoder()
        let gameresponse = try decoder.decode(Gameresponse.self, from: jsonData)
//        gameresponsedetails contain all the information of the game
        let gameresponsedetails = gameresponse.result
        completionHandler(.success(gameresponsedetails))
        //the previous line allows values obtained when doing async instructions to be returned
        } catch {
          completionHandler(.failure(.canNotProcessData))
        }
      }
    dataTask.resume()
  }

//  this function gets the list of games
  func getGameList() {
//    check api documentation for this function
  }

}

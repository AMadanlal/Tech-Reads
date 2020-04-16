//
//  TechNewsAPICalls.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/16.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation


public enum Newsinfoerror: Error {
  case noDataAvailable
  case canNotProcessData
}

//Codable Struct to represent JSON payload found at source:
//https://github.com/DanKorkelia/News-API-swift/blob/master/News-API%20Playground.playground/Contents.swift
struct NewsSource: Codable {
    let status: String?
    let totalResults: Int?
    struct Article: Codable {
        let source: Source
        let author: String?
        let title: String?
        let description: String?
        let url: URL?
        let urlToImage: URL?
        let publishedAt: String?
        struct Source: Codable {
            let id: String?
            let name: String?
        }
    }
    let articles: [Article]
}

 func getNewsList(completionHandler: @escaping(Result<NewsSource, Newsinfoerror>) ->
    Void) {
    let request = NSMutableURLRequest(url: NSURL(string: "https://newsapi" +
      ".org/v2/top-headlines?country=za&category=technology&" +
      "pagesize=10&apiKey=db03aae8ea77408ab75aa849fae46298")! as URL,
                                      cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
    request.httpMethod = "GET"
//    NOT PUTTING HEADERS AS THEY ARE ALREADY IN THE URL STRING
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest) { data, _, _ in
      guard let jsonData = data else {
        completionHandler(.failure(.noDataAvailable))
        return
      }
      do {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
       let newsResponse = try decoder.decode(NewsSource.self, from: jsonData)
        completionHandler(.success(newsResponse))
      } catch {
        completionHandler(.failure(.canNotProcessData))
      }
    }
    dataTask.resume()
  }

func getArticle(theArticle: NewsSource.Article, textViewToUse: UITextView) {
      let urlString: String = "https://techreadsapi.herokuapp.com/NewsArticleFormatter"
      let json = theArticle
      let jsonData = try? JSONEncoder().encode(json)
      let url = URL(string: urlString)!
      var request = URLRequest(url: url)
      request.httpMethod = "POST"
         request.setValue("application/json", forHTTPHeaderField: "Accept")
         request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
      let task = URLSession.shared.dataTask(with: request) { data, _, error in
          guard let data = data, error == nil else {
              print(error?.localizedDescription ?? "No data")
              return
          }
       let responseJSON = String(data: data, encoding: .utf8)
       if let responseJSON = responseJSON {
            DispatchQueue.main.async {
              print(responseJSON)
              textViewToUse.text = responseJSON
           }
          }
      }
     task.resume()
}

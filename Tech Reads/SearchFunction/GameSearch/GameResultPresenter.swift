//
//  GameResultPresenter.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/22.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation
import TechReadsPod

class GameResultsPresenter {
  weak var view: GameResultsPresenterView?
  var gameList: GameList?
  var gameItems = [String]()

  init(with view: GameResultsPresenterView) { self.view = view }

  func displayGameResults() {
    let gameApi = ChickenCoopAPI()
    gameApi.getGameList(searchItem: view?.searchString ?? "") { result in
      switch result {
      case .failure(let error):
        print(error)
        DispatchQueue.main.async {
          self.view?.popUpWarning(title: "Error", message: "Data couldnt be obtained")
        }
      case.success(let details):
        self.gameList = details
        self.gameItems = details.result.map { item in
          let title = item.title
          let description = item.platform
          return title + " on " + description
        }
        DispatchQueue.main.async {
          self.view?.updateSearchItems(gameItems: self.gameItems)
      }
      }
    }
  }

}

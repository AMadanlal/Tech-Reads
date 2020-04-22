//
//  GameReviewPresenter.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/21.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation
import TechReadsPod

class GameReviewPresenter {

  weak var view: GamePresenterView?
  var gameList: GameList?
  var gameListItem: GameListItem?
  var game: Game?

  init(with view: GamePresenterView) { self.view = view }

  func displayGame() {
    let gameDetail = ChickenCoopAPI()
    guard let gameListItem = self.gameListItem else { return }
    gameDetail.getGameInfo(gameTitle: gameListItem.title, gamePlatform: gameListItem.platform) { result in
      switch result {
      case .failure(let error):
        print(error)
      case.success(let details):
        self.game = details
        DispatchQueue.main.async {
          let infoProcessing = GameInfoProcess()
          guard let aGame = self.game else { return }
          let content = infoProcessing.textDisplay(game: aGame)
          self.view?.updatePageContent(aGame.title, withContent: content, andImageURL: aGame.image)
      }
      }
    }
  }

  func displayRandomGame() {
    let gameAPI = ChickenCoopAPI()
    gameAPI.getGameList(searchItem: "") { result in
      switch result {
      case .failure(let error):
      print(error)
      case.success(let details):
      self.gameList = details
      DispatchQueue.main.async {
      guard let gameList = self.gameList else { return }
      self.gameListItem = gameAPI.getRandomGameListItem(gameList: gameList)
      guard let listItem = self.gameListItem else { return }
      gameAPI.getGameInfo(gameTitle: listItem.title, gamePlatform: listItem.platform) { result in
      switch result {
      case .failure(let error):
      print(error)
      case.success(let details):
      self.game = details
      DispatchQueue.main.async {
        let infoProcessing = GameInfoProcess()
        guard let aGame = self.game else { return }
        let content = infoProcessing.textDisplay(game: aGame)
        self.view?.updatePageContent(aGame.title, withContent: content, andImageURL: aGame.image)
              }
            }
          }
        }
      }
    }
  }
}

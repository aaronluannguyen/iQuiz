//
//  AppData.swift
//  iQuiz
//
//  Created by Aaron Nguyen on 10/30/18.
//  Copyright © 2018 Aaron Nguyen. All rights reserved.
//

import UIKit

class AppData: NSObject {
  static let shared = AppData()
  
  public struct Quiz: Decodable {
    var title: String
    var desc: String
    var questions: [Question]
  }
  
  public struct Question: Decodable {
    var text: String
    var answer: String
    var answers: [String]
  }

  
  open var quizzes = [Quiz]()
  open var jsonURL = "http://tednewardsandbox.site44.com/questions.json"
  open var topicIndex = 0
  open var questionIndex = 0
  open var userResponse = ""
  open var userScore = 0
}

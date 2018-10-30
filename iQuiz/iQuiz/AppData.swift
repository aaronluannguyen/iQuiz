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
  
  struct Quiz {
    var title: String
    var description: String
    var image: UIImage
    var question1: String
    var question1Answers: [String]
    var question1CorrectAnswer: String
    var question2: String
    var question2Answers: [String]
    var question2CorrectAnswer: String
  }
  
  open var quizzes: [Quiz] = [Quiz(title: "Baseball Quiz", description: "A quiz about baseball as a sport and its participants!", image: UIImage(named: "baseball")!,
                                   question1: "What is Seattle's baseball team called?",
                                   question1Answers: ["Dodgers", "Red Sox", "Mariners", "Marlins"],
                                   question1CorrectAnswer: "Mariners",
                                   question2: "How many innings are in a baseball game?",
                                   question2Answers: ["6", "7", "8", "9"],
                                   question2CorrectAnswer: "9"
                              ),
                              Quiz(title: "Transformers Quiz", description: "Questions about the world of Transformers!", image: UIImage(named: "transformer")!,
                                   question1: "Who is the leader of the Autobots?",
                                   question1Answers: ["Optimus Prime", "Bumblebee", "Ratchet", "Ironhide"],
                                   question1CorrectAnswer: "Optimus Prime",
                                   question2: "Who is the leader of the Decepticons?",
                                   question2Answers: ["Starscream", "Megatron", "Unicron", "Jetfire"],
                                   question2CorrectAnswer: "Megatron"
                              ),
                              Quiz(title: "Batman Quiz", description: "Learn more about Batman through a fun and interesting quiz!", image: UIImage(named: "batman")!,
                                   question1: "Who is Batman's alter ego?",
                                   question1Answers: ["Bruce Wayne", "Alfred Pennyworth", "James Gorden", "Frank Miller"],
                                   question1CorrectAnswer: "Bruce Wayne",
                                   question2: "Who was Batman's first Robin?",
                                   question2Answers: ["Damian Wayne", "Tim Drake", "Dick Grayson", "Jason Todd"],
                                   question2CorrectAnswer: "Dick Grayson"
                              )
  ]
}

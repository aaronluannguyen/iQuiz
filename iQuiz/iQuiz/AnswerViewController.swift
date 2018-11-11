//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Aaron Nguyen on 10/29/18.
//  Copyright © 2018 Aaron Nguyen. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
  
  var appdata = AppData.shared

  override func viewDidLoad() {
    super.viewDidLoad()

    loadAnswerView()
    
    let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
    swipeLeft.direction = .left
    self.view.addGestureRecognizer(swipeLeft)
    
    let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
    swipeRight.direction = .right
    self.view.addGestureRecognizer(swipeRight)
  }
  
  @objc
  func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
    if gesture.direction == UISwipeGestureRecognizer.Direction.right {
      appdata.userScore = 0
      performSegue(withIdentifier: "AToQuizzesSegue", sender: self)
    }
    else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
      let topicIndex = appdata.topicIndex
      let quiz = appdata.quizzes[topicIndex]
      if (appdata.questionIndex >= quiz.questions.count - 1) {
        appdata.questionIndex = 0
        performSegue(withIdentifier: "ToFinishedSegue", sender: self)
      } else {
        appdata.questionIndex += 1
        performSegue(withIdentifier: "BackToQuestionSegue", sender: self)
      }
    }
  }
  
  
  @IBOutlet weak var question: UILabel!
  @IBOutlet weak var userAnswer: UILabel!
  @IBOutlet weak var correctAnswer: UILabel!
  @IBOutlet weak var statusImage: UIImageView!
  @IBOutlet weak var proceedBtnOutlet: UIButton!
  
  
  func loadAnswerView() {
    userAnswer.text = "Your answer is " + appdata.userResponse
    let topicIndex = appdata.topicIndex
    let quiz = appdata.quizzes[topicIndex]
    let questionSpecific = quiz.questions[appdata.questionIndex]
    let correctAnswerValue = getCorrectAnswer(questionSpecific.answer, questionSpecific)
    question.text = questionSpecific.text
    correctAnswer.text = "The correct answer is " + correctAnswerValue
    proceedBtnOutlet.setTitle("Next", for: [])
    if (appdata.userResponse == correctAnswerValue) {
      appdata.userScore += 1
      statusImage.image = UIImage(named: "correct")!
    } else {
      statusImage.image = UIImage(named: "wrong")!
    }
  }
  
  func getCorrectAnswer(_ index: String, _ question: AppData.Question) -> String {
    switch index {
      case "1":
        return question.answers[0]
      case "2":
        return question.answers[1]
      case "3":
        return question.answers[2]
      case "4":
        return question.answers[3]
      default:
        return ""
    }
  }
  
  @IBAction func quizzesBtn(_ sender: Any) {
    appdata.questionIndex = 0
    performSegue(withIdentifier: "AToQuizzesSegue", sender: self)
  }
  
  @IBAction func proceedBtn(_ sender: Any) {
    let topicIndex = appdata.topicIndex
    let quiz = appdata.quizzes[topicIndex]
    if (appdata.questionIndex >= quiz.questions.count - 1) {
      appdata.questionIndex = 0
      performSegue(withIdentifier: "ToFinishedSegue", sender: self)
    } else {
      appdata.questionIndex += 1
      performSegue(withIdentifier: "BackToQuestionSegue", sender: self)
    }
  }
}

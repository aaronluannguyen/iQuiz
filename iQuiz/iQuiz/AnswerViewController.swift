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
    }
  
  
  @IBOutlet weak var question: UILabel!
  @IBOutlet weak var userAnswer: UILabel!
  @IBOutlet weak var correctAnswer: UILabel!
  @IBOutlet weak var statusImage: UIImageView!
  @IBOutlet weak var proceedBtnOutlet: UIButton!
  
  
  func loadAnswerView() {
    userAnswer.text = "Your answer: " + appdata.userResponse
    let topicIndex = appdata.topicIndex
    var correctAnswerValue = ""
    switch appdata.questionIndex {
      case 0:
        question.text = appdata.quizzes[topicIndex].question1
        correctAnswerValue = appdata.quizzes[topicIndex].question1CorrectAnswer
        correctAnswer.text = "The correct answer is " + correctAnswerValue
        proceedBtnOutlet.setTitle("Next", for: [])
      default:
        question.text = appdata.quizzes[topicIndex].question2
        correctAnswerValue = appdata.quizzes[topicIndex].question2CorrectAnswer
        correctAnswer.text = "The correct answer is " + correctAnswerValue
        proceedBtnOutlet.setTitle("Finish", for: [])
    }
    if (appdata.userResponse == correctAnswerValue) {
      statusImage.image = UIImage(named: "correct")!
    } else {
      statusImage.image = UIImage(named: "wrong")!
    }
  }
  
  @IBAction func quizzesBtn(_ sender: Any) {
    appdata.questionIndex = 0
    performSegue(withIdentifier: "AToQuizzesSegue", sender: self)
  }
  
  @IBAction func proceedBtn(_ sender: Any) {
    switch appdata.questionIndex {
      case 0:
        appdata.questionIndex = 1
        performSegue(withIdentifier: "BackToQuestionSegue", sender: self)
      default:
        appdata.questionIndex = 0
        performSegue(withIdentifier: "AToQuizzesSegue", sender: self)
    }
  }
}

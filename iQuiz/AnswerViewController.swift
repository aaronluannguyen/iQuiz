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
  @IBOutlet weak var correctAnswer: UILabel!
  @IBOutlet weak var statusImage: UIImageView!
  @IBOutlet weak var proceedBtnOutlet: UIButton!
  
  
  func loadAnswerView() {
    let topicIndex = appdata.topicIndex
    switch appdata.questionIndex {
      case 0:
        question.text = appdata.quizzes[topicIndex].question1
        correctAnswer.text = appdata.quizzes[topicIndex].question1CorrectAnswer
        proceedBtnOutlet.setTitle("Next", for: [])
      default:
        question.text = appdata.quizzes[topicIndex].question2
        correctAnswer.text = appdata.quizzes[topicIndex].question2CorrectAnswer
        proceedBtnOutlet.setTitle("Finish", for: [])
    }
    //Handle image here
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

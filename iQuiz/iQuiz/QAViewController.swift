//
//  QAViewController.swift
//  iQuiz
//
//  Created by Aaron Nguyen on 10/29/18.
//  Copyright © 2018 Aaron Nguyen. All rights reserved.
//

import UIKit

class QAViewController: UIViewController {
  
    var appdata = AppData.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        loadQAView()
    }
    

  @IBOutlet weak var questionText: UILabel!
  
  
  @IBAction func quizzesBtn(_ sender: Any) {
    appdata.questionIndex = 0
    performSegue(withIdentifier: "QAToQuizzesSegue", sender: self)
  }
  

  @IBOutlet weak var a1: UIButton!
  @IBOutlet weak var a2: UIButton!
  @IBOutlet weak var a3: UIButton!
  @IBOutlet weak var a4: UIButton!
  @IBOutlet weak var submitBtn: UIButton!
  
  func loadQAView() {
    let topicIndex = appdata.topicIndex
    let quiz = appdata.quizzes[topicIndex]
    switch appdata.questionIndex {
      case 0:
        questionText.text = quiz.question1
        a1.setTitle(quiz.question1Answers[0], for: [])
        a2.setTitle(quiz.question1Answers[1], for: [])
        a3.setTitle(quiz.question1Answers[2], for: [])
        a4.setTitle(quiz.question1Answers[3], for: [])

      default:
        questionText.text = quiz.question2
        a1.setTitle(quiz.question2Answers[0], for: [])
        a2.setTitle(quiz.question2Answers[1], for: [])
        a3.setTitle(quiz.question2Answers[2], for: [])
        a4.setTitle(quiz.question2Answers[3], for: [])
    }
    submitBtn.setTitle("Submit", for: [])
  }
  
  
  @IBAction func btnA1(_ sender: Any) {

  }
  
  @IBAction func btnA2(_ sender: Any) {
    
  }
  
  @IBAction func btnA3(_ sender: Any) {
    
  }
  
  @IBAction func btnA4(_ sender: Any) {
    
  }

  @IBAction func btnSubmit(_ sender: Any) {
    
  }
}

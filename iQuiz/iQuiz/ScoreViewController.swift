//
//  ScoreViewController.swift
//  iQuiz
//
//  Created by Aaron Nguyen on 10/30/18.
//  Copyright © 2018 Aaron Nguyen. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
  
  var appdata = AppData.shared

  override func viewDidLoad() {
    super.viewDidLoad()

    renderScoreLabel()
  }

  @IBOutlet weak var scoreLabel: UILabel!
  
  func renderScoreLabel() {
    scoreLabel.text = "You got " + String(appdata.userScore) + " out of 2!"
  }
  
  @IBAction func btnToQuizzes(_ sender: Any) {
    appdata.userScore = 0
    performSegue(withIdentifier: "FinishToQuizzesSegue", sender: self)
  }
}

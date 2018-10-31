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
      performSegue(withIdentifier: "FinishToQuizzesSegue", sender: self)
    }
    else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
      performSegue(withIdentifier: "FinishToQuizzesSegue", sender: self)
    }
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

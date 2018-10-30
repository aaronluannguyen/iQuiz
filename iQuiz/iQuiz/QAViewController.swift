//
//  QAViewController.swift
//  iQuiz
//
//  Created by Aaron Nguyen on 10/29/18.
//  Copyright © 2018 Aaron Nguyen. All rights reserved.
//

import UIKit

class QAViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  @IBOutlet weak var questionText: UILabel!
  
  
  @IBAction func quizzesBtn(_ sender: Any) {
    performSegue(withIdentifier: "ToQuizzesSegue", sender: self)
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

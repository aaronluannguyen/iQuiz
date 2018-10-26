//
//  ViewController.swift
//  iQuiz
//
//  Created by Aaron Nguyen on 10/25/18.
//  Copyright © 2018 Aaron Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  
  @IBAction func settingsBtn(_ sender: Any) {
    let alert = UIAlertController(title: "Settings", message: "Check back for settings!", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    self.present(alert, animated: true)
  }
}


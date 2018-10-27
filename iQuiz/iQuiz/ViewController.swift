//
//  ViewController.swift
//  iQuiz
//
//  Created by Aaron Nguyen on 10/25/18.
//  Copyright © 2018 Aaron Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var table: UITableView!
  var quizzes = [Quiz]()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    loadQuizzes()
//    self.table.register(QuizTableViewCell.self, forCellReuseIdentifier: "cell")
    table.delegate = self
    table.dataSource = self
    table.tableFooterView = UIView()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func settingsBtn(_ sender: Any) {
    let alert = UIAlertController(title: "Settings", message: "Check back for settings!", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    self.present(alert, animated: true)
  }
  
  struct Quiz {
    var title: String
    var description: String
    var image: UIImage
  }
  
  private func loadQuizzes() {
    let baseballQuizImage = UIImage(named: "baseball")
    let transformersQuizImage = UIImage(named: "transformer")
    let batmanQuizImage = UIImage(named: "batman")
    
    let baseballQuiz = Quiz(title: "Baseball Quiz", description: "A quiz about baseball as a sport and its participants!", image: baseballQuizImage!)
    
    let transformersQuiz = Quiz(title: "Transformers Quiz", description: "Questions about the world of Transformers!", image: transformersQuizImage!)
    
    let batmanQuiz = Quiz(title: "Batman Quiz", description: "Learn more about Batman through a fun and interesting quiz!", image: batmanQuizImage!)
    
    quizzes += [baseballQuiz, transformersQuiz, batmanQuiz]
  }

  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return quizzes.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "cell"
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! QuizTableViewCell
    
    let quiz = quizzes[indexPath.row]
    
    cell.quizTitle?.text = quiz.title
    cell.quizDescription?.text = quiz.description
    cell.quizImage?.image = quiz.image
        
    return cell
  }
}

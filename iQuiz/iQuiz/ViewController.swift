//
//  ViewController.swift
//  iQuiz
//
//  Created by Aaron Nguyen on 10/25/18.
//  Copyright © 2018 Aaron Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  var appdata = AppData.shared
  var quizzes = AppData.shared.quizzes
  
  struct Quiz: Decodable {
    var title: String
    var desc: String
    var questions: [Question]
  }
  
  struct Question: Decodable {
    var text: String
    var answer: String
    var answers: [String]
  }
  
  @IBOutlet weak var table: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    table.delegate = self
    table.dataSource = self
    table.tableFooterView = UIView()
    
    guard let url = URL(string: appdata.jsonURL) else {return}
    print(url)

    URLSession.shared.dataTask(with: url) { (data, response, err) in
      guard let data = data else {return}
      
      do {
        let jsonQuizzes = try JSONDecoder().decode([Quiz].self, from: data)
        print(jsonQuizzes)
      } catch let jsonErr {
        print("Error serializing json: ", jsonErr)
      }
    }.resume()
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

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    appdata.topicIndex = indexPath.row
    appdata.questionIndex = 0
    performSegue(withIdentifier: "ToQuestionSegue", sender: self)
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

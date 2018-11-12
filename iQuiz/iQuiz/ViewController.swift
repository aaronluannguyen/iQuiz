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
  
  @IBOutlet weak var table: UITableView!


  override func viewDidLoad() {
    super.viewDidLoad()
    table.delegate = self
    table.dataSource = self
    table.tableFooterView = UIView()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    getJsonQuizzes()
  }

  func getJsonQuizzes() {
    
    if CheckInternet.Connection() {
      let jsonURL: String = self.getJsonURL()
      guard let url = URL(string: jsonURL) else {return}
      
      URLSession.shared.dataTask(with: url) { (data, response, err) in
        if (err != nil) {
          let alert = UIAlertController(title: "Download Fail", message: "There was an error downloading the quizzes!", preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: {action in self.getJsonQuizzes()}))
          alert.addAction(UIAlertAction(title: "Local Quizzes", style: .default, handler: nil))
          self.present(alert, animated: true)
        }
        
        guard let data: Data = data else {return}
        
        do {
          AppData.shared.quizzes = try JSONDecoder().decode([AppData.Quiz].self, from: data)
          UserDefaults.standard.set(try? PropertyListEncoder().encode(AppData.shared.quizzes), forKey:"localQuizzes")
          DispatchQueue.main.async {
            self.table.reloadData()
          }
        } catch let jsonErr {
          print("Error serializing json: ", jsonErr)
        }
        }.resume()
    } else {
      let alert = UIAlertController(title: "No Internet Connection", message: "You have neither cellular data nor wifi connection at the moment. You will be using the last downloaded set of quizzes", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: {action in self.getJsonQuizzes()}))
      alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
      self.present(alert, animated: true)
    }
    
    if let data = UserDefaults.standard.value(forKey:"localQuizzes") as? Data {
      AppData.shared.quizzes = try! PropertyListDecoder().decode(Array<AppData.Quiz>.self, from: data)
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func getJsonURL() -> String {
    var jsonURL = UserDefaults.standard.object(forKey: "jsonURL") as? String
    if jsonURL == nil {
      UserDefaults.standard.set("http://tednewardsandbox.site44.com/questions.json", forKey: "jsonURL")
      jsonURL = UserDefaults.standard.object(forKey: "jsonURL") as? String
    }
    return jsonURL!
  }

  @IBAction func settingsBtn(_ sender: Any) {
    let jsonURL = self.getJsonURL()
    let alert = UIAlertController(title: "Settings", message: "Enter a url for new quizzes!", preferredStyle: .alert)
    alert.addTextField { (textField) in
      textField.text = jsonURL
    }
    alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
    alert.addAction(UIAlertAction(title: "Check Now", style: .default, handler: {action in
      let textField = alert.textFields![0]
      UserDefaults.standard.set(textField.text, forKey: "jsonURL")
      self.getJsonQuizzes()
    }))
    self.present(alert, animated: true)
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    appdata.topicIndex = indexPath.row
    appdata.questionIndex = 0
    performSegue(withIdentifier: "ToQuestionSegue", sender: self)
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return AppData.shared.quizzes.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "cell"
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! QuizTableViewCell

    let quiz = AppData.shared.quizzes[indexPath.row]
    
    cell.quizTitle?.text = quiz.title
    cell.quizDescription?.text = quiz.desc

    return cell
  }
}

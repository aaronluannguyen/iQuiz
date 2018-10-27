//
//  QuizTableViewController.swift
//  iQuiz
//
//  Created by Aaron Nguyen on 10/26/18.
//  Copyright © 2018 Aaron Nguyen. All rights reserved.
//

import UIKit

class QuizTableViewController: UITableViewController {

  override func viewDidLoad() {
      super.viewDidLoad()
    
      //Load Quizzes
      loadQuizzes()
  }

  struct Quiz {
    var title: String?
    var description: String?
    var image: UIImage?
  }
  

  // MARK: - Table view data source
  var quizzes = [Quiz]()
  
  private func loadQuizzes() {
    let baseballQuizImage = UIImage(named: "baseball")
    let transformersQuizImage = UIImage(named: "transformer")
    let batmanQuizImage = UIImage(named: "batman")
    
    let baseballQuiz = Quiz(title: "Baseball Quiz", description: "A quiz about baseball as a sport and its participants!", image: baseballQuizImage)
    
    let transformersQuiz = Quiz(title: "Transformers Quiz", description: "Questions about the world of Transformers!", image: transformersQuizImage)
    
    let batmanQuiz = Quiz(title: "Batman Quiz", description: "Learn more about Batman through a fun and interesting quiz!", image: batmanQuizImage)
    
    quizzes += [baseballQuiz, transformersQuiz, batmanQuiz]
  }
  

  override func numberOfSections(in tableView: UITableView) -> Int {
      return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return quizzes.count
  }


  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "QuizTableViewCell"
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? QuizTableViewCell else {
      fatalError("Dequeued cell is not an instance of QuizTableViewCell")
    }

    let quiz = quizzes[indexPath.row]
    
    cell.quizTitle.text = quiz.title!
    cell.quizDescription.text = quiz.description!
    cell.quizImage.image = quiz.image!
    
    return cell
  }
}

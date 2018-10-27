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
      // #warning Incomplete implementation, return the number of sections
      return 0
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      // #warning Incomplete implementation, return the number of rows
      return 0
  }

  /*
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

      // Configure the cell...

      return cell
  }
  */

  /*
  // Override to support conditional editing of the table view.
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      // Return false if you do not want the specified item to be editable.
      return true
  }
  */

  /*
  // Override to support editing the table view.
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
          // Delete the row from the data source
          tableView.deleteRows(at: [indexPath], with: .fade)
      } else if editingStyle == .insert {
          // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
      }
  }
  */

  /*
  // Override to support rearranging the table view.
  override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

  }
  */

  /*
  // Override to support conditional rearranging of the table view.
  override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
      // Return false if you do not want the item to be re-orderable.
      return true
  }
  */

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destination.
      // Pass the selected object to the new view controller.
  }
  */
}

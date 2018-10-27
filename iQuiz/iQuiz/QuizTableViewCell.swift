//
//  QuizTableViewCell.swift
//  iQuiz
//
//  Created by Aaron Nguyen on 10/26/18.
//  Copyright © 2018 Aaron Nguyen. All rights reserved.
//

import UIKit

class QuizTableViewCell: UITableViewCell {
  
  //MARK: Properties
  @IBOutlet weak var quizTitle: UILabel!
  @IBOutlet weak var quizDescription: UILabel!
  @IBOutlet weak var quizImage: UIImageView!
  
  
  override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

      // Configure the view for the selected state
  }

}

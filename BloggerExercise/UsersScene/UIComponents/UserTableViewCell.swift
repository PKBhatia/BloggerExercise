//
//  UserTableViewCell.swift
//  BloggerExercise
//
//  Created by Bhatia, Parveen on 10/11/17.
//  Copyright © 2017 Bhatia, Parveen. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var streetAndSuiteLabel: UILabel!
    @IBOutlet weak var cityDetailsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

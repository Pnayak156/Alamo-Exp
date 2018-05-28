//
//  CommentTableViewCell.swift
//  Almofire-Exp
//
//  Created by Prashanta Kumar Nayak on 29/05/18.
//  Copyright © 2018 Prashant. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var emailLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

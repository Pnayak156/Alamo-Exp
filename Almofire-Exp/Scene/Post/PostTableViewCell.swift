//
//  PostTableViewCell.swift
//  Almofire-Exp
//
//  Created by Prashanta Kumar Nayak on 29/05/18.
//  Copyright © 2018 Prashant. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

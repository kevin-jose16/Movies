//
//  ClientTableViewCell.swift
//  Movies
//
//  Created by Dario on 5/12/18.
//  Copyright © 2018 Dario. All rights reserved.
//

import UIKit

class ClientTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

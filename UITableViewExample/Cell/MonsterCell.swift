//
//  MetamongTableViewCell.swift
//  UITableViewExample
//
//  Created by 최민섭 on 01/08/2019.
//  Copyright © 2019 최민섭. All rights reserved.
//

import UIKit

class MonsterCell: UITableViewCell {

    @IBOutlet weak var monsterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

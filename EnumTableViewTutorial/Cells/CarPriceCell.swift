//
//  CarPriceCell.swift
//  EnumTableViewTutorial
//
//  Created by Furkan Arslan on 24/12/2017.
//  Copyright © 2017 Furkan Arslan. All rights reserved.
//

import UIKit

class CarPriceCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellIdentifier() -> String {
        return "CarPriceCell"
    }
    
}

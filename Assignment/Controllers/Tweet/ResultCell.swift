//
//  ResultCell.swift
//  Assignment
//
//  Created by VuongTC on 9/12/18.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell {
    @IBOutlet var mainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with data: String) {
        mainLabel.text = data
    }
    
}

//
//  ImageCell.swift
//  USAF DA
//
//  Created by Bryan Allebone on 03/07/17.
//  Copyright © 2017 kdidigital.com. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    @IBOutlet weak var prodImg: UIImageView!
    @IBOutlet weak var prodTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

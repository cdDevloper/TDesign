//
//  MenuTableViewCell.swift
//  Tripoye
//
//  Created by Chaitanya Patil on 09/08/18.
//  Copyright © 2018 Chaitanya Patil. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    @IBOutlet weak var menuImgView: UIImageView!
    @IBOutlet weak var menuNameLbl: UILabel!
    @IBOutlet weak var menuLineLbl: UILabel!
    @IBOutlet weak var imgWidthConstaint: NSLayoutConstraint!
    @IBOutlet weak var imgLeadingConstaint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

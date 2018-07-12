//
//  CityCell.swift
//  Tripoye
//
//  Created by Chaitanya Patil on 12/07/18.
//  Copyright © 2018 Chaitanya Patil. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {
    @IBOutlet weak var cityImgView: UIImageView!
    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var cityDetailLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

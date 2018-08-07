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

    //CityInfoViewController
    @IBOutlet weak var cityInfoCollectioView: UICollectionView!
    
    //CityViewAll
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var actualPriceLbl: UILabel!
    @IBOutlet weak var discountPriceLbl: UILabel!
    @IBOutlet weak var crossLineLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

class CityHeaderCell: UITableViewCell {
    @IBOutlet weak var cityHeaderLbl: UILabel!
    
    //CityInfoViewController
    @IBOutlet weak var cityInfoHeaderLbl: UILabel!
    @IBOutlet weak var viewAllbBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}


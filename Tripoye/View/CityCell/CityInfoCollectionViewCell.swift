//
//  CityInfoCollectionViewCell.swift
//  Tripoye
//
//  Created by Chaitanya Patil on 14/07/18.
//  Copyright © 2018 Chaitanya Patil. All rights reserved.
//

import UIKit

class CityInfoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cityImgView: UIImageView!
    @IBOutlet weak var cityDetailLbl: UILabel!
    @IBOutlet weak var cityOfferLbl: UILabel!
    @IBOutlet weak var cityOfferView: UIView!
}


class SecondCityInfoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cityImgView: UIImageView!
    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var cityDetailLbl: UILabel!
    @IBOutlet weak var cityPriceLbl: UILabel!
    @IBOutlet weak var likeImg: UIImageView!
}


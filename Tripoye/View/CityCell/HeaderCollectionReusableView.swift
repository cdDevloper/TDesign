//
//  HeaderCollectionReusableView.swift
//  Tripoye
//
//  Created by Chaitanya Patil on 14/07/18.
//  Copyright © 2018 Chaitanya Patil. All rights reserved.
//

import UIKit

protocol CityInfoCollectionSectionHeaderViewDelegate: class {
    func sectionHeaderViewDidTappedButton(_ view: HeaderCollectionReusableView)
}

class HeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var cityInfoHeaderLbl: UILabel!
    @IBOutlet weak var viewAllbBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}



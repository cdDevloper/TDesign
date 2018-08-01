//
//  CityInfoViewController.swift
//  Tripoye
//
//  Created by Chaitanya Patil on 14/07/18.
//  Copyright © 2018 Chaitanya Patil. All rights reserved.
//

import UIKit

class CityInfoViewController: UIViewController {
    
    var showSecondColl = false
    @IBOutlet weak var cityInfoCollectioView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityInfoCollectioView.register(UINib(nibName: StringName.cityInfoCollHeader, bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: StringName.cityInfoCollHeader)//register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: StringName.cityInfoCollHeader)
        self.cityInfoCollectioView.reloadData()
        // Do any additional setup after loading the view.
    }
    
}

extension CityInfoViewController :UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StringName.collViewCityInfoCell, for: indexPath) as! CityInfoCollectionViewCell
        return cell
        
        // let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StringName.secondCollViewCityInfoCell, for: indexPath) as! SecondCityInfoCollectionViewCell
        // return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        
        switch kind {
        case UICollectionElementKindSectionHeader:
            let cellHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: StringName.cityInfoCollHeader, for: indexPath) as! HeaderCollectionReusableView
            
            return cellHeader
        default:
            assert(false, "Unexpected element kind")
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:collectionView.frame.size.width , height:55)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width:(collectionView.frame.size.width/2) - 20 , height:188)
    }
}


//MARK: TableView Delegate and Datasource
extension CityInfoViewController : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 0
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1{
            showSecondColl = false
        }else{
            showSecondColl = true
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: StringName.cityInfoCell, for: indexPath) as! CityCell
        cell.cityInfoCollectioView.reloadData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: StringName.collHeaderCell) as! CityHeaderCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1{
            return 188
        }else{
            return 206
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 60
        }else{
            return 60
        }
    }
    
}

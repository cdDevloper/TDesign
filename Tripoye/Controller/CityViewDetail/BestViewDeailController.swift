//
//  BestViewDeailController.swift
//  Tripoye
//
//  Created by Chaitanya Patil on 07/08/18.
//  Copyright © 2018 Chaitanya Patil. All rights reserved.
//

import UIKit

class BestViewDeailController: UIViewController {

    
    @IBOutlet weak var viewAllTblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAllTblView.separatorStyle = .none
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

}


// Custum Method
extension BestViewDeailController{
    func menuOpen()
    {
        var menu = SlideMenu()
        menu = self.loadSlideMenuWindowNiB()
        menu.frame = self.view.bounds
        menu.registerNibToTblMapMarker()
        menu.menuTblView.reloadData()
        self.view.addSubview(menu)
        self.view.endEditing(true)
        let transition: CATransition = CATransition()
        let timeFunc : CAMediaTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.duration = 0.25
        transition.timingFunction = timeFunc
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        menu.delegate = self
        menu.layer.add(transition, forKey: kCATransition)
    }
}

// MARK: - IBAction Method
extension BestViewDeailController{
    func loadSlideMenuWindowNiB() -> SlideMenu {
        let infoWindow = SlideMenu.instanceFromNib() as! SlideMenu
        return infoWindow
    }
    
    @IBAction func btnCartClicked(_ sender: Any) {
        
    }
    
    @IBAction func btnMenuCliked(_ sender: Any) {
        menuOpen()
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

 // MARK: - UITableviewDelegate and Datasource Method
extension BestViewDeailController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StringName.viewallCityInfo, for: indexPath) as! CityCell
        cell.selectionStyle = .none
       if indexPath.row == 1{
            cell.crossLineLbl.isHidden = true
            cell.actualPriceLbl.isHidden = true
       }else{
           cell.crossLineLbl.isHidden = false
           cell.actualPriceLbl.isHidden = false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


extension BestViewDeailController: SlideMenuDelegate{
    func menuSelectedWith(index: Int) {
        switch index {
        case SelectedMenuType.city:
            print("city")
        case SelectedMenuType.myFavou:
            print("city")
        case SelectedMenuType.myCart:
            print("city")
        case SelectedMenuType.myOrder:
            print("city")
        case SelectedMenuType.myProfile:
            print("city")
        case SelectedMenuType.myChat:
            print("city")
        case SelectedMenuType.changeCurrency:
            print("city")
        case SelectedMenuType.signIn:
            print("city")
        case SelectedMenuType.referFriend:
            print("city")
        case SelectedMenuType.faq:
            let cityInfoCntrl = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.faqViewController) as! FAQViewController
            self.navigationController?.pushViewController(cityInfoCntrl, animated: true)
        case SelectedMenuType.helpAndSupport:
            print("city")
        case SelectedMenuType.terms:
            let termConditionController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.termConditionController) as! TermConditionController
            self.navigationController?.pushViewController(termConditionController, animated: true)
            
        case SelectedMenuType.privacy:
            let termConditionController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.termConditionController) as! TermConditionController
            self.navigationController?.pushViewController(termConditionController, animated: true)
        default:
            print("default")
        }
    }
}

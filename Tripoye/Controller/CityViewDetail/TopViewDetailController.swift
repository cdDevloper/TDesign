//
//  TopViewDetailController.swift
//  Tripoye
//
//  Created by Chaitanya Patil on 08/08/18.
//  Copyright © 2018 Chaitanya Patil. All rights reserved.
//

import UIKit

class TopViewDetailController: UIViewController {

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
extension TopViewDetailController{
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
        menu.layer.add(transition, forKey: kCATransition)
    }
}

// MARK: - IBAction Method
extension TopViewDetailController{
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
extension TopViewDetailController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StringName.viewallCityInfo) as! CityCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

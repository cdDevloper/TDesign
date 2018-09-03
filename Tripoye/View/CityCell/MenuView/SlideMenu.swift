//
//  SlideMenu.swift
//  Tripoye
//
//  Created by Chaitanya Patil on 09/08/18.
//  Copyright © 2018 Chaitanya Patil. All rights reserved.
//

import UIKit


protocol SlideMenuDelegate{
    func menuSelectedWith(index:Int)
}

struct SelectedMenuType {
    static let  city:Int = 0
    static let  myFavou = 1
    static let  myCart = 2
    static let  myOrder = 3
    static let  myProfile = 4
    static let  myChat = 5
    static let  changeCurrency = 6
    static let  signIn = 7
    static let  referFriend = 8
    static let  faq = 9
    static let  helpAndSupport = 10
    static let  terms = 11
    static let  privacy = 12
}

class SlideMenu: UIView {
    
   
   @IBOutlet var menuTblView: UITableView!
    let arrMenu = ["City","My Favourite","My Cart","My Order", "My Profile","My Chat","Change Currency","Sign In","Refer a friend", "FAQ's", "Help and Supports","Terms and Conditions","Privacy Policy"]
    var delegate:SlideMenuDelegate!
    class func instanceFromNib() -> UIView {
        return UINib(nibName: StringName.slideMenuNibName, bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
    }
    
    func registerNibToTblMapMarker(){
        menuTblView.register(UINib(nibName: StringName.headerNibName, bundle: nil), forCellReuseIdentifier:StringName.headerMenuCell )
        menuTblView.register(UINib(nibName: StringName.menuNibName, bundle: nil), forCellReuseIdentifier: StringName.menuCell)
        menuTblView.separatorStyle = .none
        menuTblView.estimatedRowHeight = 42
        menuTblView.rowHeight = UITableViewAutomaticDimension
        menuTblView.estimatedSectionHeaderHeight = 170
        menuTblView.sectionHeaderHeight = UITableViewAutomaticDimension
        menuTblView.tableFooterView = UIView()
    }
    
    @IBAction func btnBlackPress(_ sender: Any) {
        self.removeFromSuperview()
    }
    

}

extension SlideMenu : UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:StringName.menuCell , for: indexPath) as! MenuTableViewCell
        cell.selectionStyle = .none
        cell.menuNameLbl.text = arrMenu[indexPath.row]
        if indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 4 || indexPath.row == 9{
            cell.menuLineLbl.isHidden = false
        }else{
            cell.menuLineLbl.isHidden = true
        }
        
        if indexPath.row > 8{
            cell.imgLeadingConstaint.constant = 10
            cell.imgWidthConstaint.constant = 0
        }else{
            cell.imgLeadingConstaint.constant = 10
            cell.imgWidthConstaint.constant = 35
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let headerCell = tableView.dequeueReusableCell(withIdentifier: StringName.headerMenuCell) as! HeaderMenuViewCell
        headerView.addSubview(headerCell)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate.menuSelectedWith(index: indexPath.row)
    }
    
    
    
}

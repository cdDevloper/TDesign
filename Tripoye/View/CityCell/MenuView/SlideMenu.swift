//
//  SlideMenu.swift
//  Tripoye
//
//  Created by Chaitanya Patil on 09/08/18.
//  Copyright © 2018 Chaitanya Patil. All rights reserved.
//

import UIKit

class SlideMenu: UIView {
    
   @IBOutlet var menuTblView: UITableView!
    let arrMenu = ["City","My Favourite","My Cart","My Order", "My Profile","My Chat","Change Currency","Sign In","Refer a friend", "FAQ's", "Help and Supports","Terms and Conditions","Privacy Policy"]
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
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

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
    
    
    
}

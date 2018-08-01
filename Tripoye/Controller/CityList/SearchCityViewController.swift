//
//  SearchCityViewController.swift
//  Tripoye
//
//  Created by Chaitanya Patil on 13/07/18.
//  Copyright © 2018 Chaitanya Patil. All rights reserved.
//

import UIKit

class SearchCityViewController: UIViewController {
    @IBOutlet weak var citySearchTbl: UITableView!
    @IBOutlet weak var searchTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
}

//MARK: IBAction Method
extension SearchCityViewController{
    @IBAction func btnBackPress(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: TableView Delegate and Datasource
extension SearchCityViewController : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
             return 1
        }else{
             return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StringName.cityName, for: indexPath) as! CityCell
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: StringName.cityHeader) as! CityHeaderCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityInfoCntrl = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.cityInfoViewController) as! CityInfoViewController
        self.navigationController?.pushViewController(cityInfoCntrl, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }else{
            return 60
        }
    }
    
}

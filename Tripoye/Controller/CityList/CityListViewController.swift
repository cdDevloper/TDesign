//
//  CityListViewController.swift
//  Tripoye
//
//  Created by Chaitanya Patil on 12/07/18.
//  Copyright © 2018 Chaitanya Patil. All rights reserved.
//

import UIKit

class CityListViewController: UIViewController {
    
    @IBOutlet weak var cityListTbl: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var cityNameLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarImage(image:Image.whiteIcon)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = Color.navigationBar
        self.navigationItem.setHidesBackButton(true, animated:true);
    }
    
    
}

extension CityListViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StringName.cityCell) as! CityCell
        return cell
    }
}

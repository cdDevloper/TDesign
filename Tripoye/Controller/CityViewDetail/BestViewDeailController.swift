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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnCartClicked(_ sender: Any) {
        
    }
    
    @IBAction func btnMenuCliked(_ sender: Any) {
        
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension BestViewDeailController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StringName.viewallCityInfo) as! CityCell
       // if indexPath.row == 1{
            cell.crossLineLbl.isHidden = true
            cell.actualPriceLbl.isHidden = true
      //  }else{
      //      cell.crossLineLbl.isHidden = false
     //       cell.actualPriceLbl.isHidden = false
       // }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

//
//  FAQViewController.swift
//  Tripoye
//
//  Created by Chaitanya Patil on 20/08/18.
//  Copyright © 2018 Chaitanya Patil. All rights reserved.
//

import UIKit

class FAQViewController: UIViewController {
    
 @IBOutlet weak var faqTblView: UITableView!
    var selectedIndex = -1
    var arrSelectedIndex = [0,0,0,0,0,0]
    var selectedIndexpath :IndexPath?
    let arrQuestion = ["Why to book tours online?", "Booking tickets online? is it safe?", "Is there facility to pay in cash?","Why to book tours online?", "Booking tickets online? is it safe?", "Is there facility to pay in cash?"]
    
    let arrAns = ["Third and final step, Swift needs to know when to pass each value to the cell height. We do a similar check here, with if/else. I know you can made the code much shorter, but I'm typing everything out so other people can understand it easily, too:", "Booking tickets online? is it safe?Third and final step, Swift needs to know when to pass each value to the cell height. We do a similar check here, with if/else. I know you.", "Third and final step, Swift needs to know when to pass each value to the cell height.","Third and final step, Swift needs to know when to pass each value to the cell height. We do a similar check here, with if/else. I know you can made the code much shorter, but I'm typing everything out so other people can understand it easily, too:", "Booking tickets online? is it safe?Third and final step, Swift needs to know when to pass each value to the cell height. We do a similar check here, with if/else. I know you.", "Third and final step, Swift needs to know when to pass each value to the cell height."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        faqTblView.separatorStyle = .none
        faqTblView.estimatedRowHeight = 42
        faqTblView.rowHeight = UITableViewAutomaticDimension
        faqTblView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension FAQViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrAns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StringName.faqCell) as! CityCell
        
         cell.questionLbl.text = arrQuestion[indexPath.row]
         cell.answerLbl.text = arrAns[indexPath.row]
         cell.answerLbl.isHidden = true
        if arrSelectedIndex[indexPath.row] == 1{
            cell.answerLbl.isHidden = false
            cell.lblQuestionBottomToAnslblCostrint.isActive = true
            cell.lblAnsBottomToCellCostrint.isActive = true
            cell.lblQuestCellBottomConstraint.isActive = false
        }else{
            cell.lblQuestionBottomToAnslblCostrint.isActive = false
            cell.lblAnsBottomToCellCostrint.isActive = false
            cell.lblQuestCellBottomConstraint.isActive = true
            cell.lblQuestCellBottomConstraint.constant = 10.0
        }
        cell.selectionStyle = .none
        cell.layer.cornerRadius = 5
        
        cell.layer.masksToBounds = false
        cell.layer.shadowOffset = CGSize(width: 0, height: 5)
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowRadius = 2
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if arrSelectedIndex[indexPath.row] == 1{
            arrSelectedIndex[indexPath.row] = 0
        }else{
            arrSelectedIndex[indexPath.row] = 1
        }
        
//         if selectedIndex != indexPath.row{
//            if selectedIndex != -1{
//                selectedIndex = -2
//                tableView.reloadRows(at: [selectedIndexpath!], with: UITableViewRowAnimation.none)
//            }
//            selectedIndexpath = indexPath
//            selectedIndex = indexPath.row
            tableView.reloadData()
        //}
      
    }
}


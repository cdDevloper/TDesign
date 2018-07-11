//
//  ForgotViewController.swift
//  Tripoye
//
//  Created by Chaitanya Patil on 11/07/18.
//  Copyright © 2018 Chaitanya Patil. All rights reserved.
//

import UIKit

class ForgotViewController: UIViewController {
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var emailTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: IBAction Method
extension ForgotViewController{
    @IBAction func btnSendPress(_ sender: Any) {
        
    }
    
    @IBAction func btnBackPress(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

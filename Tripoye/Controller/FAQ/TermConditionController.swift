//
//  TermConditionController.swift
//  Tripoye
//
//  Created by Chaitanya Patil on 03/09/18.
//  Copyright © 2018 Chaitanya Patil. All rights reserved.
//

import UIKit

class TermConditionController: UIViewController {

    @IBOutlet var txtView:UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnBlackPress(_ sender: Any) {
       self.navigationController?.popViewController(animated: true)
    }
}

//
//  SignupViewController.swift
//  Tripoye
//
//  Created by Chaitanya Patil on 11/07/18.
//  Copyright © 2018 Chaitanya Patil. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    @IBOutlet weak var fbBtn: UIButton!
    @IBOutlet weak var googleBtn: UIButton!
    @IBOutlet weak var createBtn: UIButton!
    
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

//MARK: IBAction Method
extension SignupViewController{
    
    @IBAction func btnCreateAccountPress(_ sender:Any){
        
    }
    
    @IBAction func btnFBPress(_ sender:Any){
        
    }
    
    @IBAction func btnGooglePress(_ sender:Any){
        
    }
    
    @IBAction func btnBackPress(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

//
//  LoginViewController.swift
//  Tripoye
//
//  Created by Chaitanya Patil on 11/07/18.
//  Copyright © 2018 Chaitanya Patil. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var fbBtn: UIButton!
    @IBOutlet weak var googleBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var forgotBtn: UIButton!
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
}

//MARK: IBAction Method
extension LoginViewController{
    
    @IBAction func btnLogInPress(_ sender: Any) {
        
    }
    
    @IBAction func btnSignupPress(_ sender:Any){
        let signupCntrl = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.signupViewController) as! SignupViewController
        self.navigationController?.pushViewController(signupCntrl, animated: true)
    }
    
    @IBAction func btnFBPress(_ sender:Any){
        
    }
    
    @IBAction func btnGooglePress(_ sender:Any){
        
    }
    
    @IBAction func btnForgotPasswordPress(_ sender:Any){
        let forgotCntrl = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.forgotViewController) as! ForgotViewController
        self.navigationController?.pushViewController(forgotCntrl, animated: true)
    }
    
}

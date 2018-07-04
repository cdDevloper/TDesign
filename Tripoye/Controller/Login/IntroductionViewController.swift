//
//  LoginViewController.swift
//  Tripoye
//
//  Created by Chaitanya Patil on 01/07/18.
//  Copyright © 2018 Chaitanya Patil. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {
    
    @IBOutlet var imageSlideView: ImageSlideshow!
    @IBOutlet weak var fbBtn: UIButton!
    @IBOutlet weak var googleBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    
    var alamofireSource :[InputSource] = [ImageSource(imageString: "slide1")!, ImageSource(imageString: "slide1")!, ImageSource(imageString: "slide1")!, ImageSource(imageString: "slide1")!]
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setup SlideView
        self.setupSlideView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
}

//MARK: Cuatum Method
extension IntroductionViewController{
    func setupSlideView(){
        imageSlideView.slideshowInterval = 5.0
        imageSlideView.pageControlPosition = PageControlPosition.insideScrollView
        imageSlideView.pageControl.currentPageIndicatorTintColor = UIColor.gray
        imageSlideView.pageControl.pageIndicatorTintColor = UIColor.white
        imageSlideView.contentScaleMode = UIViewContentMode.center
        
        if self.alamofireSource.count != 0{
            imageSlideView.setImageInputs(self.alamofireSource)
        }
        imageSlideView.activityIndicator = DefaultActivityIndicator()
    }
}

//MARK: IBAction Method
extension IntroductionViewController{
    
    @IBAction func btnLogInPress(_ sender: Any) {
        
    }
    
    @IBAction func btnSignupPress(_ sender:Any){
        
    }
    
    @IBAction func btnFBPress(_ sender:Any){
        
    }
    
    @IBAction func btnGooglePress(_ sender:Any){
        
    }
    
    @IBAction func btnSkipPress(_ sender:Any){
        
    }
    
}




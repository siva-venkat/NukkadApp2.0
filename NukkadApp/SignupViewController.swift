//
//  SignupViewController.swift
//  NukkadApp
//
//  Created by systimanx on 11/01/18.
//  Copyright © 2018 systimanx. All rights reserved.
//

import UIKit

class SignupViewController: APPViewController {
    
    
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var mobileNumberText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmPasswordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        var signUpMode:Bool = false

    }
    
    
    @IBAction func signupAction(_ sender: Any) {
        
        let user = NAUser()
        user.firstName = firstNameText.text
        user.lastName = lastNameText.text
        user.mobileNumber = mobileNumberText.text
        user.email = emailText.text
        user.password = passwordText.text
        user.osName = ""
        user.osVersion = ""
           _ = self.prepareUIForService(promise:NAConnection.register(user: user).then(execute: { (message) -> Void in
                UIApplication.shared.keyWindow?.rootViewController = AppNavigationController(rootViewController: DashboardViewController.instance())
            }))
        }
    
}

//
//  LoginViewController.swift
//  NukkadApp
//
//  Created by systimanx on 09/01/18.
//  Copyright © 2018 systimanx. All rights reserved.
//

import UIKit

class LoginViewController: APPViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

}
    
    @IBAction func loginAction(_ sender: Any) {
        if (emailTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)!  {
            showToast(message: "Both values are required")
        } else if (emailTextField.text?.validEmail())! == false {
            showToast(message: "Invalid email entered")
        } else {
            _ = self.prepareUIForService(promise: NAConnection.login(email: emailTextField.text!, password: passwordTextField.text!, osName: "", osVersion: "").then(execute: { (user) -> Void in
                let signupViewController = SignupViewController.instance() as! SignupViewController
                UIApplication.shared.keyWindow?.rootViewController = AppNavigationController(rootViewController: signupViewController)
            }))
        }
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "Please enter your email", preferredStyle: .alert)
        var textfield: UITextField!
        alert.addTextField { textField in
            textField.placeholder = "Email"
            textfield = textField
        }
        alert.addAction(UIAlertAction(title: "Cancel", style:.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Retrieve", style:.default, handler:{ action in
            _ = self.prepareUIForService(promise: NAConnection.forgotPassword(email: textfield.text!).then(execute: { message -> Void in
                let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Done", style:.cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }))
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

    


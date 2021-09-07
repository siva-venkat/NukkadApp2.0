//
//  ViewController.swift
//  NukkadApp
//
//  Created by systimanx on 12/12/17.
//  Copyright © 2017 systimanx. All rights reserved.
//

import UIKit

class ViewController: APPViewController {

    @IBOutlet weak var zipCodeText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zipCodeText.layer.borderWidth = 3.0
        zipCodeText.layer.borderColor = #colorLiteral(red: 0.9454804063, green: 0.5906256437, blue: 0.2002735734, alpha: 1)
        zipCodeText.leftViewMode =  UITextFieldViewMode.always
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}




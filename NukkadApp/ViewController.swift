//
//  ViewController.swift
//  NukkadApp
//
//  Created by systimanx on 12/12/17.
//  Copyright © 2017 systimanx. All rights reserved.
//

import UIKit

class ViewController: APPViewController {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
 self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}




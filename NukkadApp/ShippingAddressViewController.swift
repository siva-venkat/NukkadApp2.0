//
//  ShippingAddressViewController.swift
//  NukkadApp
//
//  Created by systimanx on 17/01/18.
//  Copyright © 2018 systimanx. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class ShippingAddressViewController: APPViewController,UITextFieldDelegate {
   
    

    @IBOutlet weak var dispalyTextField: UITextField!
    
    @IBOutlet weak var stateDisplayText: UITextField!
    @IBOutlet weak var sameAddressChkBtn: UIButton!
   
    let listArray = ["India", "China", "Russia"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let paddingView = UIView(frame: CGRect(x: 0, y:0, width: 10, height: 10))
        
        let paddingView1 = UIView(frame: CGRect(x: 0, y:0, width: 10, height: 10))
        dispalyTextField.delegate = self
        dispalyTextField.layer.borderWidth = 2
        dispalyTextField.layer.borderColor = UIColor.lightGray.cgColor
        dispalyTextField.layer.cornerRadius = 20;
        dispalyTextField.leftView = paddingView
        dispalyTextField.leftViewMode = UITextFieldViewMode.always
        stateDisplayText.delegate = self
        stateDisplayText.layer.borderWidth = 2
        stateDisplayText.layer.borderColor = UIColor.lightGray.cgColor
        stateDisplayText.layer.cornerRadius = 20;
        stateDisplayText.leftView = paddingView1
        stateDisplayText.leftViewMode = UITextFieldViewMode.always
        self.setStateChangeForButton(button:sameAddressChkBtn )

    }
   
    func setStateChangeForButton(button:UIButton)
    {
        if button.isSelected {
            // set selected
            button.isSelected = true
            
        } else {
            // set deselected
            button.isSelected = false
        }
    }
    
    
    @IBAction func selectCountryAction(_ sender: Any) {
        
        
        let alertController = UIAlertController(title: nil, message: "Select A Country", preferredStyle: .actionSheet)
//        let actionSheet = UIAlertController.init(title:nil, message: "Select A Country", preferredStyle: .actionSheet)
//        if UI_USER_INTERFACE_IDIOM() == .pad  {
//            // show action sheet
//            actionSheet.popoverPresentationController?.sourceView = sender as? UIView
//        }
        for CountryList in ["India","Australia","China","America"] {
            alertController.addAction(UIAlertAction(title: CountryList, style: .default, handler: { (action) in
                self.dispalyTextField.text = CountryList
            }))
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func selectStateAction(_ sender: Any) {
        
        
        let alertController = UIAlertController(title: nil, message: "Select A City", preferredStyle: .actionSheet)
        
        for StateList in ["TamilNadu","Kerala","AndraPradesh","Assam","Gujarat"] {
            alertController.addAction(UIAlertAction(title: StateList, style: .default, handler: { (action) in
                self.stateDisplayText.text = StateList
            }))
        }
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
}



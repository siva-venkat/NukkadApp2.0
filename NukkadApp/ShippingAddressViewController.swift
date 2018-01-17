//
//  ShippingAddressViewController.swift
//  NukkadApp
//
//  Created by systimanx on 17/01/18.
//  Copyright © 2018 systimanx. All rights reserved.
//

import UIKit

class ShippingAddressViewController: APPViewController,UIPickerViewDelegate,UIPickerViewDataSource, UITextFieldDelegate {
   
    

    @IBOutlet weak var dispalyTextField: UITextField!
    
    @IBOutlet weak var sameAddressChkBtn: UIButton!
    @IBOutlet weak var countryPickerView: UIPickerView!
    let listArray = ["India", "China", "Russia"]
    override func viewDidLoad() {
        super.viewDidLoad()
   self.setStateChangeForButton(button:sameAddressChkBtn )
//        countryPickerView = UIPickerView()
          countryPickerView.delegate = self
          countryPickerView.dataSource = self
          countryPickerView.isHidden = true
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
}
    public  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return listArray.count
}
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        self.view.endEditing(true)
        return listArray[row]

}
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.dispalyTextField.text = self.listArray[row]
        self.countryPickerView.isHidden = true
        
}
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.dispalyTextField {
            self.countryPickerView.isHidden = false
            //if you dont want the users to se the keyboard type:
            
            textField.endEditing(true)
        }
        
    }
    func setStateChangeForButton(button:UIButton)
    {
        if button.isSelected {
            // set selected
            button.isSelected = false
            
        } else {
            // set deselected
            button.isSelected = true
        }
    }
    
}


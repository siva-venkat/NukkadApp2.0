//
//  ProductDetailsViewController.swift
//  NukkadApp
//
//  Created by systimanx on 08/01/18.
//  Copyright © 2018 systimanx. All rights reserved.
//

import UIKit

class ProductDetailsViewController: APPViewController {
//   var cartCount: Int = 0
//    var minusCount: Int = 0
    var minusCount: Int = 0
    var plusCount: Int = 0
    var count = NACount()
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var addCartBtn: UIButton!
    @IBOutlet weak var countDisplayLbl: UILabel!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var offersPopupView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureMinusCountLabel()
        configurePlusCountLabel()
        offersPopupView.isHidden = true
        self.offersPopupView.layer.shadowOpacity = 0.8
    }
    
    @IBAction func minusAction(_ sender: UIButton) {
        if sender.tag == 0 {
            if minusCount != 0 {
                minusCount = minusCount - 1
            }
        } else {
            minusCount = minusCount + 1
        }
        configureMinusCountLabel()
    }
    
func configureMinusCountLabel(){
    
    countDisplayLbl.text = "\(minusCount)"
}

    
    @IBAction func plusAction(_ sender: UIButton) {
        if sender.tag == 0 {
            if plusCount != 0 {
                plusCount = plusCount - 1
            }
        } else {
            plusCount = plusCount + 1
        }
        configurePlusCountLabel()
    }
    func configurePlusCountLabel(){
        count.no_of_adults = "\(plusCount)"
        countDisplayLbl.text =  count.no_of_adults
    }

    
    override func leftBarButtonConfig() -> (barButtonType?, Any?) {
        return (.kImage, #imageLiteral(resourceName: "ic_hambuger"))
    }
    override func rightBarButtonconfig() -> (barButtonType?, Any?) {
        return (.kImage,#imageLiteral(resourceName: "ic_cartcount"))
    }
    
    override func leftBarButtonAction() {
        self.showHamburger()
    }
    
    @IBAction func offersAction(_ sender: Any) {
        offersPopupView.isHidden = false
    }
    
    @IBAction func popupCloseAction(_ sender: Any) {
         offersPopupView.isHidden = true
    }
}


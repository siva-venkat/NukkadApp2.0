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
        offersPopupView.isHidden = true
        self.offersPopupView.layer.shadowOpacity = 0.8
    }
    
    @IBAction func minusAction(_ sender: Any) {

    }
    
    @IBAction func plusAction(_ sender: UIButton) {
    
    }
    
    override  func leftBarButtonConfig() -> (barButtonType?, Any?) {
        return (.kImage,#imageLiteral(resourceName: "ic_back"))
    }
    
    override func rightBarButtonconfig() -> (barButtonType?, Any?) {
        return (.kImage,#imageLiteral(resourceName: "ic_cartcount"))
    }
    
    @IBAction func offersAction(_ sender: Any) {
        offersPopupView.isHidden = false
    }
    
    @IBAction func popupCloseAction(_ sender: Any) {
         offersPopupView.isHidden = true
    }
}


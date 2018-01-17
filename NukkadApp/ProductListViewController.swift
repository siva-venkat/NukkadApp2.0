//
//  ProductListViewController.swift
//  NukkadApp
//
//  Created by systimanx on 14/12/17.
//  Copyright © 2017 systimanx. All rights reserved.
//

import UIKit

class ProductListCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!

    @IBOutlet weak var brandImg: UIImageView!
    
   
    @IBOutlet weak var offerLbl: UILabel!
    @IBOutlet weak var brandNameLbl: UILabel!
    
    @IBOutlet weak var waitLbl: UILabel!
    
    
    @IBOutlet weak var priceLbl: UILabel!
    
    @IBOutlet weak var addCartBtn: UIButton!
   
    @IBOutlet weak var heartBtn: UIButton!
    
    @IBOutlet weak var countView: UIView!
    
    @IBOutlet weak var minusBtn: UIButton!
    
    @IBOutlet weak var plusBtn: UIButton!
    
    @IBOutlet weak var countLbl: UILabel!
   
}

class ProductListViewController: APPViewController, UICollectionViewDelegate,UICollectionViewDataSource {

    
    @IBOutlet weak var productNamesCollectionView: UICollectionView!
    
    @IBOutlet weak var productDetailsCollectionView: UICollectionView!
   

    let picksCell = "ProductListId"
    let brandCell = "ProductViewId"
    var cellSelectedIndex:Int?
    var cartCount = 0
    
    var titleArray = ["SOFT DRINK", "COOL DRINK", "HEALTH DRINK","FRUIT DRINK","MINERAL DRINK", "BADAM DRINK"]
   
    let productsPackage = ["productItems","productPrice","productOffers","productWaits","productImg"]
    let productItems  = ["Oil", "Vegetables", "Cooldrinks","GreenFood","StationaryItems", "Fruits"]
    let productPrice = ["$50.10","$70.20","$80.30","$90","$80.40","$90.50"]
    let productOffers = ["10% OFF", "20% OFF","40% OFF","50% OFF","40% OFF","50% OFF"]
    let productWaits = ["3Kg","4Kg","5Kg","6Kg","5Kg","6Kg"]
    let productImg = ["ic_oil", "ic_greenfood", "ic_cooldrinks","ic_oil", "ic_greenfood","ic_shopcart"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productNamesCollectionView.delegate = self
        productNamesCollectionView.dataSource = self
        productDetailsCollectionView.delegate = self
        productDetailsCollectionView.dataSource = self
        
       }
    override  func leftBarButtonConfig() -> (barButtonType?, Any?) {
        return (.kImage,#imageLiteral(resourceName: "ic_back"))
    }
    override func rightBarButtonconfig() -> (barButtonType?, Any?) {
        return (.kImage,#imageLiteral(resourceName: "ic_cartcount"))
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case  0:
            return titleArray.count
        case  1:
            return productItems.count
        default:
            return 0
        }
       
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.productNamesCollectionView {
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductListId" , for: indexPath ) as! ProductListCell
            cellA.titleLbl.text = titleArray[indexPath.row]
          return cellA
            
        }
        else {
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductViewId" , for: indexPath ) as! ProductListCell
            
            
            cellB.priceLbl.text = productPrice[indexPath.row]
            cellB.brandImg?.image = UIImage(named: productImg[indexPath.row])
            cellB.brandNameLbl.text = productItems[indexPath.row]
            cellB.waitLbl.text = productWaits[indexPath.row]
            cellB.offerLbl.text = productOffers[indexPath.row]
            cellB.heartBtn.addTarget(self,action: #selector(setStateForButton),for: UIControlEvents.touchUpInside)
//            cellB.addCartBtn.addTarget(self,action: #selector(addcartcount),for: UIControlEvents.touchUpInside)
//          
//            cellB.minusBtn.addTarget(self,action: #selector(countDisplayButton),for: UIControlEvents.touchUpInside)
//            cellB.plusBtn.addTarget(self,action: #selector(setStateForButton),for: UIControlEvents.touchUpInside)
//           cellB.countLbl.text = "\(cartCount)"
            return cellB
        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        titleArray = [productsPackage[indexPath.row]]
        productDetailsCollectionView.reloadData()

        let produtsCategories = productNamesCollectionView.cellForItem(at: indexPath) as! ProductListCell
        produtsCategories.titleLbl.backgroundColor = UIColor.gray
        produtsCategories.titleLbl.textColor = UIColor.black
        
        if cellSelectedIndex != nil {
            let cellSelected = productNamesCollectionView.cellForItem(at: IndexPath.init(row: cellSelectedIndex!, section: 0)) as! ProductListCell
            cellSelected.titleLbl.textColor = UIColor.white
           
        }
        cellSelectedIndex = indexPath.row
    
    }
    
   @objc func setStateForButton(sender: UIButton) {

        if sender.isSelected == false {
            sender.isSelected = true
        } else {
            sender.isSelected = false
        }
    
    }
    
    @objc func countDisplayButton(button:UIButton!) {
//      countLbl.text = "\(cartCount)"

        if button.tag == 0 {
            if cartCount != 0 {
    cartCount = cartCount - 1
    }
    } else {
    cartCount = cartCount + 1
    }
    }
}


    



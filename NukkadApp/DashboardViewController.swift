//
//  DashboardViewController.swift
//  NukkadApp
//
//  Created by systimanx on 13/12/17.
//  Copyright © 2017 systimanx. All rights reserved.
//

import UIKit


class DashboardCell: UICollectionViewCell {
    
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var proName: UILabel!
    @IBOutlet weak var offLbl: UILabel!
    @IBOutlet weak var waitLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var brandImg: UIImageView!
    @IBOutlet weak var brandName: UILabel!
}

 class DashboardViewController: APPViewController,UICollectionViewDelegate,UICollectionViewDataSource{
   
    @IBOutlet weak var scrolView: UIScrollView!
    @IBOutlet weak var collectionAView: UICollectionView!
    @IBOutlet weak var collectionBView: UICollectionView!
    @IBOutlet weak var brandImg: UIImageView!
    @IBOutlet weak var oilBtn: UIButton!
    @IBOutlet weak var vegBtn: UIButton!
    @IBOutlet weak var drinksBtn: UIButton!
    @IBOutlet weak var greenBtn: UIButton!
    
    
    let picksCell = "pickId"
    let brandCell = "brandId"
    
    let productItems  = ["Oil", "Vegetables", "Cooldrinks","GreenFood","StationaryItems", "Fruits"]
    let productPrice = ["$50.10","$70.20","$80.30","$90","$80.40","$90.50"]
    let productOffers = ["10% OFF", "20% OFF","40% OFF","50% OFF","40% OFF","50% OFF"]
    let productWaits = ["3Kg","4Kg","5Kg","6Kg","5Kg","6Kg"]
    let productImg = ["ic_oil", "ic_greenfood", "ic_cooldrinks","ic_oil", "ic_greenfood","ic_shopcart"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionAView.delegate = self
        collectionAView.dataSource = self
        collectionBView.delegate = self
        collectionBView.dataSource = self
        
        self.setShadowForButton(button: oilBtn)
        self.setShadowForButton(button: vegBtn)
        self.setShadowForButton(button: greenBtn)
        self.setShadowForButton(button: drinksBtn)
       
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productItems.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionAView {
        let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: "pickId" , for: indexPath ) as! DashboardCell
        
        
        cellA.priceLbl.text = productPrice[indexPath.row]
        cellA.productImg?.image = UIImage(named: productImg[indexPath.row])
        cellA.proName.text = productItems[indexPath.row]
        cellA.waitLbl.text = productWaits[indexPath.row]
        cellA.offLbl.text = productOffers[indexPath.row]
        return cellA
        
    }
        else {
         let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: "brandId" , for: indexPath ) as! DashboardCell
            cellB.brandImg?.image = UIImage(named:productImg[indexPath.row])
            cellB.brandName.text = productItems[indexPath.row]
            
         return cellB
        }
    }
    override func leftBarButtonAction() {
        if let count = self.navigationController?.viewControllers.count, count > 1 {
            return super.leftBarButtonAction()
        } else {
            showHamburger()
        }
    }
    func setShadowForButton(button: UIButton!){
        button.layer.shadowOffset = CGSize(width: 0.0, height:2.0)
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 2.0
        button.layer.shadowOpacity = 0.5
        button.layer.backgroundColor = UIColor.white.cgColor
        button.layer.shadowColor = UIColor.gray.cgColor
    }
    override  func leftBarButtonConfig() -> (barButtonType?, Any?) {
        return (.kImage,#imageLiteral(resourceName: "ic_hambuger"))
    }
    override func rightBarButtonconfig() -> (barButtonType?, Any?) {
        return (.kImage,#imageLiteral(resourceName: "ic_cartcount"))
    }
    

}



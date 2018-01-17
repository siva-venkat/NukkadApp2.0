//
//  CartListViewController.swift
//  NukkadApp
//
//  Created by systimanx on 09/01/18.
//  Copyright © 2018 systimanx. All rights reserved.
//

import UIKit

class CartListCell: UITableViewCell {
    
    @IBOutlet weak var productImg: UIImageView!
   
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var categoryTableView: UITableView!
    
}

class CartListViewController: APPViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var cartListTableView: UITableView!
    
   
    let textCellIdentifier = "CartListCell"
    let ProductImages =  ["ic_cooldrinks", "ic_oil", "ic_cooldrinks", "ic_oil"]
    let ProductNames = ["Sun flower oil", "Sprite","Maazza","Sun Rich"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
}
    
    
    //MARK UITableViewDelgate Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProductImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "CartListCell", for: indexPath) as! CartListCell
        
            cell.titleLbl?.text = ProductNames[indexPath.row]
            cell.productImg?.image = UIImage(named:ProductImages[indexPath.row])

        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
    }
    override  func leftBarButtonConfig() -> (barButtonType?, Any?) {
        return (.kImage,#imageLiteral(resourceName: "ic_close"))
    }
    
    override func configTitle(){
        self.navigationItem.title = "Your Cart"
    }
    
}

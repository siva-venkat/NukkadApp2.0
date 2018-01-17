//
//  CategoriesListViewController.swift
//  NukkadApp
//
//  Created by systimanx on 10/01/18.
//  Copyright © 2018 systimanx. All rights reserved.
//

import UIKit

class CategoriesListViewController: APPViewController,UITableViewDelegate,UITableViewDataSource{
  
    
    @IBOutlet weak var categoryTableView: UITableView!
     var hidden:[Bool] = [true, true]
    
    let textCellIdentifier = "CategoriesCell"
    var sectionArrays = ["row1Items","row2Items"]
    var row1Items = ["Apples", "Orange", "Mango", "Banana"]
    var row2Items = ["GreenFoods", "LadiesFinger"]
    override func viewDidLoad() {
        super.viewDidLoad()
    
}
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell", for: indexPath)
        
        cell.textLabel?.text = row1Items[indexPath.row]
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, estimateheightForHeaderInSection section: Int) -> CGFloat {
//        return 3
//    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        
        label.text = "Fruits"
        label.tag = section
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CategoriesListViewController.tapFunction))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        
        return label
    }
  @objc   func tapFunction(sender:UITapGestureRecognizer) {
        let section = sender.view!.tag
        let indexPaths = (0..<3).map { i in return IndexPath(item: i, section: section)  }
        
        hidden[section] = !hidden[section]
        
        categoryTableView?.beginUpdates()
        if hidden[section] {
            categoryTableView?.deleteRows(at: indexPaths, with: .fade)
        } else {
            categoryTableView?.insertRows(at: indexPaths, with: .fade)
        }
        categoryTableView?.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if hidden[section] {
            return 0
        
        } else {
            return 3
        }
    }
}

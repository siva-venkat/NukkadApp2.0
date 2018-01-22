//
//  CategoriesListViewController.swift
//  NukkadApp
//
//  Created by systimanx on 10/01/18.
//  Copyright © 2018 systimanx. All rights reserved.
//

import UIKit

class CategoriesListViewController: APPViewController,UITableViewDelegate, UITableViewDataSource {
  
    
    @IBOutlet weak var categoryTableView: UITableView!
    let cellId = "CategoriesCell"
    var titleArray = ["A","B","C"]
    
    var sectionsArray = [
        
        ExpandableNames(isExpanded:false, names: ["Apple","Orange","Mango"]),
        ExpandableNames(isExpanded:false, names: ["SunFlowerOil","Gold Winner","CardiaLife","SunRich"]),
        ExpandableNames(isExpanded:false, names: ["Maaza","Sprite","Limca","Mirinda"]),
        
    ]
//    var SelectedPath : IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsArray.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let  headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height:20))
        
       
        let imageViewGame = UIImageView(frame: CGRect(x:0, y:0, width:40, height:40));
        let image = UIImage(named: "ic_greenfood");
        imageViewGame.image = image;
        headerView.addSubview(imageViewGame)
       
       
       let button = UIButton(frame: CGRect(x: 150, y: 5, width: view.frame.size.width, height:20))
//        button.setTitle("close", for: .normal)
//        button.setTitleColor(.blue, for: .normal)
        button.setImage(#imageLiteral(resourceName: "ic_downarrow"), for: .normal)
        button.addTarget(self, action: #selector(handleExpand), for: UIControlEvents.touchUpInside)
        button.tag = section
        headerView.addSubview(button)
       
        return headerView
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        if sectionsArray[section].isExpanded {
        //            return 0
        //        }
        return sectionsArray.count
        
        
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleArray[section]
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell .textLabel?.text = sectionsArray[indexPath.section].names[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (sectionsArray[indexPath.section].isExpanded) {
            return 44
        } else {
            return 0
        }
    }
    @objc func handleExpand(button:UIButton) {
        let section =  button.tag
        
        print("expanded")
        
        let indexpaths = [IndexPath]()
        
        for section in sectionsArray.indices {
            for row in sectionsArray[section].names.indices {
                print(section,row)
//
//            let indexPath = IndexPath[row:row, section:section]
//                indexpaths.append(indexPath)
            }
            
            
        }
        
        
        let isExpanded = sectionsArray[section].isExpanded
        sectionsArray[section].isExpanded = !isExpanded
        
//    button.setTitle(isExpanded ? "open": "close", for: .normal)
        if isExpanded {
            categoryTableView.deleteRows(at: indexpaths, with:.fade)
            
        } else {
            
            categoryTableView.insertRows(at: indexpaths, with: .fade)
            
        }
        
    }
    
}





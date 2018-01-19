//
//  HamburgerViewController.swift
//  NukkadApp
//
//  Created by systimanx on 14/12/17.
//  Copyright © 2017 systimanx. All rights reserved.
//

import UIKit


class HamburgerCell:UITableViewCell {
    
    @IBOutlet weak var listLbl: UILabel!
}

class HamburgerViewController: APPViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var hamburgerTableView: UITableView!
    @IBOutlet weak var trailinConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
  
  static let sharedController = HamburgerViewController.instance() as! HamburgerViewController
   
        
        var labelArray = ["NAME","HOME","MY TRIPS","PLAN A TRIP","MY PROFILE","RATE APP","LOGOUT"]

        let cellId = "HamburgerCell"
        
    @IBAction func tapAction(_ sender: Any) {
        self.show(show: false)
        
    }
    func show(show:Bool) {
        let superView = self.topViewController().view
        if show {
            superView?.addSubview(self.view)
            self.view.frame = (superView?.frame)!
            self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            superView?.layoutIfNeeded()
            self.view.isHidden = false
            hamburgerTableView.reloadData()
            NSLayoutConstraint.deactivate([self.trailinConstraint])
            NSLayoutConstraint.activate([self.leadingConstraint])
            UIView.animate(withDuration: 0.2, animations: {
                self.view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.2)
                superView?.layoutIfNeeded()
            })
        } else {
            NSLayoutConstraint.deactivate([leadingConstraint])
            NSLayoutConstraint.activate([trailinConstraint])
            UIView.animate(withDuration: 0.2, animations: {
                self.view.backgroundColor = UIColor.clear
                superView?.layoutIfNeeded()
            }, completion: { (completed:Bool) in
                self.view.isHidden = true
            })
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath as IndexPath) as! HamburgerCell
        cell.listLbl.text = labelArray[indexPath.row]
        return cell
    }
    
    }
    

    
    


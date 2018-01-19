//
//  APPViewController.swift
//  NukkadApp
//
//  Created by systimanx on 14/12/17.
//  Copyright © 2017 systimanx. All rights reserved.
//

import UIKit

enum barButtonType {
    case kEmpty
    case kImage
    case kText
    case kPredefined
}

extension NSObject {
    static func topViewController() -> UIViewController {
        var topViewController = UIApplication.shared.keyWindow?.rootViewController
        while topViewController?.presentedViewController != nil {
        topViewController = topViewController?.presentedViewController
    }
        return topViewController!
}
    
           func topViewController() -> UIViewController {
            return type(of: self).topViewController()
    }
}
extension UIViewController {
    static func instance() -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:String(describing: self))
    }
    
    func showHamburger() {
        HamburgerViewController.sharedController.show(show: true)
    }
}
class APPViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTitle()
        self.configLeftBarButton()
        self.configRightBarButton()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(shouldHideNavigateBar(), animated: true)
    }
    func shouldHideNavigateBar() -> Bool {
    return false
    }
    func configTitle(){
       self.navigationItem.titleView = UIImageView.init(image: #imageLiteral(resourceName: "ic_headertitle") )
    }
    func configLeftBarButton() {
        let (type,value) = self.leftBarButtonConfig()
        
        switch type {
        case .kImage?:
            self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: value as? UIImage, style: .done, target: self, action: #selector(APPViewController.leftBarButtonAction))
        case .kText?:
            self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: value as? String, style: .plain, target: self, action: #selector(APPViewController.leftBarButtonAction))
        case .kPredefined?:
            self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: value as! UIBarButtonSystemItem, target: self, action: #selector(APPViewController.leftBarButtonAction))
        default:
            if let count = self.navigationController?.viewControllers.count,count > 1 {
                self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "ic_back"), style: .done, target: self, action: #selector(APPViewController.leftBarButtonAction))
            } else {
                self.navigationItem.leftBarButtonItem = nil
            }
        }
    }
    
    @objc func leftBarButtonAction() {
        if let count = self.navigationController?.viewControllers.count, count > 1 {
            self.navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func leftBarButtonConfig() -> (barButtonType?, Any?) {
        return (.kEmpty,nil)
    }
    func configRightBarButton() {
     //   let (type,value) = self.rightBarButtonconfig()
        let searchImg   : UIImage = UIImage(named: "ic_cartcount")!
        let cartImg : UIImage = UIImage(named: "ic_search")!
        
        let searchBtn : UIBarButtonItem = UIBarButtonItem(image: searchImg,  style: UIBarButtonItemStyle.plain, target: self, action: #selector(APPViewController.rightBarButtonAction))
        
        let cartBtn : UIBarButtonItem = UIBarButtonItem(image: cartImg,  style: UIBarButtonItemStyle.plain, target: self, action: #selector (APPViewController.rightBarButtonAction))
        
        let buttons : NSArray = [searchBtn, cartBtn]
        
        self.navigationItem.rightBarButtonItems = buttons as? [UIBarButtonItem]
        
        if let count = self.navigationController?.viewControllers.count,count > 1 {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "ic_cartcount"), style: .done, target: self, action: #selector(APPViewController.rightBarButtonAction))
            } else{
        
            self.navigationItem.rightBarButtonItems = nil
    }
    }

    func rightBarButtonconfig() ->(barButtonType?,Any?) {
        return (.kEmpty, nil)
    }


    @objc func rightBarButtonAction() {
        if let count = self.navigationController?.viewControllers.count, count > 1{
            self.navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    class APPTableViewController: UITableViewController {
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
    }
    
    class AppNavigationController: UINavigationController {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.navigationBar.barTintColor = UIColor(red: 1, green: 0.753, blue: 0, alpha: 1);
            self.navigationBar.tintColor = UIColor.black
            self.navigationBar.isTranslucent = false
        }
}
}

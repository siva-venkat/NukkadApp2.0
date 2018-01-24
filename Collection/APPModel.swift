//
//  APPModel.swift
//  NukkadApp
//
//  Created by systimanx on 24/01/18.
//  Copyright © 2018 systimanx. All rights reserved.
//

import UIKit


    extension NSObject {
        var className: String {
            return String(describing: type(of: self))
        }
        
        class var className: String {
            return String(describing: self)
        }
    }
    
    class APPModel: NSObject {
        
        class func archived()->Any? {
            let data = UserDefaults.standard.object(forKey: className) as? Data
            if data != nil {
                return NSKeyedUnarchiver.unarchiveObject(with:data!)
            }
            return nil
            
        }
        
        class func clear(){
            UserDefaults.standard.removeObject(forKey:className)
            flush()
        }
        
        class func flush(){
            
        }
        
        func save() {
            let defaults = UserDefaults.standard
            defaults.set(NSKeyedArchiver.archivedData(withRootObject: self), forKey:className)
            defaults.synchronize()
        }
}

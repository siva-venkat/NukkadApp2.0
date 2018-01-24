//
//  NAModel.swift
//  NukkadApp
//
//  Created by systimanx on 24/01/18.
//  Copyright © 2018 systimanx. All rights reserved.
//

import UIKit

    extension Dictionary {
        
        func getValue(forKeyPath components : Array<Any>) -> Any? {
            var comps = components;
            let key = comps.remove(at: 0)
            if let k = key as? Key {
                if(comps.count == 0) {
                    return self[k]
                }
                if let v = self[k] as? Dictionary<AnyHashable,Any> {
                    return v.getValue(forKeyPath : comps)
                }
            }
            return nil
        }
    }
    
    class NAModel: APPModel {
        
    }
class NAUser: APPModel, NSCoding {
    
    var firstName: String?
    var lastName: String?
    var mobileNumber: String?
    var email: String?
    var password: String?
    var userType:String?
    var userId:NSInteger?
    var token:String?
    private static var CURRENT_USER: NAUser?
    
    static func current() -> NAUser? {
        if CURRENT_USER == nil  {
            CURRENT_USER = self.archived() as? NAUser
        }
        return CURRENT_USER
    }
    
    override class func flush(){
        super.flush()
        CURRENT_USER = nil
    }
    
    class func fromDict(dict:NSDictionary) -> NAUser {
        
    let user = NAUser()
        
    user.firstName = dict["name"] as? String
    user.lastName = dict["name"] as? String
    user.mobileNumber = dict["mobile"] as? String
    user.email = dict["email"] as? String
    user.userId = (dict["user_id"] as? NSNumber)?.intValue
    user.password = dict["password"] as? String
    
    return user
}
    override init() {
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(firstName, forKey: "firstName")
        aCoder.encode(lastName, forKey: "lastName")
        aCoder.encode(mobileNumber, forKey: "mobileNumber")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(password, forKey: "password")
        aCoder.encode(userId, forKey: "userId")
        
//        aCoder.encode(photoUrl, forKey: "photoUrl")
        aCoder.encode(token, forKey: "token")
    }
    
    required init?(coder aDecoder: NSCoder) {
        firstName = aDecoder.decodeObject(forKey: "firstName") as? String
        lastName = aDecoder.decodeObject(forKey: "lastName") as? String
        mobileNumber = aDecoder.decodeObject(forKey: "mobileNumber") as? String
        email = aDecoder.decodeObject(forKey: "email") as? String
        password = aDecoder.decodeObject(forKey: "password") as? String
        userId = aDecoder.decodeObject(forKey: "userId") as? NSInteger
        token = aDecoder.decodeObject(forKey: "token") as? String
    }
}





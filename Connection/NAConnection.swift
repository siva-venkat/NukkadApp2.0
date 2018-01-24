//
//  NAConnection.swift
//  NukkadApp
//
//  Created by systimanx on 24/01/18.
//  Copyright © 2018 systimanx. All rights reserved.
//

import UIKit
import PromiseKit

class NAConnection:APPConnection{
    
    override class func makeConnection(config:APPUrlConfig) -> Promise<NSDictionary> {
        return super.makeConnection(config: config).then(execute: { dict -> Promise<NSDictionary> in
            let status = dict["status"] as? Int
            if status == 0 {
                throw NSError(domain: NSURLErrorDomain, code: NSURLErrorUnknown, userInfo: [NSLocalizedDescriptionKey:dict["message"] as! String])
            }
            return Promise(value:dict)
        })
    }
    
    static func login(email:String, password:String, osName: String, osVersion: String) -> Promise<NAUser> {
        let config = APPUrlConfig(endpoint:"login")
        config.parameters = ["user": [ "email":email,"password":password,"os_name": osName, "os_version": osVersion]]
        return self.makeConnection(config: config).then(execute: { dict -> Promise<NAUser> in
            let user = NAUser.fromDict(dict: dict["user_data"] as! NSDictionary)
            user.token = connection.token
            user.save()
            return Promise(value:user)
        })
}
    
    
    static func storeFcm(fcmId:String) -> Promise<NSDictionary> {
        let config = APPUrlConfig(endpoint:"StoreFcm")
        config.parameters = ["user": ["fcm_id": fcmId]]
        return self.makeConnection(config: config).then(execute: { dict -> Promise<NSDictionary> in
            return Promise(value:dict)
        })
    }
//    static func forgotPassword(email:String) -> Promise<String> {
//        let config = APPUrlConfig(endpoint:"forgot_password")
//        config.parameters = ["user": ["email":email]]
//        return self.makeConnection(config: config).then(execute: { dict -> Promise<String> in
//            return Promise(value:dict["message"] as! String)
//        })
//    }
//   

}

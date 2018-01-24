//
//  APPConnection.swift
//  NukkadApp
//
//  Created by systimanx on 24/01/18.
//  Copyright © 2018 systimanx. All rights reserved.
//

import UIKit
import PromiseKit

enum HTTPMethod {
    case kGet
    case kPost
    
}
class APPUrlConfig: NSObject {
    var url: URL
    var method: HTTPMethod = .kPost
    var parameters:Dictionary< String, Any>?
    var headerDict:[String: String]?
    init(urll: URL){
        url = urll;
}
    init(endpoint: String, _ args: CVarArg ...) {
        self.url = URL(string:APPConnection.baseUrl().appending(String.init(format: endpoint, arguments: args)))!
        
    }

}
class APPConnection: NSObject {
    var token:String?
    
    static let connection : APPConnection = {
        return APPConnection()
    }()
    
    class func baseUrl () -> String {
        let settings = Bundle.main.infoDictionary!["NASettings"] as? [String : Any]
        let general = settings!["general"] as! [String : String]
        #if DEBUG
            return general["staging_url"]!
        #else
            return general["base_url"]!
        #endif
    }
    
    
    class func makeConnection(config:APPUrlConfig) -> Promise<NSDictionary> {
        var request = URLRequest(url: config.url)
        switch config.method {
        case .kPost:
            request.httpMethod = "POST"
        default:
            request.httpMethod = "GET"
        }
        if config.parameters != nil {
            request.httpBody = try? JSONSerialization.data(withJSONObject: config.parameters!, options: .prettyPrinted)
        }
        
        if config.headerDict != nil {
            for (aKey,aValue) in config.headerDict! {
                request.addValue(aValue, forHTTPHeaderField: aKey)
            }
        }
        if self.connection.token != nil {
            request.addValue("Bearer \(self.connection.token!)", forHTTPHeaderField: "Authorization")
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        print("###################### Request ######################\n\n\(request) \(config.parameters ?? [:]) \n\n#################### End Request ####################\n")
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        return URLSession.shared.dataTask(with: request).asDataAndResponse().then(execute: { (data, response) -> Promise<NSDictionary> in
            if let httpResponse = response as? HTTPURLResponse {
                for aheader in httpResponse.allHeaderFields {
                    if aheader.key as! String == "jwt_token" {
                        self.connection.token = aheader.value as? String
                    }
                }
            }
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            print("###################### Response ######################\n\n\(json)\n\n#################### End Response ####################\n")
            guard let dict = json as? NSDictionary else { throw JSONError.unexpectedRootNode(json) }
            
            return Promise(value:dict)
        }).always {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }

    static func uploadData(config:APPUrlConfig, data:Data, name:String) -> Promise<NSDictionary> {
        var body = Data()
        let boundary = "1i2thiS8is9ZOhO4Docs23UpLoAD321i";
        body.append(("\r\n--\(boundary)\r\n").data(using:String.Encoding.utf8)!)
        body.append(("Content-Disposition: form-data; name=\"\(name.components(separatedBy: ".").first!)\"; filename=\"\(name)\"\r\n").data(using:String.Encoding.utf8)!)
        body.append(("Content-Type: application/octet-stream\r\n\r\n").data(using:String.Encoding.utf8)!)
        body.append(data)
        body.append(("\r\n--\(boundary)\r\n").data(using:String.Encoding.utf8)!)

        var request = URLRequest(url: config.url)
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.setValue("\(body.count)", forHTTPHeaderField: "Content-Length")

        print("###################### Request ######################\n\n\(request)\n\n#################### End Request ####################\n")
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        return URLSession.shared.dataTask(with: request).asDataAndResponse().then(execute: { (data, response) -> Promise<NSDictionary> in
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            print("###################### Response ######################\n\n\(json)\n\n#################### End Response ####################\n")
            guard let dict = json as? NSDictionary else { throw JSONError.unexpectedRootNode(json) }
            return Promise(value:dict)
        }).always {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }

}





//
//  Network.swift
//  demo_yash
//
//  Created by admin on 27/06/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import Alamofire

class Network {
    class func getService(url: String, header: HTTPHeaders?, body: [String: Any]?, completionHandler:@escaping(Error?, Data?, Bool?) -> Void){
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(url).responseData { (response) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            switch(response.result){
                
                case .success(_) :
                    if let data = response.result.value{
                        completionHandler(nil, data, true)
                    }
                case .failure(_):
                    if response.result.error != nil{
                        debugPrint(response.result.error?.localizedDescription ?? "error")
                        Helper.alertWith(message: response.result.error?.localizedDescription ?? "error", title: "Error")
                    }
                    completionHandler(response.result.error, nil, false)
                }
            }
            
        }
        
    }

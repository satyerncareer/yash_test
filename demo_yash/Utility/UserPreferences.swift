
//
//  UserPreferences.swift
//  demo_yash
//
//  Created by admin on 27/06/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class UserPreferences {
    static let userDefault = UserDefaults.standard
    class func saveIsLogin(isLogin: Bool){
        userDefault.set(isLogin, forKey: "isLogin")
        userDefault.synchronize()
    }
    
    class func getIsLogin() -> Bool {
        return userDefault.bool(forKey: "isLogin")
    }
}

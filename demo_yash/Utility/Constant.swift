//
//  Constant.swift
//  demo_yash
//
//  Created by admin on 27/06/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import Foundation

var kStoryBoardMain = UIStoryboard(name: "Main", bundle: nil)
let network_endpint = "https://jsonplaceholder.typicode.com/"
enum kMessages: String {
    case login_success = "Successfully logged in"
    var value: String {
        return self.rawValue
    }
}

enum Kerrors: String {
    case fields_required = "All fields required"
    case valiedation_failed = "Validatin Failed"
    var value: String {
        return self.rawValue
    }
}

enum kNetworkCodes: Int {
    case success = 200
    case failed = 400
    
    var value: Int {
        return self.rawValue
    }
}

enum kViewControllerIdentities: String {
    
    case userVC = "UserViewController"
    case loginVC = "LoginViewController"
    case loginNav = "LoginNavController"
    case titleVC = "TitleViewController"
    case titleDetailVC = "PostDetailViewController"
    
    var value: String {
        return self.rawValue
    }
}

enum kAPIMethods: String {
    case user_list = "users/"
    case post = "posts?userId="
    
    var value: String {
        return self.rawValue
    }
    
}


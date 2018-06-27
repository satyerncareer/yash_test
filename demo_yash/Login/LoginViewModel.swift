//
//  LoginViewModel.swift
//  demo_yash
//
//  Created by admin on 27/06/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

protocol LoginViewModelType {
    var userName: String? {get set}
    var password: String? {get set}
    func validateLogin(userName: String?, password: String?) -> Bool
    func pushToUserList(source: UIViewController?, to viewControllerIdentity: String)
    func doLogin(handler:@escaping(Bool) -> Void)
}
class LoginViewModel: LoginViewModelType {
    
    var userName: String?
    var password: String?
    
    func validateLogin(userName: String?, password: String?) -> Bool {
        
        guard let user = userName, let pass = password else {
            return false
        }
        if user.isEmpty || pass.isEmpty {
            Helper.alertWith(message: "Validatin Failed.", title: "Error")
            return false
        }
        return true
    }
    
    func doLogin(handler:@escaping(Bool) -> Void) {
        let isValidated = validateLogin(userName: userName, password: password)
        if isValidated {
            handler(true)
        }else{
            handler(false)
        }
    }
    
    func pushToUserList(source: UIViewController?, to viewControllerIdentity: String) {
        let vc = kStoryBoardMain.instantiateViewController(withIdentifier: viewControllerIdentity) as! UsersViewController
        vc.userModel = UserViewModel()
        let nvc = kStoryBoardMain.instantiateViewController(withIdentifier: "NVC")
        nvc.addChildViewController(vc)
        source?.present(nvc, animated: true, completion: nil)
    }
}

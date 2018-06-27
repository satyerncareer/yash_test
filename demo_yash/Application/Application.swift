//
//  Application.swift
//  demo_yash
//
//  Created by admin on 27/06/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

final class Application {
    static let shareInstance = Application()
    func configureMainInterface(for application: UIApplication){
        let window = application.windows[0]
        if UserPreferences.getIsLogin() {
            let nvc = kStoryBoardMain.instantiateViewController(withIdentifier: "NVC")
            let viewController = kStoryBoardMain.instantiateViewController(withIdentifier: kViewControllerIdentities.userVC.value) as! UsersViewController
            viewController.userModel = UserViewModel()
            nvc.addChildViewController(viewController)
            window.rootViewController = nvc
        }else{
            let nvc = kStoryBoardMain.instantiateViewController(withIdentifier: "LNVC")
            let viewController = kStoryBoardMain.instantiateViewController(withIdentifier: kViewControllerIdentities.loginVC.value) as! LoginViewController
            viewController.loginViewModel = LoginViewModel()
            nvc.navigationController?.isNavigationBarHidden = false
            nvc.addChildViewController(viewController)
            window.rootViewController = nvc
        }
    }
}

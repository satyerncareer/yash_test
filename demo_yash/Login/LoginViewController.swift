//
//  LoginViewController.swift
//  demo_yash
//
//  Created by admin on 27/06/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    var loginViewModel: LoginViewModelType?
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginAction(sender: UIButton) {
        loginViewModel?.userName = userNameTextField.text
        loginViewModel?.password = passwordTextField.text
        loginViewModel?.doLogin(handler: {(isLogined) in
            if !isLogined {return}
            UserPreferences.saveIsLogin(isLogin: true)
            self.loginViewModel?.pushToUserList(source: self, to: kViewControllerIdentities.userVC.value)
        })
    }
}


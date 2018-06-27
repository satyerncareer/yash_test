//
//  Helper.swift
//  demo_yash
//
//  Created by admin on 27/06/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class Helper {
    static let window = UIApplication.shared.windows[0]
    class func alertWith(message m: String, title: String){
        
        let alert = UIAlertController(title: title, message: m, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
            //
        }))
        window.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    class func getRandomColor() -> UIColor{
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
}

//
//  PostDetailViewController.swift
//  demo_yash
//
//  Created by admin on 27/06/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionView: UITextView!
    @IBOutlet weak var nameLabel: UILabel!
    var postViewModel: PostViewModelType!
    override func viewDidLoad() {
        super.viewDidLoad()

        postViewModel.configureDetails(titleLabel: titleLabel, descriptionView: descriptionView, nameLabel: nameLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}

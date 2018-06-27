//
//  PostViewModel.swift
//  demo_yash
//
//  Created by admin on 27/06/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
protocol PostViewModelType {
    func configureDetails(titleLabel: UILabel, descriptionView: UITextView, nameLabel: UILabel)
}
class PostViewModel: PostViewModelType {
    var titleObject: Title
    var name: String
    init(titleObject: Title, userName: String) {
        self.titleObject = titleObject
        self.name = userName
    }
    
    func configureDetails(titleLabel: UILabel, descriptionView: UITextView, nameLabel: UILabel){
        titleLabel.text = titleObject.title
        descriptionView.text = titleObject.body
        nameLabel.text = name
        
    }
}

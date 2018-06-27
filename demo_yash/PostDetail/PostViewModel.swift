//
//  PostViewModel.swift
//  demo_yash
//
//  Created by admin on 27/06/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
protocol PostViewModelType {
    func configureDetails(titleLabel: UILabel, descriptionView: UITextView)
}
class PostViewModel: PostViewModelType {
    var titleObject: Title
    
    init(titleObject: Title) {
        self.titleObject = titleObject
    }
    
    func configureDetails(titleLabel: UILabel, descriptionView: UITextView){
        titleLabel.text = titleObject.title
        descriptionView.text = titleObject.body
    }
}

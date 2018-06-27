//
//  TitleViewModel.swift
//  demo_yash
//
//  Created by admin on 27/06/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
protocol TitleViewModelType {
    func getTitle(handler:@escaping() -> Void)
    func configureCell(_ cell: TitleCell, at row: Int)
    func numberOfRow()->Int
    func pushToDetail(at row: Int, source: UINavigationController?, to viewControllerIdentity: String)
}
class TitleViewModel: TitleViewModelType {
    var userId: Int
    var userName: String
    var titleArray:[Title] = []
    init(userId: Int, userName: String) {
        self.userId = userId
        self.userName = userName
    }
    
    func getTitle(handler:@escaping() -> Void){
        let url = network_endpint + kAPIMethods.post.value + "\(userId)"
        Network.getService(url: url, header: nil, body: nil) { (erro, response, isSuccess) in
            print(response ?? "")
            let decoder = JSONDecoder()
            guard let data = response else {return}
            do {
                let titles = try decoder.decode([Title].self, from: data)
                self.titleArray = titles
                handler()
            }
            catch let error {
                debugPrint(error.localizedDescription)
                handler()
            }
        }
    }
    
    func configureCell(_ cell: TitleCell, at row: Int){
        guard let title =  titleArray[row].title else {
            return
        }
        cell.titleTextLabel.text = title
    }
    
    func numberOfRow() -> Int {
        return titleArray.count
    }
    
    func pushToDetail(at row: Int, source: UINavigationController?, to viewControllerIdentity: String) {
        let titleObj = titleArray[row]
        let vc = kStoryBoardMain.instantiateViewController(withIdentifier: viewControllerIdentity) as! PostDetailViewController
        vc.postViewModel = PostViewModel(titleObject: titleObj, userName: userName)
        source?.pushViewController(vc, animated: true)
    }
    
}

//
//  UserViewModel.swift
//  demo_yash
//
//  Created by admin on 27/06/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
protocol UserViewModelType {
    func getAllUsers(handler:@escaping()->Void)
    func configureCell(_ cell: UserCell, row: Int)
    func numberOfUsers()->Int
    func showTitle(at row: Int, source: UINavigationController?, to viewControllerIdentity: String)
    func searchResult(searchText: String)
}
class UserViewModel: UserViewModelType {
    var userArray:[User]?
    var arrayForFilter:[User] = []
    func getAllUsers(handler:@escaping()->Void) {
        let url = network_endpint + kAPIMethods.user_list.value
        Network.getService(url: url, header: nil, body: nil) { (erro, response, isSuccess) in
            print(response ?? "")
            let decoder = JSONDecoder()
            guard let data = response else {return}
            do {
                let users = try decoder.decode([User].self, from: data)
                self.userArray = users
                self.arrayForFilter = self.userArray!
                handler()
            }
            catch let error {
                debugPrint(error.localizedDescription)
                handler()
            }
        }
    }
    
    func numberOfUsers()->Int{
        guard let count = self.userArray?.count else {
            return 0
        }
        return count
    }
    
    func configureCell(_ cell: UserCell, row: Int) {
        guard let user = userArray?[row] else {
            return
        }
        cell.circleLabel.backgroundColor = Helper.getRandomColor()
        cell.circleLabel.text = String((user.name?.prefix(1))!)
        cell.circleLabel.layer.cornerRadius = cell.circleLabel.frame.size.height / 2
        cell.circleLabel.layer.masksToBounds = true
        cell.userNameLabel.text = user.name
    }
    
    func showTitle(at row: Int, source: UINavigationController?, to viewControllerIdentity: String){
        let user = userArray?[row]
        let vc = kStoryBoardMain.instantiateViewController(withIdentifier: viewControllerIdentity) as! TitleViewController
        guard let id = user?.id, let name = user?.name else {
            return
        }
        vc.titleViewModel = TitleViewModel(userId: id, userName: name)
        source?.pushViewController(vc, animated: true)
    }
    
    func searchResult(searchText: String){
        if searchText.isEmpty {
            userArray = arrayForFilter
            return
        }
        userArray = arrayForFilter.filter{($0.name?.lowercased().contains(searchText.lowercased()))!}
    }
    
}

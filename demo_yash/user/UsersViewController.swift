//
//  UsersViewController.swift
//  demo_yash
//
//  Created by admin on 27/06/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class UsersViewController: BaseViewController {
    var userModel: UserViewModelType!
    @IBOutlet weak var tableVieqw: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        userModel.getAllUsers {
            self.configurateTableview()
            self.configureSearchBar()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func configurateTableview(){
        tableVieqw.delegate = self
        tableVieqw.dataSource = self
        tableVieqw.reloadData()
        tableVieqw.tableFooterView = UIView()
        tableVieqw.rowHeight = 74
        tableVieqw.estimatedRowHeight = 74
    }
    func configureSearchBar(){
        searchBar.delegate = self
        searchBar.setShowsCancelButton(true, animated: true)
    }
}

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userModel.numberOfUsers()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableVieqw.dequeueReusableCell(withIdentifier: "CellIdentity", for: indexPath) as! UserCell
        userModel.configureCell(cell, row: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userModel.showTitle(at: indexPath.row, source: self.navigationController, to: kViewControllerIdentities.titleVC.value)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension UsersViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        userModel.searchResult(searchText: "")
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        userModel.searchResult(searchText: searchText)
        configurateTableview()
    }
}

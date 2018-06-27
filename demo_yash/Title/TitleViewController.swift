//
//  TitleViewController.swift
//  demo_yash
//
//  Created by admin on 27/06/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class TitleViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    var titleViewModel: TitleViewModelType!
    override func viewDidLoad() {
        super.viewDidLoad()

        titleViewModel.getTitle {
            self.configureTable()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureTable(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
        self.tableView.tableFooterView = UIView()
    }

}

extension TitleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleViewModel.numberOfRow()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as! TitleCell
        titleViewModel.configureCell(cell, at: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        titleViewModel.pushToDetail(at: indexPath.row, source: self.navigationController, to: kViewControllerIdentities.titleDetailVC.value)
    }
}

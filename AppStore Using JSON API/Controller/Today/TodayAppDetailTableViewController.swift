
//
//  TodayAppDetailTableViewController.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 02/05/20.
//  Copyright © 2020 Douglas Moreira. All rights reserved.
//

import UIKit

class TodayAppDetailTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        tableView.separatorStyle = .none
        

    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = TodayCell()
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 450
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TodayDetailCell(style: .default, reuseIdentifier: nil)
        return cell
    }

}

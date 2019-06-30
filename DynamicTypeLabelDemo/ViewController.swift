//
//  ViewController.swift
//  DynamicTypeLabelDemo
//
//  Created by Merch on 2019-06-29.
//  Copyright © 2019 Merch Visoiu. All rights reserved.
//

import UIKit

internal class MyCell: UITableViewCell {
    @IBOutlet public weak var myLabel: UILabel?
}

class ViewController: UIViewController {

}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9999
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCell
        cell.myLabel?.text = "\(indexPath.row)"
        return cell
    }
}

//
//  BooksViewController.swift
//  storyboard
//
//  Created by Vladimir on 02.06.2021.
//

import UIKit

class BooksViewController: UIViewController, UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    var elements: [String] = ["Andrey", "Vlad"]
    
    
    override func viewDidLoad() {
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
         let cell = UITableViewCell()
        cell.textLabel?.text = elements[indexPath.row]
        return cell
    }
}


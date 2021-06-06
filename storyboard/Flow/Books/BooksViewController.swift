//
//  BooksViewController.swift
//  storyboard
//
//  Created by Vladimir on 02.06.2021.
//

import UIKit
import Alamofire

class BooksViewController: UIViewController, UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    var model: ListOfBooks?
    let NetWork = Network()
    
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        
        tableView.dataSource = self
     
        
        NetWork.getData { model in
            self.model = model
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.docs.count ?? 0
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description()),
           let model = model {
            cell.textLabel?.text = model.docs[indexPath.row].name
            return cell
        }
        
        return UITableViewCell()
    }
    
}

//
//  BooksViewController.swift
//  storyboard
//
//  Created by Vladimir on 02.06.2021.
//

import UIKit
import Alamofire

class BooksViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    var model: ListOfBooks?
    // let netWork = Network()
    let service = BookService()
    
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        
        tableView.dataSource = self
        tableView.delegate = self
        getData()
    }
    
    func getData() {
        service.getBooks {
            self.model = $0
            self.tableView.reloadData()
        }
    }
}
extension BooksViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.docs.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if
            let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description()),
            let model = model {
            cell.textLabel?.text = model.docs[indexPath.row].name
            return cell
        }
        
        return UITableViewCell()
    }
}
extension BooksViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let id  = model?.docs[indexPath.row].id {
            let vc = ChaptersViewController(bookID: id)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

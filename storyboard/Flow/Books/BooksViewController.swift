//
//  BooksViewController.swift
//  storyboard
//
//  Created by Vladimir on 02.06.2021.
//

import UIKit
import Alamofire
import KeychainSwift

class BooksViewController: UIViewController{
    var model: ListOfBooks?
    let service = BookService()
    let tableView = UITableView.init(frame: .zero, style: UITableView.Style.plain)
    
    override func viewDidLoad() {
        title = R.string.localizible.booksNewTitle()
        
        self.view.addSubview(self.tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        
        tableView.dataSource = self
        tableView.delegate = self
        self.updateLayout(with: self.view.frame.size)
        exitButton()
        getData()
        
        
        func exitButton() {
            let barButton = UIBarButtonItem(title: R.string.localizible.exitNewTitle(),
                                            style: .plain,
                                            target: self,
                                            action: #selector(logout(sender:)))
            self.navigationItem.leftBarButtonItem = barButton
        }
        
    }
    @objc func logout(sender: UIBarButtonItem) {
        KeychainSwift().delete(KeychainSwift.Keys.token.rawValue)
        //        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        //        appDelegate?.checkLogin()
      //  (UIApplication.shared.delegate as? AppDelegate)?.checkLogin()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Login"), object: nil)
    }
    
    
    func getData() {
        service.getBooks {
            self.model = $0
            self.tableView.reloadData()
        }
    }
    private func updateLayout(with size: CGSize) {
        tableView.frame = CGRect.init(origin: .zero, size: size)
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

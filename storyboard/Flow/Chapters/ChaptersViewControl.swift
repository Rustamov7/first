//
//  BooksViewController.swift
//  storyboard
//
//  Created by Vladimir on 02.06.2021.
//

import UIKit
import Alamofire

class ChaptersViewController: UIViewController{
    let bookID: String
    let tableView = UITableView()
    var model: ChapterList?
    let service = BookService()
    override func loadView() {
        view = tableView
    }
    
    init(bookID: String) {
        self.bookID = bookID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        tableView.dataSource = self
        getData()
    }
    func getData() {
        service.getChapters(bookID: bookID) {
            self.model = $0
            self.tableView.reloadData()
        }
    }
}
extension ChaptersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.docs.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description()),
              let model = model else {
            return UITableViewCell()
        }
        cell.textLabel?.text = model.docs[indexPath.row].chapterName
        return cell
    }
}

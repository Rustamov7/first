//
//  QuoteViewController.swift
//  storyboard
//
//  Created by Vladimir on 17.07.2021.
//

import Foundation
import UIKit


class QuoteViewController: UIViewController {
    
    var presenter: QuotesPresenter?
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        return tableView
    }()
    
    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad() {
        title = R.string.localizible.quoteNewTitle()
        super.viewDidLoad()
        
        presenter?.loadNext()
        
    }
    func reloadData() {
        tableView.reloadData()
    }
}

extension QuoteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.quotes.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableCell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description()) else {
            return UITableViewCell()
        }
        tableCell.textLabel?.text = presenter?.quotes[indexPath.row].dialog
        return tableCell
    }
}

extension QuoteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let elements = presenter?.quotes.count ?? .zero
        if elements - 40 < indexPath.row {
            presenter?.loadNext()
        }
    }
}

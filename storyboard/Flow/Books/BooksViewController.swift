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
     //   getData()
       // NetWork.getData()
        
        NetWork.getData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.docs.count ?? 0
        // return model?.total
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description()){
            cell.textLabel?.text = model?.docs[indexPath.row].name
            return cell
        }
        
        return UITableViewCell()
    }
    
   /* func getData()
    {
        let request = AF.request("https://the-one-api.dev/v2/book", method: .get)
        
        request.response
        {   response in
            if let data = response.data
            {
                do {
                    self.model = try JSONDecoder().decode(ListOfBooks.self, from: data)
                    }
                catch {
                    print(error)
                    
                        }
            }
        }
    }*/
}

////
////  ChaptersViewControl.swift
////  storyboard
////
////  Created by Vladimir on 07.06.2021.
////
//
//import Foundation
//
//import UIKit
//
//class ChaptersViewController: UIViewController {
//    
//    var bookID: String
//    
//    let tableView = UITableView()
//    
//    let service = BookService()
//    var chapters = ChapterList?
//    
////    var model = ChapterList?
//    override func loadView() {
//        view = tableView
//    }
//    
//    init(bookID: String) {
//        self.bookID = bookID
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    override func viewDidLoad() {
//        //super.viewDidLoad()
//        //getData()
//       // tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
//        
//        //tableView.dataSource = self
//        //tableView.delegate = self
//        super.viewDidLoad()
//                tableView.dataSource = self
//                tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
//
//                getData()
//            }
//
//            func getData() {
//                service.getChapters(bookID: bookID) {
//                    self.chapters = $0
//                    self.tableView.reloadData()
//                }
//            }
//    
////    func getData() {
////        service.getChapters(bookID: bookID) {
////            self.chapters = $0
////            self.tableView.reloadData()
////        }
////    }
//}
//
//extension ChaptersViewController: UITableViewDataSource {
//     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//         return chapters?.docs.count ?? 0
//     }
//
//     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//         guard let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description()),
//               let chapters = chapters else { return UITableViewCell() }
//         cell.textLabel?.text = chapters.docs[indexPath.row].chapterName
//         return cell
//     }
// }

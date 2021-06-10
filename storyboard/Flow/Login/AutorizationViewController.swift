//
//  ViewController.swift
//  storyboard
//
//  Created by Vladimir on 02.06.2021.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.string.localizible.loginNewTitle()
    }
    
    @IBAction func didTapButton(_ sender: Any) {}
}

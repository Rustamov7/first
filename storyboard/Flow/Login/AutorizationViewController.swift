//
//  ViewController.swift
//  storyboard
//
//  Created by Vladimir on 02.06.2021.
//

import UIKit
import KeychainSwift

class AuthorizationViewController: UIViewController {
    
    let service = AutorizationService()
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.string.localizible.loginNewTitle()
        print(KeychainSwift().get("token"))
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        
        guard  let login = loginTextField.text, let password = passwordTextField.text else {
            return
        }
        service.authorize(login: login, password: password) { result in
            switch result {
            case let .success(token):
                KeychainSwift().set(token, forKey: KeychainSwift.Keys.token.rawValue)
                print(token)
            case let .failure(error):
                print(error)
            }
        }
    }
}

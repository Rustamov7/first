//
//  ViewController.swift
//  storyboard
//
//  Created by Vladimir on 02.06.2021.
//

import UIKit
import KeychainSwift

class AuthorizationViewController: UIViewController {
    var window: UIWindow?
    let service = AutorizationService()
    
    let borderWidth: CGFloat = 0.5
    let borderColor: UIColor = .black
    
    lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = R.string.localizible.loginfieldNewTitle()
        textField.autocapitalizationType = .none
        textField.layer.borderWidth = borderWidth
        textField.layer.borderColor = borderColor.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = R.string.localizible.passwordNewTitle()
        textField.autocapitalizationType = .none
        textField.layer.borderWidth = borderWidth
        textField.layer.borderColor = borderColor.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle(R.string.localizible.loginButtonNewTitle(), for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.string.localizible.loginNewTitle()
        constrains()
        
        loginButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    func constrains() {
        view.backgroundColor = .white
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 75),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -75),
           // loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 75),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -75),
            //passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 75),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    
    @objc func didTapButton() {
        
        guard  let login = loginTextField.text, let password = passwordTextField.text else {
            return
        }
        let checkLogin = AppDelegate()
        if login != "vova" || password != "123" {
            error()
        }
        else {
            service.authorize(login: login, password: password) { result in
                switch result {
                case let .success(token):
                    KeychainSwift().set(token, forKey: KeychainSwift.Keys.token.rawValue)
                 return checkLogin.checkLogin()
                    print(token)
//
//                    DispatchQueue.main.async {
//                        KeychainSwift().set(token, forKey: KeychainSwift.Keys.token.rawValue)
//                        let vc = UITabBarController()
//                        vc.viewControllers = [BooksViewController(), UIViewController()].map {
//                            UINavigationController(rootViewController: $0)
//                        }
//                        self.window = UIWindow(frame: UIScreen.main.bounds)
//                        self.window?.makeKeyAndVisible()
//                        self.window?.rootViewController = vc
//                    }
                case let .failure(error):
                    print(error)
                }
            }
        }
    }
    
    func error(){
        let alert = UIAlertController(title: R.string.localizible.errorNewTitle(), message: R.string.localizible.errorMessageNewTitle(), preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        alert.addAction(ok)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
        
    }
}

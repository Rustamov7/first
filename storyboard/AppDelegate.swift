//
//  AppDelegate.swift
//  storyboard
//
//  Created by Vladimir on 02.06.2021.
//

import UIKit
import KeychainSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        checkLogin()
        return true
    }
    
    func checkLogin() {
        var controller = UIViewController()
        
        if (KeychainSwift().get(KeychainSwift.Keys.token.rawValue) != nil) {
            let tabBarViewController = UITabBarController()
            
            tabBarViewController.viewControllers = [BooksViewController(), UIViewController()].map {
                UINavigationController(rootViewController: $0)
            }
            controller = tabBarViewController
        } else {
            controller = UINavigationController(rootViewController: AuthorizationViewController())
        }
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = controller
    }
}

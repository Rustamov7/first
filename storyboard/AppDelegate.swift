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
//        var controller = UIViewController()
//
//        if (KeychainSwift().get("token") != nil) {
//            let tabBarViewController = UITabBarController()
//
//            tabBarViewController.viewControllers = [BooksViewController(), UIViewController()].map {
//                UINavigationController(rootViewController: $0)
//            }
//            controller = tabBarViewController
//        } else {
//            controller = UINavigationController(rootViewController: AuthorizationViewController())
//        }
//
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.makeKeyAndVisible()
//        window?.rootViewController = controller
        return true
    }
    
    func checkLogin() {
        DispatchQueue.main.async {
        var controller = UIViewController()
        
        if (KeychainSwift().get("token") != nil) {
            let tabBarViewController = UITabBarController()
            
            tabBarViewController.viewControllers = [BooksViewController(), UIViewController()].map {
                UINavigationController(rootViewController: $0)
            }
            controller = tabBarViewController
            print("go")
        } else {
            controller = UINavigationController(rootViewController: AuthorizationViewController())
            print("here")
        }
        print("next")
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.makeKeyAndVisible()
            self.window?.rootViewController = controller
            print("controller")
        //return true
    }
    }
}


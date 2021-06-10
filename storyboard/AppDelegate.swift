//
//  AppDelegate.swift
//  storyboard
//
//  Created by Vladimir on 02.06.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow(frame: UIScreen.main.bounds)
        let tabBarViewController = UITabBarController()
        tabBarViewController.viewControllers = [R.storyboard.main.instantiateInitialViewController(), UIViewController()].compactMap { $0 }
        
        window?.makeKeyAndVisible()
        window?.rootViewController = tabBarViewController
            
//        let tabBarController = UITabBarController()
//        tabBarController.viewControllers = [AuthorizationViewController(), UIViewController()].map {
//            UINavigationController(rootViewController: $0)
//        }
//
//        let window = UIWindow(frame: UIScreen.main.bounds)
//        window.rootViewController = tabBarController
//        window.makeKeyAndVisible()
//        self.window = window

        return true
    }
}

 

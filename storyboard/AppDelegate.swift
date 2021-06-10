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

        return true
    }
}

 

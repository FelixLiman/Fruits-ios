//
//  AppDelegate.swift
//  Fruits
//
//  Created by Felix Liman on 28/06/21.
//

import UIKit
import SnapKit
import Stevia

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UIFont.overrideInitialize()
        
        window = UIWindow()
        let navController = UINavigationController(rootViewController: HomeViewController())
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
}


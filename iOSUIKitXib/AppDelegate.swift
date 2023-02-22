//
//  AppDelegate.swift
//  iOSUIKitXib
//
//  Created by Nguyen Cuong on 06/12/2022.
//

import UIKit

@available(iOS 13.0, *)
@available(iOS 15.0, *)
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
//    @available(iOS 15.0, *)
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
//        let vc  = ProfileViewController()
//        window?.rootViewController = vc
        window?.rootViewController = UINavigationController(rootViewController: CashOutViewController())
        window?.makeKeyAndVisible()
        return true
    }
}


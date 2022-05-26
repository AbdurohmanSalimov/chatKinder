//
//  AppDelegate.swift
//  chatKinder
//
//  Created by Azizbek Salimov on 25.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        if Cache.shared.getUserName().isEmpty {
        window = UIWindow()
        let vc = LoginVC()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        } else {
            window = UIWindow()
            let vc = HomeVC()
            window?.rootViewController = vc
            window?.makeKeyAndVisible()
        }
        
        return true
    }

    


}


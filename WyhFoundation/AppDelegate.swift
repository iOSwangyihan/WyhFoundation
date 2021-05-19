//
//  AppDelegate.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/19.
//

import UIKit
import SnapKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: .init(origin: .zero, size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)))
        window?.backgroundColor = .white
        let vc = ViewController()
        let nav = UINavigationController(rootViewController: vc)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }



}


//
//  HomeAppDelegate.swift
//
//  ModulariedSuperApp
//
//  Created by Chansoo on .
//

import UIKit

@UIApplicationMain
class HomeAppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = HomeUserInterfaceViewController()
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}


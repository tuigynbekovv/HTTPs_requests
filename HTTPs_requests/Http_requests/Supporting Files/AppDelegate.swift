/*
 *  AppDelegate.swift
 *  HTTP_requests
 *
 *  Created by tuigynbekov on 2/9/21.
 */

import UIKit

@main class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        setupUserInterfaceStyle()
        return true
    }
    
    func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = MainViewController()
    }
    
    func setupUserInterfaceStyle() {
        if #available(iOS 13.0, *) { window?.overrideUserInterfaceStyle = .light }
    }
}


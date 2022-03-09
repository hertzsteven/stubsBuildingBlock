//
//  AppDelegate.swift
//  Test Prorrammatic tableview
//
//  Created by Steven Hertz on 3/6/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = MenuButtonViewController()

        
//        Programmatic Table View Controller
//        window?.rootViewController = TableViewController()

//        Just starts a ViewController with label and a  bunch of buttons
//        window?.rootViewController = SimpleStartViewController()
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }


}


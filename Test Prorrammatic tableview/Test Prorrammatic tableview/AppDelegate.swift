  //
  //  AppDelegate.swift
  //  Test Prorrammatic tableview
  //
  //  Created by Steven Hertz on 3/6/22.
  //

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .white
      observeNotification()
//    window?.rootViewController = TableViewControllerCustomHeader()
//      window?.rootViewController = TestCustomInitViewController(x: "kkkk")
      let notificationViewController = NotificationViewController()
      notificationViewController.title = "Hello"
      
//      let navigationController = UINavigationController(rootViewController: notificationViewController)
      
      window?.rootViewController = TextFieldPwdShowHideViewController()
    
      //        createTabBar()
    
      //        Programmatic Table View Controller
      //        window?.rootViewController = TableViewController()
    
      //        Just starts a ViewController with label and a  bunch of buttons
      //        window?.rootViewController = SimpleStartViewController()
    
    
    window?.makeKeyAndVisible()
    return true
  }
  
    
  func createTabBar()  {
    
    let vc1 = UIViewController()
    vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
    vc1.title = "Contacts"
    let nc1 = UINavigationController(rootViewController: vc1)
    
    let vc2 = UIViewController()
    vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
    vc2.title = "Favorites"
    let nc2 = UINavigationController(rootViewController: vc2)
    
    let vc3 = UIViewController()
    vc3.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 2)
    vc3.title = "MostViewed"
    let nc3 = UINavigationController(rootViewController: vc3)
    
    let tabVC = UITabBarController()
    tabVC.viewControllers = [nc1, nc2, nc3]
    
    window?.rootViewController = tabVC
  }
  
}

extension AppDelegate {
//    Use for Notification Observing
    func observeNotification()  {
        let nameOfNotification = Notification.Name.buttonTapped
        NotificationCenter.default.addObserver(self, selector: #selector(justGotButtonClickedMessage(notificatio:)), name: nameOfNotification, object: nil)
    }
    
    @objc func justGotButtonClickedMessage(notificatio: Notification)  {
        print("notification received")
    }
    
    
}

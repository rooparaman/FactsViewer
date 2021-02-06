// Created by Roopa Raman on 6/2/21
// 
// Using Swift 5.0

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    let navViewController = UINavigationController()
    let homeViewController = FactsViewController()
    navViewController.viewControllers = [homeViewController]
    window?.makeKeyAndVisible()
    window?.rootViewController = navViewController
    
    return true
  }
  
  
}


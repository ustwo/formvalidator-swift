//
//  AppDelegate.swift
//  iOS Example
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    // MARK: - Properties
    
    var window: UIWindow?
    
    
    // MARK: - UIApplicationDelegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let viewController = FormViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.isTranslucent = false
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

}
